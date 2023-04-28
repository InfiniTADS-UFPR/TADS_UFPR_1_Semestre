Program N03LEONARDO_SALGADO;
//Feito por Leonardo Felipe Salgado

{O programa nmod dever� ser modificado para a utiliza��o dos m�dulos indicados abaixo. Escrever os 
m�dulos em forma de procedure e function, na frente do arquivo que conter� o trabalho 03.
Colocar as respostas das perguntas (5) no final do arquivo que conter� o trabalho 03, como
coment�rio.}

var p1, p2, n, x, num, r: integer;

function inteiro(nn:real):integer;
	var mult, iint: integer;
			div1, ll:real;
	begin
		div1 := nn;
		mult := 1;
		if (div1 < 0) then
			mult := -1;
		div1 := div1 * mult;
		iint := 0;
		ll := 0;
		repeat
			iint := iint+1;
			ll := ll+1;
		until (ll > div1);
		inteiro := (iint-1)*mult;
	end;
	
function resto(a, b: integer):integer;
	var inter: integer;
	begin
		inter := inteiro(a/b);
		resto := a - inter*b;
	end;
	
procedure sai;
	begin
		writeln();
		writeln('Multiplos de ', n, ' = ', p1);
		writeln('N�o multiplos de ', n, ' = ', p2);
		writeln();
	end;
	
procedure testa(res:integer; var mu, nmu:integer);
	begin
		if (res = 0) then
			mu := mu +1
		else
			nmu := nmu +1;	
	end;

Begin
	p1:=0;
	p2:=0;
	n:=2;
	writeln('Trabalho 3: Quantos n�meros s�o m�ltiplos de 2 e 3?');
	writeln();
	writeln('Digite 10 n�meros e direi quantos s�o m�ltiplos de 2:');
	for x:= 1 to 10 do
		begin
			write('	Digite o ', x:3,'. n�mero e pressione enter => ');
			readln(num);
      r := resto(num, n);
      testa(r, p1, p2);
    end;
  sai;
  p1:=0;
	p2:=0;
	n:=3; 
	writeln('Digite 10 n�meros e direi quantos s�o m�ltiplos de 3:');
	for x:= 1 to 10 do
		begin
			write('	Digite o ', x:3,'. n�mero e pressione enter =>');
			readln(num);
      r := resto(num, n);
      testa(r, p1, p2)
    end;
  sai
End.

{1- Escreva os nomes das vari�veis locais.
	resposta: mult, iint, div1, ll, inter.  
	
2- Escreva os nomes das vari�veis globais.  
	resposta: p1, p2, n, x, num, r.
	
3- Escreva os nomes dos par�metros formais. 
	resposta: nn, a, b, res, mu, nmu
	
4- Escreva os nomes dos par�metros reais.   
	resposta: num, n, r, p1, p2
	
5- Explique o motivo de existir passagem de par�metros por valor e por refer�ncia, na rotina
TESTA.
	resposta: O par�metro por valor � passado apenas para que seja realizada a opera��o, e os par�metros
	por refer�ncia foram passados para que fosse poss�vel alterar o resultado das vari�veis globais.

}