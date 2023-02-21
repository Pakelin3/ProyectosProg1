
Program proyecto3;

Uses 
crt;

//U = usos
//MT = tipo de transporte
//Nb = numero de boletos
//P = Monto a pagar
//Q & TB = tipo de boleto
//Rs = ruta salida
//Rd = ruta destino
//BP = Boletos por persona(cantidad de boletos comprados en total)}
//CBU = Cantidad de boletos utilizados
//Pl# = promedio de personas por linea
//Pv# = promedio de ventas por linea

Var 
  Nom, Ape, menu, boletos, ruta, SUS, MT, TB, Input, Rs, Rd, Dec: String;
  ClavC, Nb, Nb1, P, P1, U, CBU, Q, Sal, BP: Integer;
  Ced1, Ced, CC, Clav1, Clav: LongInt;
  Pl1,Pl2,Pl3,Pl4,Pl5,Pl6,Pl7,Pl8: Integer;
  Pv1,Pv2,Pv3,Pv4,Pv5,Pv6,Pv7,Pv8: real;

  Label 1,2;

Const 
  M = 5;
  Mb = 3;
  A = 'Boletos simple [a]';{ 1 Amarillo 14}
  B = 'Boletos integrado [b]';{ 2 Amarillo 14}
  C = 'Boletos Ida y vuelta [c]';{ 3 Amarillo 14}
  D = 'Boletos Ida y vuelta integrado [d]';{ 4 Amarillo 14}
  E = 'Boletos Multiabono [e]';{ 5 Naranja 12}
  F = 'Boletos Multiabono integrado [f]';{ 6 Naranja 12}
  G = 'Boletos Estudiantil simple [g]';{ 7 Azul 2}
  H = 'Boletos Estudiantil integrado [h]';{ 8 Azul 2}
  I = 'Boletos MetroTarjeta [i]';{ 9 Rojo 4}
  J = 'Boletos MetroTarjeta Integrada [j]';{ 10 Rojo 4}


