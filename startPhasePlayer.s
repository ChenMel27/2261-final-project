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
	.file	"startPhasePlayer.c"
	.text
	.align	2
	.global	initStartPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStartPlayer, %function
initStartPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #32
	mov	r4, #3
	mov	r5, #72
	mov	r2, #64
	mov	r1, #1
	mov	lr, #0
	mov	r7, #42
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
	str	lr, [ip, #12]
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
	.word	startPlayer
	.word	DMANow
	.word	83886592
	.word	hikerPal
	.word	100728832
	.word	hikerTiles
	.size	initStartPlayer, .-initStartPlayer
	.align	2
	.global	initGuideSprite
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGuideSprite, %function
initGuideSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #10
	mov	r0, #16
	mov	ip, #166
	ldr	r3, .L8
	strb	r1, [r3, #52]
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #48]
	str	r2, [r3, #44]
	str	r2, [r3, #40]
	str	r2, [r3, #36]
	str	r2, [r3, #12]
	ldr	lr, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	guide
	.size	initGuideSprite, .-initGuideSprite
	.global	__aeabi_idivmod
	.align	2
	.global	updateStartPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStartPlayer, %function
updateStartPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #0
	ldr	r7, .L54
	ldr	r3, .L54+4
	ldr	r2, [r7, #16]
	ldr	r4, [r7, #24]
	ldr	ip, [r7, #20]
	ldr	lr, [r7, #28]
	ldrh	r3, [r3]
	add	r9, r4, r2
	add	r8, lr, ip
	tst	r3, #32
	mov	r5, r0
	mov	r6, r1
	str	r10, [r7, #40]
	sub	r1, r9, #1
	sub	r0, r8, #1
	bne	.L27
	mov	r9, #1
	subs	r8, r2, #1
	str	r9, [r7, #40]
	bmi	.L27
	ldr	r9, .L54+8
	add	r10, r8, ip, lsl #8
	ldrb	r10, [r10, r9]	@ zero_extendqisi2
	cmp	r10, #0
	bne	.L52
.L27:
	mov	r8, r2
.L11:
	tst	r3, #16
	bne	.L12
	mov	r9, #1
	add	r10, r4, r8
	cmp	r10, #255
	str	r9, [r7, #40]
	ble	.L53
.L12:
	tst	r3, #64
	bne	.L16
	mov	r0, #1
	subs	ip, ip, #1
	str	r0, [r7, #40]
	bmi	.L16
	ldr	r0, .L54+8
	add	r9, r2, ip, lsl #8
	ldrb	r9, [r9, r0]	@ zero_extendqisi2
	cmp	r9, #0
	lsl	r9, ip, #8
	beq	.L16
	add	r9, r1, r9
	ldrb	r0, [r9, r0]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L16
	tst	r3, #128
	str	ip, [r7, #20]
	beq	.L14
.L20:
	ldr	r9, .L54+12
	ldr	r3, [r9]
	add	r3, r3, #1
.L51:
	str	r3, [r9]
.L18:
	ldr	r2, .L54+16
	ldr	r2, [r2]
	cmp	r2, r3
	bge	.L23
	ldr	r0, [r9, #4]
	ldr	r3, .L54+20
	ldr	r1, [r7, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r1, [r9, #4]
	str	r3, [r9]
	b	.L23
.L16:
	tst	r3, #128
	beq	.L14
	ldr	r9, .L54+12
	ldr	r2, [r7, #40]
	ldr	r3, [r9]
	cmp	r2, #0
	add	r3, r3, #1
	str	r3, [r9]
	streq	r2, [r9, #4]
	streq	r2, [r9]
	bne	.L18
.L23:
	add	r4, r4, r4, lsr #31
	asr	r4, r4, #1
	rsb	r4, r4, #120
	sub	r4, r8, r4
	str	r4, [r5]
	ldr	r3, [r7, #28]
	add	r3, r3, r3, lsr #31
	ldr	r2, [r7, #20]
	asr	r3, r3, #1
	rsb	r3, r3, #80
	sub	r3, r2, r3
	str	r3, [r6]
	ldr	r3, [r5]
	bic	r3, r3, r3, asr #31
	str	r3, [r5]
	ldr	r3, [r6]
	bic	r3, r3, r3, asr #31
	str	r3, [r6]
	ldr	r3, [r5]
	cmp	r3, #16
	movge	r3, #16
	str	r3, [r5]
	ldr	r3, [r6]
	cmp	r3, #96
	movge	r3, #96
	str	r3, [r6]
	ldr	r3, [r5]
	add	r2, r3, #255
	cmp	r3, #0
	movlt	r3, r2
	ldr	r2, .L54+24
	asr	r3, r3, #8
	add	r3, r3, #20
	str	r3, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	mov	r0, #1
	ldr	r3, [r7, #20]
	rsb	ip, lr, #256
	cmp	r3, ip
	str	r0, [r7, #40]
	bge	.L20
	add	lr, lr, r3
	ldr	r0, .L54+8
	add	r2, r2, lr, lsl #8
	ldrb	r2, [r2, r0]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	lr, lr, #8
	add	r2, r3, #1
	beq	.L20
	add	lr, r1, lr
	ldrb	r3, [lr, r0]	@ zero_extendqisi2
	ldr	r9, .L54+12
	cmp	r3, #0
	ldr	r3, [r9]
	add	r3, r3, #1
	strne	r2, [r7, #20]
	strne	r3, [r9]
	bne	.L18
	b	.L51
.L53:
	mov	r9, r10
	ldr	r10, .L54+8
	add	fp, r9, ip, lsl #8
	ldrb	fp, [fp, r10]	@ zero_extendqisi2
	cmp	fp, #0
	add	fp, r8, #1
	beq	.L12
	add	r0, r9, r0, lsl #8
	ldrb	r0, [r0, r10]	@ zero_extendqisi2
	cmp	r0, #0
	movne	r8, fp
	strne	fp, [r7, #16]
	b	.L12
.L52:
	add	r10, r8, r0, lsl #8
	ldrb	r9, [r10, r9]	@ zero_extendqisi2
	cmp	r9, #0
	strne	r8, [r7, #16]
	bne	.L11
	b	.L27
.L55:
	.align	2
.L54:
	.word	startPlayer
	.word	buttons
	.word	townCMBitmap
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	__aeabi_idivmod
	.word	sbb
	.size	updateStartPlayer, .-updateStartPlayer
	.align	2
	.global	updateGuideSprite
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGuideSprite, %function
updateGuideSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateGuideSprite, .-updateGuideSprite
	.align	2
	.global	drawStartPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStartPlayer, %function
drawStartPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L59
	ldr	r2, .L59+4
	ldr	r1, .L59+8
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
	ldr	r1, .L59+12
	str	lr, [sp, #-4]!
	ldr	ip, [r1, #4]
	ldr	r1, .L59+16
	add	r1, r1, ip, lsl #2
	ldr	r1, [r1, #4]
	ldr	lr, .L59+20
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
.L60:
	.align	2
.L59:
	.word	startPlayer
	.word	hOff
	.word	vOff
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	shadowOAM
	.size	drawStartPlayer, .-drawStartPlayer
	.align	2
	.global	drawGuideSprite
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGuideSprite, %function
drawGuideSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L63
	ldr	r3, .L63+4
	ldr	r2, [r1, #20]
	ldr	r3, [r3]
	sub	r2, r2, r3
	and	r2, r2, #255
	mvn	r2, r2, lsl #17
	mov	ip, #472
	mvn	r2, r2, lsr #17
	str	lr, [sp, #-4]!
	ldr	r0, .L63+8
	ldr	r3, [r1, #16]
	ldr	r0, [r0]
	sub	r3, r3, r0
	ldrb	r1, [r1, #52]	@ zero_extendqisi2
	ldr	r0, .L63+12
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	lsl	lr, r1, #3
	orr	r3, r3, #53248
	add	r1, r0, r1, lsl #3
	strh	r2, [r0, lr]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L64:
	.align	2
.L63:
	.word	guide
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.size	drawGuideSprite, .-drawGuideSprite
	.align	2
	.global	checkPlayerGuideCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkPlayerGuideCollision, %function
checkPlayerGuideCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L67
	add	r1, r3, #24
	ldm	r1, {r1, ip}
	ldr	r2, [r3, #20]
	ldr	r3, [r3, #16]
	sub	sp, sp, #16
	ldr	r0, .L67+4
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r0, #16
	ldm	r0, {r0, r1, r2, r3}
	ldr	r4, .L67+8
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	guide
	.word	startPlayer
	.word	collision
	.size	checkPlayerGuideCollision, .-checkPlayerGuideCollision
	.comm	guide,56,4
	.comm	startPlayer,56,4
	.global	startHikerFrames
	.global	startHikerFrame
	.global	startHikerFrameCounter
	.global	startHikerFrameDelay
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	startHikerFrameDelay, %object
	.size	startHikerFrameDelay, 4
startHikerFrameDelay:
	.word	4
	.type	startHikerFrames, %object
	.size	startHikerFrames, 12
startHikerFrames:
	.word	12
	.word	16
	.word	20
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	startHikerFrameCounter, %object
	.size	startHikerFrameCounter, 4
startHikerFrameCounter:
	.space	4
	.type	startHikerFrame, %object
	.size	startHikerFrame, 4
startHikerFrame:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
