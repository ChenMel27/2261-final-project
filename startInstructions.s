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
	.file	"startInstructions.c"
	.text
	.align	2
	.global	goToStartInstructions
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStartInstructions, %function
goToStartInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L3
	ldr	r3, .L3+4
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	bx	lr
.L4:
	.align	2
.L3:
	.word	1044
	.word	.LANCHOR0
	.size	goToStartInstructions, .-goToStartInstructions
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Hello...\000"
	.align	2
.LC1:
	.ascii	"You are here to summit mount rainier...\000"
	.align	2
.LC2:
	.ascii	"If you want to give\000"
	.align	2
.LC3:
	.ascii	"survival your best shot...\000"
	.align	2
.LC4:
	.ascii	"My name is Brady,\000"
	.align	2
.LC5:
	.ascii	"I've led tours for 30 years...\000"
	.align	2
.LC6:
	.ascii	"Three sections await with difficulty...\000"
	.align	2
.LC7:
	.ascii	"We begin with the Ascent\000"
	.align	2
.LC8:
	.ascii	"to Camp Muir...\000"
	.align	2
.LC9:
	.ascii	"Let's begin.\000"
	.text
	.align	2
	.global	drawStartInstructionsDialouge
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStartInstructionsDialouge, %function
drawStartInstructionsDialouge:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L57
	ldr	r6, .L57+4
	mov	lr, pc
	bx	r5
	mov	r0, #0
	ldr	r3, .L57+8
	mov	lr, pc
	bx	r3
	ldr	r4, [r6]
	cmp	r4, #0
	beq	.L50
	cmp	r4, #1
	beq	.L51
	cmp	r4, #2
	beq	.L52
	cmp	r4, #3
	beq	.L53
	cmp	r4, #4
	beq	.L54
	cmp	r4, #5
	beq	.L55
	cmp	r4, #6
	beq	.L56
.L8:
	mov	lr, pc
	bx	r5
	ldr	r3, .L57+12
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L50:
	mov	r3, #1
	mov	r1, #60
	mov	r0, #7
	ldr	r2, .L57+16
.L49:
	ldr	r4, .L57+20
.L47:
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L8
.L37:
	ldr	r3, .L57+28
	ldrh	r3, [r3]
	tst	r3, #8
	ldreq	r3, [r6]
	addeq	r3, r3, #1
	streq	r3, [r6]
	b	.L8
.L52:
	mov	r3, #1
	ldr	r2, .L57+32
	mov	r1, #55
	mov	r0, #5
	ldr	r4, .L57+20
	mov	lr, pc
	bx	r4
	mov	r3, #1
	ldr	r2, .L57+36
.L45:
	mov	r1, #65
	mov	r0, #5
	b	.L47
.L51:
	mov	r3, r4
	mov	r1, #60
	mov	r0, #5
	ldr	r2, .L57+40
	ldr	r4, .L57+20
	b	.L47
.L53:
	mov	r3, #1
	ldr	r2, .L57+44
	mov	r1, #55
	mov	r0, #5
	ldr	r4, .L57+20
	mov	lr, pc
	bx	r4
	mov	r3, #1
	ldr	r2, .L57+48
	b	.L45
.L54:
	mov	r3, #1
	mov	r1, #60
	mov	r0, #5
	ldr	r2, .L57+52
	b	.L49
.L55:
	mov	r3, #1
	mov	r1, #55
	mov	r0, r4
	ldr	r2, .L57+56
	ldr	r7, .L57+20
	mov	lr, pc
	bx	r7
	mov	r3, #1
	mov	r0, r4
	mov	r1, #65
	ldr	r2, .L57+60
	mov	lr, pc
	bx	r7
	ldr	r3, .L57+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L8
	b	.L37
.L56:
	mov	r3, #1
	mov	r1, #60
	mov	r0, #5
	ldr	r2, .L57+64
	ldr	r4, .L57+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L8
	ldr	r3, .L57+28
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L8
	ldr	r3, .L57+68
	mov	lr, pc
	bx	r3
	b	.L8
.L58:
	.align	2
.L57:
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	fillScreen4
	.word	flipPages
	.word	.LC0
	.word	drawString4
	.word	oldButtons
	.word	buttons
	.word	.LC2
	.word	.LC3
	.word	.LC1
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	goToPhaseOne
	.size	drawStartInstructionsDialouge, .-drawStartInstructionsDialouge
	.global	startPage
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	startPage, %object
	.size	startPage, 4
startPage:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
