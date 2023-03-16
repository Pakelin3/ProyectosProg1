
Program EN1;

// Moises Cardenas
// C.I: 29864094

Uses crt, SysUtils;

Var 
  frase: string;
  opcion: integer;
  continuar: char;


Function aBinario(frase: String): string;
// SysUtils salvando la patria

Var 
  i, j, ascii: integer;
  binario, temp: string;
Begin
  binario := ' ';
  For i := 1 To Length(frase) Do
    Begin
      ascii := Ord(frase[i]);
      temp := ' ';
      While ascii > 0 Do
        Begin
          If (ascii Mod 2) = 0 Then
            temp := '0' + temp
          Else
            temp := '1' + temp;
          ascii := ascii Div 2;
        End;
      For j := Length(temp) + 1 To 8 Do
        temp := '0' + temp;
      binario := binario + temp;
    End;
  aBinario := binario;
  WriteLn('Frase en binario: ', binario);

End;

Procedure aHexadecimal(frase: String);
// SysUtils salvando la patria

Var 
  i: integer;
  hexadecimal: string;
Begin
  hexadecimal := '';
  For i := 1 To Length(frase) Do
    Begin
      hexadecimal := hexadecimal + IntToHex(Ord(frase[i]), 2) + ' ';
      // esta operacion convierte cada caracter a su valor hexadecimal de 2 dígitos
    End;
  WriteLn('Frase en hexadecimal: ', hexadecimal);
End;


Procedure aOctal(frase: String);
// SysUtils salvando la patria

Var 
  i: integer;
  octal: string;
Begin
  octal := '';
  For i := 1 To Length(frase) Do
    Begin
      octal := octal + OctStr(Ord(frase[i]), 3) + ' ';
      // esta operacion convierte cada caracter a su valor octal de 3 dígitos
    End;
  WriteLn('Frase en octal: ', octal);
End;


Procedure aRomano(frase: String);
// tuve que buscar la operacion matematica y la logica del la
// numeracion romana, fue una travesia pero funciona

Const 
  I = 'I';
  V = 'V';
  X = 'X';
  L = 'L';
  C = 'C';
  D = 'D';
  M = 'M';

Var 
  ascii,Divis,Res, k, N1, P1: integer;
  romano: string;
  // esta funcon agrega todos lon numeros romanos que contengan '1' I/X/C/M
Function TLN1(y:integer;u:String): string;

Var 
  j: integer; {variable de iteracióm}
Begin
  TLN1 := '';
  If y In [1,2,3] Then
    For j := 1 To y Do
      TLN1 := TLN1+u;
End;
// esta funcion agrega todos los numeros romanos que contengan '5' V/L/D
Function TLN5(y:integer;u:String): string;
Begin
  If y In [4,5,6,7,8] Then
    TLN5 := u
  Else
    TLN5 := '';
End;
// esta funcion valida las unidades con el formato: III|I V III|I X
Function ValUni(z:integer): string;
Begin
  ValUni := TLN1(z,I)+TLN1(((z Div 4)+10*(z Mod 4))*(z Div 4),I)
            +TLN5(z,V)+TLN1(z-5,I)+TLN1((z Div 9)+10*(z Mod 9),I)+TLN1((z Div 9)+10*(z Mod 9),X);
End;
// esta funcion valida las decenas con el formato: XXX|X L XXX|X C
Function ValDec(z:integer): string;
Begin
  ValDec := TLN1(z,X)+TLN1(((z Div 4)+10*(z Mod 4))*(z Div 4),X)
            +TLN5(z,L)+TLN1(z-5,X)+TLN1((z Div 9)+10*(z Mod 9),X)+TLN1((z Div 9)+10*(z Mod 9),C);
End;
// esta funcion valida las centenas con el formato: CCC|C D CCC|C M
Function ValCen(z:integer): string;
Begin
  ValCen := TLN1(z,C)+TLN1(((z Div 4)+10*(z Mod 4))*(z Div 4),C)
            +TLN5(z,D)+TLN1(z-5,C)+TLN1((z Div 9)+10*(z Mod 9),C)+TLN1((z Div 9)+10*(z Mod 9),M);
End;

Begin
  Write('Frase en Romano: ');
  P1 := P1 - 187;
  // por alguna razon siempre me daba 188 cuando lo declaraba 
  // una variable x para hacer la comprobacion del until
  // es por eso que hice esta operacion
  Repeat

    For k := 1 To Length(frase) Do
      Begin
        ascii := Ord(frase[k]);

        N1 := Length(frase);
        P1 := P1 + 1;


        If ascii In [1..9]  Then
          romano := ValUni(ascii);
        If ascii In [10..99] Then
          Begin
            Divis := ascii Div 10;
            Res := ascii Mod 10;
            romano := ValDec(Divis)+ValUni(Res);
          End;
        If (ascii>=100) And (ascii<1000) Then
          Begin
            Divis := ascii Div 100;
            Res := ascii Mod 100;
            romano := ValCen(Divis)+ValDec(Res Div 10)+ValUni(Res Mod 10);
          End;
        Write(romano, ' ');
        romano := ' ';

      End;

  Until  (P1 = N1) And (N1 = P1);
End;


Begin
  Repeat
    clrscr;
    WriteLn('|------------------------->');
    Write('|-Ingrese una frase: ');
    ReadLn(frase);
    WriteLn('|------------------------->');

    WriteLn('|-Elija a que quiere convertir su frase:');
    WriteLn('|------------------------------>');
    WriteLn('| 1: [Binario]                 |');
    WriteLn('| 2: [Hexadecimal]             |');
    WriteLn('| 3: [Octal]                   |');
    WriteLn('| 4: [Romano]                  |');
    WriteLn('|------------------------------>');

    ReadLn(opcion);

    Case opcion Of 
      1: aBinario(frase);
      2: aHexadecimal(frase);
      3: aOctal(frase);
      4: aRomano(frase);
      Else
        WriteLn('Opcion invalida');
    End;

    WriteLn('Desea seguir convirtiendo [S/N]');
    ReadLn(continuar);
  Until (continuar = 'N') Or (continuar = 'n');
End.
