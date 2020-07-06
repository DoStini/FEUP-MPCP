.text
.global CountCommon
.type CountCommon, function


CountCommon:
	mov w6, 0
	mov x9, x3
	mov w10, w2
loopA:
	cbz w0, endCountCommon
	ldr w4, [x1]
	add x1, x1, 4
	sub w0, w0, 1
	mov x3, x9
	mov w2, w10

loopB:
	cbz w2, loopA
	ldr w5, [x3]
	add x3, x3, 4
	sub w2, w2, 1
	cmp w5, w4
	b.ne loopB
	add w6, w6, 1
	b loopA

endCountCommon:
	mov w0, w6
	ret
