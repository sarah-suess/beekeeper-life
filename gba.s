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
	.file	"gba.c"
	.text
	.align	2
	.global	drawRect
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r3, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	lr, #0
	ldr	r5, .L11
	add	ip, r1, ip
	ldr	r3, [r5]
	rsb	r1, r1, r1, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	r4, r0, r1, lsl #4
	add	ip, r0, ip, lsl #4
	ldr	r1, [r5, #4]
	orr	r0, r2, #-2130706432
	add	r2, r3, ip, lsl #1
	add	r3, r3, r4, lsl #1
.L3:
	add	ip, sp, #12
	str	lr, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r2
	str	r0, [r1, #44]
	bne	.L3
	pop	{r4, r5, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r2, .L15
	sub	sp, sp, #12
	ldm	r2, {r2, r3}
	ldr	r1, .L15+4
	add	ip, sp, #6
	strh	r0, [sp, #6]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen, .-fillScreen
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r1
	ble	.L21
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L23
.L21:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L23:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L21
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L25:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L25
	mov	r2, #67108864
.L26:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L26
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	drawChar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L40
	push	{r4, r5, lr}
	rsb	r1, r1, r1, lsl #4
	ldr	r4, [ip]
	ldr	lr, .L40+4
	add	r1, r0, r1, lsl #4
	add	r2, r2, r2, lsl #1
	add	r4, r4, r1, lsl #1
	add	lr, lr, r2, lsl #4
	add	r5, r0, #6
.L31:
	mov	r1, r4
	sub	r2, lr, #48
.L33:
	ldrb	ip, [r2]	@ zero_extendqisi2
	add	r2, r2, #6
	cmp	ip, #0
	strhne	r3, [r1]	@ movhi
	cmp	r2, lr
	add	r1, r1, #480
	bne	.L33
	add	r0, r0, #1
	cmp	r0, r5
	add	lr, r2, #1
	add	r4, r4, #2
	bne	.L31
	pop	{r4, r5, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.word	fontdata_6x8+48
	.size	drawChar, .-drawChar
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L42
	mov	r4, r0
	mov	r6, r1
.L44:
	mov	r0, r4
	mov	r1, r6
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L44
.L42:
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString, .-drawString
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L52
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	drawFlower
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFlower, %function
drawFlower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #0
	ldr	r7, .L58
	mov	r5, r6
	mov	r4, r7
	ldr	r3, .L58+4
	rsb	r1, r1, r1, lsl #4
	lsl	lr, r1, #4
	ldr	ip, [r3]
	sub	sp, sp, #8
	ldr	r3, [r3, #4]
	add	r9, r0, #1
	add	r10, lr, #240
	add	r1, r9, r1, lsl #4
	add	r8, sp, #6
	add	r10, r10, r0
	strh	r2, [sp, #6]	@ movhi
	add	r1, ip, r1, lsl #1
	str	r6, [r3, #44]
	add	r10, ip, r10, lsl #1
	str	r8, [r3, #36]
	add	r8, sp, #4
	str	r1, [r3, #40]
	str	r7, [r3, #44]
	strh	r2, [sp, #4]	@ movhi
	str	r6, [r3, #44]
	str	r8, [r3, #36]
	str	r10, [r3, #40]
	ldr	r10, .L58+8
	add	r1, lr, #480
	str	r10, [r3, #44]
	add	r1, r1, r0
	str	r6, [r3, #44]
	add	r0, lr, r0
	str	r8, [r3, #36]
	add	r8, lr, #720
	add	lr, lr, #960
	add	r1, ip, r1, lsl #1
	add	r8, r8, r9
	add	lr, lr, r9
	ldr	r9, .L58+12
	str	r1, [r3, #40]
	add	r8, ip, r8, lsl #1
	str	r10, [r3, #44]
	add	r1, ip, #4288
	strh	r2, [sp, #2]	@ movhi
	add	r2, sp, #2
	str	r6, [r3, #44]
	add	r1, r1, #34
	str	r2, [r3, #36]
	str	r8, [r3, #40]
	str	r7, [r3, #44]
	strh	r9, [sp]	@ movhi
	add	r1, r1, r0, lsl #1
	add	r2, ip, lr, lsl #1
.L55:
	str	r5, [r3, #44]
	str	sp, [r3, #36]
	str	r2, [r3, #40]
	add	r2, r2, #480
	cmp	r1, r2
	str	r4, [r3, #44]
	bne	.L55
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	-2130706430
	.word	.LANCHOR0
	.word	-2130706428
	.word	1285
	.size	drawFlower, .-drawFlower
	.align	2
	.global	drawBee
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBee, %function
drawBee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L76
	ldr	lr, [r3]
	rsb	r1, r1, r1, lsl #4
	add	r6, r0, r1, lsl #4
	sub	sp, sp, #28
	add	r5, lr, #4800
	ldr	r3, [r3, #4]
	ldr	r8, .L76+4
	mov	r9, ip
	strh	ip, [sp, #22]	@ movhi
	lsl	r4, r6, #1
	lsl	ip, r1, #4
	add	r7, sp, #22
	add	r1, lr, r6, lsl #1
	add	r6, r5, r6, lsl #1
.L61:
	str	r9, [r3, #44]
	str	r7, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r1, r6
	str	r8, [r3, #44]
	bne	.L61
	mov	r7, #0
	add	r1, r0, #1
	add	r1, r1, ip
	add	r6, r5, #2
	strh	r2, [sp, #20]	@ movhi
	ldr	r8, .L76+8
	add	r1, lr, r1, lsl #1
	add	r6, r6, r4
	add	r9, sp, #20
.L62:
	str	r7, [r3, #44]
	str	r9, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r1, r6
	str	r8, [r3, #44]
	bne	.L62
	mov	r7, #0
	add	r1, r0, #3
	add	r1, r1, ip
	add	r6, r5, #6
	strh	r2, [sp, #18]	@ movhi
	ldr	r8, .L76+8
	add	r1, lr, r1, lsl #1
	add	r6, r6, r4
	add	r9, sp, #18
.L63:
	str	r7, [r3, #44]
	str	r9, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r1, r6
	str	r8, [r3, #44]
	bne	.L63
	mov	r7, #0
	add	r1, r0, #5
	add	r1, r1, ip
	add	r6, r5, #10
	strh	r2, [sp, #16]	@ movhi
	ldr	r8, .L76+8
	add	r1, lr, r1, lsl #1
	add	r6, r6, r4
	add	r9, sp, #16
.L64:
	str	r7, [r3, #44]
	str	r9, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r1, r6
	str	r8, [r3, #44]
	bne	.L64
	mov	r7, #0
	add	r1, r0, #7
	add	r1, r1, ip
	add	r6, r5, #14
	strh	r2, [sp, #14]	@ movhi
	ldr	r8, .L76+8
	add	r1, lr, r1, lsl #1
	add	r6, r6, r4
	add	r9, sp, #14
.L65:
	str	r7, [r3, #44]
	str	r9, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r1, r6
	str	r8, [r3, #44]
	bne	.L65
	mov	r6, #0
	add	r1, r0, #9
	add	r5, r5, #18
	add	r1, r1, ip
	strh	r2, [sp, #12]	@ movhi
	ldr	r8, .L76+8
	add	r5, r5, r4
	add	r1, lr, r1, lsl #1
	add	r7, sp, #12
.L66:
	str	r6, [r3, #44]
	str	r7, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r5, r1
	str	r8, [r3, #44]
	bne	.L66
	mov	r5, #0
	add	r1, r0, ip
	add	r1, r1, #488
	add	r7, lr, #2896
	add	r7, r7, #4
	strh	r6, [sp, #10]	@ movhi
	add	r1, r1, #2
	ldr	r6, .L76+12
	add	r4, r7, r4
	add	r1, lr, r1, lsl #1
	add	r7, sp, #10
.L67:
	str	r5, [r3, #44]
	str	r7, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r4, r1
	str	r6, [r3, #44]
	bne	.L67
	add	r4, r0, ip
	add	ip, r4, #728
	add	r1, r4, #1184
	add	r0, r4, #1424
	add	ip, ip, #3
	ldr	r4, .L76+16
	lsl	ip, ip, #1
	add	r1, r1, #13
	add	r0, r0, #14
	strh	r2, [lr, ip]	@ movhi
	add	r1, lr, r1, lsl #1
	add	r0, lr, r0, lsl #1
	add	ip, sp, #8
	add	r2, sp, #6
	strh	r5, [sp, #8]	@ movhi
	str	r5, [r3, #44]
	str	ip, [r3, #36]
	str	r1, [r3, #40]
	str	r6, [r3, #44]
	strh	r5, [sp, #6]	@ movhi
	str	r5, [r3, #44]
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r4, [r3, #44]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	.LANCHOR0
	.word	-2130706422
	.word	-2130706431
	.word	-2130706429
	.word	-2130706430
	.size	drawBee, .-drawBee
	.align	2
	.global	drawBeeCover
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBeeCover, %function
drawBeeCover:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r9, #0
	ldr	r3, .L94
	ldr	lr, [r3]
	rsb	r1, r1, r1, lsl #4
	sub	sp, sp, #28
	add	r6, r0, r1, lsl #4
	add	r5, lr, #4800
	strh	r2, [sp, #22]	@ movhi
	ldr	r3, [r3, #4]
	ldr	r8, .L94+4
	lsl	ip, r1, #4
	lsl	r4, r6, #1
	add	r1, lr, r6, lsl #1
	add	r7, sp, #22
	add	r6, r5, r6, lsl #1
.L79:
	str	r9, [r3, #44]
	str	r7, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r1, r6
	str	r8, [r3, #44]
	bne	.L79
	mov	r7, #0
	add	r1, r0, #1
	add	r1, r1, ip
	add	r6, r5, #2
	strh	r2, [sp, #20]	@ movhi
	ldr	r8, .L94+8
	add	r1, lr, r1, lsl #1
	add	r6, r6, r4
	add	r9, sp, #20
.L80:
	str	r7, [r3, #44]
	str	r9, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r1, r6
	str	r8, [r3, #44]
	bne	.L80
	mov	r7, #0
	add	r1, r0, #3
	add	r1, r1, ip
	add	r6, r5, #6
	strh	r2, [sp, #18]	@ movhi
	ldr	r8, .L94+8
	add	r1, lr, r1, lsl #1
	add	r6, r6, r4
	add	r9, sp, #18
.L81:
	str	r7, [r3, #44]
	str	r9, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r1, r6
	str	r8, [r3, #44]
	bne	.L81
	mov	r7, #0
	add	r1, r0, #5
	add	r1, r1, ip
	add	r6, r5, #10
	strh	r2, [sp, #16]	@ movhi
	ldr	r8, .L94+8
	add	r1, lr, r1, lsl #1
	add	r6, r6, r4
	add	r9, sp, #16
.L82:
	str	r7, [r3, #44]
	str	r9, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r1, r6
	str	r8, [r3, #44]
	bne	.L82
	mov	r7, #0
	add	r1, r0, #7
	add	r1, r1, ip
	add	r6, r5, #14
	strh	r2, [sp, #14]	@ movhi
	ldr	r8, .L94+8
	add	r1, lr, r1, lsl #1
	add	r6, r6, r4
	add	r9, sp, #14
.L83:
	str	r7, [r3, #44]
	str	r9, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r1, r6
	str	r8, [r3, #44]
	bne	.L83
	mov	r6, #0
	add	r1, r0, #9
	add	r5, r5, #18
	add	r1, r1, ip
	strh	r2, [sp, #12]	@ movhi
	ldr	r8, .L94+8
	add	r5, r5, r4
	add	r1, lr, r1, lsl #1
	add	r7, sp, #12
.L84:
	str	r6, [r3, #44]
	str	r7, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r5, r1
	str	r8, [r3, #44]
	bne	.L84
	mov	r5, #0
	add	r1, r0, ip
	add	r1, r1, #488
	add	r7, lr, #2896
	add	r7, r7, #4
	add	r1, r1, #2
	strh	r2, [sp, #10]	@ movhi
	ldr	r6, .L94+12
	add	r4, r7, r4
	add	r1, lr, r1, lsl #1
	add	r7, sp, #10
.L85:
	str	r5, [r3, #44]
	str	r7, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r4, r1
	str	r6, [r3, #44]
	bne	.L85
	add	r4, r0, ip
	add	ip, r4, #728
	add	r1, r4, #1184
	add	r0, r4, #1424
	add	ip, ip, #3
	ldr	r4, .L94+16
	lsl	ip, ip, #1
	add	r1, r1, #13
	add	r0, r0, #14
	strh	r2, [lr, ip]	@ movhi
	add	r1, lr, r1, lsl #1
	add	r0, lr, r0, lsl #1
	add	ip, sp, #6
	add	lr, sp, #8
	strh	r2, [sp, #8]	@ movhi
	str	r5, [r3, #44]
	str	lr, [r3, #36]
	str	r1, [r3, #40]
	str	r6, [r3, #44]
	strh	r2, [sp, #6]	@ movhi
	str	r5, [r3, #44]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r4, [r3, #44]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L95:
	.align	2
.L94:
	.word	.LANCHOR0
	.word	-2130706422
	.word	-2130706431
	.word	-2130706429
	.word	-2130706430
	.size	drawBeeCover, .-drawBeeCover
	.align	2
	.global	drawBasket
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBasket, %function
drawBasket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, #0
	mov	fp, r2
	ldr	r3, .L98
	rsb	r1, r1, r1, lsl #4
	ldr	ip, [r3]
	sub	sp, sp, #28
	ldr	r3, [r3, #4]
	lsl	r2, r1, #4
	add	r1, r0, r1, lsl #4
	add	r6, ip, r1, lsl #1
	add	r7, r2, #240
	add	r1, sp, #22
	strh	fp, [sp, #22]	@ movhi
	ldr	r8, .L98+4
	str	lr, [r3, #44]
	add	r4, r0, r2
	str	r1, [r3, #36]
	add	r5, r0, #1
	ldr	r1, .L98+8
	add	r10, r2, #480
	add	r7, r7, r0
	str	r6, [r3, #40]
	add	r7, ip, r7, lsl #1
	add	r6, sp, #20
	add	r10, r10, r5
	sub	r4, r4, #1184
	str	r8, [r3, #44]
	add	r10, ip, r10, lsl #1
	strh	r1, [sp, #20]	@ movhi
	sub	r4, r4, #13
	str	lr, [r3, #44]
	str	r6, [r3, #36]
	str	r7, [r3, #40]
	str	r8, [r3, #44]
	strh	fp, [sp, #18]	@ movhi
	add	fp, sp, #18
	str	lr, [r3, #44]
	add	r4, ip, r4, lsl #1
	str	fp, [r3, #36]
	str	r10, [r3, #40]
	ldr	r10, .L98+12
	str	r4, [sp, #4]
	add	r9, r2, #720
	add	r4, r0, #2
	str	r10, [r3, #44]
	add	r9, r9, r4
	add	r10, sp, #16
	strh	r1, [sp, #16]	@ movhi
	add	r9, ip, r9, lsl #1
	str	lr, [r3, #44]
	sub	r7, r2, #480
	str	r10, [r3, #36]
	ldr	r10, .L98+16
	str	r9, [r3, #40]
	add	r9, r0, r7
	str	r10, [r3, #44]
	sub	r8, r2, #240
	add	r10, sp, #14
	add	r6, r0, #7
	add	r9, ip, r9, lsl #1
	strh	r1, [sp, #14]	@ movhi
	add	r7, r6, r7
	str	lr, [r3, #44]
	add	r6, r6, r8
	str	r10, [r3, #36]
	add	r8, r0, r8
	str	r9, [r3, #40]
	ldr	r9, .L98+20
	add	r8, ip, r8, lsl #1
	str	r9, [r3, #44]
	sub	fp, r2, #720
	str	lr, [r3, #44]
	sub	r2, r2, #960
	str	r10, [r3, #36]
	str	r8, [r3, #40]
	add	r8, r0, #6
	add	r0, r0, #5
	add	r7, ip, r7, lsl #1
	add	r10, sp, #12
	add	r6, ip, r6, lsl #1
	add	r0, r0, r2
	str	r9, [r3, #44]
	add	r5, r5, fp
	strh	r1, [sp, #12]	@ movhi
	add	r4, r4, r2
	str	lr, [r3, #44]
	lsl	r2, r0, #1
	str	r10, [r3, #36]
	ldr	r0, .L98+24
	str	r7, [r3, #40]
	add	r8, r8, fp
	str	r9, [r3, #44]
	str	lr, [r3, #44]
	str	r10, [r3, #36]
	str	r6, [r3, #40]
	str	r9, [r3, #44]
	strh	r1, [sp, #10]	@ movhi
	str	lr, [r3, #44]
	ldr	lr, [sp, #4]
	lsl	r5, r5, #1
	lsl	r4, r4, #1
	lsl	r8, r8, #1
	add	r7, sp, #10
	str	r7, [r3, #36]
	str	lr, [r3, #40]
	str	r0, [r3, #44]
	strh	r1, [ip, r5]	@ movhi
	strh	r1, [ip, r8]	@ movhi
	strh	r1, [ip, r4]	@ movhi
	strh	r1, [ip, r2]	@ movhi
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	.LANCHOR0
	.word	-2130706424
	.word	4299
	.word	-2130706426
	.word	-2130706428
	.word	-2130706431
	.word	-2130706430
	.size	drawBasket, .-drawBasket
	.align	2
	.global	drawBasketCover
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBasketCover, %function
drawBasketCover:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, #0
	ldr	r3, .L102
	rsb	r6, r1, r1, lsl #4
	sub	sp, sp, #28
	ldr	ip, [r3]
	lsl	r1, r6, #4
	ldr	r3, [r3, #4]
	add	fp, sp, #22
	add	r8, r1, #240
	add	r6, r0, r6, lsl #4
	strh	r2, [sp, #22]	@ movhi
	add	r5, r0, #1
	str	lr, [r3, #44]
	add	r6, ip, r6, lsl #1
	str	fp, [r3, #36]
	add	r10, r1, #480
	ldr	fp, .L102+4
	add	r8, r8, r0
	str	r6, [r3, #40]
	add	r8, ip, r8, lsl #1
	add	r6, sp, #20
	add	r10, r10, r5
	str	fp, [r3, #44]
	add	r7, r0, r1
	strh	r2, [sp, #20]	@ movhi
	add	r10, ip, r10, lsl #1
	str	lr, [r3, #44]
	str	r6, [r3, #36]
	str	r8, [r3, #40]
	str	fp, [r3, #44]
	add	fp, sp, #18
	strh	r2, [sp, #18]	@ movhi
	sub	r7, r7, #1184
	str	lr, [r3, #44]
	str	fp, [r3, #36]
	str	r10, [r3, #40]
	ldr	r10, .L102+8
	add	r4, r0, #2
	add	r9, r1, #720
	sub	r7, r7, #13
	str	r10, [r3, #44]
	add	r7, ip, r7, lsl #1
	add	r10, sp, #16
	add	r9, r9, r4
	strh	r2, [sp, #16]	@ movhi
	str	r7, [sp, #4]
	str	lr, [r3, #44]
	add	r9, ip, r9, lsl #1
	str	r10, [r3, #36]
	sub	r7, r1, #480
	ldr	r10, .L102+12
	str	r9, [r3, #40]
	add	r9, r0, r7
	str	r10, [r3, #44]
	sub	r8, r1, #240
	add	r10, sp, #14
	add	r6, r0, #7
	add	r9, ip, r9, lsl #1
	strh	r2, [sp, #14]	@ movhi
	add	r7, r6, r7
	str	lr, [r3, #44]
	add	r6, r6, r8
	str	r10, [r3, #36]
	add	r8, r0, r8
	str	r9, [r3, #40]
	ldr	r9, .L102+16
	add	r8, ip, r8, lsl #1
	str	r9, [r3, #44]
	sub	fp, r1, #720
	str	lr, [r3, #44]
	sub	r1, r1, #960
	str	r10, [r3, #36]
	add	r7, ip, r7, lsl #1
	str	r8, [r3, #40]
	add	r10, sp, #12
	add	r8, r0, #6
	add	r0, r0, #5
	str	r9, [r3, #44]
	add	r6, ip, r6, lsl #1
	strh	r2, [sp, #12]	@ movhi
	add	r0, r0, r1
	str	lr, [r3, #44]
	str	r10, [r3, #36]
	str	r7, [r3, #40]
	add	r7, sp, #10
	str	r9, [r3, #44]
	add	r5, r5, fp
	str	lr, [r3, #44]
	add	r4, r4, r1
	str	r10, [r3, #36]
	lsl	r1, r0, #1
	str	r6, [r3, #40]
	ldr	r0, .L102+20
	str	r9, [r3, #44]
	add	r8, r8, fp
	strh	r2, [sp, #10]	@ movhi
	str	lr, [r3, #44]
	str	r7, [r3, #36]
	ldr	r7, [sp, #4]
	lsl	r5, r5, #1
	lsl	r4, r4, #1
	lsl	r8, r8, #1
	str	r7, [r3, #40]
	str	r0, [r3, #44]
	strh	r2, [ip, r5]	@ movhi
	strh	r2, [ip, r8]	@ movhi
	strh	r2, [ip, r4]	@ movhi
	strh	r2, [ip, r1]	@ movhi
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	.LANCHOR0
	.word	-2130706424
	.word	-2130706426
	.word	-2130706428
	.word	-2130706431
	.word	-2130706430
	.size	drawBasketCover, .-drawBasketCover
	.align	2
	.global	drawBerry
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBerry, %function
drawBerry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #31
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, #0
	ldr	r3, .L116
	ldr	r2, [r3]
	rsb	r1, r1, r1, lsl #4
	add	r5, r0, r1, lsl #4
	sub	sp, sp, #28
	add	r4, r2, #3360
	ldr	r3, [r3, #4]
	ldr	r6, .L116+4
	strh	ip, [sp, #22]	@ movhi
	lsl	lr, r5, #1
	add	ip, r2, r5, lsl #1
	add	r4, r4, r5, lsl #1
	lsl	r1, r1, #4
	add	r5, sp, #22
.L105:
	str	r7, [r3, #44]
	str	r5, [r3, #36]
	str	ip, [r3, #40]
	add	ip, ip, #480
	cmp	ip, r4
	str	r6, [r3, #44]
	bne	.L105
	mov	r5, #31
	mov	r7, #0
	sub	r10, r0, #1
	add	r8, r1, #240
	add	r4, r2, #2864
	add	ip, r8, r10
	add	r4, r4, #14
	ldr	r6, .L116+8
	strh	r5, [sp, #20]	@ movhi
	add	ip, r2, ip, lsl #1
	add	r4, r4, lr
	add	r5, sp, #20
.L106:
	str	r7, [r3, #44]
	str	r5, [r3, #36]
	str	ip, [r3, #40]
	add	ip, ip, #480
	cmp	ip, r4
	str	r6, [r3, #44]
	bne	.L106
	mov	r4, #0
	mov	r6, #31
	mov	r5, r4
	sub	ip, r0, #2
	add	r9, r1, #480
	add	ip, ip, r9
	ldr	r7, .L116+8
	strh	r6, [sp, #18]	@ movhi
	add	ip, r2, ip, lsl #1
	add	r6, sp, #18
.L107:
	add	r4, r4, #1
	cmp	r4, #3
	str	r5, [r3, #44]
	str	r6, [r3, #36]
	str	ip, [r3, #40]
	str	r7, [r3, #44]
	add	ip, ip, #480
	bne	.L107
	mov	r6, #31
	mov	r4, #0
	add	ip, r0, #4
	add	r5, r2, #2880
	add	r5, r5, #8
	strh	r6, [sp, #16]	@ movhi
	add	ip, ip, r8
	ldr	r6, .L116+8
	add	lr, r5, lr
	add	ip, r2, ip, lsl #1
	add	r5, sp, #16
.L108:
	str	r4, [r3, #44]
	str	r5, [r3, #36]
	str	ip, [r3, #40]
	add	ip, ip, #480
	cmp	lr, ip
	str	r6, [r3, #44]
	bne	.L108
	mov	r4, #0
	mov	r6, #31
	mov	ip, r4
	add	r5, r0, #5
	add	lr, r9, r5
	ldr	r7, .L116+8
	strh	r6, [sp, #14]	@ movhi
	add	lr, r2, lr, lsl #1
	add	r6, sp, #14
.L109:
	add	r4, r4, #1
	cmp	r4, #3
	str	ip, [r3, #44]
	str	r6, [r3, #36]
	str	lr, [r3, #40]
	str	r7, [r3, #44]
	add	lr, lr, #480
	bne	.L109
	add	lr, r0, #1
	add	r8, r8, lr
	lsl	r8, r8, #1
	str	r8, [sp]
	mov	r8, #31	@ movhi
	mov	fp, #992
	mvn	r4, #64512
	add	r7, r1, #1680
	add	r10, r10, r9
	add	r7, r7, lr
	lsl	r10, r10, #1
	str	r10, [sp, #4]
	add	r7, r2, r7, lsl #1
	add	r10, sp, #12
	strh	r8, [sp, #12]	@ movhi
	sub	r6, r1, #240
	str	ip, [r3, #44]
	sub	r8, r1, #480
	str	r10, [r3, #36]
	str	r7, [r3, #40]
	add	r10, r1, #720
	ldr	r7, .L116+12
	add	r6, r6, lr
	add	r8, r8, lr
	add	r5, r5, r10
	add	lr, lr, r10
	add	r10, r0, #3
	str	r7, [r3, #44]
	add	r6, r2, r6, lsl #1
	strh	fp, [sp, #10]	@ movhi
	lsl	r8, r8, #1
	str	ip, [r3, #44]
	add	r1, r1, #1200
	add	r9, r10, r9
	add	ip, sp, #10
	add	r10, r0, #2
	str	ip, [r3, #36]
	add	r0, r1, r0
	str	r6, [r3, #40]
	add	r1, r10, r1
	str	r7, [r3, #44]
	ldr	r10, [sp, #4]
	strh	fp, [r2, r8]	@ movhi
	ldr	r8, [sp]
	lsl	lr, lr, #1
	lsl	r5, r5, #1
	lsl	r9, r9, #1
	lsl	r0, r0, #1
	lsl	r1, r1, #1
	strh	r4, [r2, r8]	@ movhi
	strh	r4, [r2, r10]	@ movhi
	strh	r4, [r2, lr]	@ movhi
	strh	r4, [r2, r9]	@ movhi
	strh	r4, [r2, r0]	@ movhi
	strh	r4, [r2, r1]	@ movhi
	strh	r4, [r2, r5]	@ movhi
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L117:
	.align	2
.L116:
	.word	.LANCHOR0
	.word	-2130706428
	.word	-2130706431
	.word	-2130706430
	.size	drawBerry, .-drawBerry
	.align	2
	.global	drawBerryCover
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBerryCover, %function
drawBerryCover:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r7, #0
	ldr	r3, .L130
	ldr	lr, [r3]
	rsb	ip, r1, r1, lsl #4
	ldr	r2, .L130+4
	add	r5, r0, ip, lsl #4
	sub	sp, sp, #20
	add	r1, lr, #3360
	ldr	r3, [r3, #4]
	ldr	r6, .L130+8
	strh	r2, [sp, #14]	@ movhi
	lsl	r4, r5, #1
	add	r2, lr, r5, lsl #1
	add	r1, r1, r5, lsl #1
	lsl	ip, ip, #4
	add	r5, sp, #14
.L119:
	str	r7, [r3, #44]
	str	r5, [r3, #36]
	str	r2, [r3, #40]
	add	r2, r2, #480
	cmp	r2, r1
	str	r6, [r3, #44]
	bne	.L119
	mov	r7, #0
	ldr	r6, .L130+4
	sub	r1, r0, #1
	add	r5, ip, #240
	add	r2, lr, #2864
	add	r1, r1, r5
	add	r2, r2, #14
	ldr	r8, .L130+12
	strh	r6, [sp, #12]	@ movhi
	add	r1, lr, r1, lsl #1
	add	r2, r2, r4
	add	r6, sp, #12
.L120:
	str	r7, [r3, #44]
	str	r6, [r3, #36]
	str	r1, [r3, #40]
	add	r1, r1, #480
	cmp	r1, r2
	str	r8, [r3, #44]
	bne	.L120
	mov	r2, #0
	mov	r8, r2
	ldr	r7, .L130+4
	sub	r1, r0, #2
	add	r6, ip, #480
	add	r1, r1, r6
	ldr	r9, .L130+12
	strh	r7, [sp, #10]	@ movhi
	add	r1, lr, r1, lsl #1
	add	r7, sp, #10
.L121:
	add	r2, r2, #1
	cmp	r2, #3
	str	r8, [r3, #44]
	str	r7, [r3, #36]
	str	r1, [r3, #40]
	str	r9, [r3, #44]
	add	r1, r1, #480
	bne	.L121
	mov	r7, #0
	ldr	r8, .L130+4
	add	r2, r0, #4
	add	r1, lr, #2880
	add	r2, r2, r5
	add	r1, r1, #8
	strh	r8, [sp, #8]	@ movhi
	ldr	r5, .L130+12
	add	r4, r1, r4
	add	r2, lr, r2, lsl #1
	add	r1, sp, #8
.L122:
	str	r7, [r3, #44]
	str	r1, [r3, #36]
	str	r2, [r3, #40]
	add	r2, r2, #480
	cmp	r4, r2
	str	r5, [r3, #44]
	bne	.L122
	mov	r1, #0
	mov	r4, r1
	ldr	r5, .L130+4
	add	r2, r0, #5
	add	r6, r2, r6
	strh	r5, [sp, #6]	@ movhi
	ldr	r5, .L130+12
	add	r6, lr, r6, lsl #1
	add	r2, sp, #6
.L123:
	add	r1, r1, #1
	cmp	r1, #3
	str	r4, [r3, #44]
	str	r2, [r3, #36]
	str	r6, [r3, #40]
	str	r5, [r3, #44]
	add	r6, r6, #480
	bne	.L123
	ldr	r5, .L130+4
	add	r0, r0, #1
	add	r1, ip, #1680
	sub	r2, ip, #240
	sub	ip, ip, #480
	add	r6, sp, #4
	add	r1, r1, r0
	add	r2, r2, r0
	add	r0, ip, r0
	ldr	ip, .L130+16
	strh	r5, [sp, #4]	@ movhi
	add	r1, lr, r1, lsl #1
	str	r4, [r3, #44]
	add	r2, lr, r2, lsl #1
	str	r6, [r3, #36]
	lsl	r0, r0, #1
	add	r6, sp, #2
	str	r1, [r3, #40]
	str	ip, [r3, #44]
	strh	r5, [sp, #2]	@ movhi
	str	r4, [r3, #44]
	str	r6, [r3, #36]
	str	r2, [r3, #40]
	str	ip, [r3, #44]
	strh	r5, [lr, r0]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L131:
	.align	2
.L130:
	.word	.LANCHOR0
	.word	21301
	.word	-2130706428
	.word	-2130706431
	.word	-2130706430
	.size	drawBerryCover, .-drawBerryCover
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
