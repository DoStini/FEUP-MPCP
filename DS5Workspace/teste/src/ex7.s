.text
.global intern
.type intern, "function"


intern:
	mov x12, 0
loop_intern:
	cbz w2, end_ok_intern
	ldr w5, [x0], 4
	ldr w6, [x1], 4

	sub w2, w2, 1

	smaddl x12, w5, w6, x12

	asr x13, x12, 31
	cmp x13, 0
	b.eq loop_intern
	cmp x13, -1
	b.eq loop_intern

	mov w12, -1
	lsr w0, w12, 1 // 111..111 -> 011..111 max int
	b return_intern

end_ok_intern:
	mov w0, w12
return_intern:
	ret
