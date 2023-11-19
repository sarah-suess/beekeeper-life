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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"PRESS START\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L7
	sub	sp, sp, #44
	ldr	r3, .L7+4
	mov	lr, pc
	bx	r3
	mov	r1, #55
	mov	r0, #30
	ldr	r2, .L7+8
	ldr	r3, .L7+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L7+16
	ldm	r3, {r0, r1, r2}
	add	r6, sp, #4
	stmia	r6!, {r0, r1}
	ldr	r5, .L7+20
	strh	r2, [r6], #2	@ movhi
	lsr	r7, r2, #16
	ldmia	r5!, {r0, r1, r2, r3}
	add	lr, sp, #16
	stmia	lr!, {r0, r1, r2, r3}
	ldm	r5, {r0, r1}
	str	r0, [lr], #4
	strb	r7, [r6]
	mov	r4, #55
	mov	ip, #80
	strh	r1, [lr]	@ movhi
	ldr	r7, .L7+24
	add	r5, sp, #14
	add	r6, sp, #4
	b	.L3
.L6:
	ldrb	ip, [r6, #1]!	@ zero_extendqisi2
.L3:
	mov	r0, r4
	mov	r2, ip
	mov	r1, #70
	ldrh	r3, [r5, #2]!
	add	r4, r4, #12
	mov	lr, pc
	bx	r7
	cmp	r4, #187
	bne	.L6
	mov	r3, #0
	ldr	r1, .L7+28
	ldr	r2, .L7+32
	strb	r3, [r1]
	str	r3, [r2]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	32767
	.word	fillScreen
	.word	22494
	.word	drawBee
	.word	.LC1
	.word	.LANCHOR0
	.word	drawChar
	.word	state
	.word	rSeed
	.size	goToStart, .-goToStart
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
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #2
	mvn	ip, #170
	mov	r2, #0
	strh	r0, [r3, #132]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	ldr	r0, .L10
	strh	r1, [r3, #130]	@ movhi
	ldr	r1, .L10+4
	ldrh	r0, [r0, #48]
	ldr	r3, .L10+8
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L11:
	.align	2
.L10:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L19
	ldr	r3, [r4]
	ldr	r2, .L19+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L19+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L12
	ldr	r3, .L19+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L18
.L12:
	pop	{r4, lr}
	bx	lr
.L18:
	ldr	r0, [r4]
	ldr	r3, .L19+16
	mov	lr, pc
	bx	r3
	ldr	r0, .L19+20
	ldr	r3, .L19+24
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L19+28
	ldr	r3, .L19+32
	strb	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	rSeed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	21301
	.word	fillScreen
	.word	state
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L23
	ldr	r0, .L23+4
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L23+8
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	fillScreen
	.word	21301
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"game paused!\000"
	.text
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
	push	{r4, lr}
	ldr	r0, .L27
	ldr	r3, .L27+4
	mov	lr, pc
	bx	r3
	mov	r1, #55
	mov	r0, #60
	ldr	r2, .L27+8
	ldr	r3, .L27+12
	mov	lr, pc
	bx	r3
	ldr	r2, .L27+16
	mov	r1, #82
	mov	r0, #170
	ldr	r3, .L27+20
	mov	lr, pc
	bx	r3
	mov	r1, #90
	mov	r0, #120
	ldr	r3, .L27+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+28
	ldr	r2, .L27+32
	mov	r3, #0
	mov	r1, #60
	mov	r0, #84
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L27+40
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	32767
	.word	fillScreen
	.word	1023
	.word	drawBee
	.word	7539
	.word	drawBasket
	.word	drawBerry
	.word	drawString
	.word	.LC2
	.word	waitForVBlank
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
	ldr	r3, .L41
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L41+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L30
	ldr	r2, .L41+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L39
.L30:
	tst	r3, #4
	beq	.L29
	ldr	r3, .L41+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L40
.L29:
	pop	{r4, lr}
	bx	lr
.L39:
	ldr	r3, .L41+12
	ldr	r0, .L41+16
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L41+20
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L40:
	pop	{r4, lr}
	b	goToStart
.L42:
	.align	2
.L41:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	21301
	.word	state
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"you won!!!\000"
	.align	2
.LC4:
	.ascii	"press start to play again\000"
	.text
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
	push	{r4, lr}
	ldr	r0, .L45
	ldr	r3, .L45+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L45+8
	mov	r1, #60
	mov	r0, #80
	ldr	r3, .L45+12
	ldr	r2, .L45+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L45+20
	mov	r3, #0
	mov	r1, #70
	mov	r0, #40
	mov	lr, pc
	bx	r4
	ldr	r3, .L45+24
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L45+28
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	32767
	.word	fillScreen
	.word	drawString
	.word	21951
	.word	.LC3
	.word	.LC4
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L54
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
	ldr	r3, .L54+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L53
.L47:
	pop	{r4, lr}
	bx	lr
.L53:
	pop	{r4, lr}
	b	goToStart
.L55:
	.align	2
.L54:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"you lost :(\000"
	.align	2
.LC6:
	.ascii	"how did you let a bee beat you??\000"
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
	push	{r4, lr}
	ldr	r0, .L58
	ldr	r3, .L58+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L58+8
	mov	r1, #50
	mov	r0, #80
	ldr	r3, .L58+12
	ldr	r2, .L58+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L58+20
	mov	r3, #0
	mov	r1, #60
	mov	r0, #30
	mov	lr, pc
	bx	r4
	ldr	r3, .L58+24
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L58+28
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	32767
	.word	fillScreen
	.word	drawString
	.word	32625
	.word	.LC5
	.word	.LC6
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"%d\000"
	.align	2
.LC8:
	.ascii	"bee: \000"
	.align	2
.LC9:
	.ascii	"you: \000"
	.text
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r2, .L70
	ldr	r3, [r2]
	ldr	r6, .L70+4
	sub	sp, sp, #8
	add	r3, r3, #1
	ldr	r1, .L70+8
	ldr	r5, .L70+12
	str	r3, [r2]
	ldr	r4, .L70+16
	mov	lr, pc
	bx	r1
	ldr	r2, [r6]
	ldr	r1, .L70+20
	ldr	r0, .L70+24
	mov	lr, pc
	bx	r4
	ldr	r2, [r5]
	ldr	r1, .L70+20
	ldr	r0, .L70+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L70+32
	mov	lr, pc
	bx	r3
	ldr	r4, .L70+36
	mov	r3, #0
	mov	r1, #1
	mov	r0, #190
	ldr	r2, .L70+40
	ldr	r8, .L70+44
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #8
	mov	r0, #190
	ldr	r2, .L70+48
	mov	lr, pc
	bx	r4
	ldr	r7, .L70+52
	mov	r3, #8
	mov	r2, #12
	mov	r1, #1
	mov	r0, #220
	str	r8, [sp]
	mov	lr, pc
	bx	r7
	mov	r3, #8
	mov	r2, #12
	mov	r1, r3
	mov	r0, #220
	str	r8, [sp]
	mov	lr, pc
	bx	r7
	mov	r3, #0
	mov	r1, #1
	mov	r0, #220
	ldr	r2, .L70+24
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #9
	mov	r0, #220
	ldr	r2, .L70+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L70+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+60
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L61
	ldr	r3, .L70+64
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
.L61:
	ldr	r2, [r6]
	ldr	r3, [r5]
	add	r1, r2, r3
	cmp	r1, #25
	beq	.L69
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L69:
	cmp	r2, r3
	ble	.L63
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	goToLose
.L63:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	goToWin
.L68:
	bl	goToPause
	b	.L61
.L71:
	.align	2
.L70:
	.word	framecount
	.word	beeScore
	.word	updateGame
	.word	playerScore
	.word	sprintf
	.word	.LC7
	.word	beeBuffer
	.word	playerBuffer
	.word	waitForVBlank
	.word	drawString
	.word	.LC8
	.word	21301
	.word	.LC9
	.word	drawRect
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"Debugging Initialized\000"
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
	mov	r5, #67108864
	ldr	r2, .L83
	push	{r4, r7, fp, lr}
	ldr	r3, .L83+4
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r0, .L83+8
	ldr	r3, .L83+12
	mov	lr, pc
	bx	r3
	mov	r0, #128
	mvn	r1, #170
	mov	r3, #2
	mov	r2, #0
	strh	r0, [r5, #132]	@ movhi
	ldr	r4, .L83+16
	strh	r1, [r5, #128]	@ movhi
	strh	r3, [r5, #130]	@ movhi
	ldr	fp, .L83+20
	ldrh	r1, [r4, #48]
	ldr	r5, .L83+24
	ldr	r3, .L83+28
	strh	r1, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L83+32
	ldr	r10, .L83+36
	ldr	r9, .L83+40
	ldr	r8, .L83+44
	ldr	r7, .L83+48
.L73:
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldrh	r3, [fp]
.L74:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L74
.L76:
	.word	.L79
	.word	.L78
	.word	.L77
	.word	.L75
	.word	.L75
.L75:
	mov	lr, pc
	bx	r7
	b	.L73
.L77:
	mov	lr, pc
	bx	r9
	b	.L73
.L78:
	mov	lr, pc
	bx	r8
	b	.L73
.L79:
	mov	lr, pc
	bx	r10
	b	.L73
.L84:
	.align	2
.L83:
	.word	1027
	.word	mgba_open
	.word	.LC10
	.word	mgba_printf
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	game
	.word	pause
	.word	win
	.size	main, .-main
	.text
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
	b	win
	.size	lose, .-lose
	.comm	playerBuffer,41,4
	.comm	beeBuffer,41,4
	.comm	once,4,4
	.comm	count,4,4
	.comm	timeTrack,4,4
	.comm	slowdown,4,4
	.comm	playerScore,4,4
	.comm	beeScore,4,4
	.comm	framecount,4,4
	.comm	rSeed,4,4
	.comm	state,1,1
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	NOTES,2,2
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	28274
	.short	32625
	.short	28274
	.short	32625
	.short	28274
	.short	31
	.short	32625
	.short	28274
	.short	32625
	.short	28274
	.short	32625
	.ident	"GCC: (devkitARM release 53) 9.1.0"
