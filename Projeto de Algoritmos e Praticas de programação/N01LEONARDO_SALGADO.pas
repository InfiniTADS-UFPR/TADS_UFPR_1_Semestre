Program N01LEONARDO_SALGADO;
//Leonardo Felipe Salgado

{FUP que leia dois n�meros e a opera��o aritm�tica desejada (+, �, *, /). Ap�s a leitura calcule, 
SE POSS�VEL e mostre a resposta da opera��o realizada. Se n�o for poss�vel realizar a opera��o, 
mostrar a palavra ERRO e a resposta que ser� 0(zero).}

//VERS�O COM IF

var n1, n2, result: real;
		ops: string[1];

Begin
	writeln('Trabalho 1: Calculador b�sico');
	writeln();
	writeln('Digite o primeito n�mero e pressione Enter: ');
	readln(n1);
	writeln('Digite o segundo n�mero e pressione Enter: ');
	readln(n2);
	writeln('Digite a opera��o desejada (+, -, *, /) e pressione Enter: ');
	readln(ops);
	writeln();
	writeln('Realizando opera��o: ', n1, ops, n2);
	if (ops = '+') then
		begin
			result := n1+n2;
			writeln('Resultado: ', result);
		end;
	if (ops = '-') then
		begin
			result := n1-n2;
			writeln('Resultado: ', result);
		end;
	if (ops = '*') then
		begin
			result := n1*n2;
			writeln('Resultado: ', result);
		end;
	if (ops = '/') then
		begin
			if (n2 = 0) then
				writeln('ERRO: Divis�o por 0')
			else
				result := n1/n2;
				writeln('Resultado: ', result);
		end;
End.

// VERS�O COM CASE

{var n1, n2, result: real;
		ops: char;

Begin
	writeln('Trabalho 1: Calculador b�sico');
	writeln();
	writeln('Digite o primeito n�mero e pressione Enter: ');
	readln(n1);
	writeln('Digite o segundo n�mero e pressione Enter: ');
	readln(n2);
	writeln('Digite a opera��o desejada (+, -, *, /) e pressione Enter: ');
	readln(ops);
	writeln();
	writeln('Realizando opera��o: ', n1, ops, n2);
	case ops of
		'+': result := n1+n2;
		'-': result := n1-n2;
		'*': result := n1*n2;
		'/': if (n2 = 0) then
					writeln('ERRO: Divis�o por 0')
				 else
					result := n1/n2;
	end;
	writeln('Resultado: ', result);
End.}

