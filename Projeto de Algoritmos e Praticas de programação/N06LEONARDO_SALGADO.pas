Program gercandtxtv2 ;
//Feito por Leonardo Felipe Salgado
{O trabalho consiste em alterar o programa gercandtxtv1, validando todas as
informa��es que ser�o digitadas, a menos do nome.}

uses bibliont;

var
 arq:text; //NOME L�GICO DO ARQUIVO (SER� TIPO TEXTO - ACESSO SEQUENCIAL)
 reg:string[60]; //REGISTRO SER� DE 60 CARACTERES
 num,car,dd,mm,aa,a,b,c,tam:integer;
 nome:string[35];
 cpf:string[11];
 numa,anoa:string[4];
 dda,mma,caa:string[2];
 
Begin
 writeln('Trabalho 06: Inscri��o para concurso p�blico');
 writeln;
 assign(arq,'sai1.txt'); //LIGA NOME L�GICO AO F�SICO
 append(arq); //ABRE PARA ACRESCENTAR REGISTROS (S� TIPO TEXTO ACESSO/ORGANIZA��O SEQUENCIAL)
//VALIDAR O NUMERO LIDO. TEM QUE SER MENOR QUE 9999
 repeat
  leitura('N�mero de inscri��o ',num);
  if (num > 9999) then
   writeln('O n�mero de inscri��o deve ter apenas 4 d�gitos!!');
 until num <= 9999;
 while (num > 0) do
  begin 
   writeln;
   str(num,numa); //TRANFORMA NUM INTEGER EM STRING[4]
   tam:=length(numa);
   for a:=1 to 4-tam do
    insert('0',numa,1); //INSERE 0 A ESQUERDA
   write('Digite seu nome completo => ');
   readln(nome);
   nome:=upcase(nome);
   tam:=length(nome);
   for a:=tam+1 to 35 do
    insert(' ',nome,a); //INSERE ESPA�OS A DIREITA
//VALIDAR O CPF (USAR A FUN��O DA BIBLIONT)
   repeat 
    writeln;
	  write('Digite seu CPF => ');
    readln(cpf);
    if (not validacpf(cpf)) then
     writeln('O CPF deve ser v�lido!!');
   until validacpf(cpf);
//VALIDAR A DATA (USAR A FUN��O DA BIBLIONT)
   repeat 
    writeln;
    leitura('Dia de nascimento ',dd);
    leitura('M�s de nascimento ',mm);
    leitura('Ano de nascimento ',aa);
    if (not validata(dd,mm,aa)) then
     writeln('Data inv�lida!!');
   until validata(dd,mm,aa);
//VALIDAR O CARGO - TEM QUE ESTAR ENTRE 1 E 12
   repeat   
    writeln;
    leitura('Cargo desejado ',car);
    if (car > 12) then
     writeln('Digite um cargo v�lido!!');
   until car <= 12;
   str(dd,dda); //TRANSFORMA DIA EM STRING[2]
   if(dd<10)then
    insert('0',dda,1);
   str(mm,mma); //TRANSFORMA MES EM STRING[2]
   if(mm<10)then
    insert('0',mma,1);
   str(aa,anoa); //TRANSFORMA ANO EM STRING[4]
   str(car,caa); //TRANSFORMA CARGO EM STRING[2]
   if(car<10)then
   insert('0',caa,1);
//Insiro os campos strings no registro de tr�s para frente inserindo sempre na posi��o 1
   insert(caa,reg,1);
   insert(anoa,reg,1);
   insert(mma,reg,1);
   insert(dda,reg,1);
   insert(cpf,reg,1);
   insert(nome,reg,1);
   insert(numa,reg,1);
//ABRA O ARQUIVO SAI1.TXT, DEPOIS DE ENCERRAR, E CONFIRA
   writeln(arq,reg); //GRAVA O REGISTRO
//VALIDAR O NUMERO LIDO. TEM QUE SER MENOR QUE 9999
   writeln;
   repeat  
    writeln;
    leitura('N�mero de inscri��o ',num);
    if (num > 9999) then
     writeln('O n�mero de inscri��o deve ter apenas 4 d�gitos!!');
   until num <= 9999;
  end;
 close(arq);
 fim;
End.