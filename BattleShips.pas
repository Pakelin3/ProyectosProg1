
Program BattleShips;

Uses crt, SysUtils;

// Moises Cardenas
// Martin Marcano

Const 
  N = 10;
  // tamaño del Mapa

Type 
  tMapa = array[1..N, 1..N] Of Char;
  // tipo matriz para el Mapa

Var 
  Mapa : tMapa;
  fila, fila1, col, col1, trys, P: Integer;
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
      p := p - 100;
      textcolor(7);

    End;
  If Mapa[fila, col] = 'v' Then
    Begin
      textcolor(4);
      writeln('LE DISTE A UN BARCO');
      Mapa[fila, col] := 'X';
      p := p + 200;
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
             p := 2000;
             Repeat
               clrscr;
               writeln('[BattleShip]');
               MostrarMapa();
               PreguntarCoordenadas();
               RealizarDisparo();
               WriteLn('Pulsa enter para refrescar: ');
               WriteLn('Tienes ', p , ' puntos');
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
             clrscr;
             writeln('BIENVENIDO CAPITAN!!');
             writeln;
             writeln('Este juego es llamado "Hundir la flota" (Battleship para el que se crea gringo)');
             writeln('Las reglas son muy sencillas:');
             writeln;
             writeln('1. El objetivo es acertar en el objetivo, los cuales son las naves enemigas.');
             writeln;
             writeln('2. Para seleccionar un punto en el cual atacar, lo unico que debes hacer es seleccionar una fila ');
             WriteLn('y una columna. Tras esto, el juego te indicara el si has acertado (X) o si has fallado (O).');
             writeln;
             writeln('3. Por cada nave a la cual se logre acertar correctamente, ganas 200 puntos. Pero si fallas el tiro, ');
             WriteLn('solo ganaras 1 punto!');
             writeln;
             writeln('4. Hay tres modos de juego, facil, normal, y dificil, siendo la diferencia la cantidad de ');
             WriteLn('disparos que puedes ejecutar entre cada modo:');
             writeln;
             writeln('--------------------------------------------------------------------------------');
             writeln('*Facil: 40 misiles, disfruta del juego');
             writeln;
             writeln('*Medio: 25 misiles, pongamoslo algo interesante');
             writeln;
             write('*Dificil: 15 misiles. Hay que admitirlo, este se ve injusto, pero...');
             TextColor(Red);
             TextBackground(Black);
             WriteLn(' TE ATREVES?');
             TextColor(7);
             TextBackground(Black);
             writeln('--------------------------------------------------------------------------------');
             writeln;
             writeln('5. Pierdes si te has quedado sin misiles que disparar.');
             writeln;
             writeln('Y eso resumiria este juego, disfruten.');
             writeln;
             TextColor(Green);
             TextBackground(Black);
             WriteLn('(Y si sale un hombre con barba de pulpo preguntando que si tienen miedo a la muerte, le dicen que no)');
             TextColor(7);
             WriteLn;
             writeln('Presiona enter para ir al menu principal');
             readkey;
             goto 1;
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
