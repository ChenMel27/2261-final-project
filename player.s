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
	.file	"player.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #30
	mov	r4, #3
	mov	r5, #64
	mov	r2, #50
	mov	r1, #1
	mov	lr, #0
	mov	r7, #101
	mov	r6, #112
	ldr	ip, .L4
	mov	r0, r4
	str	r5, [ip, #4]
	str	r3, [ip, #24]
	str	r2, [ip, #28]
	str	r1, [ip, #40]
	ldr	r5, .L4+4
	mov	r3, #256
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	str	r4, [ip, #48]
	str	r7, [ip, #20]
	str	r6, [ip]
	str	lr, [ip, #16]
	strb	lr, [ip, #52]
	str	lr, [ip, #44]
	str	lr, [ip, #36]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #16384
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	DMANow
	.word	83886592
	.word	hikerPal
	.word	100728832
	.word	hikerTiles
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L64
	ldrh	r3, [r3]
	ldr	r4, .L64+4
	tst	r3, #32
	mov	r8, r0
	mov	r9, r1
	str	r2, [r4, #40]
	sub	sp, sp, #12
	bne	.L8
	mov	r1, #1
	ldr	r2, [r4, #16]
	cmp	r2, #0
	str	r1, [r4, #40]
	ble	.L8
	ldr	r1, [r4, #20]
	ldr	r0, .L64+8
	sub	r2, r2, #1
	add	ip, r2, r1, lsl #9
	ldrb	ip, [r0, ip]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L58
.L8:
	tst	r3, #16
	ldr	r7, [r4, #24]
	bne	.L11
	mov	r1, #1
	ldr	r2, [r4, #16]
	rsb	r0, r7, #512
	cmp	r2, r0
	str	r1, [r4, #40]
	blt	.L59
.L11:
	ldr	r2, .L64+12
	ldrh	r2, [r2]
	tst	r2, #64
	ldr	r5, [r4, #12]
	beq	.L13
	tst	r3, #64
	bne	.L13
	cmp	r5, #0
	bne	.L13
	mvn	r5, #10
	ldr	r3, [r4, #16]
	str	r5, [r4, #12]
	str	r3, [sp, #4]
.L14:
	ldr	r2, [sp, #4]
	ldr	r0, .L64+8
	ldr	r3, [r4, #20]
	add	lr, r2, r7
	sub	lr, lr, #1
	add	lr, r0, lr
	mov	r1, #0
	add	r0, r0, r2
	add	r5, r5, r3
	b	.L25
.L61:
	cmp	r3, r5
	beq	.L60
.L25:
	mov	ip, r3
	sub	r3, r3, #1
	ldrb	r2, [r0, r3, lsl #9]	@ zero_extendqisi2
	ldrb	r6, [lr, r3, lsl #9]	@ zero_extendqisi2
	subs	r2, r2, #0
	movne	r2, #1
	cmp	r6, #0
	moveq	r2, #0
	mov	r6, r1
	cmp	ip, #0
	movle	r1, #0
	andgt	r1, r2, #1
	cmp	r1, #0
	bne	.L61
	cmp	r6, #0
	strne	ip, [r4, #20]
	b	.L26
.L13:
	add	r5, r5, #1
	cmp	r5, #4
	str	r5, [r4, #12]
	movgt	r5, #4
	ldr	r3, [r4, #16]
	strgt	r5, [r4, #12]
	str	r3, [sp, #4]
	ble	.L62
.L16:
	mov	ip, #0
	mov	r3, ip
	ldr	r2, [sp, #4]
	ldr	r10, [r4, #28]
	ldr	lr, [r4, #20]
	add	r6, r7, r2
	add	r0, lr, r10
	add	r6, r6, r0, lsl #9
	add	r6, r6, #508
	add	r0, r2, r0, lsl #9
	ldr	r2, .L64+8
	add	r6, r6, #3
	add	r0, r0, #512
	rsb	r10, r10, #256
	add	r6, r6, r2
	add	r0, r0, r2
.L21:
	ldrb	r2, [r6, r3, lsl #9]	@ zero_extendqisi2
	subs	r2, r2, #0
	movne	r2, #1
	ldrb	r1, [r0, r3, lsl #9]	@ zero_extendqisi2
	cmp	r1, #0
	mov	fp, ip
	movne	ip, r2
	moveq	ip, #0
	cmp	ip, #0
	add	r3, r3, #1
	beq	.L20
	cmp	r10, lr
	ble	.L20
	cmp	r3, r5
	add	lr, lr, #1
	blt	.L21
	str	lr, [r4, #20]
	b	.L23
.L62:
	cmp	r5, #0
	bgt	.L16
	bne	.L14
.L23:
	ldr	r6, .L64+16
	ldr	r2, [r4, #40]
	ldr	r3, [r6]
	cmp	r2, #0
	add	r3, r3, #1
	str	r3, [r6]
	bne	.L63
	str	r2, [r6, #4]
	str	r2, [r6]
	ldr	r5, .L64+20
.L28:
	add	r7, r7, r7, lsr #31
	ldr	r3, [sp, #4]
	asr	r7, r7, #1
	rsb	r7, r7, #120
	sub	r7, r3, r7
	str	r7, [r8]
	ldr	r3, [r4, #28]
	add	r3, r3, r3, lsr #31
	ldr	r2, [r4, #20]
	asr	r3, r3, #1
	rsb	r3, r3, #80
	sub	r3, r2, r3
	str	r3, [r9]
	ldr	r3, [r8]
	bic	r3, r3, r3, asr #31
	str	r3, [r8]
	ldr	r3, [r9]
	bic	r3, r3, r3, asr #31
	str	r3, [r9]
	ldr	r3, [r8]
	cmp	r3, #272
	movge	r3, #272
	str	r3, [r8]
	ldr	r3, [r9]
	cmp	r3, #96
	movge	r3, #96
	str	r3, [r9]
	ldr	r3, [r8]
	add	r2, r3, #255
	cmp	r3, #0
	movlt	r3, r2
	asr	r3, r3, #8
	add	r3, r3, #20
	str	r3, [r5, #4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L59:
	ldr	r1, [r4, #20]
	ldr	r0, .L64+8
	add	ip, r2, r7
	add	lr, ip, r1, lsl #9
	ldrb	lr, [r0, lr]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L11
	ldr	lr, [r4, #28]
	add	r1, r1, lr
	sub	r1, r1, #1
	add	r1, ip, r1, lsl #9
	ldrb	r1, [r0, r1]	@ zero_extendqisi2
	cmp	r1, #0
	addne	r2, r2, #1
	strne	r2, [r4, #16]
	b	.L11
.L63:
	ldr	r5, .L64+20
	ldr	r2, [r5]
	cmp	r3, r2
	ble	.L28
	ldr	r0, [r6, #4]
	ldr	r3, .L64+24
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r1, [r6, #4]
	str	r3, [r6]
	b	.L28
.L20:
	cmp	fp, #0
	strne	lr, [r4, #20]
.L26:
	mov	r3, #0
	str	r3, [r4, #12]
	b	.L23
.L58:
	ldr	ip, [r4, #28]
	add	r1, r1, ip
	sub	r1, r1, #1
	add	r1, r2, r1, lsl #9
	ldrb	r1, [r0, r1]	@ zero_extendqisi2
	cmp	r1, #0
	strne	r2, [r4, #16]
	b	.L8
.L60:
	str	r3, [r4, #20]
	b	.L23
.L65:
	.align	2
.L64:
	.word	buttons
	.word	player
	.word	bgOneCMBitmap
	.word	oldButtons
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	__aeabi_idivmod
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L68
	ldr	r2, .L68+4
	ldr	r1, .L68+8
	ldr	ip, [r2]
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldr	r1, [r1]
	sub	r3, r3, ip
	sub	r2, r2, r1
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	and	r2, r2, #255
	mvn	r3, r3, lsl #18
	mvn	r2, r2, lsl #17
	mvn	r3, r3, lsr #18
	mvn	r2, r2, lsr #17
	ldr	r1, .L68+12
	str	lr, [sp, #-4]!
	ldr	ip, [r1, #4]
	ldr	r1, .L68+16
	add	r1, r1, ip, lsl #2
	ldr	r1, [r1, #8]
	ldr	lr, .L68+20
	ldrb	r0, [r0, #52]	@ zero_extendqisi2
	add	r1, r1, #480
	lsl	r1, r1, #22
	add	ip, lr, r0, lsl #3
	lsr	r1, r1, #22
	lsl	r0, r0, #3
	strh	r2, [lr, r0]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r1, [ip, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L69:
	.align	2
.L68:
	.word	player
	.word	hOff
	.word	vOff
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	colorAt
	.syntax unified
	.arm
	.fpu softvfp
	.type	colorAt, %function
colorAt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L71
	add	r0, r0, r1, lsl #9
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	bx	lr
.L72:
	.align	2
.L71:
	.word	bgOneCMBitmap
	.size	colorAt, .-colorAt
	.global	sbb
	.comm	player,56,4
	.global	hikerFrames
	.global	hikerFrame
	.global	hikerFrameCounter
	.global	hikerFrameDelay
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	hikerFrameDelay, %object
	.size	hikerFrameDelay, 4
hikerFrameDelay:
	.word	4
	.type	sbb, %object
	.size	sbb, 4
sbb:
	.word	20
	.type	hikerFrames, %object
	.size	hikerFrames, 12
hikerFrames:
	.word	12
	.word	16
	.word	20
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hikerFrameCounter, %object
	.size	hikerFrameCounter, 4
hikerFrameCounter:
	.space	4
	.type	hikerFrame, %object
	.size	hikerFrame, 4
hikerFrame:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
