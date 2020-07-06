.text
.global freqchars
.type freqchars, "function"

const100: .float 100.0
const32: .int 32
/*
- N:    número de carateres do texto
- text: endereço base da sequência de carateres que constitui o texto
- nl:    número de letras a pesquisar
- lett: endereço base da sequência de letras a pesquisar
- freq: endereço base da sequência de frequências relativas das letras
*/
//freqchars(unsigned int N, char *text, char nl, char *lett, float *freq);
/*
freqchars:
	ldr w22, const32
	mov x21, x1
	dup v22.16b, w22
	scvtf s25, w0
	ldr s15, const100
	lsr w0, w0, 4
	mov w10, 0 // NULL CHARACTER
	mov w11, 0 // LETTER COUNTER TO COMPARE
loopFC:
	cbz w2, endFC
	sub w2, w2, 1
	ldrb w9, [x3], 1
	mov w5, 0
	mov w20, w0
	mov x1, x21
loop2FC:
	dup v1.16b, w9
	cbz w20, end2FC
	sub w20, w20, 1
	ldr q5, [x1], 16

	cmeq v0.16b, v5.16b, v1.16b
	addv b6, v0.16b
	smov w6, v6.b[0]
	sub w5, w5, w6

	sub v1.16b, v1.16b, v22.16b
	cmeq v0.16b, v5.16b, v1.16b
	addv b6, v0.16b
	smov w6, v6.b[0]
	sub w5, w5, w6

	b loop2FC
end2FC:
	cmp w5, w11
	b.lt skipmov
	mov w10, w9
	mov w11, w5
skipmov:
	scvtf s4, w5
	fmul s0, s15, s4
	fdiv s0, s0, s25
	str s0, [x4], 4
	b loopFC
endFC:
	mov w0, w10
	ret



teste2:
	ldr q0, [x0]
	cmge v1


*/
