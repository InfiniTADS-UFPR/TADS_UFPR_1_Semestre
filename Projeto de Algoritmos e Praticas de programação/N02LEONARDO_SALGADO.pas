Program N02LEONARDO_SALGADO;
//Leonardo Felipe Salgado

{FUP que leia uma lista de n�meros inteiros, terminada pelo n�mero 0 e que, para cada n�mero lido, 
mostre o pr�prio n�mero e a rela��o de seus divisores.}

var num, divs, result: integer;
		loop: string[3] = 'sim';

Begin
	writeln('Trabalho 2: Um n�mero e seus divisores');
	while (loop = 'sim') do
		begin
			writeln();
			writeln('Digite um n�mero inteiro e pressione Enter: ');
			readln(num);   
			if (num = 0) then break;
			writeln('N�mero lido: ', num);
			divs := num;
			if (divs < 0) then
				divs := divs * -1;
			writeln('Divisores: ');
			repeat
				result := num mod divs;
				if (result = 0) then
					writeln('		', divs);
				divs := divs-1;
			until divs = 0; 
			writeln();
			writeln('Deseja continuar? sim/n�o');
			readln(loop);
		end;
End.