#Dado o conjunto de instru��es visto nas aulas), mostre uma linguagem de montagem para os seguintes segmentos de c�digo

#se (i == 0) ent�o
#i = i + 1;
#fim-se

addi $s0,$zero,3 # i
add $t0, $zero, $zero
bne $s0, $t0, FIM
addi $s0, $s0, 1
FIM: 