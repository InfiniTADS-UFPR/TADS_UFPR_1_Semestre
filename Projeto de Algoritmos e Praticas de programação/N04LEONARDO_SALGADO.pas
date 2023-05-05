Program N04LEONARDO_SALGADO;
//Feito por Leonardo Felipe Salgado

{Fa�a um programa que leia uma s�rie de CPF�s e informe se o CPF lido � v�lido ou n�o. CPF
�00000000000� (onze zeros) encerra o programa. Use o exerc�cio 10 da lista 2 (enviado) como
refer�ncia. Garantir que sejam digitados 11 d�gitos (validar).}

var cpf:string[11];
		cpfFormatado:string[14];
    dvc:integer;
    resultado:boolean;
    
procedure readCPF(var cpf:string[11]);
	var a,erro: integer;
			chave:boolean;
	begin
		repeat
			chave:=true;
			write('Informe seu CPF (somente n�meros!) => ');
			readln(cpf);
			val(cpf,a,erro);
			if (erro>0)then
				 chave:=false;
			if (length(cpf)<>11)then
				 chave:=false;
			if not chave then
				writeln('CPF digitado incorretamente!');
				writeln;
		until chave;
	end;
	
function validaCPF(cpf:string[11]; mult:integer; var dvc:integer):boolean;
	var ind,num,soma,ee,resto,dvl,limit:integer;
	begin
		soma:=0;
		val(cpf[mult],dvl,ee);
		limit:=mult-1;
		for ind:=1 to limit do
		 begin
			val(cpf[ind],num, ee);
			soma:=soma+num*mult;
			mult:=mult-1;
		 end;
		resto:=soma mod 11;
		dvc:=11-resto;
		if (dvc>9) then
			dvc:=0;
		if (dvc = dvl) then
			validaCPF:=true
		else
			validaCPF:=false
	end;

Begin
	writeln('Trabalho 4: Validando um CPF');
	writeln;
	readCPF(cpf);
	while (cpf <> '00000000000') do
	 begin
	 	cpfFormatado := copy(cpf,1,3)+'.'+copy(cpf,4,3)+'.'+copy(cpf,7,3)+'-'+copy(cpf,10,2);
	  writeln('CPF lido => ', cpfFormatado);
		resultado:= validaCPF(cpf,10,dvc); 
		writeln('Digito verificador para a posi��o 10 => ', dvc);
		if (resultado) then
		 begin
			resultado:= validaCPF(cpf,11,dvc);
			writeln('Digito verificador para a posi��o 11 => ', dvc);
			if (resultado) then
				writeln('Este CPF � V�LIDO')
			else
 			  writeln('Este CPF � INV�LIDO')
 		 end
		else
			writeln('Este CPF � INV�LIDO');	
		readCPF(cpf);
	 end;
  write('Programa encerrado');
End.