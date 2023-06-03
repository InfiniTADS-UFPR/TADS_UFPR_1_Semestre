Program N07LEONARDO_SALGADO;
//Feito por Leonardo Felipe Salgado

{FUP que possibilite mostrar os dados (veja leinddir.pas) do arquivo CAND.IND em ordem :  1 � Inscri��o 
ou, 2 � Alfab�tica ou, 3 � Cpf ou, 4 - Cargo e alfab�tica dentro do cargo. Dar as quatro op��es para o 
usu�rio escolher uma delas.}
uses bibliont;

const cargos:array [1..12] of string[22]=
('Enganador de chefe    ','Enrolador de trabalho ','Pensador              ','Analista de sistemas  ',
 'Degustador de cerveja ','Tecnico em redes      ','Contador de estorias  ','Sai da aula antes     ',
 'Acougueiro limpinho   ','Seguranca de banheiro ','Gestor de borboletas  ','Agente leva e traz    ' );

var arq: file of regis;
    reg: regis;
    chave: string[35];
    relatorio: string[20];
    a, b, contlin, pagina, tot, posi, opt: integer;
    totcargos: array[1..12] of integer;
    passe: boolean;
    vet: vetor;

Begin
 writeln('------------------------------------------');
 writeln('| Trabalho 07: Ordena��o dos candidatos  |');
 writeln('|                                        |');
 writeln('| Como voc� deseja ordenar os candidatos?|');
 writeln('| 1 - N�mero de inscri��o                |');
 writeln('| 2 - Nome                               |');
 writeln('| 3 - CPF                                |');
 writeln('| 4 - Cargo e nome                       |');
 writeln('------------------------------------------');
 leitura('Op��o ',opt); 
 assign(arq, 'cand.ind');
 reset(arq);
 repeat
  a:= a+1;
  vet[a].pf:= posi;
  read(arq,reg);
  case opt of
   1: begin; str(reg.num:4, chave); relatorio:= 'N�mero de inscri��o'; end;
   2: begin; chave:= reg.nome; relatorio:= 'Nome';  end;
   3: begin; chave:= reg.cpf; relatorio:= 'CPF';  end;
   4: begin; str(reg.car:2, chave); chave:=chave+reg.nome; relatorio:= 'Cargo e nome';  end;
  end;
  vet[a].cc:=chave;
  posi:= posi+1;
 until eof(arq);
 tot:= a;
 writeln('Ordenando...');
 ordem(vet,tot);
 clrscr; 
 for a:=1 to tot do
  begin;
   seek(arq,vet[a].pf);
   read(arq, reg);
   if (reg.car > 0) then
    totcargos[reg.car]:=totcargos[reg.car]+1;
   if (contlin mod 25 = 0) then
    cabeca1(relatorio, pagina);
   write(a:5,reg.num:5,' ',reg.nome,' ',reg.cpf,' ',reg.data.dia,'/',reg.data.mes,'/',reg.data.ano,reg.car:3);
   for b:=1 to 6 do
    write(reg.notas[b]:4);
   writeln(reg.som:5, reg.clg:5, reg.clc:4, reg.ccl:3, reg.falta:3);
   contlin:= contlin+1;
  end;
 close(arq);
 writeln;
 writeln('Total de inscritos por cargo:');
 for b:=1 to 12 do
  writeln(cargos[b], '-->', totcargos[b]:4);
 writeln('Total de candidatos:', tot:5);
End.