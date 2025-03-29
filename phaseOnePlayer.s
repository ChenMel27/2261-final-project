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
	.file	"phaseOnePlayer.c"
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
	mov	r1, #0
	mov	r4, #3
	mov	r5, #64
	mov	r3, #30
	mov	r2, #50
	mov	lr, #1
	mov	r7, #101
	mov	r6, #112
	ldr	ip, .L4
	mov	r0, r4
	str	r5, [ip, #4]
	str	r3, [ip, #24]
	str	r2, [ip, #28]
	str	r1, [ip, #16]
	strb	r1, [ip, #56]
	str	r1, [ip, #44]
	str	r1, [ip, #36]
	str	r1, [ip, #12]
	ldr	r5, .L4+4
	mov	r3, #256
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	str	r4, [ip, #48]
	str	r7, [ip, #20]
	str	r6, [ip]
	str	lr, [ip, #40]
	str	lr, [ip, #52]
	str	lr, [ip, #8]
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, r1
	mov	r1, #0
	ldr	r4, .L81
	ldr	r3, .L81+4
	ldrh	r9, [r3]
	add	r3, r4, #20
	ldm	r3, {r3, r5, r10}
	ldr	r2, [r4, #16]
	lsr	fp, r9, #7
	add	ip, r5, r2
	sub	sp, sp, #20
	ldr	r8, .L81+8
	str	r1, [r4, #40]
	eor	fp, fp, #1
	sub	r1, ip, #1
	add	lr, r10, r3
	str	r1, [sp]
	and	fp, fp, #1
	sub	r1, lr, #1
	tst	r9, #32
	mov	r6, r0
	str	ip, [sp, #4]
	str	fp, [r8]
	str	r1, [sp, #8]
	bne	.L8
	mov	ip, r1
	mov	r1, #1
	cmp	r2, #0
	str	r1, [r4, #40]
	ble	.L8
	ldr	r1, [r4, #8]
	ldr	r0, .L81+12
	sub	r1, r2, r1
	add	fp, r1, r3, lsl #9
	ldrb	fp, [fp, r0]	@ zero_extendqisi2
	cmp	fp, #0
	bne	.L72
.L8:
	tst	r9, #16
	bne	.L11
	mov	r0, #1
	ldr	r1, [r4, #16]
	rsb	fp, r5, #512
	cmp	r1, fp
	str	r0, [r4, #40]
	blt	.L73
.L11:
	ldr	r1, .L81+16
	ldrh	r1, [r1]
	tst	r1, #64
	ldr	r1, [r4, #12]
	beq	.L13
	tst	r9, #64
	beq	.L74
.L13:
	add	r1, r1, #1
	cmp	r1, #4
	movgt	r1, #4
	strgt	r1, [r4, #12]
	ble	.L75
.L16:
	ldr	r0, [sp, #4]
	add	ip, r0, r10, lsl #9
	ldr	r0, .L81+12
	sub	ip, ip, #1
	add	ip, r0, ip
	add	r2, r0, r2
	mov	r0, lr
	cmp	r0, #255
	mov	fp, #0
	bgt	.L30
.L28:
	ldrb	r9, [r2, r0, lsl #9]	@ zero_extendqisi2
	add	r0, r0, #1
	cmp	r9, #0
	sub	r10, r0, lr
	beq	.L30
	ldrb	r9, [ip, r3, lsl #9]	@ zero_extendqisi2
	cmp	r9, #0
	beq	.L30
	cmp	r1, r10
	mov	fp, #1
	add	r3, r3, #1
	ble	.L76
	cmp	r0, #255
	ble	.L28
.L30:
	cmp	fp, #0
	strne	r3, [r4, #20]
	b	.L20
.L75:
	cmp	r1, #0
	str	r1, [r4, #12]
	blt	.L14
	bne	.L77
.L26:
	ldr	r3, [r8, #4]
	ldr	r2, [r4, #40]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r8, #4]
	bne	.L78
	str	r2, [r8, #8]
	str	r2, [r8, #4]
	ldr	r9, .L81+20
.L33:
	add	r5, r5, r5, lsr #31
	ldr	r3, [r4, #16]
	asr	r5, r5, #1
	rsb	r5, r5, #120
	sub	r5, r3, r5
	str	r5, [r6]
	ldr	r3, [r4, #28]
	add	r3, r3, r3, lsr #31
	ldr	r2, [r4, #20]
	asr	r3, r3, #1
	rsb	r3, r3, #80
	sub	r3, r2, r3
	str	r3, [r7]
	ldr	r3, [r6]
	bic	r3, r3, r3, asr #31
	str	r3, [r6]
	ldr	r3, [r7]
	bic	r3, r3, r3, asr #31
	str	r3, [r7]
	ldr	r3, [r6]
	cmp	r3, #272
	movge	r3, #272
	str	r3, [r6]
	ldr	r3, [r7]
	cmp	r3, #96
	movge	r3, #96
	str	r3, [r7]
	ldr	r3, [r6]
	add	r2, r3, #255
	cmp	r3, #0
	movlt	r3, r2
	ldr	r0, [r4, #24]
	ldr	r2, [r4, #16]
	ldr	r1, .L81+24
	asr	r3, r3, #8
	add	r2, r2, r0
	add	r3, r3, #20
	cmp	r2, r1
	str	r3, [r9, #4]
	bgt	.L79
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L74:
	cmp	r1, #0
	mvneq	r1, #10
	streq	r1, [r4, #12]
	bne	.L13
.L14:
	ldr	lr, .L81+12
	ldr	r0, [r4, #20]
	ldr	r3, [sp]
	add	r2, r2, lr
	mov	r9, #0
	add	r1, r1, r0
	add	lr, lr, r3
	b	.L24
.L18:
	ldrb	ip, [r2, r3, lsl #9]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L23
	ldrb	ip, [lr, r3, lsl #9]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L23
	cmp	r3, r1
	mov	r9, #1
	beq	.L80
	mov	r0, r3
.L24:
	cmp	r0, #0
	sub	r3, r0, #1
	bgt	.L18
.L23:
	cmp	r9, #0
	strne	r0, [r4, #20]
.L20:
	mov	r3, #0
	str	r3, [r4, #12]
	b	.L26
.L73:
	ldr	r0, [r4, #8]
	ldr	ip, [sp]
	str	r0, [sp, #12]
	add	r0, r0, ip
	ldr	ip, .L81+12
	add	fp, r0, r3, lsl #9
	ldrb	fp, [fp, ip]	@ zero_extendqisi2
	cmp	fp, #0
	beq	.L11
	ldr	fp, [sp, #8]
	add	r0, r0, fp, lsl #9
	ldrb	r0, [r0, ip]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, [sp, #12]
	addne	r1, r1, r0
	strne	r1, [r4, #16]
	b	.L11
.L78:
	ldr	r9, .L81+20
	ldr	r2, [r9]
	cmp	r3, r2
	ble	.L33
	ldr	r0, [r8, #8]
	ldr	r3, .L81+28
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r1, [r8, #8]
	str	r3, [r8, #4]
	b	.L33
.L79:
	ldr	r3, .L81+32
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L72:
	add	fp, r1, ip, lsl #9
	ldrb	r0, [fp, r0]	@ zero_extendqisi2
	cmp	r0, #0
	strne	r1, [r4, #16]
	b	.L8
.L80:
	str	r1, [r4, #20]
	b	.L26
.L76:
	str	r3, [r4, #20]
	b	.L26
.L77:
	ldr	r3, [r4, #20]
	add	lr, r10, r3
	b	.L16
.L82:
	.align	2
.L81:
	.word	player
	.word	buttons
	.word	.LANCHOR0
	.word	bgOneCMBitmap
	.word	oldButtons
	.word	.LANCHOR1
	.word	510
	.word	__aeabi_idivmod
	.word	goToPhaseTwo
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
	push	{r4, lr}
	ldr	r1, .L102
	ldr	r3, [r1, #16]
	ldr	r2, [r1, #20]
	ldr	lr, .L102+4
	add	r0, r3, r2, lsl #9
	ldrb	r0, [r0, lr]	@ zero_extendqisi2
	cmp	r0, #2
	beq	.L84
	ldr	r0, [r1, #24]
	add	r0, r3, r0
	lsl	ip, r2, #9
	sub	r0, r0, #1
	add	ip, r0, ip
	ldrb	ip, [ip, lr]	@ zero_extendqisi2
	cmp	ip, #2
	beq	.L84
	ldr	ip, [r1, #28]
	add	ip, r2, ip
	sub	ip, ip, #1
	add	r4, r3, ip, lsl #9
	ldrb	r4, [r4, lr]	@ zero_extendqisi2
	cmp	r4, #2
	lsl	ip, ip, #9
	beq	.L84
	add	r0, r0, ip
	ldrb	r0, [r0, lr]	@ zero_extendqisi2
	cmp	r0, #2
	beq	.L84
	ldr	ip, .L102+8
	ldr	r0, .L102+12
	ldr	lr, [r1, #52]
	ldr	ip, [ip]
	ldr	r0, [r0]
	cmp	lr, #0
	sub	r3, r3, ip
	sub	r2, r2, r0
	beq	.L86
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	and	r2, r2, #255
	mvn	r2, r2, lsl #17
	mvn	r3, r3, lsr #18
	mvn	r2, r2, lsr #17
	ldr	lr, .L102+16
	ldrb	r1, [r1, #56]	@ zero_extendqisi2
	ldr	ip, .L102+20
	ldr	r4, [lr]
	add	r0, ip, r1, lsl #3
	cmp	r4, #0
	strh	r3, [r0, #2]	@ movhi
	movne	r3, #788
	lsl	r1, r1, #3
	ldreq	r3, .L102+24
	strh	r2, [ip, r1]	@ movhi
	ldreq	r2, [lr, #8]
	addeq	r3, r3, r2, lsl #2
	ldreq	r3, [r3, #8]
	addeq	r3, r3, #480
	lsleq	r3, r3, #22
	lsreq	r3, r3, #22
	strh	r3, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L84:
	mov	r3, #0
	str	r3, [r1, #52]
.L86:
	ldr	r3, .L102+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	player
	.word	bgOneCMBitmap
	.word	hOff
	.word	vOff
	.word	.LANCHOR0
	.word	shadowOAM
	.word	.LANCHOR1
	.word	goToLose
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
	ldr	r3, .L105
	add	r0, r0, r1, lsl #9
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	bx	lr
.L106:
	.align	2
.L105:
	.word	bgOneCMBitmap
	.size	colorAt, .-colorAt
	.global	sbb
	.comm	player,60,4
	.global	isDucking
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
	.type	isDucking, %object
	.size	isDucking, 4
isDucking:
	.space	4
	.type	hikerFrameCounter, %object
	.size	hikerFrameCounter, 4
hikerFrameCounter:
	.space	4
	.type	hikerFrame, %object
	.size	hikerFrame, 4
hikerFrame:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
