.text
.global VF5
.type VF5, "function"

.global VF6
.type VF6, "function"

.global cos
.type cos, "function"


.global VF9
.type VF9, "function"

VF5:
	mov x20, 0
	scvtf d0, x20
loopVF5:
	cbz w2, endVF5
	ldr s1, [x0], 4
	ldr s2, [x1], 4
	sub w2, w2, 1

	fcvt d1, s1
	fcvt d2, s2

	fmadd d0, d1, d2, d0

	b loopVF5

endVF5:
	ret




//X0<-V    X1<-N   S0<-A    S1<-B

VF6:
	mov x5, 0
loopVF6:
	cbz x1, endVF6
	ldr s2, [x0], 4
	sub x1, x1, 1
	fcmp s2, s0
	b.lt loopVF6
	fcmp s2, s1
	b.gt loopVF6
	add x5, x5, 1
	b loopVF6
endVF6:
	mov x0, x5
	ret


.data

PI: .double 3.141592
const100: .double 100.0
const50: .double 50.0
const180: .double 180.0
nFac: .double 0.000000275573192, 0.00002480158, 0.00138888888, 0.04166666666, 0.5, 1.0


VF9:
	ldr d1, const180
	ldr d2, PI
	ldr d3, const100
	ldr d4, const50
	fmul d0, d0, d2
	fdiv d0, d0, d1                     // rad = g*pi/180

	bl cos

	fmadd d0, d4, d0, d3
	ret



cos:
	ldr d5, =nFac
	fmul d0, d0, d0    // x²
	mov w3, 4

loopcos:
	cbz w3, endcos
	sub w3, w3, 1
	ldr x0, =nFac
	ldr d6, [x0], 8
	fmsub d5, d0, d5, d6

endcos:
	fmov d0, d5
	ret

