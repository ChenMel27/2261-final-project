	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"mode4.c"
	.text
	.align	2
	.global	setPixel4
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	r3, [r3]
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	tst	r0, #1
	ldrh	r0, [r3, r1]
	andne	r0, r0, #255
	andeq	r0, r0, #65280
	orrne	r2, r0, r2, lsl #8
	orreq	r2, r0, r2
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L6:
	.align	2
.L5:
	.word	videoBuffer
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #36
	ldrb	ip, [sp, #72]	@ zero_extendqisi2
	ldrb	lr, [sp, #72]	@ zero_extendqisi2
	subs	r7, r3, #0
	orr	ip, ip, lr, lsl #8
	str	r2, [sp, #16]
	strh	ip, [sp, #30]	@ movhi
	ble	.L7
	mov	r3, r2
	mov	r4, r1
	add	r8, r2, r2, lsr #31
	add	r2, r0, r2
	orr	r9, r0, r2
	and	r1, r0, r2
	str	r2, [sp, #12]
	asr	r3, r3, #1
	bic	r2, r2, r0
	asr	r8, r8, #1
	and	r1, r1, #1
	and	r2, r2, #1
	orr	r3, r3, #-2130706432
	mov	r6, r0
	ldr	r10, .L20
	ldr	fp, .L20+4
	str	r1, [sp, #4]
	str	r2, [sp, #8]
	str	r3, [sp, #20]
	add	r7, r7, r4
	orr	r8, r8, #-2130706432
	and	r9, r9, #1
	b	.L14
.L9:
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L19
	ldr	r3, [sp, #8]
	cmp	r3, #0
	movne	r2, r5
	movne	r3, r8
	add	r1, sp, #30
	bne	.L18
	mov	r1, r4
	mov	r0, r6
	ldrb	r2, [sp, #72]	@ zero_extendqisi2
	bl	setPixel4
	mov	r3, r8
	mov	r0, #3
	add	r2, r5, #2
	add	r1, sp, #30
	mov	lr, pc
	bx	fp
.L10:
	add	r4, r4, #1
	cmp	r7, r4
	beq	.L7
.L14:
	rsb	r5, r4, r4, lsl #4
	add	r5, r6, r5, lsl #4
	ldr	r3, [r10]
	add	r5, r5, r5, lsr #31
	bic	r5, r5, #1
	cmp	r9, #0
	add	r5, r3, r5
	bne	.L9
	mov	r2, r5
	mov	r3, r8
	mov	r0, #3
	add	r1, sp, #30
	add	r4, r4, #1
	mov	lr, pc
	bx	fp
	cmp	r7, r4
	bne	.L14
.L7:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L19:
	mov	r1, r4
	ldrb	r2, [sp, #72]	@ zero_extendqisi2
	mov	r0, r6
	bl	setPixel4
	ldr	r3, [sp, #16]
	cmp	r3, #1
	add	r2, r5, #2
	add	r1, sp, #30
	ble	.L12
	ldr	r3, [sp, #20]
.L18:
	mov	r0, #3
	mov	lr, pc
	bx	fp
.L12:
	ldr	r3, [sp, #12]
	mov	r1, r4
	ldrb	r2, [sp, #72]	@ zero_extendqisi2
	sub	r0, r3, #1
	bl	setPixel4
	b	.L10
.L21:
	.align	2
.L20:
	.word	videoBuffer
	.word	DMANow
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #16
	strb	r0, [sp, #7]
	ldr	r2, .L24
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r0, #3
	orr	ip, ip, r3, lsl #8
	ldr	r2, [r2]
	ldr	r3, .L24+4
	ldr	r4, .L24+8
	add	r1, sp, #14
	strh	ip, [sp, #14]	@ movhi
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	videoBuffer
	.word	-2130687232
	.word	DMANow
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	cmp	r3, #0
	ldr	r6, [sp, #32]
	ldrb	r9, [sp, #36]	@ zero_extendqisi2
	ble	.L26
	mov	r7, r2
	mov	r10, r1
	sub	r5, r6, #1
	add	r8, r3, r1
	sub	r6, r0, r6
	add	r5, r5, r2
.L28:
	cmp	r7, #0
	subgt	r4, r5, r7
	ble	.L32
.L30:
	ldrb	r2, [r4, #1]!	@ zero_extendqisi2
	cmp	r2, r9
	add	r0, r4, r6
	movne	r1, r10
	blne	setPixel4
.L29:
	cmp	r4, r5
	bne	.L30
.L32:
	add	r10, r10, #1
	cmp	r10, r8
	add	r5, r5, r7
	sub	r6, r6, r7
	bne	.L28
.L26:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L37
	mov	r1, r0
	ldr	r2, [r3]
	ldr	r4, .L37+4
	mov	r0, #3
	ldr	r3, .L37+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	videoBuffer
	.word	DMANow
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	drawChar4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar4, %function
drawChar4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, r0
	mov	r8, r1
	mov	r7, r3
	ldr	r10, .L50
	add	r2, r2, r2, lsl #1
	sub	r10, r10, r0
	add	r9, r0, #6
	add	r10, r10, r2, lsl #4
.L40:
	mov	r4, #0
	add	r5, r10, r6
	b	.L42
.L41:
	add	r4, r4, #1
	cmp	r4, #8
	add	r5, r5, #6
	beq	.L49
.L42:
	ldrb	ip, [r5]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L41
	add	r1, r8, r4
	mov	r2, r7
	mov	r0, r6
	add	r4, r4, #1
	bl	setPixel4
	cmp	r4, #8
	add	r5, r5, #6
	bne	.L42
.L49:
	add	r6, r6, #1
	cmp	r6, r9
	bne	.L40
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	fontdata_6x8
	.size	drawChar4, .-drawChar4
	.align	2
	.global	drawString4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString4, %function
drawString4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L52
	mov	r4, r0
	mov	r7, r1
	mov	r6, r3
.L54:
	mov	r0, r4
	mov	r3, r6
	mov	r1, r7
	bl	drawChar4
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L54
.L52:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString4, .-drawString4
	.align	2
	.global	flipPages
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPages, %function
flipPages:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L63
	moveq	r2, #100663296
	ldr	r1, .L63+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L64:
	.align	2
.L63:
	.word	100704256
	.word	videoBuffer
	.size	flipPages, .-flipPages
	.ident	"GCC: (devkitARM release 53) 9.1.0"
