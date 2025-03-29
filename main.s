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
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	goToStartPhase
	.size	initialize, .-initialize
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #5
	ldr	r3, .L7
	strb	r2, [r3]
	bx	lr
.L8:
	.align	2
.L7:
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L16
	push	{r4, lr}
	mov	r0, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L9
	ldr	r3, .L16+12
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L15
.L9:
	pop	{r4, lr}
	bx	lr
.L15:
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+20
	strb	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	1028
	.word	fillScreen4
	.word	oldButtons
	.word	buttons
	.word	goToStartPhase
	.word	state
	.size	pause, .-pause
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
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
	ldr	r3, .L32
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+4
	mov	lr, pc
	bx	r3
	ldr	r8, .L32+8
	ldr	r4, .L32+12
	ldr	r5, .L32+16
	ldr	fp, .L32+20
	ldr	r10, .L32+24
	ldr	r9, .L32+28
	ldr	r7, .L32+32
	ldr	r6, .L32+36
.L27:
	ldrh	r3, [r4]
	strh	r3, [r8]	@ movhi
	ldrb	r3, [r5]	@ zero_extendqisi2
	ldrh	r2, [r6, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L19
.L21:
	.word	.L26
	.word	.L25
	.word	.L24
	.word	.L23
	.word	.L22
	.word	.L20
	.word	.L20
.L20:
	mov	lr, pc
	bx	r9
.L19:
	mov	lr, pc
	bx	r7
	b	.L27
.L22:
	ldr	r3, .L32+40
	mov	lr, pc
	bx	r3
	b	.L19
.L23:
	ldr	r3, .L32+44
	mov	lr, pc
	bx	r3
	b	.L19
.L24:
	ldr	r3, .L32+48
	mov	lr, pc
	bx	r3
	b	.L19
.L26:
	mov	lr, pc
	bx	fp
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L19
	ldr	r3, .L32+52
	mov	lr, pc
	bx	r3
	mov	r3, #1
	strb	r3, [r5]
	b	.L19
.L25:
	ldr	r3, .L32+56
	mov	lr, pc
	bx	r3
	b	.L19
.L33:
	.align	2
.L32:
	.word	mgba_open
	.word	goToStartPhase
	.word	oldButtons
	.word	buttons
	.word	state
	.word	startPhaseState
	.word	checkPlayerGuideCollision
	.word	pause
	.word	waitForVBlank
	.word	67109120
	.word	phaseThreeState
	.word	phaseTwoState
	.word	phaseOneState
	.word	goToStart
	.word	drawDialouge
	.size	main, .-main
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #6
	ldr	r3, .L35
	strb	r2, [r3]
	bx	lr
.L36:
	.align	2
.L35:
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	pause
	.size	lose, .-lose
	.comm	state,1,1
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	startPage,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
