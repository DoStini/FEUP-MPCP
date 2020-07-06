.text
.global maximo
.type maximo,"function"

.global contadorIntervalo
.type contadorIntervalo,"function"


maximo:
	ldr w5, [x0] // Definir o valor maximo como o primeiro elemento de x0
	add x0, x0, #4
	sub x1, x1, #1
ciclo2:
	cbz x1, end2
	ldr w6, [x0]
	add x0, x0, #4
	sub x1, x1, #1

	cmp w6, w5
	b.lt skip2
	mov w5, w6
skip2:
	b ciclo2
end2:
	mov w0, w5
	ret



contadorIntervalo:
	mov w5, 0 // contador, em w2 estara o minimo, w3 o maximo
	mov w4, w3 // usar w4 como maximo para questao de legibilidade de comparacao
loop2e:
	cbz x1, end2e
	ldr w3, [x0]
	add x0, x0, #4
	sub x1, x1, #1

	cmp w3, w2
	b.lt loop2e
	cmp w3, w4
	b.ge loop2e // aalterar para maior ou igual

	add w5, w5, #1
	b loop2e

end2e:
	mov w0, w5
	ret








