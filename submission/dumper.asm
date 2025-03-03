	@ /B00
LOADER	K /0000 	; inicio da subrotina LOADER
	LD QNT		; obtém quantidade de palavras (blocos)
	MM CONTA	; armazena o contador em CONTA
LOOP	LD /704		; obtém endereço do inicio da leitura
	AD OP_LD	; Compõe o e endereço com opcode LD
	MM LEITURA	; Guarda a instrução de leitura
	LD CONTA	; Carrega contador
	AD UM		; Adiciona um ao contador
	MM CONTA	; Atualiza o contador
	SB /706		; Subtrai a quantidade de palavras do bloco
	JZ FIM		; Se o contador atingir o fim das palavras, jumpzero para o fim
LEITURA K /0000		; Lê instrução de leitura
	PD /300		; Salva no dispositivo 300
	AD CHECKSUM	; Adiciona o checksum
	MM CHECKSUM 	; Salva no checksum
	LD /704		; Pega endereço
	AD DOIS		; Adiciona dois
	MM /704		; Salva o endereço (será o da próxima leitura)
	JP LOOP		; Volta para o começo do laço
CHECKSUM K /0000	; Mantém o checksum
OP_LD	LD /000		; OP de LOAD, com operando 000
DOIS	K=2		; Constante 0010
UM	K=1		; Constante 0001
CONTA	K /0000		; Contador de palavras
FIM	RS LOADER	; fim da subrotina

