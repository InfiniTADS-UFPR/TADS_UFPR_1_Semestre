#Dado o conjunto de instru��es visto nas aulas), mostre uma linguagem de montagem para os seguintes segmentos de c�digo

#se (i != 0) ent�o
#i = i � 1;

addi $s0,$zero,2 # i
beqz  $s0, FIM
subi $s0, $s0, 1
FIM: 