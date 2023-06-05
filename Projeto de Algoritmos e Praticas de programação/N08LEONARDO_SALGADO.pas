Program N08LEONARDO_SALGADO;
//Feito por Leonardo Felipe Salgado

{FUP que atualize os campos das 6 notas e o campo soma das notas dos registros do arquivo CAND.IND, dos
candidatos presentes. Antes, executar o programa MARCAFALTAS.PAS, (atualiza o campo reg.falta com 1) 
enviado. Antes de encerrar, mostrar a m�dia das 6 disciplinas.}

//Gabarito: AAAAAAAABBBBBBBBBBBBBCCCCCCCCCCCCCCCCCCDDDDDDDDDDDDDEEEEEEEE
uses bibliont;

const disciplinas: array[1..6] of string[20]=
('L.E.M. ', 'Matem�tica ', 'L�gica ', 'Conhecimento espec. ', 'Inform�tica ', 'Atualidades ');

var arq: file of regis;
    arq2:text;
    reg: regis;
    chave: string[35];
    candnotas: string[28];
    relatorio: string[20];
    a, b, tot, posi, e, tc, soma, total, contlin, pagina: integer;
    notas, medias: array[1..6] of integer;
    vet: vetor;

Begin
 writeln('Trabalho 08: Registrar as notas dos candidatos');
 assign(arq, 'cand.ind');
 assign(arq2,'notas.txt');
 reset(arq);
 reset(arq2);
 //Cria o vetor para ordenar os candidatos por n�mero de inscri��o
 repeat
  a:= a+1;
  vet[a].pf:= posi;
  read(arq,reg);
  str(reg.num, chave);
  tc:=length(chave);
	for b:=1 to 4-tc do
	 insert('0',chave,1);
  vet[a].cc:=chave;
  posi:= posi+1;
 until eof(arq);
 tot:= a;
 //Ordena os candidatos por n�mero de inscri��o
 writeln('Ordenando candidatos...');
 ordem(vet,tot);
 writeln('Registrando notas...');
 //L� as notas e atualiza no Cand.ind pelo n�mero de inscri��o
 repeat
  readln(arq2,candnotas);
  b:=5;
  //L� as notas do notas.txt
  for a:=1 to 6 do
   begin
    val(copy(candnotas,b,4),notas[a],e);
    soma:=soma+notas[a];
    medias[a]:=medias[a]+notas[a];
    b:=b+4;
   end;
  //Pesquisa a posi��o do candidado no vetor  
  pebin1(vet,copy(candnotas,1,4),tot,posi); 
  //Abre o registro do candidato pela posi��o f�sica
  seek(arq,vet[posi].pf);
  read(arq,reg);
  //Atualiza os dados do candidato
  reg.som:=soma;
  for a:=1 to 6 do
   reg.notas[a]:=notas[a];
  //Mostra os candidatos  
  if (contlin mod 25 = 0) then
   cabeca1(relatorio, pagina);
  write('     ',reg.num:5,' ',reg.nome,' ',reg.cpf,' ',reg.data.dia,'/',reg.data.mes,'/',reg.data.ano,reg.car:3);
  for b:=1 to 6 do
   write(reg.notas[b]:4);
  writeln(reg.som:5, reg.clg:5, reg.clc:4, reg.ccl:3, reg.falta:3);
  soma:=0;
  contlin:= contlin+1;
  //Conta os candidados que fizeram a prova
  total:=total+1;
  //Escreve o registro atualizado no cand.ind
  seek(arq,vet[posi].pf);
  write(arq,reg);
 until eof(arq2);
 close(arq);
 close(arq2);
 writeln;
 writeln('M�dia final por disciplina: ');
 //Calcula as m�dias por disciplina considerando somente os candidatos que fizeram a prova
 for b:=1 to 6 do
  writeln(disciplinas[b], '--> ', medias[b]/total:4);
 writeln('Total de candidatos que realizaram a prova:', total:5);
End.