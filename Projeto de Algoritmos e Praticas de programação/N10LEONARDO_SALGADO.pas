Program N10LEONARDO_SALGADO;
//Feito por Leonardo Felipe Salgado

{FUP que possibilite mostrar os dados do arquivo CAND.IND conforme abaixo:
1 � Todos os candidatos CLASSIFICADOS nos cargos em ordem alfab�tica ou, 2 � Todos os candidatos em
ordem de classifica��o por cargo ou, 3 � Todos os candidatos em ordem de classifica��o geral. Dar as 
tr�s op��es para o usu�rio escolher uma.}
uses bibliont;

const cargos:array [1..12] of string[22]=
('Enganador de chefe    ','Enrolador de trabalho ','Pensador              ','Analista de sistemas  ',
 'Degustador de cerveja ','Tecnico em redes      ','Contador de estorias  ','Sai da aula antes     ',
 'Acougueiro limpinho   ','Seguranca de banheiro ','Gestor de borboletas  ','Agente leva e traz    ' );

var arq: file of regis;
    reg: regis;
    chave: string[35];
    relatorio: string[26];
    subtitulo:string[22];
    aux:string[4];
    a, b, contlin, pagina, tot, posi, opt,cargo: integer;
    vet: vetor;

procedure cabecalho2(relat:string[26]; subtitle:string[22]; var pag:integer);
 begin
  write('Aperte enter para continuar');
  readln;
  clrscr;
  pag:=pag+1;
  writeln('          ', relat, subtitle,'             P�gina: ', pag);
  writeln;
  writeln(' NUM: NOME:                                CLG:  CLC: CARGO:  FALTOU:');
 end;

Begin
 writeln('---------------------------------------------');
 writeln('| Trabalho 10: Classifica��o dos candidatos |');
 writeln('|                                           |');
 writeln('| Como voc� deseja mostrar os candidatos?   |');
 writeln('| 1 - Candidatos CLASSIFICADOS por nome     |');
 writeln('| 2 - Todos os candidatos por cargo         |');
 writeln('| 3 - Todos os candidatos no geral          |');
 writeln('---------------------------------------------');
 //Escolhe a op��o que ser� usada para ordenar o vetor
 leitura('Op��o ',opt); 
 assign(arq, 'cand.ind');
 reset(arq);
 //Cria o vetor para ordenar
 repeat
  a:= a+1;
  vet[a].pf:= posi;
  read(arq,reg);
  //Seleciona a chave para ordenar o vetor pela escolha do usu�rio
  case opt of
   1: begin; str(reg.car:2, chave); str(reg.ccl:4,aux); chave:=chave+aux+reg.nome; relatorio:='Classificados: '; end;
   2: begin; str(reg.car:2, chave); str(reg.clc:4,aux); chave:=chave+aux; relatorio:='Classifica��o por cargo: '; end;
   3: begin; str(reg.clg:4, chave); relatorio:='Classifica��o geral'; end;
  end;
  vet[a].cc:=chave;
  posi:= posi+1;
 until eof(arq);
 tot:= a;
 //Ordena o vetor com base na chave escolhida
 writeln('Carregando resultado...');
 ordem(vet,tot);
 clrscr; 
 for a:=1 to tot do
  begin;
   //Mostra os candidados na ordem do vetor ordenado
   seek(arq,vet[a].pf);
   read(arq, reg);
   //Mostra o nome do cargo se a op��o n�o for Classifica��o geral
   if (opt <> 3) then
    subtitulo:=cargos[reg.car];
   //Mostra o cabe�alho a cada 20 linhas OU a cada mudan�a de cargo
   if (contlin = 20) or (cargo <> reg.car) and (opt <> 3) then
    begin
		 cabecalho2(relatorio, subtitulo, pagina);
		 contlin:=0;
		end;
	 //N�o mostra os candidatos n�o classificados se a op��o for 1
	 if (opt <> 1) or (reg.ccl <> 0) then
	  begin
	   //Escreve somente as informa��es relevantes do candidato
     write(reg.num:5,' ',reg.nome,' ');
     writeln(reg.clg:5, reg.clc:5, reg.ccl:5, reg.falta:6);
     contlin:= contlin+1;
    end;  
   cargo:=reg.car;
  end;
 close(arq);
 fim; 
End.