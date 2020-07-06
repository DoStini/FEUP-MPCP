.text
.global copy_vector
.type copy_vector,"function"


copy_vector:
	// x0 endereco
	// x1 endereco vetor copia
	// w2 dimensao vetor
loop_copy_vector:
	cbz w2, end_copy_vector
	ldrsw x3, [x0]
	add x0, x0, 4
	sub w2, w2, 1
	str x3, [x1]
	add x1, x1, 8
	b loop_copy_vector
end_copy_vector:
	ret




.text
.global xparintab
.type xparintab,"function"
xparintab:  mov X7, #0
			mov X6, #0
        	b loop
loop:		sub X1, X1, 1
			cmp X1, #-1
			b.eq result
			LDR X5, [X0, X6]
			add X6, X6, 4
			TST X5, #1
			b.ne loop
			cmp X5, X2
			b.lt loop
			cmp X5, X3
			b.gt loop
			add X7, X7, 1
			b loop
result:		mov X0, X7
			ret
