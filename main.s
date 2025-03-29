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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause.part.0, %function
pause.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L8
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L8+8
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	buttons
	.word	goToStartPhase
	.word	state
	.size	pause.part.0, .-pause.part.0
	.set	splashScreen.part.0,pause.part.0
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
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L12+4
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	mgba_open
	.word	state
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
	mov	r2, #6
	ldr	r3, .L15
	strb	r2, [r3]
	bx	lr
.L16:
	.align	2
.L15:
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
	ldr	r2, .L20
	push	{r4, lr}
	mov	r0, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L20+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+8
	ldrh	r3, [r3]
	tst	r3, #8
	popne	{r4, lr}
	bne	pause.part.0
.L17:
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	1028
	.word	fillScreen4
	.word	oldButtons
	.size	pause, .-pause
	.align	2
	.global	goToSplashScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToSplashScreen, %function
goToSplashScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L23
	strb	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	state
	.size	goToSplashScreen, .-goToSplashScreen
	.align	2
	.global	splashScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	splashScreen, %function
splashScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L28
	push	{r4, lr}
	mov	r0, #3
	strh	r1, [r2]	@ movhi
	ldr	r3, .L28+4
	mov	r2, #83886080
	ldr	r1, .L28+8
	ldr	r4, .L28+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L28+16
	ldr	r0, .L28+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+24
	ldrh	r3, [r3]
	tst	r3, #8
	popne	{r4, lr}
	bne	splashScreen.part.0
.L25:
	pop	{r4, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	1028
	.word	-2147483392
	.word	splashScreenPal
	.word	DMANow
	.word	drawFullscreenImage4
	.word	splashScreenBitmap
	.word	oldButtons
	.size	splashScreen, .-splashScreen
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
	ldr	r3, .L45
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r3, r2
	ldr	r5, .L45+4
	ldr	r7, .L45+8
	strb	r2, [r5]
	ldr	r4, .L45+12
	ldr	fp, .L45+16
	ldr	r10, .L45+20
	ldr	r9, .L45+24
	ldr	r8, .L45+28
	ldr	r6, .L45+32
.L40:
	ldrh	r2, [r4]
	strh	r2, [r7]	@ movhi
	ldrh	r2, [r6, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L31
.L33:
	.word	.L39
	.word	.L38
	.word	.L37
	.word	.L36
	.word	.L35
	.word	.L34
	.word	.L32
	.word	.L32
.L32:
	mov	lr, pc
	bx	r9
.L31:
	mov	lr, pc
	bx	r8
	ldrb	r3, [r5]	@ zero_extendqisi2
	b	.L40
.L34:
	ldr	r3, .L45+36
	mov	lr, pc
	bx	r3
	b	.L31
.L35:
	ldr	r3, .L45+40
	mov	lr, pc
	bx	r3
	b	.L31
.L36:
	ldr	r3, .L45+44
	mov	lr, pc
	bx	r3
	b	.L31
.L37:
	ldr	r3, .L45+48
	mov	lr, pc
	bx	r3
	b	.L31
.L39:
	mov	lr, pc
	bx	fp
	b	.L31
.L38:
	mov	lr, pc
	bx	r10
	ldr	r3, .L45+52
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L31
	ldr	r3, .L45+56
	mov	lr, pc
	bx	r3
	mov	r3, #2
	strb	r3, [r5]
	b	.L31
.L46:
	.align	2
.L45:
	.word	mgba_open
	.word	state
	.word	oldButtons
	.word	buttons
	.word	splashScreen
	.word	startPhaseState
	.word	pause
	.word	waitForVBlank
	.word	67109120
	.word	phaseThreeState
	.word	phaseTwoState
	.word	phaseOneState
	.word	drawStartInstructionsDialouge
	.word	checkPlayerGuideCollision
	.word	goToStartInstructions
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
	mov	r2, #7
	ldr	r3, .L48
	strb	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
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
