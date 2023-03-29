
Program BattleShips;

Uses crt, SysUtils;


Const 
  N = 10;
  // tamaño del Mapa

Type 
  tMapa = array[1..N, 1..N] Of Char;
  // tipo matriz para el Mapa

Var 
  Mapa : tMapa;
  fila, fila1, col, col1, i, j, trys: Integer;
  Input, D : String;
  opcion: char;

  Label 1;

Procedure InicializarMapa();

Var 
  i, j: Integer;
Begin
  For i := 1 To N Do
    For j := 1 To N Do
      Mapa[i, j] := '-';

End;

Procedure MostrarMapa();

Var 
  i, j: Integer;
Begin
  writeln('     1 2 3 4 5 6 7 8 9 10');
  writeln('   +===+===+==+==+===+===+');
  For i := 1 To N Do
    Begin
      Write(i:2, ' | ');
      For j := 1 To N Do
        Write(Mapa[i, j], ' ');
      writeln('|');
    End;
  writeln('   +===+===+==+==+===+===+');
  WriteLn('');
  Writeln('Intentos restantes: ', trys);
End;

Procedure PreguntarCoordenadas();

Begin
  writeln('Ingrese coordenadas para disparar:');
  Repeat
    Write('Vertical (1-10): ');
    readln(Input);
    Val(Input, fila, fila1);
  Until (fila1 = 0) And (fila >= 1) And (fila <= N);

  Repeat
    Write('Horizontal (1-10): ');
    readln(Input);
    Val(Input, col, col1);
  Until (col1 = 0) And (col >= 1) And (col <= N);

End;

Procedure RealizarDisparo();

Begin
  If Mapa[fila, col] = '-'  Then
    Begin
      textcolor(1);
      writeln('FALLASTE EL TIRO');
      Mapa[fila, col] := 'O';
      textcolor(7);

    End;
  If Mapa[fila, col] = 'v' Then
    Begin
      textcolor(4);
      writeln('LE DISTE A UN BARCO');
      Mapa[fila, col] := 'X';
      textcolor(7);

    End;
End;


Function JuegoTerminado(): Boolean;

Var 
  i, j: Integer;
Begin
  For i := 1 To N Do
    For j := 1 To N Do
      If Mapa[i, j] = 'v' Then
        Exit(False);

  Exit(True);
End;

Procedure GenerarBarcos();

Var 
  i, fila, col: Integer;
Begin
  Randomize;
  For i := 1 To 10 Do
    Begin
      Repeat
        fila := Random(N) + 1;
        col := Random(N) + 1;
      Until Mapa[fila, col] = '-';
      Mapa[fila, col] := 'v';
    End;
End;




Begin
  1:
     clrscr;
  writeln('+----------------------------------+');
  writeln('|                                  |');
  writeln('|     BIENVENIDO A BATTLESHIP      |');
  writeln('|                                  |');
  writeln('|----------------------------------|');
  writeln('|                                  |');
  writeln('| 1. Jugar                         |');
  writeln('| 2. Leer Instrucciones            |');
  writeln('| 3. Salir                         |');
  writeln('|                                  |');
  writeln('+----------------------------------+');
  Repeat
    ReadLn(opcion);


    Case opcion Of 

      '1':
           Begin
             clrscr;
             Repeat

               writeln('Elige la dificultad:');
               WriteLn('Facil [f] |  Medio [m] | Dificil [d]');
               ReadLn(D);
             Until (D = 'f') Or (D = 'm') Or (D = 'd');
             If (D = 'f') Then
               Begin
                 trys := 40;
               End;

             If (D = 'm') Then
               Begin
                 trys := 25;
               End;

             If (D = 'd') Then
               Begin
                 trys := 15;
               End;


             writeln('[BattleShip]');
             InicializarMapa();
             GenerarBarcos();
             Repeat
               clrscr;
               writeln('[BattleShip]');
               MostrarMapa();
               PreguntarCoordenadas();
               RealizarDisparo();
               WriteLn('Pulsa enter para refrescar: ');
               trys := trys - 1;
               readkey;
               If (trys = 0) Then
                 Begin
                   WriteLn('');
                   Writeln('Ya no te quedan intentos');
                   WriteLn('presiona enter para ir al menu');
                   readkey;
                   goto 1;
                 End
               Else
             Until JuegoTerminado();

             writeln('Felicitaciones, has hundido todos los barcos.');
             readln;

           End;
      '2':
           Begin
             writeln('Instrucciones:');

           End;
      '3':
           Begin
             writeln('Adios');
             halt;
           End;

      Else
        writeln('Respona [1 - 2 - 3]');
    End;
  Until (opcion = '1') Or (opcion = '2') Or (opcion = '3');

End.
