.text
.global eStep
.type eStep, "function"

.global dist
.type dist, "function"

//extern void eStep(unsigned int N, float *seq_P , unsigned int M, double *seq_C, unsigned int *seq_Out);

eStep:
	stp x29, x30, [SP, -16]!
	mov x29, SP

	mov w19, w0	  // N
	mov x20, x1   // Float seq_p
	mov w21, w2   // M
	mov x22, x3   // Float seq_c
	mov x23, x4   // seq out

eStepLoop:
	cbz w19, eStepEnd
	ldr s0, [x20],4
	ldr s1, [x20],4
	sub w19, w19, 1

	mov x0, x22
	mov w1, w21

	bl dist
	str w0, [x23], 4
	b eStepLoop

eStepEnd:
	ldp x29, x30, [SP], 16
	ret






dist:
	mov w2, 0
	mov w5, 0 	// Resultado
	mov x7, -1   // temp
	mov x9, -1   //temp
	scvtf d5, x7 // Curr smalles dist
	scvtf d9, x9 // temporary, to compare
	fmov s12, s0
	fmov s13, s1
distLoop:
	cmp w2, w1
	b.eq distEnd
	ldr d2, [x0], 8
	ldr d3, [x0], 8


	fcvt d0, s12
	fcvt d1, s13

	fsub d0, d2, d0
	fmul d0, d0, d0

	fsub d1, d3, d1
	fmul d1, d1, d1

	fadd d0, d0, d1
	fsqrt d0, d0

	fcmp d5, d9			// If 1st iteration
	b.ne skipDist
	fmov d5, d0
	b distNext
skipDist:
	fcmp d0, d5
	b.ge distNext
	fmov d5, d0
	mov w5, w2

distNext:
	add w2, w2, 1    // This the problem
	b distLoop

distEnd:
	mov w0, w5
	ret
