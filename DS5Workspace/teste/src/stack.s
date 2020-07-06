.text
.global st_ex4
.type st_ex4, "function"
.global st_ex5
.type st_ex5, "function"



st_ex4: //x0, endereco cadeia carateres
mov x9, 0 // contador
mov x8, x0 // copia do endereco
loop_ex4:
	ldrb w1, [x0], 1
	cbz w1, loop2_ex4 // fim da cadeia
	str w1, [SP, -16]! // sempre a apontar para o ultimo endereco da pilha, sempre multiplos de 16
	add x9, x9, 1
	b loop_ex4
loop2_ex4:
	cbz x9, fim_ex4
	ldr w1, [SP], 16
	strb w1, [x8], 1
	sub x9, x9, 1
	b loop2_ex4
fim_ex4:
	ret



soma:


