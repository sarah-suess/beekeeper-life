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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFlowers.part.0, %function
updateFlowers.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #4
	mov	lr, #9
	ldr	r2, [r0, #4]
	ldr	r3, [r0]
	ldr	r5, .L12
	sub	sp, sp, #16
	mov	r4, r0
	ldr	r0, [r5]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #4]
	ldr	r6, .L12+4
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	sub	r0, r0, #2
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L2
	mov	r1, #0
	mov	r2, #67108864
	mov	ip, #22272
	ldr	r0, .L12+8
	ldr	r3, [r0]
	add	r3, r3, #1
	str	r3, [r0]
	ldr	r3, .L12+12
	str	r1, [r4, #28]
	str	r1, [r4, #32]
	strh	ip, [r2, #104]	@ movhi
	strh	r3, [r2, #108]	@ movhi
	ldrh	r3, [r4, #24]
	strh	r3, [r5, #40]	@ movhi
.L2:
	mov	ip, #4
	mov	r5, #9
	ldr	r0, .L12+16
	add	r2, r0, #16
	ldr	r1, [r0, #4]
	ldr	lr, [r4, #4]
	ldm	r2, {r2, r3}
	ldr	r0, [r0]
	str	r5, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	sub	r1, r1, #4
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L1
	mov	r1, #0
	mov	r2, #67108864
	mov	ip, #22272
	ldr	r0, .L12+20
	ldr	r3, [r0]
	add	r3, r3, #1
	str	r3, [r0]
	ldr	r3, .L12+24
	str	r1, [r4, #28]
	str	r1, [r4, #32]
	strh	ip, [r2, #104]	@ movhi
	strh	r3, [r2, #108]	@ movhi
.L1:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	bee
	.word	collision
	.word	beeScore
	.word	-14420
	.word	player
	.word	playerScore
	.word	-14435
	.size	updateFlowers.part.0, .-updateFlowers.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBerry.part.0, %function
updateBerry.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L26
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	add	ip, r4, #8
	ldm	ip, {ip, lr}
	ldr	r1, .L26+4
	sub	sp, sp, #20
	sub	r2, r2, #2
	sub	r3, r3, #2
	ldr	r0, [r1]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	add	r2, r1, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r1, #4]
	ldr	r6, .L26+8
	sub	r0, r0, #2
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L24
.L15:
	ldr	r5, .L26+12
	ldr	ip, [r4, #8]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r7, [r4, #12]
	ldr	r1, [r5, #4]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldr	r0, [r5]
	stm	sp, {ip, lr}
	str	r7, [sp, #12]
	sub	r1, r1, #4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L25
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L24:
	ldm	r4, {r0, r1}
	ldr	r3, .L26+16
	mov	lr, pc
	bx	r3
	b	.L15
.L25:
	ldm	r4, {r0, r1}
	ldr	r3, .L26+20
	mov	lr, pc
	bx	r3
	mov	r3, #1
	mov	r1, #0
	mov	r2, #31
	str	r1, [r4, #16]
	str	r3, [r5, #24]
	str	r3, [r5, #36]
	strh	r2, [r5, #32]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	berry
	.word	bee
	.word	collision
	.word	player
	.word	drawBerry
	.word	drawBerryCover
	.size	updateBerry.part.0, .-updateBerry.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #10
	str	lr, [sp, #-4]!
	mov	r1, #0
	mov	lr, #6
	mov	ip, #8
	mov	r0, #2
	ldr	r3, .L30
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	ldr	r2, .L30+4
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	strh	r2, [r3, #32]	@ movhi
	str	r1, [r3, #28]
	str	r1, [r3, #36]
	ldr	lr, [sp], #4
	bx	lr
.L31:
	.align	2
.L30:
	.word	player
	.word	7539
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBee
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBee, %function
initBee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #150
	push	{r4, lr}
	mov	r1, #1
	mov	r4, #165
	mov	lr, #12
	mov	r2, #0
	mov	ip, #10
	ldr	r3, .L34
	str	r0, [r3, #4]
	ldr	r0, .L34+4
	str	r4, [r3]
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	strh	r0, [r3, #40]	@ movhi
	str	r1, [r3, #32]
	str	r1, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	bee
	.word	22494
	.size	initBee, .-initBee
	.align	2
	.global	initBerry
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBerry, %function
initBerry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #80
	mov	lr, #100
	mov	r0, #8
	mov	r1, #10
	mov	r2, #0
	ldr	r3, .L38
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L39:
	.align	2
.L38:
	.word	berry
	.size	initBerry, .-initBerry
	.align	2
	.global	initFlowers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFlowers, %function
initFlowers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L61
	mov	r10, r7
	ldr	r4, .L61+4
	ldr	r6, .L61+8
	ldr	r9, .L61+12
	ldr	r8, .L61+16
	add	r5, r7, #900
.L48:
	mov	r3, #0
	mov	r2, #1
	mov	r0, #4
	mov	r1, #9
	str	r3, [r10, #32]
	str	r2, [r10, #28]
	str	r0, [r10, #16]
	str	r1, [r10, #20]
	mov	lr, pc
	bx	r4
	smull	r3, r2, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3
	cmp	r0, #4
	ldrls	pc, [pc, r0, asl #2]
	b	.L41
.L43:
	.word	.L47
	.word	.L46
	.word	.L45
	.word	.L44
	.word	.L42
.L42:
	mvn	r3, #32768
	strh	r3, [r10, #24]	@ movhi
.L41:
	add	r10, r10, #36
	cmp	r10, r5
	bne	.L48
	mov	r10, #0
	ldr	r9, .L61
	ldr	r8, .L61+20
	ldr	r6, .L61+24
.L49:
	mov	lr, pc
	bx	r4
	mov	r5, r0
	mov	lr, pc
	bx	r4
	smull	r3, r2, r8, r5
	smull	r3, r1, r6, r0
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #3
	add	r1, r1, r0
	asr	r2, r0, #31
	sub	r5, r5, r3
	rsb	r3, r2, r1, asr #2
	add	r5, r5, #10
	rsb	r3, r3, r3, lsl #3
	add	r5, r5, r10
	sub	r0, r0, r3
	add	r10, r10, #45
	add	r0, r0, #10
	cmp	r10, #225
	str	r5, [r9]
	str	r0, [r9, #4]
	add	r9, r9, #36
	bne	.L49
	mov	r10, #0
	ldr	r9, .L61
	ldr	r8, .L61+20
	ldr	r6, .L61+24
.L50:
	mov	lr, pc
	bx	r4
	mov	r5, r0
	mov	lr, pc
	bx	r4
	smull	r3, r2, r8, r5
	smull	r3, r1, r6, r0
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #3
	add	r1, r1, r0
	asr	r2, r0, #31
	sub	r5, r5, r3
	rsb	r3, r2, r1, asr #2
	add	r5, r5, #10
	rsb	r3, r3, r3, lsl #3
	add	r5, r5, r10
	sub	r0, r0, r3
	add	r10, r10, #45
	add	r0, r0, #40
	cmp	r10, #225
	str	r5, [r9, #180]
	str	r0, [r9, #184]
	add	r9, r9, #36
	bne	.L50
	mov	r10, #0
	ldr	r9, .L61
	ldr	r8, .L61+20
	ldr	r6, .L61+24
.L51:
	mov	lr, pc
	bx	r4
	mov	r5, r0
	mov	lr, pc
	bx	r4
	smull	r3, r2, r8, r5
	smull	r3, r1, r6, r0
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #3
	add	r1, r1, r0
	asr	r2, r0, #31
	sub	r5, r5, r3
	rsb	r3, r2, r1, asr #2
	add	r5, r5, #10
	rsb	r3, r3, r3, lsl #3
	add	r5, r5, r10
	sub	r0, r0, r3
	add	r10, r10, #45
	add	r0, r0, #70
	cmp	r10, #225
	str	r5, [r9, #360]
	str	r0, [r9, #364]
	add	r9, r9, #36
	bne	.L51
	mov	r10, #0
	ldr	r9, .L61
	ldr	r8, .L61+20
	ldr	r6, .L61+24
.L52:
	mov	lr, pc
	bx	r4
	mov	r5, r0
	mov	lr, pc
	bx	r4
	smull	r3, r2, r8, r5
	smull	r3, r1, r6, r0
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #3
	add	r1, r1, r0
	asr	r2, r0, #31
	sub	r5, r5, r3
	rsb	r3, r2, r1, asr #2
	add	r5, r5, #10
	rsb	r3, r3, r3, lsl #3
	add	r5, r5, r10
	sub	r0, r0, r3
	add	r10, r10, #45
	add	r0, r0, #100
	cmp	r10, #225
	str	r5, [r9, #540]
	str	r0, [r9, #544]
	add	r9, r9, #36
	bne	.L52
	mov	r9, #0
	ldr	r8, .L61+20
	ldr	r6, .L61+24
.L53:
	mov	lr, pc
	bx	r4
	mov	r5, r0
	mov	lr, pc
	bx	r4
	smull	r3, r2, r8, r5
	smull	r3, r1, r6, r0
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #3
	add	r1, r1, r0
	asr	r2, r0, #31
	sub	r5, r5, r3
	rsb	r3, r2, r1, asr #2
	add	r5, r5, #10
	rsb	r3, r3, r3, lsl #3
	add	r5, r5, r9
	sub	r0, r0, r3
	add	r9, r9, #45
	add	r0, r0, #130
	cmp	r9, #225
	str	r5, [r7, #720]
	str	r0, [r7, #724]
	add	r7, r7, #36
	bne	.L53
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L44:
	strh	r9, [r10, #24]	@ movhi
	b	.L41
.L45:
	strh	r8, [r10, #24]	@ movhi
	b	.L41
.L47:
	ldr	r3, .L61+28
	strh	r3, [r10, #24]	@ movhi
	b	.L41
.L46:
	ldr	r3, .L61+32
	strh	r3, [r10, #24]	@ movhi
	b	.L41
.L62:
	.align	2
.L61:
	.word	flowers
	.word	rand
	.word	1717986919
	.word	32625
	.word	21951
	.word	818089009
	.word	-1840700269
	.word	22494
	.word	28274
	.size	initFlowers, .-initFlowers
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	mov	lr, #2
	mov	r5, #10
	mov	r6, #8
	mov	r7, #6
	mov	r1, #12
	mov	r2, #1
	mov	ip, #165
	mov	r0, #150
	ldr	r3, .L65
	str	r4, [r3]
	ldr	r3, .L65+4
	str	r4, [r3]
	ldr	r3, .L65+8
	str	r4, [r3]
	ldr	r3, .L65+12
	str	r4, [r3]
	ldr	r3, .L65+16
	str	r4, [r3]
	ldr	r3, .L65+20
	str	r4, [r3]
	ldr	r3, .L65+24
	str	lr, [r3, #24]
	ldr	lr, .L65+28
	str	r4, [r3, #28]
	str	r4, [r3, #36]
	str	r7, [r3, #16]
	str	r5, [r3]
	strh	lr, [r3, #32]	@ movhi
	str	r5, [r3, #4]
	str	r6, [r3, #20]
	str	r5, [r3, #8]
	str	r5, [r3, #12]
	ldr	r3, .L65+32
	str	r1, [r3, #16]
	ldr	r1, .L65+36
	strh	r1, [r3, #40]	@ movhi
	ldr	r1, .L65+40
	str	r5, [r3, #20]
	str	r4, [r3, #36]
	str	r4, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #24]
	str	r2, [r1]
	str	ip, [r3]
	str	r0, [r3, #4]
	bl	initFlowers
	mov	r1, #100
	mov	r2, #80
	ldr	r3, .L65+44
	str	r6, [r3, #8]
	str	r5, [r3, #12]
	str	r4, [r3, #16]
	stm	r3, {r1, r2}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	framecount
	.word	beeScore
	.word	playerScore
	.word	slowdown
	.word	timeTrack
	.word	count
	.word	player
	.word	7539
	.word	bee
	.word	22494
	.word	once
	.word	berry
	.size	initGame, .-initGame
	.align	2
	.global	updateFlowers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFlowers, %function
updateFlowers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	b	updateFlowers.part.0
	.size	updateFlowers, .-updateFlowers
	.global	__aeabi_idivmod
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L100
	ldr	r3, [r3]
	cmp	r3, #5
	sub	sp, sp, #20
	beq	.L93
.L96:
	ldr	r4, .L100+4
.L70:
	ldr	r2, .L100+8
	ldr	r3, .L100+12
	ldr	r0, [r2]
	ldr	r1, [r4, #24]
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	ldm	r4, {r0, r1}
	bne	.L71
	ldr	r3, .L100+16
	ldrh	r2, [r3]
	lsr	r3, r2, #5
	eor	r3, r3, #1
	cmp	r0, #0
	movle	r3, #0
	andgt	r3, r3, #1
	cmp	r3, #0
	str	r0, [r4, #8]
	subne	r0, r0, #1
	strne	r0, [r4]
	tst	r2, #16
	str	r1, [r4, #12]
	bne	.L73
	cmp	r0, #231
	addle	r0, r0, #1
	strle	r0, [r4]
.L73:
	lsr	r3, r2, #6
	eor	r3, r3, #1
	cmp	r1, #5
	movle	r3, #0
	andgt	r3, r3, #1
	cmp	r3, #0
	subne	r1, r1, #1
	strne	r1, [r4, #4]
	tst	r2, #128
	beq	.L97
.L71:
	ldr	r3, .L100+20
	ldr	r2, [r3]
	ldr	lr, [r3, #16]
	ldr	ip, [r3, #4]
	ldr	r5, [r3, #20]
	sub	r3, r2, #2
	stmib	sp, {ip, lr}
	str	r5, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r5, .L100+24
	sub	r1, r1, #4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L75
	mov	r2, #0
	mov	r3, #1
	mov	lr, #3
	ldr	r0, .L100+28
	str	r2, [r0]
	mov	r2, r3
	ldr	r1, .L100+32
	ldr	ip, .L100+36
	str	r3, [r1]
	str	lr, [r4, #24]
	strh	ip, [r4, #32]	@ movhi
.L76:
	mov	r3, #22272
	mov	lr, #67108864
	ldr	ip, .L100+40
	strh	r3, [lr, #104]	@ movhi
	ldr	r3, [ip]
	cmp	r3, #14
	bls	.L98
	sub	r5, r3, #15
	cmp	r5, #14
	bhi	.L81
	ldr	r5, .L100+44
	add	r3, r3, #1
	strh	r5, [lr, #108]	@ movhi
	str	r3, [ip]
.L80:
	cmp	r2, #300
	str	r2, [r0]
	bne	.L69
	ldr	r3, [r4, #36]
	cmp	r3, #1
	mov	r0, #0
	movne	r2, #2
	ldreq	r2, .L100+48
	ldrne	r3, .L100+48
	streq	r3, [r4, #24]
	streq	r0, [r1]
	strheq	r2, [r4, #32]	@ movhi
	strne	r0, [r1]
	strne	r2, [r4, #24]
	strhne	r3, [r4, #32]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L75:
	ldr	r1, .L100+32
	ldr	r3, [r1]
	cmp	r3, #1
	beq	.L99
.L69:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L97:
	cmp	r1, #155
	addle	r1, r1, #1
	strle	r1, [r4, #4]
	b	.L71
.L93:
	ldr	r2, .L100+52
	ldr	r3, [r2]
	cmp	r3, #1
	bne	.L96
	mov	r1, #0
	ldr	r4, .L100+4
	str	r1, [r2]
	str	r3, [r4, #28]
	b	.L70
.L98:
	ldr	r5, .L100+56
	add	r3, r3, #1
	strh	r5, [lr, #108]	@ movhi
	str	r3, [ip]
	b	.L80
.L81:
	sub	r5, r3, #30
	cmp	r5, #14
	movhi	r3, #0
	ldrls	r5, .L100+60
	ldrhi	r5, .L100+60
	addls	r3, r3, #1
	strh	r5, [lr, #108]	@ movhi
	str	r3, [ip]
	b	.L80
.L99:
	ldr	r0, .L100+28
	ldr	r3, [r0]
	add	r2, r3, #1
	b	.L76
.L101:
	.align	2
.L100:
	.word	playerScore
	.word	player
	.word	framecount
	.word	__aeabi_idivmod
	.word	buttons
	.word	bee
	.word	collision
	.word	timeTrack
	.word	slowdown
	.word	32625
	.word	count
	.word	-15087
	.word	7539
	.word	once
	.word	-15005
	.word	-15131
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBee
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBee, %function
updateBee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r5, .L128
	ldr	r3, [r5, #16]
	ldr	r4, .L128+4
	cmp	r3, #1
	ldm	r4, {r0, r1}
	sub	sp, sp, #20
	beq	.L123
.L103:
	mov	ip, #1
	ldr	r3, [r4, #24]
	ldr	r2, .L128+8
	cmp	r3, ip
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	str	ip, [r2]
	beq	.L124
.L106:
	ldr	r3, [r4, #28]
	cmp	r3, #1
	beq	.L125
.L109:
	ldr	r3, [r4, #32]
	cmp	r3, #1
	beq	.L126
.L110:
	ldr	r3, [r4, #36]
	cmp	r3, #1
	beq	.L112
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L124:
	cmp	r1, ip
	subgt	r1, r1, #1
	strgt	r1, [r4, #4]
	bgt	.L106
	mov	r2, #0
	str	r3, [r4, #28]
	str	r2, [r4, #24]
.L108:
	ldr	r3, [r4, #32]
	add	r1, r1, #1
	cmp	r3, #1
	str	r1, [r4, #4]
	bne	.L110
.L126:
	cmp	r0, #2
	bgt	.L111
	mov	r2, #0
	str	r3, [r4, #36]
	str	r2, [r4, #32]
.L112:
	ldr	r3, [r4]
	cmp	r3, #226
	movgt	r2, #1
	movgt	r3, #0
	addle	r3, r3, #1
	strgt	r2, [r4, #32]
	strgt	r3, [r4, #36]
	strle	r3, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L123:
	ldm	r5, {r3, ip}
	sub	ip, ip, #2
	ldr	r2, [r4, #16]
	ldr	lr, [r5, #12]
	str	ip, [sp, #4]
	ldr	ip, [r5, #8]
	sub	r3, r3, #2
	str	r3, [sp]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	r3, [r4, #20]
	ldr	r6, .L128+12
	sub	r0, r0, #3
	add	r2, r2, #4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L127
.L104:
	ldr	r1, [r5, #4]
	ldr	r3, [r5]
	sub	r1, r1, #2
	ldr	r2, [r4, #16]
	ldr	r0, [r4]
	ldr	ip, [r5, #12]
	str	r1, [sp, #4]
	ldr	r1, [r5, #8]
	sub	r3, r3, #2
	str	r3, [sp]
	str	r1, [sp, #8]
	str	ip, [sp, #12]
	ldr	r3, [r4, #20]
	ldr	r1, [r4, #4]
	add	r2, r2, #4
	sub	r0, r0, #3
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L105
.L122:
	ldm	r4, {r0, r1}
	b	.L103
.L125:
	ldr	r1, [r4, #4]
	cmp	r1, #149
	ble	.L108
	mov	r2, #0
	str	r3, [r4, #24]
	str	r2, [r4, #28]
	b	.L109
.L111:
	sub	r0, r0, #1
	str	r0, [r4]
	b	.L110
.L127:
	ldr	r0, .L128+16
	ldr	ip, [r5, #8]
	add	r2, r0, #16
	ldr	r1, [r0, #4]
	ldm	r2, {r2, r3}
	ldr	r0, [r0]
	ldr	r7, [r5, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	str	r7, [sp, #12]
	stm	sp, {ip, lr}
	sub	r1, r1, #4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L104
	ldm	r5, {r0, r1}
	ldr	r3, .L128+20
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r0, [r4]
	str	r3, [r5, #16]
	ldr	r1, [r4, #4]
	b	.L103
.L105:
	ldm	r5, {r0, r1}
	ldr	r3, .L128+24
	mov	lr, pc
	bx	r3
	b	.L122
.L129:
	.align	2
.L128:
	.word	berry
	.word	bee
	.word	timestep
	.word	collision
	.word	player
	.word	drawBerryCover
	.word	drawBerry
	.size	updateBee, .-updateBee
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
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	bl	updateBee
	ldr	r3, .L141
	ldr	r3, [r3, #16]
	cmp	r3, #1
	beq	.L139
.L131:
	ldr	r4, .L141+4
	add	r5, r4, #900
	b	.L133
.L132:
	add	r4, r4, #36
	cmp	r4, r5
	beq	.L140
.L133:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L132
	mov	r0, r4
	add	r4, r4, #36
	bl	updateFlowers.part.0
	cmp	r4, r5
	bne	.L133
.L140:
	pop	{r4, r5, r6, lr}
	bx	lr
.L139:
	bl	updateBerry.part.0
	b	.L131
.L142:
	.align	2
.L141:
	.word	berry
	.word	flowers
	.size	updateGame, .-updateGame
	.align	2
	.global	drawFlowers
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFlowers, %function
drawFlowers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L147
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L148
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L148:
	ldr	r2, .L149
	ldr	r3, [r0, #20]
	str	r2, [sp]
	ldr	r5, .L149+4
	ldr	r2, [r0, #16]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #32]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L147:
	ldrh	r2, [r0, #24]
	ldr	r3, .L149+8
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L150:
	.align	2
.L149:
	.word	21301
	.word	drawRect
	.word	drawFlower
	.size	drawFlowers, .-drawFlowers
	.align	2
	.global	updateBerry
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBerry, %function
updateBerry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L153
	ldr	r3, [r3, #16]
	cmp	r3, #1
	bxne	lr
	b	updateBerry.part.0
.L154:
	.align	2
.L153:
	.word	berry
	.size	updateBerry, .-updateBerry
	.align	2
	.global	drawGameBerry
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGameBerry, %function
drawGameBerry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L159
	ldr	r5, [r4, #28]
	cmp	r5, #1
	beq	.L158
	mov	r3, #0
	str	r3, [r4, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L158:
	ldr	r6, .L159+4
	ldr	r3, .L159+8
	ldm	r6, {r0, r1}
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r5, [r6, #16]
	str	r3, [r4, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L160:
	.align	2
.L159:
	.word	player
	.word	berry
	.word	drawBerry
	.size	drawGameBerry, .-drawGameBerry
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L163
	add	r0, r4, #8
	ldr	r2, .L163+4
	ldm	r0, {r0, r1}
	ldr	r3, .L163+8
	mov	lr, pc
	bx	r3
	ldrh	r2, [r4, #32]
	ldm	r4, {r0, r1}
	ldr	r3, .L163+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L164:
	.align	2
.L163:
	.word	player
	.word	21301
	.word	drawBasketCover
	.word	drawBasket
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawGameBee
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGameBee, %function
drawGameBee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L167
	add	r0, r4, #8
	ldr	r2, .L167+4
	ldm	r0, {r0, r1}
	ldr	r3, .L167+8
	mov	lr, pc
	bx	r3
	ldrh	r2, [r4, #40]
	ldm	r4, {r0, r1}
	ldr	r3, .L167+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L168:
	.align	2
.L167:
	.word	bee
	.word	21301
	.word	drawBeeCover
	.word	drawBee
	.size	drawGameBee, .-drawGameBee
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	drawPlayer
	bl	drawGameBee
	bl	drawGameBerry
	ldr	r4, .L173
	add	r5, r4, #900
.L170:
	mov	r0, r4
	add	r4, r4, #36
	bl	drawFlowers
	cmp	r4, r5
	bne	.L170
	pop	{r4, r5, r6, lr}
	bx	lr
.L174:
	.align	2
.L173:
	.word	flowers
	.size	drawGame, .-drawGame
	.comm	once,4,4
	.comm	playerScore,4,4
	.comm	beeScore,4,4
	.comm	count,4,4
	.comm	timeTrack,4,4
	.comm	slowdown,4,4
	.comm	timestep,4,4
	.comm	framecount,4,4
	.comm	berry,20,4
	.comm	bee,44,4
	.comm	player,40,4
	.comm	flowers,900,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