Begin
  clrscr;
  writeln('Hola, desea comprar boletos? [si/no]');
  Repeat
    readln(menu);

    Case menu Of 

      'no':

            Begin
              WriteLn('---------------------------------------------------');
              WriteLn('Espero nos visites pronto. ');
              Halt;
            End;


      'si':

            Begin
              clrscr;
              WriteLn('Por favor ingrese su nombre y apellido: ');
              WriteLn('---------------------------------------------------------------------------');
              write('Nombre: ');
              readln(Nom);
              write('Apellido: ');
              readln(Ape);
              WriteLn('---------------------------------------------------------------------------');
              Repeat
                write('Ahora ingrese su cedula: ');
                readln(Input);
                Val(Input, Ced, Ced1);
              Until (Ced > 1000000) And (Ced < 40000000) And (Ced1 = 0);
              CC := Ced;

              {Repetido:}
              Begin
                WriteLn('---------------------------------------------------------------------------');
                WriteLn('Mucho gusto, ', Nom ,' ', Ape);
                1: //----------------------------------------------------------------------------------
                   WriteLn('Ingrese la letra del tipo de boleto que desea comprar: ');
                WriteLn('---------------------------------------------------------------------------');
                textcolor(2);
                WriteLn('Viaje en Metro: ', M,'$                         Viaje en Metrobus: ', Mb,'$');
                textcolor(7);
                WriteLn('---------------------------------------------------------------------------');
                textcolor(14);
                WriteLn('a: Simple                          1 viaje en metro');
                WriteLn('b: Integrado                       1 viaje en metro o en metrobus');
                writeln('c: Ida y vuelta                    2 viajes en metro');
                WriteLn('d: Ida y vuelta integrado          2 en metro o en metrobus');
                textcolor(12);
                writeln('e: Multiabono                      10 viajes en metro');
                WriteLn('f: Multiabono integrado            10 viajes en metro o en metrobus');
                textcolor(1);
                writeln('g: Estudiantil simple              10 viajes en metro');
                WriteLn('h: Estudiantil integrado           10 en metro o 20 en metrobus');
                textcolor(4);
                writeln('i: MetroTarjeta                    20, 30 o 40 viajes en metro o metrobus');
                writeln('j: MetroTarjeta Integrada          20, 30 o 40 viajes en metro y metrobus');
                textcolor(7);
                WriteLn('---------------------------------------------------------------------------');
                readln(boletos);
                If (boletos <> 'a') And (boletos <> 'b') And (boletos <> 'c') And (boletos <> 'd') And (boletos <> 'e')
                   And (boletos <> 'f') And (boletos <> 'g') And (boletos <> 'h') And (boletos <> 'i') And (boletos <> 'j')
                  Then
                  Repeat
                    Write('Ingresa uno de los tipos de boletos disponibles por favor: ');
                    Readln(boletos);
                  Until (boletos = 'a') Or (boletos = 'b') Or (boletos = 'c') Or (boletos = 'd') Or (boletos = 'e')
                        Or (boletos = 'f') Or (boletos = 'g') Or (boletos = 'h') Or (boletos = 'i') Or (boletos = 'j');

              End;
            End;
      Else
        writeln('Respona [si/no]');
    End;
  Until (menu = 'si') Or (menu = 'no');

  Case boletos Of 

    'a':
         Begin
           clrscr;
           TB := A;
           Q := 1;
           Repeat
             write('Ingrese cantidad de boletos a comprar (MIN = 1) (MAX = 20) : ');
             readln(Input);
             Val(Input, Nb, Nb1);
           Until (Nb1 = 0) And (Nb <=20) And (Nb >= 1);
           WriteLn('Ha seleccionado el boleto tipo [a] UNICAMENTE por [metro]');
           WriteLn('---------------------------------------------------------------------------');
           p := (Nb * M);
           WriteLn('Monto a pagar: ', p,'$');
           writeln('Boletos a comprar: ', Nb);
           U := Nb;
           MT := '[metro]';
           BP := (BP + 1);
         End;

    'b':
         Begin
           clrscr;
           TB := B;
           Q := 2;
           WriteLn('Eliga el metodo de transporte: [metro] o [metrobus]');
           ReadLn(MT);
           If (MT < 'metrobus') And (MT <> 'metro') Then
             Repeat
               writeln('Eliga el metodo de transporte que estan disponibles, por favor.');
               readln(MT);
             Until (MT = 'metro') Or (MT = 'metrobus');
           WriteLn('---------------------------------------------------------------------------');
           Repeat
             write('Ingrese cantidad de boletos a comprar (MIN = 1) (MAX = 20) : ');
             readln(Input);
             Val(Input, Nb, Nb1);
           Until (Nb1 = 0) And (Nb <=20) And (Nb >= 1);
           If (MT = 'metro')Then
             Begin
               WriteLn('---------------------------------------------------------------------------');
               WriteLn('Ha seleccionado el boleto tipo [b] por [metro]');
               P := (Nb * M);
               WriteLn('Monto a pagar: ', P ,'$');
               writeln('Boletos a comprar: ', Nb);
               U := Nb;
               MT := '[metro]';
             End;
           If (MT = 'metrobus')Then
             Begin
               WriteLn('---------------------------------------------------------------------------');
               WriteLn('Ha seleccionado el boleto tipo [b] por [metrobus]');
               P := (Nb * Mb);
               WriteLn('Monto a pagar: ', P ,'$');
               writeln('Boletos a comprar: ', Nb);
               U := Nb;
               MT := '[metrobus]';
               BP := BP + 1;
             End;
         End;

    'c':
         Begin
           clrscr;
           TB := C;
           Q := 3;
           Repeat
             write('Ingrese cantidad de boletos a comprar (MIN = 1) (MAX = 20) : ');
             readln(Input);
             Val(Input, Nb, Nb1);
           Until (Nb1 = 0) And (Nb <=20) And (Nb >= 1);
           WriteLn('El boleto tipo [c] cuenta con Ida y vuelta por [metro]');
           p := Nb * (M * 2);
           WriteLn('Monto a pagar: ', P,'$');
           writeln('Boletos a comprar: ', Nb);
           U := Nb * 2;
           MT := '[metro]';
           BP := BP + 1;
         End;

    'd':
         Begin
           clrscr;
           TB := D;
           Q := 4;
           WriteLn('Eliga el metodo de transporte: [metro] o [metrobus]');
           ReadLn(MT);
           If (MT < 'metrobus') And (MT <> 'metro') Then
             Repeat
               writeln('Eliga el metodo de transporte que estan disponibles, por favor.');
               readln(MT);
             Until (MT = 'metro') Or (MT = 'metrobus');
           WriteLn('---------------------------------------------------------------------------');
           Repeat
             write('Ingrese cantidad de boletos a comprar (MIN = 1) (MAX = 20) : ');
             readln(Input);
             Val(Input, Nb, Nb1);
           Until (Nb1 = 0) And (Nb <=20) And (Nb >= 1);
           If (MT = 'metro')Then
             Begin
               WriteLn('---------------------------------------------------------------------------');
               WriteLn('Ha seleccionado el boleto tipo [d] por [metro] (Ida y vuelta)');
               P := (Nb * (M * 2));
               WriteLn('Monto a pagar: ', P ,'$');
               writeln('Boletos a comprar: ', Nb);
               U := Nb * 2;
               MT := '[metro]';
               BP := BP + 1;
             End;
           If (MT = 'metrobus')Then
             Begin
               WriteLn('---------------------------------------------------------------------------');
               WriteLn('Ha seleccionado el boleto tipo [d] por [metrobus] (Ida y vuelta)');
               P := (Nb * (Mb * 2));
               WriteLn('Monto a pagar: ', P ,'$');
               writeln('Boletos a comprar: ', Nb);
               U := Nb * 2;
               MT := '[metrobus]';
               BP := BP + 1;
             End;
         End;

    'e':
         Begin
           clrscr;
           TB := E;
           Q := 5;
           Repeat
             write('Ingrese cantidad de boletos a comprar (MIN = 1) (MAX = 20) : ');
             readln(Input);
             Val(Input, Nb, Nb1);
           Until (Nb1 = 0) And (Nb <=20) And (Nb >= 1);
           WriteLn('Ha seleccionado el boleto tipo [e] por [metro] (10 viajes) ');
           WriteLn('---------------------------------------------------------------------------');
           P := (Nb * (M * 10));
           WriteLn('Monto a pagar: ', P ,'$');
           writeln('Boletos a comprar: ', Nb);
           U := Nb;
           MT := '[metro]';
           BP := BP + 1;
         End;

    'f':
         Begin
           clrscr;
           TB := F;
           Q := 6;
           WriteLn('Eliga el metodo de transporte: [metro] o [metrobus]');
           ReadLn(MT);
           If (MT < 'metrobus') And (MT <> 'metro') Then
             Repeat
               writeln('Eliga el metodo de transporte que estan disponibles, por favor.');
               readln(MT);
             Until (MT = 'metro') Or (MT = 'metrobus');
           WriteLn('---------------------------------------------------------------------------');
           Repeat
             write('Ingrese cantidad de boletos a comprar (MIN = 1) (MAX = 20) : ');
             readln(Input);
             Val(Input, Nb, Nb1);
           Until (Nb1 = 0) And (Nb <=20) And (Nb >= 1);

           If (MT = 'metro')Then
             Begin
               WriteLn('---------------------------------------------------------------------------');
               WriteLn('Ha seleccionado el boleto tipo [f] por [metro] (10 viajes Ida y vuelta)');
               P := (Nb * (M * 10));
               WriteLn('Monto a pagar: ', P ,'$');
               writeln('Boletos a comprar: ', Nb);
               U := Nb * 2;
               MT := '[metro]';
               BP := BP + 1;
             End;
           If (MT = 'metrobus')Then
             Begin
               WriteLn('---------------------------------------------------------------------------');
               WriteLn('Ha seleccionado el boleto tipo [f] por [metrobus] (10 viajes Ida y vuelta)');
               P := (Nb * (Mb * 10));
               WriteLn('Monto a pagar: ', P ,'$');
               writeln('Boletos a comprar: ', Nb);
               U := Nb * 2;
               MT := '[metrobus]';
               BP := BP + 1;
             End;
         End;

    'g':
         Begin
           clrscr;
           TB := G;
           Q := 7;
           WriteLn('Al ser estudiante se aplicara un descuento del 20%');
           Repeat
             write('Ingrese cantidad de boletos a comprar (MIN = 1) (MAX = 20) : ');
             readln(Input);
             Val(Input, Nb, Nb1);
           Until (Nb1 = 0) And (Nb <=20) And (Nb >= 1);
           WriteLn('Ha seleccionado el boleto tipo [e] por [metro] (10 viajes) ');
           WriteLn('---------------------------------------------------------------------------');
           P := (Nb * (M * 10));
           P1 := (P * 20) Div 100;
           WriteLn('Monto a pagar: ', P ,'$');
           writeln('Boletos a comprar: ', Nb);
           P := (P - P1);
           WriteLn('Descuento del 20%: ', P ,'$');
           U := Nb;
           MT := '[metro]';
           BP := BP + 1;
         End;

    'h':
         Begin
           clrscr;
           TB := H;
           Q := 8;
           WriteLn('Eliga el metodo de transporte: [metro] o [metrobus]');
           ReadLn(MT);
           If (MT < 'metrobus') And (MT <> 'metro') Then
             Repeat
               writeln('Eliga el metodo de transporte que estan disponibles, por favor.');
               readln(MT);
             Until (MT = 'metro') Or (MT = 'metrobus');
           WriteLn('---------------------------------------------------------------------------');
           WriteLn('Al ser estudiante se aplicara un descuento del 20%');
           Repeat
             write('Ingrese cantidad de boletos a comprar (MIN = 1) (MAX = 20) : ');
             readln(Input);
             Val(Input, Nb, Nb1);
           Until (Nb1 = 0) And (Nb <=20) And (Nb >= 1);

           If (MT = 'metro')Then
             Begin
               WriteLn('---------------------------------------------------------------------------');
               WriteLn('Ha seleccionado el boleto tipo [h] por [metro] (10 viajes Ida y vuelta)');
               P := (Nb * (M * 10));
               P1 := (P * 20) Div 100;
               WriteLn('Monto a pagar: ', P ,'$');
               writeln('Boletos a comprar: ', Nb);
               P := (P - P1);
               WriteLn('Descuento del 20%: ',P,'$');
               U := Nb * 2;
               MT := '[metro]';
               BP := BP + 1;
             End;
           If (MT = 'metrobus')Then
             Begin
               WriteLn('---------------------------------------------------------------------------');
               WriteLn('Ha seleccionado el boleto tipo [h] por [metrobus] (20 viajes Ida y vuelta)');
               P := (Nb * (Mb * 20));
               P1 := (P * 20) Div 100;
               WriteLn('Monto a pagar: ', P ,'$');
               writeln('Boletos a comprar: ', Nb);
               P := (P - P1);
               WriteLn('Descuento del 20%: ',P,'$');
               U := Nb * 2;
               MT := '[metrobus]';
               BP := BP + 1;
             End;
         End;

    'i':
         Begin
           clrscr;
           TB := I;
           Q := 9;
           WriteLn('Eliga el metodo de transporte: [metro] o [metrobus]');
           ReadLn(MT);
           If (MT < 'metrobus') And (MT <> 'metro') Then
             Repeat
               writeln('Eliga el metodo de transporte que estan disponibles, por favor.');
               readln(MT);
             Until (MT = 'metro') Or (MT = 'metrobus');
           WriteLn('---------------------------------------------------------------------------');
           writeln('Eliga la cantidad de usos del boleto: [20, 30, 40]');
           Readln(U);
           If (U <> 20) And (U <> 30) And (U <> 40) Then
             Repeat
               writeln('Eliga la cantidad de usus que estan disponibles, por favor.');
               readln(U);
             Until (U = 20) Or (U = 30) Or (U = 40);

           WriteLn('---------------------------------------------------------------------------');
           Repeat
             write('Ingrese cantidad de boletos a comprar (MIN = 1) (MAX = 20) : ');
             readln(Input);
             Val(Input, Nb, Nb1);
           Until (Nb1 = 0) And (Nb <=20) And (Nb >= 1);
           If (MT = 'metro')Then
             Begin
               WriteLn('---------------------------------------------------------------------------');
               WriteLn('Ha seleccionado el boleto tipo [i] por [metro] (',U,' viajes Ida y vuelta)');
               P := (Nb * (M * U));
               WriteLn('Monto a pagar: ',P,'$');
               writeln('Boletos a comprar: ', Nb);
               U := Nb * 2;
               MT := '[metro]';
             End;
           If (MT = 'metrobus')Then
             Begin
               WriteLn('---------------------------------------------------------------------------');
               WriteLn('Ha seleccionado el boleto tipo [i] por [metrobus] (',U,' viajes Ida y vuelta)');
               P := (Nb * (Mb * U));
               WriteLn('Monto a pagar: ',P,'$');
               writeln('Boletos a comprar: ', Nb);
               U := Nb * 2;
               MT := '[metrobus]';
               BP := BP + 1;
             End;
         End;

    'j':
         Begin
           clrscr;
           TB := J;
           Q := 10;
           writeln('Eliga la cantidad de usos del boleto: [20, 30, 40]');
           Readln(U);
           If (U <> 20) And (U <> 30) And (U <> 40) Then
             Repeat
               writeln('Eliga la cantidad de usus que estan disponibles, por favor.');
               readln(U);
             Until (U = 20) Or (U = 30) Or (U = 40);

           WriteLn('---------------------------------------------------------------------------');
           Repeat
             write('Ingrese cantidad de boletos a comprar (MIN = 1) (MAX = 20) : ');
             readln(Input);
             Val(Input, Nb, Nb1);
           Until (Nb1 = 0) And (Nb <=20) And (Nb >= 1);
           WriteLn('---------------------------------------------------------------------------');
           Writeln('Ha seleccionado el boleto tipo [j] Metro y Metrobus. (',U,' viajes Ida y vuelta)');
           {Hice un promedio del precio por metro y por metrobus para calcular el precio del boleto tipo [j]}
           P := ((M * U) + (Mb * U) Div 2);
           P := (P * Nb);
           WriteLn('Monto a pagar: ', P,'$');
           writeln('Boletos a comprar: ', Nb);
           U := Nb * 2;
           BP := BP + 1;

         End;


    Else
      writeln('El valor no es valido.');
  End;


  Begin {clave}
    WriteLn('---------------------------------------------------------------------------');
    Writeln('Ingrese una clave de seguridad no mayor a 4 digitos para usarla');
    WriteLn('en la confirmacion de pago mas adelante (RECUERDELA).');
    Repeat
      write('Clave: ');
      readln(Input);
      Val(Input, Clav, Clav1)
    Until (Clav < 9999) And (Clav > 1000) And (Clav1 = 0);
    WriteLn('---------------------------------------------------------------------------');
    WriteLn('Pulsa cualquier tecla para continuar la operacion.');
    ClavC := Clav;
    Readkey();
  End;
  Begin
    If (Q = 1) Or (Q = 2) Or (Q = 3) Or (Q = 4) Then
      Begin
        WriteLn('---------------------------------------------------------------------------');
        write('Has seleccionado ' ,Nb,' ');
        textcolor(14);
        write(TB);
        Textcolor(lightgray);
        WriteLn(' por el monto de: ',P,'$');
        WriteLn('---------------------------------------------------------------------------');
      End
    Else If (Q = 5) Or (Q = 6) Then
           Begin
             WriteLn('---------------------------------------------------------------------------');
             write('Has seleccionado ' ,Nb,' ');
             textcolor(12);
             write(TB);
             Textcolor(lightgray);
             WriteLn(' por el monto de: ',P,'$');
             WriteLn('---------------------------------------------------------------------------');
           End

    Else If (Q = 7) Or (Q = 8) Then
           Begin
             WriteLn('---------------------------------------------------------------------------');
             write('Has seleccionado ' ,Nb,' ');
             textcolor(2);
             write(TB);
             Textcolor(lightgray);
             WriteLn(' por el monto de: ',P,'$');
             WriteLn('---------------------------------------------------------------------------');
           End

    Else If (Q = 9) Or (Q = 10) Then

           Begin
             WriteLn('---------------------------------------------------------------------------');
             write('Has seleccionado ' ,Nb,' ');
             textcolor(4);
             write(TB);
             Textcolor(lightgray);
             WriteLn(' por el monto de: ',P,'$');
             WriteLn('---------------------------------------------------------------------------');
           End;


    Begin {Rutas}
      WriteLn('Ahora eliga el numero de la linea por donde desea viajar:');
      textcolor(5);
      Write('| Linea 1:');
      WriteLn('-------------------------------------------------------------------------------------------------|');
      Writeln('|-Propatria   |-Capitolio       |-Plaza Venezuela |-Miranda    |-Perez Bonalde |-La Hoyada  |-Sabana Grande|');
      WriteLn('|-Plaza sucre |-Parque Carabobo |-Chacaito        |-Gato negro |-Bellas artes  |-Chacao     |-La california|');
      Writeln('|-Agua salud  |-Colegio de Ing. |-Los Dos Caminos |-Petare     |-Cabo Amarillo |-Palo Verde |-Altamira     |');
      WriteLn('|-Los Cortijos                                                                                             |');
      textcolor(4);
      Write('| Linea 2:');
      WriteLn(' ------------------------------------------------------------------------------------------------|');
      writeln('|-El silencio |-La Paz          |-Capuchinos      |-Mamera     |-Caricuao      |-Antimano   |-La Yaguara   |');
      writeln('|-Maternidad  |-Carapita        |-Zoologico       |-Artiguas   |-Ruiz Pineda/Las Adjuntas                  |');
      textcolor(9);
      Write('| Linea 3:');
      writeLn('-------------------------------------------------------------------------------------------------|');
      WriteLn('|-Mercado     |-Los Jardines    |-Los Simbolos    |-El Valle   |-La Rinconada  |-Coche      |-La Bandera   |');
      WriteLn('|-Plaza Venezuela               |-Ciudad Universitaria                                                     |');
      Textcolor(10);
      Write('| Linea 4:');
      WriteLn(' ------------------------------------------------------------------------------------------------|');
      WriteLn('|-Zona Rental |-Maternidad      |-Parque Central  |-Antimano   |-Capuchinos    |-La Yaragua |-Nuevo Circo  |');
      writeln('|-Artigas     |-Mamera          |-La Paz          |-Teatros    |-Carapita      |-Ruiz Pineda/Las Adjuntas  |');
      Textcolor(6);
      Write('| Linea 5:');
      WriteLn(' ------------------------------------------------------------------------------------------------|');
      writeln('|-Bello Monte |-Warairarepano   |-Las Mercedes    |-El Marquez |-Bello Campo   |-Boleitas   |-Hugo Chavez  |');
      WriteLn('|-MonteCristo |-Parque Simon Bolivar                                                                       |');
      Textcolor(12);
      Write('| Linea 6:');
      WriteLn(' ------------------------------------------------------------------------------------------------|');
      writeln('|-Zoologico   |-La Rinconada                                                                               |');
      Textcolor(11);
      Write('| Linea 7:');
      WriteLn(' ------------------------------------------------------------------------------------------------|');
      WriteLn('|-Las Flores  |- El Cristo      |-Roosevelt       |-Panteon     |-Roca Tarpeya  |-Socorro   |-La Bandera   |');
      writeln('|-INCES       |-La Hoyada       |-Los Ilustres    |-Presidente Medina                                      |');
      Textcolor(2);
      Write('| Linea 8:');
      WriteLn(' ------------------------------------------------------------------------------------------------|');
      writeln('|-Petare 2    |-Warairarepano   |-5 de Julio      |-19 de Abril |-24 de Julio                              |');
      WriteLn('|----------------------------------------------------------------------------------------------------------|');
      textcolor(7);
      Readln(ruta);
      If (ruta <> '1') And (ruta <> '2') And (ruta <> '3') And (ruta <> '4') And (ruta <> '5') And (ruta <> '6') And (ruta <> '7')
         And (ruta <> '8') Then
        Begin
          Repeat
            Write('Ingrese una de las rutas disponibles: ');
            ReadLn(ruta);
          Until (ruta = '1') Or (ruta = '2') Or (ruta = '3') Or (ruta = '4') Or (ruta = '5') Or (ruta = '6') Or (ruta = '7') Or (ruta = '8')
        End;
    End;
    Case ruta Of 

      '1':
           Begin
             clrscr;
             WriteLn('Eliga el Punto de Partida y el Destino: [CON SUS RESPECTIVAS MAYUSCULAS]');
             textcolor(5);
             Write('| Linea 1:');
             WriteLn('-------------------------------------------------------------------------------------------------|');
             Writeln('|-Propatria   |-Capitolio       |-Plaza Venezuela |-Miranda    |-Perez Bonalde |-La Hoyada  |-Sabana Grande|');
             WriteLn('|-Plaza sucre |-Parque Carabobo |-Chacaito        |-Gato negro |-Bellas artes  |-Chacao     |-La california|');
             Writeln('|-Agua salud  |-Colegio de Ing. |-Los Dos Caminos |-Petare     |-Cabo Amarillo |-Palo Verde |-Altamira     |');
             WriteLn('|-Los Cortijos                                                                                             |');
             WriteLn('|----------------------------------------------------------------------------------------------------------|');
             textcolor(7);
             Pl1 := (Pl1 + 1);
             Pv1 := (Pv1 + Nb);

             Write('Punto de Partida: ');
             readln(Rs);
             If (Rs <> 'Propatria') And (Rs <> 'Capitolio') And (Rs <> 'Plaza Venezuela') And (Rs <> 'Miranda') And (Rs <> 'Perez Bonalde')
                And (Rs <> 'La Hoyada') And (Rs <> 'Sabana Grande') And (Rs <> 'Plaza Sucre') And (Rs <> 'Parque Carabobo') And (Rs <> 'Chacaito')
                And (Rs <> 'Gato Negro') And (Rs <> 'Bellas Artes') And (Rs <> 'Chacao') And (Rs <> 'La California') And (Rs <> 'Agua Salud')
                And (Rs <> 'Colegio de Ing.') And (Rs <> 'Altamira') And (Rs <> 'Petare') And (Rs <> 'Cabo Amarillo') And (Rs <> 'Palo Verde')
                And (Rs <> 'Los Dos Caminos') And (Rs <> 'Los Cortijos') Then
               Repeat
                 write('Ingrese bien el punto de salida: ');
                 readln(Rs);
                 WriteLn('---------------------------------------------------------------------------');
               Until (Rs = 'Propatria') Or (Rs = 'Capitolio') Or (Rs = 'Plaza Venezuela') Or (Rs = 'Miranda') Or (Rs = 'Perez Bonalde')
                     Or (Rs = 'La Hoyada') Or (Rs = 'Sabana Grande') Or (Rs = 'Plaza Sucre') Or (Rs = 'Parque Carabobo') Or (Rs = 'Chacaito')
                     Or (Rs = 'Gato Negro') Or (Rs = 'Bellas Artes') Or (Rs = 'Chacao') Or (Rs = 'La California') Or (Rs = 'Agua Salud')
                     Or (Rs = 'Colegio de Ing.') Or (Rs = 'Altamira') Or (Rs = 'Petare') Or (Rs = 'Cabo Amarillo') Or (Rs = 'Palo Verde')
                     Or (Rs = 'Los Dos Caminos') Or (Rs = 'Los Cortijos');

             Write('Destino: ');
             ReadLn(Rd);
             If (Rd = Rs) Then
               Repeat
                 write('El Destino no puede ser igual al Punto de Partida: ');
                 ReadLn(Rd);
               Until (Rd <> Rs);
             If (Rd <> 'Propatria') And (Rd <> 'Capitolio') And (Rd <> 'Plaza Venezuela') And (Rd <> 'Miranda') And (Rd <> 'Perez Bonalde')
                And (Rd <> 'La Hoyada') And (Rd <> 'Sabana Grande') And (Rd <> 'Plaza Sucre') And (Rd <> 'Parque Carabobo') And (Rd <> 'Chacaito')
                And (Rd <> 'Gato Negro') And (Rd <> 'Bellas Artes') And (Rd <> 'Chacao') And (Rd <> 'La California') And (Rd <> 'Agua Salud')
                And (Rd <> 'Colegio de Ing.') And (Rd <> 'Altamira') And (Rd <> 'Petare') And (Rd <> 'Cabo Amarillo') And (Rd <> 'Palo Verde')
                And (Rd <> 'Los Dos Caminos') And (Rd <> 'Los Cortijos') Then
               Repeat
                 write('Ingrese bien el Destino: ');
                 readln(Rd);
                 WriteLn('---------------------------------------------------------------------------');
               Until (Rd = 'Propatria') Or (Rd = 'Capitolio') Or (Rd = 'Plaza Venezuela') Or (Rd = 'Miranda') Or (Rd = 'Perez Bonalde')
                     Or (Rd = 'La Hoyada') Or (Rd = 'Sabana Grande') Or (Rd = 'Plaza Sucre') Or (Rd = 'Parque Carabobo') Or (Rd = 'Chacaito')
                     Or (Rd = 'Gato Negro') Or (Rd = 'Bellas Artes') Or (Rd = 'Chacao') Or (Rd = 'La California') Or (Rd = 'Agua Salud')
                     Or (Rd = 'Colegio de Ing.') Or (Rd = 'Altamira') Or (Rd = 'Petare') Or (Rd = 'Cabo Amarillo') Or (Rd = 'Palo Verde')
                     Or (Rd = 'Los Dos Caminos') Or (Rd = 'Los Cortijos');
           End;

      '2':
           Begin
             clrscr;
             WriteLn('Eliga el Punto de Partida y el Destino: [CON SUS RESPECTIVAS MAYUSCULAS]');
             textcolor(4);
             Write('| Linea 2:');
             WriteLn(' ------------------------------------------------------------------------------------------------|');
             writeln('|-El Silencio |-La Paz          |-Capuchinos      |-Mamera     |-Caricuao      |-Antimano   |-La Yaguara   |');
             writeln('|-Maternidad  |-Carapita        |-Zoologico       |-Artiguas   |-Ruiz Pineda/Las Adjuntas                  |');
             WriteLn('|----------------------------------------------------------------------------------------------------------|');
             textcolor(7);
             Pl2 := (Pl2 + 1);
             Pv2 := (Pv2 + Nb);

             Write('Punto de Partida: ');
             readln(Rs);
             If (Rs <> 'El Silencio') And (Rs <> 'La Paz') And (Rs <> 'Capuchinos') And (Rs <> 'Mamera') And (Rs <> 'Caricuao')
                And (Rs <> 'Antimano') And (Rs <> 'La Yaguara') And (Rs <> 'Maternidad') And (Rs <> 'Carapita') And (Rs <> 'Zoologico')
                And (Rs <> 'Artiguas') And (Rs <> 'Ruiz Pineda/Las Adjuntas') Then
               Repeat
                 write('Ingrese bien el punto de salida: ');
                 readln(Rs);
                 WriteLn('---------------------------------------------------------------------------');
               Until  (Rs = 'El Silencio') Or (Rs = 'La Paz') Or (Rs = 'Capuchinos') Or (Rs = 'Mamera') Or (Rs = 'Caricuao')
                     Or (Rs = 'Antimano') Or (Rs = 'La Yaguara') Or (Rs = 'Maternidad') Or (Rs = 'Carapita') Or (Rs = 'Zoologico')
                     Or (Rs = 'Artiguas') Or  (Rs = 'Ruiz Pineda/Las Adjuntas');

             Write('Destino: ');
             ReadLn(Rd);
             If (Rd = Rs)  Then
               Repeat
                 write('El Destino no puede ser igual al Punto de Partida: ');
                 ReadLn(Rd);
               Until (Rd <> Rs);
             If (Rd <> 'El Silencio') And (Rd <> 'La Paz') And (Rd <> 'Capuchinos') And (Rd <> 'Mamera') And (Rd <> 'Caricuao')
                And (Rd <> 'Antimano') And (Rd <> 'La Yaguara') And (Rd <> 'Maternidad') And (Rd <> 'Carapita') And (Rd <> 'Zoologico')
                And (Rd <> 'Artiguas') And (Rd = 'Ruiz Pineda/Las Adjuntas') Then
               Repeat
                 write('Ingrese bien el Destino: ');
                 readln(Rd);
                 WriteLn('---------------------------------------------------------------------------');
               Until  (Rd = 'El Silencio') Or (Rd = 'La Paz') Or (Rd = 'Capuchinos') Or (Rd = 'Mamera') Or (Rd = 'Caricuao')
                     Or (Rd = 'Antimano') Or (Rd = 'La Yaguara') Or (Rd = 'Maternidad') Or (Rd = 'Carapita') Or (Rd = 'Zoologico')
                     Or (Rd = 'Artiguas') Or  (Rd = 'Ruiz Pineda/Las Adjuntas');
           End;

      '3':
           Begin
             clrscr;
             WriteLn('Eliga el Punto de Partida y el Destino: [CON SUS RESPECTIVAS MAYUSCULAS]');
             textcolor(9);
             Write('| Linea 3:');
             writeLn('-------------------------------------------------------------------------------------------------|');
             WriteLn('|-Mercado     |-Los Jardines    |-Los Simbolos    |-El Valle   |-La Rinconada  |-Coche      |-La Bandera   |');
             WriteLn('|-Plaza Venezuela               |-Ciudad Universitaria                                                     |');
             WriteLn('|----------------------------------------------------------------------------------------------------------|');
             textcolor(7);
             Pl3 := (Pl3 + 1);
             Pv3 := (Pv3 + Nb);

             Write('Punto de Partida: ');
             readln(Rs);
             If (Rs <> 'Mercado') And (Rs <> 'Los Jardines') And (Rs <> 'Los Simbolos') And (Rs <> 'El Valle') And (Rs <> 'La Rinconada')
                And (Rs <> 'Coche') And (Rs <> 'La Bandera') And (Rs <> 'Plaza Venezuela') And (Rs <> 'Ciudad Universitaria') Then
               Repeat
                 write('Ingrese bien el punto de salida: ');
                 readln(Rs);
                 WriteLn('---------------------------------------------------------------------------');
               Until (Rs = 'Mercado') Or (Rs = 'Los Jardines') Or (Rs = 'Los Simbolos') Or (Rs = 'El Valle') Or (Rs = 'La Rinconada')
                     Or (Rs = 'Coche') Or (Rs = 'La Bandera') Or (Rs = 'Plaza Venezuela') Or (Rs = 'Ciudad Universitaria');

             Write('Destino: ');
             ReadLn(Rd);
             If (Rd = Rs)  Then
               Repeat
                 write('El Destino no puede ser igual al Punto de Partida: ');
                 ReadLn(Rd);
               Until (Rd <> Rs);
             If (Rd <> 'Mercado') And (Rd <> 'Los Jardines') And (Rd <> 'Los Simbolos') And (Rd <> 'El Valle') And (Rd <> 'La Rinconada')
                And (Rd <> 'Coche') And (Rd <> 'La Bandera') And (Rd <> 'Plaza Venezuela') And (Rd <> 'Ciudad Universitaria') Then
               Repeat
                 write('Ingrese bien el Destino: ');
                 readln(Rd);
                 WriteLn('---------------------------------------------------------------------------');
               Until (Rd = 'Mercado') Or (Rd = 'Los Jardines') Or (Rd = 'Los Simbolos') Or (Rd = 'El Valle') Or (Rd = 'La Rinconada')
                     Or (Rd = 'Coche') Or (Rd = 'La Bandera') Or (Rd = 'Plaza Venezuela') Or (Rd = 'Ciudad Universitaria');
           End;

      '4':
           Begin
             clrscr;
             WriteLn('Eliga el Punto de Partida y el Destino: [CON SUS RESPECTIVAS MAYUSCULAS]');
             Textcolor(10);
             Write('| Linea 4:');
             WriteLn(' ------------------------------------------------------------------------------------------------|');
             WriteLn('|-Zona Rental |-Maternidad      |-Parque Central  |-Antimano   |-Capuchinos    |-La Yaragua |-Nuevo Circo  |');
             writeln('|-Artigas     |-Mamera          |-La Paz          |-Teatros    |-Carapita      |-Ruiz Pineda/Las Adjuntas  |');
             WriteLn('|----------------------------------------------------------------------------------------------------------|');
             textcolor(7);
             Pl4 := (Pl4 + 1);
             Pv4 := (Pv4 + Nb);

             Write('Punto de Partida: ');
             readln(Rs);
             If (Rs <> 'Zona Rental')  And (Rs <> 'Maternidad') And (Rs <> 'Parque Central') And (Rs <> 'Antimano') And (Rs <> 'Capuchinos')
                And (Rs <> 'La Yaragua') And (Rs <> 'Nuevo circo') And (Rs <> 'Artigas') And (Rs <> 'Mamera') And (Rs <> 'La Paz')
                And (Rs <> 'Teatros') And (Rs <> 'Carapita') And (Rs <> 'Ruiz Pineda/Las Adjuntas') Then
               Repeat
                 write('Ingrese bien el punto de salida: ');
                 readln(Rs);
                 WriteLn('---------------------------------------------------------------------------');
               Until (Rs = 'Zona Rental') Or (Rs = 'Maternidad') Or (Rs = 'Capuchinos') Or (Rs = 'Mamera') Or (Rs = 'Parque Central')
                     Or (Rs = 'Antimano') Or (Rs = 'La Yaragua') Or (Rs = 'Nuevo Circo') Or (Rs = 'Carapita') Or (Rs = 'Teatros')
                     Or (Rs = 'Artigas') Or  (Rs = 'Ruiz Pineda/Las Adjuntas') Or (Rs = 'La Paz');

             Write('Destino: ');
             ReadLn(Rd);
             If (Rd = Rs)  Then
               Repeat
                 write('El Destino no puede ser igual al Punto de Partida: ');
                 ReadLn(Rd);
               Until (Rd <> Rs);
             If (Rd <> 'Zona Rental')  And (Rd <> 'Maternidad') And (Rd <> 'Parque Central') And (Rd <> 'Antimano') And (Rd <> 'Capuchinos')
                And (Rd <> 'La Yaragua') And (Rd <> 'Nuevo circo') And (Rd <> 'Artigas') And (Rd <> 'Mamera') And (Rd <> 'La Paz')
                And (Rd <> 'Teatros') And (Rd <> 'Carapita') And (Rd <> 'Ruiz Pineda/Las Adjuntas') Then
               Repeat
                 write('Ingrese bien el Destino: ');
                 readln(Rd);
               Until (Rd = 'Zona Rental')  Or (Rd = 'Maternidad') Or (Rd = 'Parque Central') Or (Rd = 'Antimano') Or (Rd = 'Capuchinos')
                     Or (Rd = 'La Yaragua') Or (Rd = 'Nuevo circo') Or (Rd = 'Artigas') Or (Rd = 'Mamera') Or (Rd = 'La Paz')
                     Or (Rd = 'Teatros') Or (Rd = 'Carapita') Or (Rd = 'Ruiz Pineda/Las Adjuntas');
           End;

      '5':
           Begin
             clrscr;
             WriteLn('Eliga el Punto de Partida y el Destino: [CON SUS RESPECTIVAS MAYUSCULAS]');
             Textcolor(6);
             Write('| Linea 5:');
             WriteLn(' ------------------------------------------------------------------------------------------------|');
             writeln('|-Bello Monte |-Warairarepano   |-Las Mercedes    |-El Marquez |-Bello Campo   |-Boleitas   |-Hugo Chavez  |');
             WriteLn('|-MonteCristo |-Parque Simon Bolivar                                                                       |');
             WriteLn('|----------------------------------------------------------------------------------------------------------|');
             textcolor(7);
             Pl5 := (Pl5 + 1);
             Pv5 := (Pv5 + Nb);

             Write('Punto de Partida: ');
             readln(Rs);
             If (Rs <> 'Bello Monte') And (Rs <> 'Warairarepano') And (Rs <> 'Las Mercedes') And (Rs <> 'El Marquez') And (Rs <> 'Boleitas')
                And (Rs <> 'Bello Campo') And (Rs <> 'Hugo Chavez') And (Rs <> 'MonteCristo') And (Rs <> 'Parque Simon Bolivar') Then
               Repeat
                 write('Ingrese bien el punto de salida: ');
                 readln(Rs);
                 WriteLn('---------------------------------------------------------------------------');
               Until (Rs = 'Bello Monte') Or (Rs = 'Warairarepano') Or (Rs = 'Las Mercedes') Or (Rs = 'El Marquez') Or (Rs = 'Boleitas')
                     Or (Rs = 'Bello Campo') Or (Rs = 'Hugo Chavez') Or (Rs = 'MonteCristo') Or (Rs = 'Parque Simon Bolivar');

             Write('Destino: ');
             ReadLn(Rd);
             If (Rd = Rs)  Then
               Repeat
                 write('El Destino no puede ser igual al Punto de Partida: ');
                 ReadLn(Rd);
               Until (Rd <> Rs);
             If (Rd <> 'Bello Monte') And (Rd <> 'Warairarepano') And (Rd <> 'Las Mercedes') And (Rd <> 'El Marquez') And (Rd <> 'Boleitas')
                And (Rd <> 'Bello Campo') And (Rd <> 'Hugo Chavez') And (Rd <> 'MonteCristo') And (Rd <> 'Parque Simon Bolivar') Then
               Repeat
                 write('Ingrese bien el Destino: ');
                 readln(Rd);
                 WriteLn('---------------------------------------------------------------------------');
               Until (Rd = 'Bello Monte') Or (Rd = 'Warairarepano') Or (Rd = 'Las Mercedes') Or (Rd = 'El Marquez') Or (Rd = 'Boleitas')
                     Or (Rd = 'Bello Campo') Or (Rd = 'Hugo Chavez') Or (Rd = 'MonteCristo') Or (Rd = 'Parque Simon Bolivar');
           End;

      '6':
           Begin
             clrscr;
             WriteLn('Eliga el Punto de Partida y el Destino: [CON SUS RESPECTIVAS MAYUSCULAS]');
             Textcolor(12);
             Write('| Linea 6:');
             WriteLn(' ------------------------------------------------------------------------------------------------|');
             writeln('|-Zoologico   |-La Rinconada                                                                               |');
             WriteLn('|----------------------------------------------------------------------------------------------------------|');
             textcolor(7);
             Pl6 := (Pl6 + 1);
             Pv6 := (Pv6 + Nb);

             Write('Punto de Partida: ');
             readln(Rs);
             If (Rs <> 'Zoologico') And (Rs <> 'La Rinconada') Then
               Repeat
                 write('Ingrese bien el punto de salida: ');
                 readln(Rs);
                 WriteLn('---------------------------------------------------------------------------');
               Until (Rs = 'Zoologico') Or (Rs = 'La Rinconada');

             Write('Destino: ');
             ReadLn(Rd);
             If (Rd = Rs)  Then
               Repeat
                 write('El Destino no puede ser igual al Punto de Partida: ');
                 ReadLn(Rd);
               Until (Rd <> Rs);
             If (Rd <> 'Zoologico') And (Rd <> 'La Rinconada') Then
               Repeat
                 write('Ingrese bien el Destino: ');
                 readln(Rd);
                 WriteLn('---------------------------------------------------------------------------');
               Until (Rd = 'Zoologico') Or (Rd = 'La Rinconada');
           End;

      '7':
           Begin
             clrscr;
             WriteLn('Eliga el Punto de Partida y el Destino: [CON SUS RESPECTIVAS MAYUSCULAS]');
             Write('| Linea 7:');
             WriteLn(' ------------------------------------------------------------------------------------------------|');
             WriteLn('|-Las Flores  |- El Cristo      |-Roosevelt       |-Panteon     |-Roca Tarpeya  |-Socorro   |-La Bandera   |');
             writeln('|-INCES       |-La Hoyada       |-Los Ilustres    |-Presidente Medina                                      |');
             WriteLn('|----------------------------------------------------------------------------------------------------------|');
             textcolor(7);
             Pl7 := (Pl7 + 1);
             Pv7 := (Pv7 + Nb);

             Write('Punto de Partida: ');
             readln(Rs);
             If (Rs <> 'Las Flores') And (Rs <> 'El Cristo') And (Rs <> 'Roosevelt') And (Rs <> 'Panteon') And (Rs <> 'Roca Tarpeya')
                And (Rs <> 'Socorro') And (Rs <> 'La Bandera') And (Rs <> 'INCES') And (Rs <> 'La Hoyada') And (Rs <> 'Los Ilustres')
                And (Rs <> 'Presidente Medina') Then
               Repeat
                 write('Ingrese bien el punto de salida: ');
                 readln(Rs);
                 WriteLn('---------------------------------------------------------------------------');

               Until (Rs = 'Las Flores') Or (Rs = 'El Cristo') Or (Rs = 'Roosevelt') Or (Rs = 'Panteon') Or (Rs = 'Roca Tarpeya')
                     Or (Rs = 'Socorro') Or (Rs = 'La Bandera') Or (Rs = 'INCES') Or (Rs = 'La Hoyada') Or (Rs = 'Los Ilustres')
                     Or (Rs = 'Presidente Medina');

             Write('Destino: ');
             ReadLn(Rd);
             If (Rd = Rs)  Then
               Repeat
                 write('El Destino no puede ser igual al Punto de Partida: ');
                 ReadLn(Rd);
               Until (Rd <> Rs);
             If  (Rd <> 'Las Flores') And (Rd <> 'El Cristo') And (Rd <> 'Roosevelt') And (Rd <> 'Panteon') And (Rd <> 'Roca Tarpeya')
                And (Rd <> 'Socorro') And (Rd <> 'La Bandera') And (Rd <> 'INCES') And (Rd <> 'La Hoyada') And (Rd <> 'Los Ilustres')
                And (Rd <> 'Presidente Medina') Then
               Repeat
                 write('Ingrese bien el Destino: ');
                 readln(Rd);
                 WriteLn('---------------------------------------------------------------------------');

               Until (Rd = 'Las Flores') Or (Rd = 'El Cristo') Or (Rd = 'Roosevelt') Or (Rd = 'Panteon') Or (Rd = 'Roca Tarpeya')
                     Or (Rd = 'Socorro') Or (Rd = 'La Bandera') Or (Rd = 'INCES') Or (Rd = 'La Hoyada') Or (Rd = 'Los Ilustres')
                     Or (Rd = 'Presidente Medina');
           End;

      '8':
           Begin
             clrscr;
             WriteLn('Eliga el Punto de Partida y el Destino: [CON SUS RESPECTIVAS MAYUSCULAS]');
             Textcolor(2);
             Write('| Linea 8:');
             WriteLn(' ------------------------------------------------------------------------------------------------|');
             writeln('|-Petare 2    |-Warairarepano   |-5 de Julio      |-19 de Abril |-24 de Julio                              |');
             WriteLn('|----------------------------------------------------------------------------------------------------------|');
             textcolor(7);
             Pl8 := (Pl8 + 1);
             Pv8 := (Pv8 + Nb);

             Write('Punto de Partida: ');
             readln(Rs);
             If (Rs <> 'Petare 2') And (Rs <> 'Warairarepano') And (Rs <> '5 de Julio') And (Rs <> '19 de Abril') And (Rs <> '24 de Julio')Then
               Repeat
                 write('Ingrese bien el punto de salida: ');
                 readln(Rs);
                 WriteLn('---------------------------------------------------------------------------');
               Until (Rs = 'Petare 2') Or (Rs = 'Warairarepano') Or (Rs = '5 de Julio') Or (Rs = '19 de Abril') Or (Rs = '24 de Julio');

             Write('Destino: ');
             ReadLn(Rd);
             If (Rd = Rs)  Then
               Repeat
                 write('El Destino no puede ser igual al Punto de Partida: ');
                 ReadLn(Rd);
               Until (Rd <> Rs);
             If (Rd <> 'Petare 2') And (Rd <> 'Warairarepano') And (Rd <> '5 de Julio') And (Rd <> '19 de Abril') And (Rd <> '24 de Julio')Then
               Repeat
                 write('Ingrese bien el Destino: ');
                 readln(Rd);
                 WriteLn('---------------------------------------------------------------------------');
               Until (Rd = 'Petare 2') Or (Rd = 'Warairarepano') Or (Rd = '5 de Julio') Or (Rd = '19 de Abril') Or (Rd = '24 de Julio');
           End;

      Else
        writeln('El valor no es valido.');

    End;
  End;

  Write('Presiona cualquier tecla para continuar: ');
  readkey();
  clrscr;
  WriteLn('-----------------------------------------------------------------------------------------------');
  Write('[',Nom, ' ', Ape,'] C.I: ',Ced,' | Desea comprar ', Nb, ' ');
  If (Q = 1) Or (Q = 2) Or (Q = 3) Or (Q = 4) Then
    Begin
      textcolor(14);
      write(TB);
      Textcolor(lightgray);
    End
  Else If (Q = 5) Or (Q = 6) Then
         Begin
           textcolor(12);
           write(TB);
           Textcolor(lightgray);
         End

  Else If (Q = 7) Or (Q = 8) Then
         Begin
           textcolor(2);
           write(TB);
           Textcolor(lightgray);
         End

  Else If (Q = 9) Or (Q = 10) Then

         Begin
           textcolor(4);
           write(TB);
           Textcolor(lightgray);
         End;

  WriteLn(' Por el monto de: ',P,'$' );
  WriteLn('Desde el Punto de Partida: ',Rs);
  WriteLn('Con Destino: ',Rd);
  WriteLn('Metodo de transporte: ', MT);
  Repeat
    WriteLn('[si/no]');
    WriteLn('-----------------------------------------------------------------------------------------------');
    ReadLn(Dec);
    Case Dec Of 

      'no':

            Begin
              WriteLn('---------------------------------------------------');
              WriteLn('Espero nos visites pronto. ');
              Halt;
            End;

      'si':
            Begin
              WriteLn('-----------------------------------------------------------------------------------------------');
              Write('Ingrese el monto para pagar:  ');
              ReadLn(Sal);
              WriteLn('Monto total a pagar: ', P,'$');
              If (Sal < P) Then
                Repeat
                  writeln('Saldo insuficiente');
                  P := (P - Sal);
                  WriteLn('-----------------------------------------------------------------------------------------------');
                  Writeln('Monto restante por pagar: ', P,'$');
                  Write('Ingrese el monto a pagar para cancelar el restante: ');
                  Readln(Sal);
                  WriteLn('-----------------------------------------------------------------------------------------------');
                Until (P = 0) Or (P < Sal);
              If (Sal > p) Then

                WriteLn('-----------------------------------------------------------------------------------------------');
              WriteLn('Sobrepasaste el monto a pagar');
              Sal := (Sal - p);
              Writeln('El cambio es de: ' ,Sal, '$');
            End;
      Else WriteLn('Respuesta no valida, responda:');
    End;
  Until (Dec = 'si') Or (Dec = 'no');

  2: //-----------------------------------------------------------------------------------------------------
     Begin
       // Menu 2
       Write('Presiona cualquier tecla para continuar: ');
       readkey();
       clrscr;
       WriteLn('Que quieres hacer ahora:');
       WriteLn('--------------------------------------------------------------------|');
       WriteLn('|-[1]: Salir del sistema                                            |');
       WriteLn('|-[2]: Utilizar el boleto                                           |');
       WriteLn('|-[3]: Ver en Sistema (Datos personales)                            |');
       WriteLn('|-[4]: Ver en Sistema (Estadisticas Generales de la estacion)       |');
       WriteLn('--------------------------------------------------------------------|');
       ReadLn(SUS);
       If (SUS <> '1') And (SUS <> '2') And (SUS <> '3') And (SUS <> '4')  Then
         Begin
           Repeat
             write('Ingrese una de las respuestas disponibles: ');
             ReadLn(SUS);
           Until (SUS = '1') Or (SUS = '2') Or (SUS = '3') Or (SUS = '4');
         End;
     End;

  Case SUS Of 

    '1':
         Begin
           clrscr;
           WriteLn('---------------------------------------------------');
           WriteLn('Espero nos visites pronto. ');
           Halt;
         End;

    '3':
         Begin
           clrscr;
           Writeln('Para confirmar que es usted, ingrese la clave de seguridad');
           Repeat
             write('Clave: ');
             readln(Input);
             Val(Input, Clav, Clav1);
           Until (Clav1 = 0) And (Clav < 9999) And (Clav > 1000);

           If (Clav <> ClavC ) Then
             Repeat
               write('La clave no coincide, Intentelo de nuevo: ');
               readln(Input);
               Val(Input, Clav, Clav1);
             Until (Clav < 9999) And (Clav > 1000) And (Clav1 = 0) And (clav = ClavC);

           If (Clav = ClavC) Then
             Begin
               WriteLn('--------------------------------------------------------------------|');
               WriteLn('|-[Nombre y Apellido]: ',Nom,' ',Ape,'                              ');
               WriteLn('|-[Cedula]: ',Ced,'                                                 ');
               Write('|-[Tipo de Boleto]: ');
               If (Q = 1) Or (Q = 2) Or (Q = 3) Or (Q = 4) Then
                 Begin
                   textcolor(14);
                   writeln(TB);
                   Textcolor(lightgray);
                 End
               Else If (Q = 5) Or (Q = 6) Then
                      Begin
                        textcolor(12);
                        writeln(TB);
                        Textcolor(lightgray);
                      End

               Else If (Q = 7) Or (Q = 8) Then
                      Begin
                        textcolor(2);
                        writeln(TB);
                        Textcolor(lightgray);
                      End

               Else If (Q = 9) Or (Q = 10) Then

                      Begin
                        textcolor(4);
                        writeln(TB);
                        Textcolor(lightgray);
                      End;

               WriteLn('|-[Metodo de Transporte]: ',MT);
               WriteLn('|-[Boletos restantes]: ',U);
               WriteLn('|-[Boletos Utilizados]: ',CBU);
             End;
           WriteLn('--------------------------------------------------------------------|');
           WriteLn('Pulsa cualquier tecla para ir al menu');
           readkey();
           goto 2;



         End;

    '2':
         Begin
           clrscr;
           WriteLn('-----------------------------------------------------------------------------------------------');
           write(Nom,' Tienes ',U, ' ');
           If (Q = 1) Or (Q = 2) Or (Q = 3) Or (Q = 4) Then
             Begin
               textcolor(14);
               write(TB);
               Textcolor(lightgray);

             End
           Else If (Q = 5) Or (Q = 6) Then
                  Begin
                    textcolor(12);
                    write(TB);
                    Textcolor(lightgray);
                  End

           Else If (Q = 7) Or (Q = 8) Then
                  Begin
                    textcolor(2);
                    write(TB);
                    Textcolor(lightgray);
                  End

           Else If (Q = 9) Or (Q = 10) Then

                  Begin
                    textcolor(4);
                    write(TB);
                    Textcolor(lightgray);
                  End;



           Writeln(' Puedes usarlo ', U, ' veces ');
           Repeat
             writeln('Estas seguro de utilizar el boleto?   [si/no]');
             ReadLn(Dec);
             If (Dec = 'si') Then
               Repeat
                 Writeln('Para confirmar la operacion ingrese su numero de cedula. ');
                 Repeat
                   write('Cedula: ');
                   readln(Input);
                   Val(Input, Ced, Ced1);
                 Until (Ced > 1000000) And (Ced < 40000000) And (Ced1 = 0);
                 If (Ced <> CC) Then
                   Repeat
                     write('La cedula no coincide, Intentelo de nuevo: ');
                     readln(Input);
                     Val(Input, Ced, Ced1);
                   Until (Ced > 1000000) And (Ced < 40000000) And (Ced1 = 0) And (Ced = CC);
                 If (Ced = CC) Then
                   WriteLn('-----------------------------------------------------------------------------------------------');
                 U := (U - 1);
                 CBU := (CBU + 1);

                 If (Q = 1) Then
                   Begin
                     Pl1 := Pl1 + 1;
                   End

                 Else If (Q = 2) Then
                        Begin
                          Pl2 := Pl2 + 1;
                        End

                 Else If (Q = 3) Then
                        Begin
                          Pl3 := Pl3 + 1;
                        End

                 Else If (Q = 4) Then
                        Begin
                          Pl4 := Pl4 + 1;
                        End
                 Else If (Q = 5) Then
                        Begin
                          Pl5 := Pl5 + 1;
                        End
                 Else If (Q = 6) Then
                        Begin
                          Pl6 := Pl6 + 1;
                        End
                 Else If (Q = 7) Then
                        Begin
                          Pl7 := Pl7 + 1;
                        End
                 Else If (Q = 8) Then
                        Begin
                          Pl8 := Pl8 + 1;
                        End;
                 WriteLn('Haz utilizado un boleto, te quedan: ', U);
                 WriteLn('Quieres utilizar otro? [si/no]');
                 readln(Dec)
               Until (U <= 0) Or (Dec = 'no');
           Until (Dec = 'si') Or (Dec = 'no') Or (U <= 0);
           If (Dec = 'no') Then
             Begin
               Goto 2;
             End;
           If (U = 0) Then
             Begin
               Repeat
                 WriteLn('-----------------------------------------------------------------------------------------------');
                 WriteLn('No tienes mas boletos');
                 writeln('Te gustaria comprar mas boletos? [si/no]');
                 ReadLn(Dec);
                 If (Dec = 'no') Then
                   Begin
                     WriteLn('---------------------------------------------------');
                     WriteLn('Espero nos visites pronto. ');
                     Halt;
                   End
                 Else If (Dec = 'si') Then
                        Begin
                          clrscr;
                          goto 1;
                        End;
               Until (Dec = 'si') Or (Dec = 'no');
             End;
         End;

    '4':
         Begin
           clrscr;
           Writeln('Para confirmar que es usted, ingrese la clave de seguridad');
           Repeat
             write('Clave: ');
             readln(Input);
             Val(Input, Clav, Clav1);
           Until (Clav1 = 0) And (Clav < 9999) And (Clav > 1000);

           If (Clav <> ClavC ) Then
             Repeat
               write('La clave no coincide, Intentelo de nuevo: ');
               readln(Input);
               Val(Input, Clav, Clav1);
             Until (Clav < 9999) And (Clav > 1000) And (Clav1 = 0) And (clav = ClavC);

           If (Clav = ClavC) Then
             Begin
               WriteLn('--------------------------------------------------------------------|');
               WriteLn('|-[Cantidad de personas ingresadas Y promedio de ventas por linea]: |');
               If (Pl1 <> 0) Then
                 Begin
                   Pv1 := (Pv1 / Pl1);
                 End;
               If (Pl1 = 0) Then
                 Begin
                   Pl1 := 0;
                 End;
               WriteLn('|-Linea 1: ',Pl1,'                  Ventas: ',Pv1:0:2,'                          |');
               If (Pl2 <> 0) Then
                 Begin
                   Pv2 := (Pv2 / Pl2);
                 End;
               If (Pl2 = 0) Then
                 Begin
                   Pl2 := 0;
                 End;
               WriteLn('|-Linea 2: ',Pl2,'                  Ventas: ',Pv2:0:2,'                          |');
               If (Pl3 <> 0) Then
                 Begin
                   Pv3 := (Pv3 / Pl3);
                 End;
               If (Pl3 = 0) Then
                 Begin
                   Pl3 := 0;
                 End;
               WriteLn('|-Linea 3: ',Pl3,'                  Ventas: ',Pv3:0:2,'                          |');
               If (Pl4 <> 0) Then
                 Begin
                   Pv4 := (Pv4 / Pl4);
                 End;
               If (Pl4 = 0) Then
                 Begin
                   Pl4 := 0;
                 End;
               WriteLn('|-Linea 4: ',Pl4,'                  Ventas: ',Pv4:0:2,'                          |');
               If (Pl5 <> 0) Then
                 Begin
                   Pv5 := (Pv5 / Pl5);
                 End;
               If (Pl5 = 0) Then
                 Begin
                   Pl5 := 0;
                 End;
               WriteLn('|-Linea 5: ',Pl5,'                  Ventas: ',Pv5:0:2,'                          |');
               If (Pl6 <> 0) Then
                 Begin
                   Pv6 := (Pv6 / Pl6);
                 End;
               If (Pl6 = 0) Then
                 Begin
                   Pl6 := 0;
                 End;
               WriteLn('|-Linea 6: ',Pl6,'                  Ventas: ',Pv6:0:2,'                          |');
               If (Pl7 <> 0) Then
                 Begin
                   Pv7 := (Pv7 / Pl7);
                 End;
               If (Pl7 = 0) Then
                 Begin
                   Pl7 := 0;
                 End;
               WriteLn('|-Linea 7: ',Pl7,'                  Ventas: ',Pv7:0:2,'                          |');
               Begin
                 Pv8 := (Pv8 / Pl8);
               End;
               If (Pl8 = 0) Then
                 Begin
                   Pl8 := 0;
                 End;
               WriteLn('|-Linea 8: ',Pl8,'                  Ventas: ',Pv8:0:2,'                          |');
             End;

           WriteLn('--------------------------------------------------------------------|');
           WriteLn('Pulsa cualquier tecla para ir al menu');
           readkey();
           goto 2;

         End;
  End;
End.
