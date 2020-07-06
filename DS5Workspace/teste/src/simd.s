.text

.global SIMD1a
.type SIMD1a, "function"
/*
SIMD1a:
	// void somaVetores(float *p, float *Q, float *R, int nElem)
	lsr w3, w3, 2 // n iteracoes = n/4 pois lê 4 de uma vez

SIMD1aloop:
	cbz w3, SIMD1AFIM
	ldr q0, [x0], 16     // le 4 elementos de P, 16 butes (4 floats - 4 byte)
	ldr q1, [x1], 16

	fadd v2, v0.4s, v1.4s
	str q2, [x2], 16    // guarda soma dos 4 floats resultantes de fadd
	sub w3, w3, 1
	b SIMD1aloop

SIMD1AFIM:
	ret


SIMD1B:
	lsr w1, w1, 2		// 4 valores de cada vez

	// k esta em s0
SIMD1BLOOP:
	cbz w1 SIMD1BEND
	ldr q1, [x0]   // nao pode ser q0 pois ia escrever por cima de s0
	sub w1, w1, 1
	fmul v1, v1.4s, v0.s[0]
	str q1, [x0]
	add x0, x0, 16
	b SIMD1BLOOP



SIMD2:
	lsr w2, w2, 2
	mov x5, 0
SIMD2LOOP:
	cbz w2, SIMD2END
	ldr q0, [x0], 4
	ldr q1, [x1], 4
	sub w2, w2, 1
	mul v2, v0.4s, v1.4s
	addv s3, v2.4s
	smov x6, v3.s[0]
	add x5, x5, x6
	b SIMD2LOOP

SIMD2END:
	mov x0, x5
	ret
*/
/*

SIMD3:
	mov x5, 0
	lsr w1, 4
	dup v2.16B, w2
SIMD3LOOP:
	cbz x1, SIMD3END
	ldr q0, [x0], 16
	add x1,x1, 1
	cmeq v0.16B, v0.16B, v1.16B
	addv b0, v0.16B
	smov x4, v3.B[0]
	sub x5, x5, x4

	b SIMD3LOOP
SIMD3END:
	mov x0, x5
	ret



SIMD6:
	fsub d0, d0, d0
	lsr x1, x1, 1
SIMD6LOOP:
	cbz x1, fim
	ldr q1, [x0], 16
	sub x1, x1, 0

	fmul v2.2d, v1.2d, v1.2d

	ins v2.d[0], v1.d[1]		// Ou entao faddp
	fadd d1, d1, d2
	fadd d0, d1

	b SIMD6LOOP
SIMD6END:
	fsqrt d0, d0
	ret

*/




