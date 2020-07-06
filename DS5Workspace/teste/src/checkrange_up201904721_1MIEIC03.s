.text
.global CheckRange
.type CheckRange,"function"


CheckRange:
	mov w5, 0
	mov w3, w0
	neg w3, w3
loopCheckRange:
	cbz w1, endCheckRange
	ldr w4, [x2]
	add x2, x2, 4
	sub w1, w1, 1

	cmp w4, w3
	b.ge nextCheck
	add w5, w5, 1
	str w3, [x2, -4]

	b loopCheckRange
nextCheck:
	cmp w4, w0
	b.le loopCheckRange
	add w5, w5, 1
	str w0, [x2, -4]

	b loopCheckRange

endCheckRange:
	mov w0, w5
	ret
