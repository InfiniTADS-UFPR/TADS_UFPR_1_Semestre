Program N05LEONARDO_SALGADO;
//Feito por Leonardo Felipe Salgado

{FUP que leia uma rela��o de n�meros positivos, encerrada por um n�mero negativo. Ap�s a
leitura, mostrar os n�meros pares lidos em ordem crescente e os n�meros �mpares lidos em
ordem decrescente. (M�ximo de 100 n�meros)}

var lista:array[1..100] of integer;
		tot,total, count, resto, aux, a, num, erro: integer;
		aux2:string[5];
		troca: boolean;

Begin
  //Valida��o do n�mero
	repeat
	 write('Digite um n�mero e pressione enter => ');
   readln(aux2);
   val(aux2,num,erro);
   if (erro<>0) then
    writeln('Eu pedi um n�mero!');
  until erro = 0;
  a:= 0;
  //Cria��o do vetor
  while (num>0) and (a<100) do
   begin
    a:= a+1;
    lista[a]:= num;
    repeat
	   write('Digite um n�mero e pressione enter => ');
     readln(aux2);
     val(aux2,num,erro);
     if (erro<>0) then
      writeln('Eu pedi um n�mero!');
    until erro = 0;
   end;
  tot:= a;
  total:=tot;
  //Inicio da ordena��o
  repeat
   tot:= tot - 1;
   troca:= true;
   for a:= 1 to tot do
    begin
     if (lista[a] > lista[a+1]) then
      begin
       aux:= lista[a];
       lista[a]:= lista[a+1];
       lista[a+1]:= aux;
       troca:= false;
      end;
    end;
	until troca;
	//Mostra a lista inteira ordenada
  writeln;
  write('Lista informada => ');
  for a:= 1 to total do
   write(lista[a], ' ');
  writeln;
  writeln('Total de n�meros => ', total);
  //Mostra somente os n�meros pares em ordem crescente
	writeln;
  write('N�meros pares => ');
  count:=0;
  for a:= 1 to total do
   begin
    resto:= lista[a] mod 2;
    if (resto = 0) then
     begin
      write(lista[a], ' ');
      count:= count+1;
     end;
   end;
  writeln;
  writeln('Total de n�meros pares => ', count);
  //Mostra somente os �mpares em ordem decrescente
	writeln;
  write('N�meros �mpares => ');
  count:=0;
  for a:= total downto 1 do
   begin
    resto:= lista[a] mod 2;
    if (resto <> 0) then
     begin
      write(lista[a], ' ');
      count:= count+1;
     end;
   end;
  writeln;
  writeln('Total de n�meros �mpares => ', count);  
End.