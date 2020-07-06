.text
.global estudo1
.type estudo1, "function"

estudo1:
	mov x5, 10

	dup v1.2s, x5
	mul v2.2s, v2.2s, v1,2s
ret
