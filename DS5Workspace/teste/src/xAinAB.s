.text
.global xAinAB
.type xAinAB, "function"

xAinAB:
	// x0 endereco array
	// x1 array size
	// w2 min: a
	// w3 max: b
	// w5 result
	// w4 temp value
	mov w5, 0
loop_xAinAB:
	cbz x1, end_xAinAB

	ldr w4, [x0]
	add x0, x0, 4
	sub x1, x1, 1

	cmp w4, w2
	b.lt loop_xAinAB
	cmp w4, w3
	b.gt loop_xAinAB

	mov w7, w4
	sdiv w4, w4, w2
	smull x4, w4, w2
	cmp w4, w7
	b.ne loop_xAinAB

	add w5, w5, 1
	b loop_xAinAB

end_xAinAB:
	mov w0, w5
	ret
