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
	.file	"startPhase.c"
	.text
	.align	2
	.global	goToStartPhase
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStartPhase, %function
goToStartPhase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4608
	ldr	r1, .L4
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L4+4
	strh	r1, [r2, #10]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #3840
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, #96
	ldr	r0, .L4+32
	ldr	ip, .L4+36
	ldr	r2, .L4+40
	strb	r3, [r0]
	str	r3, [ip]
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	6020
	.word	DMANow
	.word	snowtilesPal
	.word	100679680
	.word	snowtilesTiles
	.word	100710400
	.word	townMap
	.word	initPlayer
	.word	state
	.word	hOff
	.word	vOff
	.size	goToStartPhase, .-goToStartPhase
	.align	2
	.global	startPhaseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startPhaseState, %function
startPhaseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L8
	ldr	r5, .L8+4
	mov	r1, r4
	mov	r0, r5
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r2, [r5]
	ldrh	r1, [r4]
	strh	r2, [r3, #20]	@ movhi
	strh	r1, [r3, #22]	@ movhi
	ldr	r2, .L8+12
	mov	lr, pc
	bx	r2
	ldr	r4, .L8+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+20
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	vOff
	.word	hOff
	.word	updatePlayer
	.word	drawPlayer
	.word	DMANow
	.word	shadowOAM
	.size	startPhaseState, .-startPhaseState
	.ident	"GCC: (devkitARM release 53) 9.1.0"
