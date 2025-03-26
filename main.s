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
	.file	"main.c"
	.text
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L13+12
	ldr	r4, .L13+16
	ldr	r6, .L13+20
	ldr	fp, .L13+24
	ldr	r10, .L13+28
	ldr	r9, .L13+32
	ldr	r8, .L13+36
	ldr	r7, .L13+40
	b	.L5
.L12:
	cmp	r3, #0
	beq	.L11
.L4:
	mov	lr, pc
	bx	r8
.L5:
	ldrh	r3, [r4]
	strh	r3, [r5]	@ movhi
	ldrb	r3, [r6]	@ zero_extendqisi2
	ldrh	r2, [r7, #48]
	cmp	r3, #1
	strh	r2, [r4]	@ movhi
	beq	.L2
	cmp	r3, #2
	bne	.L12
	mov	lr, pc
	bx	r9
	b	.L4
.L2:
	mov	lr, pc
	bx	r10
	b	.L4
.L11:
	mov	lr, pc
	bx	fp
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L4
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L4
	ldr	r3, .L13+44
	mov	lr, pc
	bx	r3
	mov	r3, #1
	strb	r3, [r6]
	b	.L4
.L14:
	.align	2
.L13:
	.word	mgba_open
	.word	goToStartPhase
	.word	initPlayer
	.word	oldButtons
	.word	buttons
	.word	state
	.word	startPhaseState
	.word	drawDialouge
	.word	phaseOneState
	.word	waitForVBlank
	.word	67109120
	.word	goToStart
	.size	main, .-main
	.text
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L17
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	mgba_open
	.word	goToStartPhase
	.word	initPlayer
	.size	initialize, .-initialize
	.comm	state,1,1
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	startPage,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
