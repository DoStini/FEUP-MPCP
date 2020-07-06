.text
.global ocorrencias
.type ocorrencias,"function"


ocorrencias:
	// x0 endereco
	// w1 valor
	mov w2, 0 // Resultadao
loop_oc:
	ldrb w4, [x0]
	add x0, x0, 1
	cbz w4, end_oc
	cmp w4, w1
	//b.ne skip_oc
	add w2, w2, 1
skip_oc:
	b loop_oc
end_oc:
	mov w0, w2
	ret
