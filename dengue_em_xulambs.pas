{  -----UNIVERSIDADE FEDERAL DE SÃO JOÃO DEL-REI-----
		  Isabella Vieira Ferreira
		    Mônica Neli de Resende
	  Ciência da Computação - 1º período
			    03/06/2011                           }


{------------------------------------------------------------------
Este programa verifica qual a melhor vila (em um grafo), 
      em que deve ficar o posto de vacinação
------------------------------------------------------------------}

Program dengue_em_xulambs;

uses crt;   

var 
	matriz: array [1..100,1..3] of integer;                    //matriz para armazenar os dados lidos do arquivo
	arquivo: text;                                            //nome do arquivo interno
	vetor: array [1..100] of integer;                         //vetor para armazenar as vilas que sobraram
	vilas: integer;                                          //numero de vilas do país
	cont: integer;									  //variavel contadora
	contador: integer;								 //variavel contadora
	i: integer;                                              //variável de controle
	j: integer;                                              //variável de controle
	k: integer;                                              //variável de controle
	w: integer;                                              //variável de controle
	z: integer;                                              //variável de controle
	maior_contador: integer;				   		     //variavel contadora
	posicao: integer;                                        //posicao no vetor em que esta a vila
	teste: integer;                                          // conta quantos testes serão feitos a medida que são lidos do arquivo
	

 Begin
 
 	clrscr;
 	
 	assign (arquivo,'xulambs.txt');       //assinalamento de arquivo interno e externo
 	reset (arquivo);                      //abre arquivo ja existente
 	
 	readln (arquivo,vilas);               //le o numero de vilas do pais
 	
 	teste:= 1;
 	
 	while (vilas > 1) do
 	begin
 	
 		//inicializando o vetor e a matriz com 0
 		for i:=1 to 100 do 
 		begin
		 	vetor[i]:=0;
			for j:=1 to 3 do 
			begin
				matriz[i,j]:=0;
			end;
		end;
		
		//colocando os dados lidos na matriz (na coluna 1 e coluna 2)
	 	for i:= 1 to vilas-1 do
 	    	begin
 	    	   	readln (arquivo,matriz[i,1],matriz[i,2]);
 	    	end;	
				
		cont:= vilas-1;
		
		contador:=0;
		
		//enquanto sobrar arestas para cortar, ate sobrar duas ou menos
		while (cont > 2) do
		begin
			{contando quantas vezes o numero da vila se repete}	
			for i:= 1 to vilas-1 do                  
			begin
				if (matriz[i,3] <> -1) then               
				begin
					for j:= 1 to 2 do
					begin
						for z:= 1 to vilas-1 do
						begin
							if (matriz[z,3] <> -1) then
							begin
								for w:= 1 to 2 do
								begin
									if (matriz [i,j]= matriz[z,w]) then
									begin
										contador:= contador + 1;
									end;	
								end;
							end;
						end;
						if (contador = 1) then            {se houver apenas uma vila daquela,significa que ela está na extremidade,entao
													a 3ª coluna da matriz recebe -2 para que ainda possa ser usado na contagem dos graus}
						begin
							matriz[i,3]:=-2;
						end;
						contador:=0;
					end;
				end;
			end;
			
			//Substitui o -2 por -1 para que nao sejam mais usados
			for i:=1 to vilas-1 do
			begin
				if (matriz[i,3] = -2) then 
				begin
					matriz[i,3]:=-1;
				end;
			end;
			
			cont := 0;
			
			//verifica quantas linhas sao diferentes de -1 e conta quantas linhas ainda sobraram para avaliar 
			for i:= 1 to vilas-1 do                  
			begin
				if (matriz[i,3] <> -1) then
				begin
					cont:= cont + 1;
				end;
			end;
		end;  
		
		//Se nao sobra nenhuma aresta sem cortar verifica qual vertice tem maior grau, ou seja, qual aparece mais vezes
		if (cont = 0) then
		begin
			for i:= 1 to k -1 do
			begin
				for z:= 1 to 2 do
				begin
					contador:=0;
					for j:= 1 to vilas-1 do
					begin
						for w:=1 to 2 do
						begin
							if (matriz[i,z] = matriz[j,w]) then
							begin
								contador:= contador + 1;
							end;
						end;
					end;
					if (contador > maior_contador) then
					begin
						maior_contador:= contador;
						posicao:= matriz[i,z];
					end;
				end;
			end;
		end
		else
		begin
		   //Se sobrar alguma aresta sem cortar atribui esses valores a um vetor
		   k:=1;
		   for i:= 1 to vilas-1 do                 
			begin
				for j:= 1 to 2 do
				begin
			    		if (matriz[i,3] <> -1) then
			    		begin
			    			vetor[k]:= matriz[i,j];
			    			k:= k +1;
					end;
				end;	
			end;
		     maior_contador:=0;
			
			//Verifica qual vertice do vetor tem maior grau, ou seja, aparece mais vezes
			for i:= 1 to k -1 do
			begin
				contador:=0;
				for j:= 1 to vilas-1 do
				begin
					for w:=1 to 2 do
					begin
						if (vetor[i] = matriz[j,w]) and (matriz[j,3]<>-1) then
						begin
							contador:= contador + 1;
						end;
					end;
				end;
				if (contador > maior_contador) then
				begin
					maior_contador:= contador;
					posicao:= vetor[i];
				end;
			end;
		end;
		
		
		//escreve o numero do teste e em qual vila deve ficar o posto de saude
		writeln ('Teste ',teste);
		writeln (posicao);
		
		teste:= teste + 1;         //incrementando o numero de testes
		
		 
		readln (arquivo,vilas);    //lendo o proximo teste a ser avaliado
	end;
  
	
	//se o numero de vilas for um , o posto ficara nessa msm cidade
 	if (vilas = 1) then
 	begin
 		writeln ('Teste ',teste);
 		writeln('1');
 	end;
 	
	close(arquivo);  //fechando o arquivo
	
	readkey;	 
		
end.
		
		
			
			
			
			
		
						
 	
 	
 	
 	

 	
 
 	
