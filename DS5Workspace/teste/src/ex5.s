.text
.global POS1msb
.type POS1msb,"function"

.global NCAP
.type NAP, "function"



POS1msb:
	clz x1, x0
	mov x0, 63
	sub x0, x0, x1

end_msb:
	mov x0, x2
	ret



NCAP:
	rbit w1, w0
	cmp w1,w0
	cset w0, eq
	ret
