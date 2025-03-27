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
	mov	r2, #0
	ldr	r3, .L56
	ldrh	r3, [r3]
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L56+4
	tst	r3, #32
	mov	r5, r0
	mov	r6, r1
	str	r2, [r7, #40]
	ldr	r8, [r7, #16]
	bne	.L11
	mov	r2, #1
	cmp	r8, #0
	str	r2, [r7, #40]
	ble	.L11
	ldr	r2, [r7, #20]
	ldr	r0, .L56+8
	sub	r1, r8, #1
	add	ip, r1, r2, lsl #8
	ldrb	ip, [ip, r0]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L54
.L11:
	tst	r3, #16
	ldr	r4, [r7, #24]
	bne	.L12
	mov	r2, #1
	rsb	r1, r4, #256
	cmp	r1, r8
	str	r2, [r7, #40]
	bgt	.L55
.L12:
	tst	r3, #64
	bne	.L16
	mov	r1, #1
	ldr	r2, [r7, #20]
	cmp	r2, #0
	str	r1, [r7, #40]
	ble	.L16
	sub	r2, r2, #1
	ldr	r1, .L56+8
	add	r0, r8, r2, lsl #8
	ldrb	r0, [r0, r1]	@ zero_extendqisi2
	cmp	r0, #0
	lsl	ip, r2, #8
	beq	.L16
	add	r0, r4, r8
	sub	r1, r1, #1
	add	r0, r0, ip
	ldrb	r1, [r0, r1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L16
	tst	r3, #128
	str	r2, [r7, #20]
	beq	.L14
.L20:
	ldr	r9, .L56+12
	ldr	r3, [r9]
.L53:
	add	r3, r3, #1
	str	r3, [r9]
.L18:
	ldr	r2, .L56+16
	ldr	r2, [r2]
	cmp	r2, r3
	bge	.L23
	ldr	r0, [r9, #4]
	ldr	r3, .L56+20
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
	ldr	r9, .L56+12
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
	ldr	r2, .L56+24
	asr	r3, r3, #8
	add	r3, r3, #20
	str	r3, [r2]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L14:
	mov	r1, #1
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #20]
	rsb	r0, r3, #256
	cmp	r2, r0
	str	r1, [r7, #40]
	bge	.L20
	add	r3, r2, r3
	add	r3, r3, r1
	ldr	r1, .L56+8
	add	r0, r8, r3, lsl #8
	ldrb	r0, [r0, r1]	@ zero_extendqisi2
	cmp	r0, #0
	lsl	r3, r3, #8
	beq	.L20
	add	r0, r4, r8
	sub	r1, r1, #1
	add	r3, r0, r3
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	ldr	r9, .L56+12
	cmp	r3, #0
	ldr	r3, [r9]
	beq	.L53
	add	r2, r2, #1
	add	r3, r3, #1
	str	r2, [r7, #20]
	str	r3, [r9]
	b	.L18
.L55:
	ldr	r2, [r7, #20]
	ldr	r0, .L56+8
	add	r1, r4, r8
	add	ip, r1, r2, lsl #8
	ldrb	ip, [ip, r0]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L12
	ldr	ip, [r7, #28]
	add	r2, r2, ip
	sub	r2, r2, #1
	add	r2, r1, r2, lsl #8
	ldrb	r2, [r2, r0]	@ zero_extendqisi2
	cmp	r2, #0
	addne	r8, r8, #1
	strne	r8, [r7, #16]
	b	.L12
.L54:
	ldr	ip, [r7, #28]
	add	r2, r2, ip
	sub	r2, r2, #1
	add	r2, r1, r2, lsl #8
	ldrb	r2, [r2, r0]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r8, r1
	strne	r1, [r7, #16]
	b	.L11
.L57:
	.align	2
.L56:
	.word	buttons
	.word	startPlayer
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
	ldr	r0, .L61
	ldr	r2, .L61+4
	ldr	r1, .L61+8
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
	ldr	r1, .L61+12
	str	lr, [sp, #-4]!
	ldr	ip, [r1, #4]
	ldr	r1, .L61+16
	add	r1, r1, ip, lsl #2
	ldr	r1, [r1, #4]
	ldr	lr, .L61+20
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
.L62:
	.align	2
.L61:
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
	ldr	r1, .L65
	ldr	r3, .L65+4
	ldr	r2, [r1, #20]
	ldr	r3, [r3]
	sub	r2, r2, r3
	and	r2, r2, #255
	mvn	r2, r2, lsl #17
	mov	ip, #472
	mvn	r2, r2, lsr #17
	str	lr, [sp, #-4]!
	ldr	r0, .L65+8
	ldr	r3, [r1, #16]
	ldr	r0, [r0]
	sub	r3, r3, r0
	ldrb	r1, [r1, #52]	@ zero_extendqisi2
	ldr	r0, .L65+12
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
.L66:
	.align	2
.L65:
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
	ldr	r3, .L69
	add	r1, r3, #24
	ldm	r1, {r1, ip}
	ldr	r2, [r3, #20]
	ldr	r3, [r3, #16]
	sub	sp, sp, #16
	ldr	r0, .L69+4
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r0, #16
	ldm	r0, {r0, r1, r2, r3}
	ldr	r4, .L69+8
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L70:
	.align	2
.L69:
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
