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
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+12
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	goToStart
	.word	initPlayer
	.word	DMANow
	.word	tilesetOnePal
	.word	tilesetOneTiles
	.size	initialize, .-initialize
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
	ldr	r3, .L15
	mov	lr, pc
	bx	r3
	mov	fp, #67108864
	ldr	r8, .L15+4
	ldr	r4, .L15+8
	ldr	r7, .L15+12
	ldr	r10, .L15+16
	ldr	r6, .L15+20
	ldr	r5, .L15+24
	ldr	r9, .L15+28
.L13:
	ldrh	r3, [r4]
	strh	r3, [r8]	@ movhi
	ldr	r3, [r7]
	ldrh	r2, [r5, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L7
.L9:
	.word	.L12
	.word	.L11
	.word	.L7
	.word	.L7
	.word	.L10
	.word	.L7
	.word	.L8
.L11:
	ldr	r3, .L15+32
	mov	lr, pc
	bx	r3
.L7:
	mov	lr, pc
	bx	r6
	b	.L13
.L8:
	mov	r0, #224
	strh	r9, [fp]	@ movhi
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r6
	b	.L13
.L10:
	mov	r0, #0
	strh	r9, [fp]	@ movhi
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r6
	b	.L13
.L12:
	ldr	r3, .L15+36
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r6
	b	.L13
.L16:
	.align	2
.L15:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	state
	.word	fillScreen4
	.word	waitForVBlank
	.word	67109120
	.word	1028
	.word	phaseOneState
	.word	drawStartScreen
	.size	main, .-main
	.text
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateGame, .-updateGame
	.align	2
	.global	goToPhaseTwo
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPhaseTwo, %function
goToPhaseTwo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r0, #768
	mov	r2, #2
	ldr	r3, .L19
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	state
	.size	goToPhaseTwo, .-goToPhaseTwo
	.align	2
	.global	goToPhaseThree
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPhaseThree, %function
goToPhaseThree:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r0, #768
	mov	r2, #3
	ldr	r3, .L22
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	state
	.size	goToPhaseThree, .-goToPhaseThree
	.align	2
	.global	drawPauseScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPauseScreen, %function
drawPauseScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	push	{r4, lr}
	ldr	r2, .L26
	mov	r0, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L26+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	1028
	.word	fillScreen4
	.size	drawPauseScreen, .-drawPauseScreen
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
	mov	r1, #67108864
	mov	r0, #768
	mov	r2, #4
	ldr	r3, .L29
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	bx	lr
.L30:
	.align	2
.L29:
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	drawLoseScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLoseScreen, %function
drawLoseScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	push	{r4, lr}
	ldr	r2, .L33
	mov	r0, #224
	strh	r2, [r3]	@ movhi
	ldr	r3, .L33+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	1028
	.word	fillScreen4
	.size	drawLoseScreen, .-drawLoseScreen
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
	mov	r3, #67108864
	ldr	r2, .L37
	push	{r4, lr}
	mov	r0, #224
	strh	r2, [r3]	@ movhi
	ldr	r3, .L37+4
	mov	lr, pc
	bx	r3
	mov	r2, #6
	ldr	r3, .L37+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L38:
	.align	2
.L37:
	.word	1028
	.word	fillScreen4
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	drawWinScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWinScreen, %function
drawWinScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawWinScreen, .-drawWinScreen
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r0, #768
	mov	r2, #5
	ldr	r3, .L41
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	bx	lr
.L42:
	.align	2
.L41:
	.word	state
	.size	goToWin, .-goToWin
	.comm	state,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
