
Program EN2;

// Moises Cardenas
// C.I: 29864094

Uses 
crt;

Var 
  Input: string;
  n, n1: integer;
  c : Boolean;


Function es_divisible(a,b: integer): boolean;
Begin
  es_divisible := a Mod b = 0;
End;

Begin
  clrscr;
  c := false;
  Repeat
    Write('Ingresa un numero: ');
    readln(input);
    Val(input, n, n1);
  Until (n1 = 0);
  If es_divisible(n, 13) Then
    Begin
      textcolor(6);
      writeln(n,' es divisible entre 13');
      c := true;
    End;

  If es_divisible(n, 7) Then
    Begin
      textcolor(2);
      writeln(n,' es divisible entre 7');
      c := true;
    End;

  If es_divisible(n, 5) Then
    Begin
      textcolor(4);
      writeln(n, ' es divisible entre 5');
      c := true;
    End;

  If es_divisible(n, 3) Then
    Begin
      textcolor(1);
      writeln(n, ' es divisible entre 3');
      c := true;
    End;

  If es_divisible(n, 2) Then
    Begin
      textcolor(14);
      writeln(n, ' es divisible entre 2');
      c := true;
    End
  Else If (C = false) Then
         Begin
           textcolor(15);
           writeln(n,' no es divisible entre ninguno de los numeros');
         End;
End.
