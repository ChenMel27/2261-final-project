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
	.file	"phaseOne.c"
	.text
	.align	2
	.global	goToPhaseOne
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPhaseOne, %function
goToPhaseOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #21504
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r3, #4096
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r2, #3
	mov	lr, #0
	mov	r0, #96
	ldr	r3, .L4+24
	ldr	ip, .L4+28
	ldr	r1, .L4+32
	strb	r2, [r3]
	str	lr, [ip]
	str	r0, [r1]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	tilesetOnePal
	.word	tilesetOneTiles
	.word	100704256
	.word	bgOneMap
	.word	initPlayer
	.word	state
	.word	hOff
	.word	vOff
	.size	goToPhaseOne, .-goToPhaseOne
	.align	2
	.global	phaseOneState
	.syntax unified
	.arm
	.fpu softvfp
	.type	phaseOneState, %function
phaseOneState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L8
	ldr	r6, .L8+4
	mov	r1, r4
	mov	r0, r6
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r5, #512
	ldrh	r1, [r6]
	ldr	r2, .L8+12
	strh	r1, [r3, #16]	@ movhi
	ldrb	r2, [r2, #56]	@ zero_extendqisi2
	ldrh	r1, [r4]
	ldr	r4, .L8+16
	lsl	r2, r2, #3
	strh	r1, [r3, #18]	@ movhi
	strh	r5, [r4, r2]	@ movhi
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r1, r4
	mov	r2, #117440512
	ldr	r4, .L8+24
	mov	r0, #3
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
	.word	guide
	.word	shadowOAM
	.word	drawPlayer
	.word	DMANow
	.size	phaseOneState, .-phaseOneState
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
