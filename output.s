.text
.type check, @function
.p2align 2
.globl check
check:
	addi sp, sp, -96
	sw ra, 0(sp)
	sw a0, 4(sp)
	sw a1, 8(sp)
	addi t5, sp, 16
	sw t5, 12(sp)
	addi t5, sp, 24
	sw t5, 20(sp)
	addi t5, sp, 32
	sw t5, 28(sp)
	lw t0, 4(sp)
	lw t1, 12(sp)
	sw t0, 0(t1)
	lw t0, 8(sp)
	lw t1, 20(sp)
	sw t0, 0(t1)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 36(sp)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 40(sp)
	lw t1, 36(sp)
	lw t2, 40(sp)
	slt t0, t1, t2
	sw t0, 44(sp)
	lw t0, 44(sp)
	lw t1, 28(sp)
	sw t0, 0(t1)
	lw t0, 44(sp)
	bnez t0, B1.label_logicT_0
	j B1.label_logicF_1

B1.label_logicT_0:
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 48(sp)
	lw t1, 48(sp)
	li t2, 0
	slt t0, t1, t2
	xori t0, t0, 1
	sw t0, 52(sp)
	lw t0, 52(sp)
	lw t1, 28(sp)
	sw t0, 0(t1)
	j B1.label_logicF_1

B1.label_logicF_1:
	lw t0, 28(sp)
	lw t1, 0(t0)
	sw t1, 56(sp)
	lw a0, 56(sp)
	lw ra, 0(sp)
	addi sp, sp, 96
	ret


.type main, @function
.p2align 2
.globl main
main:
	li t6, -2432
	add sp, sp, t6
	sw ra, 0(sp)
	addi t5, sp, 8
	sw t5, 4(sp)
	addi t5, sp, 16
	sw t5, 12(sp)
	addi t5, sp, 24
	sw t5, 20(sp)
	addi t5, sp, 32
	sw t5, 28(sp)
	addi t5, sp, 40
	sw t5, 36(sp)
	addi t5, sp, 48
	sw t5, 44(sp)
	addi t5, sp, 56
	sw t5, 52(sp)
	addi t5, sp, 64
	sw t5, 60(sp)
	addi t5, sp, 72
	sw t5, 68(sp)
	addi t5, sp, 80
	sw t5, 76(sp)
	addi t5, sp, 88
	sw t5, 84(sp)
	addi t5, sp, 96
	sw t5, 92(sp)
	addi t5, sp, 104
	sw t5, 100(sp)
	addi t5, sp, 112
	sw t5, 108(sp)
	addi t5, sp, 120
	sw t5, 116(sp)
	addi t5, sp, 128
	sw t5, 124(sp)
	addi t5, sp, 136
	sw t5, 132(sp)
	addi t5, sp, 144
	sw t5, 140(sp)
	addi t5, sp, 152
	sw t5, 148(sp)
	addi t5, sp, 160
	sw t5, 156(sp)
	addi t5, sp, 168
	sw t5, 164(sp)
	addi t5, sp, 176
	sw t5, 172(sp)
	addi t5, sp, 184
	sw t5, 180(sp)
	addi t5, sp, 192
	sw t5, 188(sp)
	addi t5, sp, 200
	sw t5, 196(sp)
	addi t5, sp, 208
	sw t5, 204(sp)
	addi t5, sp, 216
	sw t5, 212(sp)
	addi t5, sp, 224
	sw t5, 220(sp)
	addi t5, sp, 232
	sw t5, 228(sp)
	addi t5, sp, 240
	sw t5, 236(sp)
	addi t5, sp, 248
	sw t5, 244(sp)
	addi t5, sp, 256
	sw t5, 252(sp)
	addi t5, sp, 264
	sw t5, 260(sp)
	addi t5, sp, 272
	sw t5, 268(sp)
	addi t5, sp, 280
	sw t5, 276(sp)
	addi t5, sp, 288
	sw t5, 284(sp)
	addi t5, sp, 296
	sw t5, 292(sp)
	addi t5, sp, 304
	sw t5, 300(sp)
	addi t5, sp, 312
	sw t5, 308(sp)
	addi t5, sp, 320
	sw t5, 316(sp)
	call .init
	call getInt
	sw a0, 324(sp)
	lw t0, 324(sp)
	lw t1, 4(sp)
	sw t0, 0(t1)
	li t0, 0
	lw t1, 12(sp)
	sw t0, 0(t1)
	li t0, 0
	lw t1, 52(sp)
	sw t0, 0(t1)
	li t0, 0
	lw t1, 20(sp)
	sw t0, 0(t1)
	li t0, 0
	lw t1, 28(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 328(sp)
	lw t1, 328(sp)
	li t2, 1
	sub t0, t1, t2
	sw t0, 332(sp)
	lw t0, 332(sp)
	lw t1, 36(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 336(sp)
	lw t1, 336(sp)
	li t2, 1
	sub t0, t1, t2
	sw t0, 340(sp)
	lw t0, 340(sp)
	lw t1, 44(sp)
	sw t0, 0(t1)
	li t0, 0
	lw t1, 76(sp)
	sw t0, 0(t1)
	li t0, 0
	lw t1, 84(sp)
	sw t0, 0(t1)
	li t0, 0
	lw t1, 68(sp)
	sw t0, 0(t1)
	li t0, 0
	lw t1, 60(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 344(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 348(sp)
	lw t1, 344(sp)
	lw t2, 348(sp)
	mul t0, t1, t2
	sw t0, 352(sp)
	li a0, 4
	lw a1, 352(sp)
	call .malloc_array
	sw a0, 356(sp)
	lw t0, 356(sp)
	lw t1, 92(sp)
	sw t0, 0(t1)
	li t0, 0
	lw t1, 116(sp)
	sw t0, 0(t1)
	j B2.label_loop_4

B2.label_loop_4:
	lw t0, 116(sp)
	lw t1, 0(t0)
	sw t1, 360(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 364(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 368(sp)
	lw t1, 364(sp)
	lw t2, 368(sp)
	mul t0, t1, t2
	sw t0, 372(sp)
	lw t1, 360(sp)
	lw t2, 372(sp)
	slt t0, t1, t2
	sw t0, 376(sp)
	lw t0, 376(sp)
	bnez t0, B2.label_body_5
	j B2.label_skip_3

B2.label_step_2:
	lw t0, 116(sp)
	lw t1, 0(t0)
	sw t1, 380(sp)
	lw t1, 380(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 384(sp)
	lw t0, 384(sp)
	lw t1, 116(sp)
	sw t0, 0(t1)
	j B2.label_loop_4

B2.label_body_5:
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 388(sp)
	lw t0, 116(sp)
	lw t1, 0(t0)
	sw t1, 392(sp)
	lw t0, 388(sp)
	lw t1, 392(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 396(sp)
	li t0, 0
	lw t1, 396(sp)
	sw t0, 0(t1)
	j B2.label_step_2

B2.label_skip_3:
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 400(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 404(sp)
	lw t1, 400(sp)
	lw t2, 404(sp)
	mul t0, t1, t2
	sw t0, 408(sp)
	li a0, 4
	lw a1, 408(sp)
	call .malloc_array
	sw a0, 412(sp)
	lw t0, 412(sp)
	lw t1, 100(sp)
	sw t0, 0(t1)
	li t0, 0
	lw t1, 116(sp)
	sw t0, 0(t1)
	j B2.label_loop_8

B2.label_loop_8:
	lw t0, 116(sp)
	lw t1, 0(t0)
	sw t1, 416(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 420(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 424(sp)
	lw t1, 420(sp)
	lw t2, 424(sp)
	mul t0, t1, t2
	sw t0, 428(sp)
	lw t1, 416(sp)
	lw t2, 428(sp)
	slt t0, t1, t2
	sw t0, 432(sp)
	lw t0, 432(sp)
	bnez t0, B2.label_body_9
	j B2.label_skip_7

B2.label_step_6:
	lw t0, 116(sp)
	lw t1, 0(t0)
	sw t1, 436(sp)
	lw t1, 436(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 440(sp)
	lw t0, 440(sp)
	lw t1, 116(sp)
	sw t0, 0(t1)
	j B2.label_loop_8

B2.label_body_9:
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 444(sp)
	lw t0, 116(sp)
	lw t1, 0(t0)
	sw t1, 448(sp)
	lw t0, 444(sp)
	lw t1, 448(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 452(sp)
	li t0, 0
	lw t1, 452(sp)
	sw t0, 0(t1)
	j B2.label_step_6

B2.label_skip_7:
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 456(sp)
	li a0, 4
	lw a1, 456(sp)
	call .malloc_array
	sw a0, 460(sp)
	lw t0, 460(sp)
	lw t1, 108(sp)
	sw t0, 0(t1)
	li t0, 0
	lw t1, 116(sp)
	sw t0, 0(t1)
	j B2.label_loop_12

B2.label_loop_12:
	lw t0, 116(sp)
	lw t1, 0(t0)
	sw t1, 464(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 468(sp)
	lw t1, 464(sp)
	lw t2, 468(sp)
	slt t0, t1, t2
	sw t0, 472(sp)
	lw t0, 472(sp)
	bnez t0, B2.label_body_13
	j B2.label_skip_11

B2.label_step_10:
	lw t0, 116(sp)
	lw t1, 0(t0)
	sw t1, 476(sp)
	lw t1, 476(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 480(sp)
	lw t0, 480(sp)
	lw t1, 116(sp)
	sw t0, 0(t1)
	j B2.label_loop_12

B2.label_body_13:
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 484(sp)
	lw t0, 116(sp)
	lw t1, 0(t0)
	sw t1, 488(sp)
	lw t0, 484(sp)
	lw t1, 488(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 492(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 496(sp)
	li a0, 4
	lw a1, 496(sp)
	call .malloc_array
	sw a0, 500(sp)
	lw t0, 500(sp)
	lw t1, 492(sp)
	sw t0, 0(t1)
	li t0, 0
	lw t1, 124(sp)
	sw t0, 0(t1)
	j B2.label_loop_16

B2.label_loop_16:
	lw t0, 124(sp)
	lw t1, 0(t0)
	sw t1, 504(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 508(sp)
	lw t1, 504(sp)
	lw t2, 508(sp)
	slt t0, t1, t2
	sw t0, 512(sp)
	lw t0, 512(sp)
	bnez t0, B2.label_body_17
	j B2.label_skip_15

B2.label_step_14:
	lw t0, 124(sp)
	lw t1, 0(t0)
	sw t1, 516(sp)
	lw t1, 516(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 520(sp)
	lw t0, 520(sp)
	lw t1, 124(sp)
	sw t0, 0(t1)
	j B2.label_loop_16

B2.label_body_17:
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 524(sp)
	lw t0, 116(sp)
	lw t1, 0(t0)
	sw t1, 528(sp)
	lw t0, 524(sp)
	lw t1, 528(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 532(sp)
	lw t0, 532(sp)
	lw t1, 0(t0)
	sw t1, 536(sp)
	lw t0, 124(sp)
	lw t1, 0(t0)
	sw t1, 540(sp)
	lw t0, 536(sp)
	lw t1, 540(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 544(sp)
	li t1, 0
	li t2, 1
	sub t0, t1, t2
	sw t0, 548(sp)
	lw t0, 548(sp)
	lw t1, 544(sp)
	sw t0, 0(t1)
	j B2.label_step_14

B2.label_skip_15:
	j B2.label_step_10

B2.label_skip_11:
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 552(sp)
	lw t0, 552(sp)
	li t1, 0
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 556(sp)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 560(sp)
	lw t0, 560(sp)
	lw t1, 556(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 564(sp)
	lw t0, 564(sp)
	li t1, 0
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 568(sp)
	lw t0, 28(sp)
	lw t1, 0(t0)
	sw t1, 572(sp)
	lw t0, 572(sp)
	lw t1, 568(sp)
	sw t0, 0(t1)
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 576(sp)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 580(sp)
	lw t0, 576(sp)
	lw t1, 580(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 584(sp)
	lw t0, 584(sp)
	lw t1, 0(t0)
	sw t1, 588(sp)
	lw t0, 28(sp)
	lw t1, 0(t0)
	sw t1, 592(sp)
	lw t0, 588(sp)
	lw t1, 592(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 596(sp)
	li t0, 0
	lw t1, 596(sp)
	sw t0, 0(t1)
	j B2.label_loop_18

B2.label_loop_18:
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 600(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 604(sp)
	lw t1, 600(sp)
	lw t2, 604(sp)
	slt t0, t2, t1
	xori t0, t0, 1
	sw t0, 608(sp)
	lw t0, 608(sp)
	bnez t0, B2.label_body_20
	j B2.label_skip_19

B2.label_body_20:
	la a0, .str.pre_0
	call print
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 612(sp)
	lw a0, 612(sp)
	call printlnInt
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 616(sp)
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 620(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 624(sp)
	lw t0, 620(sp)
	lw t1, 624(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 628(sp)
	lw t0, 628(sp)
	lw t1, 0(t0)
	sw t1, 632(sp)
	lw t0, 616(sp)
	lw t1, 632(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 636(sp)
	lw t0, 636(sp)
	lw t1, 0(t0)
	sw t1, 640(sp)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 644(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 648(sp)
	lw t0, 644(sp)
	lw t1, 648(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 652(sp)
	lw t0, 652(sp)
	lw t1, 0(t0)
	sw t1, 656(sp)
	lw t0, 640(sp)
	lw t1, 656(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 660(sp)
	lw t0, 660(sp)
	lw t1, 0(t0)
	sw t1, 664(sp)
	lw t0, 664(sp)
	lw t1, 68(sp)
	sw t0, 0(t1)
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 668(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 672(sp)
	lw t0, 668(sp)
	lw t1, 672(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 676(sp)
	lw t0, 676(sp)
	lw t1, 0(t0)
	sw t1, 680(sp)
	lw t1, 680(sp)
	li t2, 1
	sub t0, t1, t2
	sw t0, 684(sp)
	lw t0, 684(sp)
	lw t1, 76(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 688(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 692(sp)
	lw t0, 688(sp)
	lw t1, 692(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 696(sp)
	lw t0, 696(sp)
	lw t1, 0(t0)
	sw t1, 700(sp)
	lw t1, 700(sp)
	li t2, 2
	sub t0, t1, t2
	sw t0, 704(sp)
	lw t0, 704(sp)
	lw t1, 84(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 708(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 712(sp)
	lw a0, 708(sp)
	lw a1, 712(sp)
	call check
	sw a0, 716(sp)
	lw t0, 716(sp)
	lw t1, 140(sp)
	sw t0, 0(t1)
	lw t0, 716(sp)
	bnez t0, B2.label_logicT_21
	j B2.label_logicF_22

B2.label_logicT_21:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 720(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 724(sp)
	lw a0, 720(sp)
	lw a1, 724(sp)
	call check
	sw a0, 728(sp)
	lw t0, 728(sp)
	lw t1, 140(sp)
	sw t0, 0(t1)
	j B2.label_logicF_22

B2.label_logicF_22:
	lw t0, 140(sp)
	lw t1, 0(t0)
	sw t1, 732(sp)
	lw t0, 732(sp)
	lw t1, 132(sp)
	sw t0, 0(t1)
	lw t0, 732(sp)
	bnez t0, B2.label_logicT_23
	j B2.label_logicF_24

B2.label_logicT_23:
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 736(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 740(sp)
	lw t0, 736(sp)
	lw t1, 740(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 744(sp)
	lw t0, 744(sp)
	lw t1, 0(t0)
	sw t1, 748(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 752(sp)
	lw t0, 748(sp)
	lw t1, 752(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 756(sp)
	lw t0, 756(sp)
	lw t1, 0(t0)
	sw t1, 760(sp)
	li t1, 0
	li t2, 1
	sub t0, t1, t2
	sw t0, 764(sp)
	lw t1, 760(sp)
	lw t2, 764(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 768(sp)
	lw t0, 768(sp)
	lw t1, 132(sp)
	sw t0, 0(t1)
	j B2.label_logicF_24

B2.label_logicF_24:
	lw t0, 132(sp)
	lw t1, 0(t0)
	sw t1, 772(sp)
	lw t0, 772(sp)
	bnez t0, B2.label_true_25
	j B2.label_false_26

B2.label_true_25:
	li a0, 1
	call printlnInt
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 776(sp)
	lw t1, 776(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 780(sp)
	lw t0, 780(sp)
	lw t1, 52(sp)
	sw t0, 0(t1)
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 784(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 788(sp)
	lw t0, 784(sp)
	lw t1, 788(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 792(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 796(sp)
	lw t0, 796(sp)
	lw t1, 792(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 800(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 804(sp)
	lw t0, 800(sp)
	lw t1, 804(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 808(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 812(sp)
	lw t0, 812(sp)
	lw t1, 808(sp)
	sw t0, 0(t1)
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 816(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 820(sp)
	lw t0, 816(sp)
	lw t1, 820(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 824(sp)
	lw t0, 824(sp)
	lw t1, 0(t0)
	sw t1, 828(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 832(sp)
	lw t0, 828(sp)
	lw t1, 832(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 836(sp)
	lw t0, 68(sp)
	lw t1, 0(t0)
	sw t1, 840(sp)
	lw t1, 840(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 844(sp)
	lw t0, 844(sp)
	lw t1, 836(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 848(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 852(sp)
	lw t1, 848(sp)
	lw t2, 852(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 856(sp)
	lw t0, 856(sp)
	lw t1, 148(sp)
	sw t0, 0(t1)
	lw t0, 856(sp)
	bnez t0, B2.label_logicT_28
	j B2.label_logicF_29

B2.label_logicT_28:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 860(sp)
	lw t0, 44(sp)
	lw t1, 0(t0)
	sw t1, 864(sp)
	lw t1, 860(sp)
	lw t2, 864(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 868(sp)
	lw t0, 868(sp)
	lw t1, 148(sp)
	sw t0, 0(t1)
	j B2.label_logicF_29

B2.label_logicF_29:
	lw t0, 148(sp)
	lw t1, 0(t0)
	sw t1, 872(sp)
	lw t0, 872(sp)
	bnez t0, B2.label_true_30
	j B2.label_false_31

B2.label_true_30:
	li t0, 1
	lw t1, 60(sp)
	sw t0, 0(t1)
	j B2.label_skip_32

B2.label_false_31:
	j B2.label_skip_32

B2.label_skip_32:
	j B2.label_skip_27

B2.label_false_26:
	j B2.label_skip_27

B2.label_skip_27:
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 876(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 880(sp)
	lw t0, 876(sp)
	lw t1, 880(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 884(sp)
	lw t0, 884(sp)
	lw t1, 0(t0)
	sw t1, 888(sp)
	lw t1, 888(sp)
	li t2, 1
	sub t0, t1, t2
	sw t0, 892(sp)
	lw t0, 892(sp)
	lw t1, 76(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 896(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 900(sp)
	lw t0, 896(sp)
	lw t1, 900(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 904(sp)
	lw t0, 904(sp)
	lw t1, 0(t0)
	sw t1, 908(sp)
	lw t1, 908(sp)
	li t2, 2
	add t0, t1, t2
	sw t0, 912(sp)
	lw t0, 912(sp)
	lw t1, 84(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 916(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 920(sp)
	lw a0, 916(sp)
	lw a1, 920(sp)
	call check
	sw a0, 924(sp)
	lw t0, 924(sp)
	lw t1, 164(sp)
	sw t0, 0(t1)
	lw t0, 924(sp)
	bnez t0, B2.label_logicT_33
	j B2.label_logicF_34

B2.label_logicT_33:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 928(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 932(sp)
	lw a0, 928(sp)
	lw a1, 932(sp)
	call check
	sw a0, 936(sp)
	lw t0, 936(sp)
	lw t1, 164(sp)
	sw t0, 0(t1)
	j B2.label_logicF_34

B2.label_logicF_34:
	lw t0, 164(sp)
	lw t1, 0(t0)
	sw t1, 940(sp)
	lw t0, 940(sp)
	lw t1, 156(sp)
	sw t0, 0(t1)
	lw t0, 940(sp)
	bnez t0, B2.label_logicT_35
	j B2.label_logicF_36

B2.label_logicT_35:
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 944(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 948(sp)
	lw t0, 944(sp)
	lw t1, 948(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 952(sp)
	lw t0, 952(sp)
	lw t1, 0(t0)
	sw t1, 956(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 960(sp)
	lw t0, 956(sp)
	lw t1, 960(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 964(sp)
	lw t0, 964(sp)
	lw t1, 0(t0)
	sw t1, 968(sp)
	li t1, 0
	li t2, 1
	sub t0, t1, t2
	sw t0, 972(sp)
	lw t1, 968(sp)
	lw t2, 972(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 976(sp)
	lw t0, 976(sp)
	lw t1, 156(sp)
	sw t0, 0(t1)
	j B2.label_logicF_36

B2.label_logicF_36:
	lw t0, 156(sp)
	lw t1, 0(t0)
	sw t1, 980(sp)
	lw t0, 980(sp)
	bnez t0, B2.label_true_37
	j B2.label_false_38

B2.label_true_37:
	li a0, 2
	call printlnInt
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 984(sp)
	lw t1, 984(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 988(sp)
	lw t0, 988(sp)
	lw t1, 52(sp)
	sw t0, 0(t1)
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 992(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 996(sp)
	lw t0, 992(sp)
	lw t1, 996(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1000(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1004(sp)
	lw t0, 1004(sp)
	lw t1, 1000(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 1008(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1012(sp)
	lw t0, 1008(sp)
	lw t1, 1012(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1016(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1020(sp)
	lw t0, 1020(sp)
	lw t1, 1016(sp)
	sw t0, 0(t1)
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 1024(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1028(sp)
	lw t0, 1024(sp)
	lw t1, 1028(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1032(sp)
	lw t0, 1032(sp)
	lw t1, 0(t0)
	sw t1, 1036(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1040(sp)
	lw t0, 1036(sp)
	lw t1, 1040(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1044(sp)
	lw t0, 68(sp)
	lw t1, 0(t0)
	sw t1, 1048(sp)
	lw t1, 1048(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 1052(sp)
	lw t0, 1052(sp)
	lw t1, 1044(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1056(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 1060(sp)
	lw t1, 1056(sp)
	lw t2, 1060(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1064(sp)
	lw t0, 1064(sp)
	lw t1, 172(sp)
	sw t0, 0(t1)
	lw t0, 1064(sp)
	bnez t0, B2.label_logicT_40
	j B2.label_logicF_41

B2.label_logicT_40:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1068(sp)
	lw t0, 44(sp)
	lw t1, 0(t0)
	sw t1, 1072(sp)
	lw t1, 1068(sp)
	lw t2, 1072(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1076(sp)
	lw t0, 1076(sp)
	lw t1, 172(sp)
	sw t0, 0(t1)
	j B2.label_logicF_41

B2.label_logicF_41:
	lw t0, 172(sp)
	lw t1, 0(t0)
	sw t1, 1080(sp)
	lw t0, 1080(sp)
	bnez t0, B2.label_true_42
	j B2.label_false_43

B2.label_true_42:
	li t0, 1
	lw t1, 60(sp)
	sw t0, 0(t1)
	j B2.label_skip_44

B2.label_false_43:
	j B2.label_skip_44

B2.label_skip_44:
	j B2.label_skip_39

B2.label_false_38:
	j B2.label_skip_39

B2.label_skip_39:
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 1084(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 1088(sp)
	lw t0, 1084(sp)
	lw t1, 1088(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1092(sp)
	lw t0, 1092(sp)
	lw t1, 0(t0)
	sw t1, 1096(sp)
	lw t1, 1096(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 1100(sp)
	lw t0, 1100(sp)
	lw t1, 76(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 1104(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 1108(sp)
	lw t0, 1104(sp)
	lw t1, 1108(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1112(sp)
	lw t0, 1112(sp)
	lw t1, 0(t0)
	sw t1, 1116(sp)
	lw t1, 1116(sp)
	li t2, 2
	sub t0, t1, t2
	sw t0, 1120(sp)
	lw t0, 1120(sp)
	lw t1, 84(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1124(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 1128(sp)
	lw a0, 1124(sp)
	lw a1, 1128(sp)
	call check
	sw a0, 1132(sp)
	lw t0, 1132(sp)
	lw t1, 188(sp)
	sw t0, 0(t1)
	lw t0, 1132(sp)
	bnez t0, B2.label_logicT_45
	j B2.label_logicF_46

B2.label_logicT_45:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1136(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 1140(sp)
	lw a0, 1136(sp)
	lw a1, 1140(sp)
	call check
	sw a0, 1144(sp)
	lw t0, 1144(sp)
	lw t1, 188(sp)
	sw t0, 0(t1)
	j B2.label_logicF_46

B2.label_logicF_46:
	lw t0, 188(sp)
	lw t1, 0(t0)
	sw t1, 1148(sp)
	lw t0, 1148(sp)
	lw t1, 180(sp)
	sw t0, 0(t1)
	lw t0, 1148(sp)
	bnez t0, B2.label_logicT_47
	j B2.label_logicF_48

B2.label_logicT_47:
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 1152(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1156(sp)
	lw t0, 1152(sp)
	lw t1, 1156(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1160(sp)
	lw t0, 1160(sp)
	lw t1, 0(t0)
	sw t1, 1164(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1168(sp)
	lw t0, 1164(sp)
	lw t1, 1168(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1172(sp)
	lw t0, 1172(sp)
	lw t1, 0(t0)
	sw t1, 1176(sp)
	li t1, 0
	li t2, 1
	sub t0, t1, t2
	sw t0, 1180(sp)
	lw t1, 1176(sp)
	lw t2, 1180(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1184(sp)
	lw t0, 1184(sp)
	lw t1, 180(sp)
	sw t0, 0(t1)
	j B2.label_logicF_48

B2.label_logicF_48:
	lw t0, 180(sp)
	lw t1, 0(t0)
	sw t1, 1188(sp)
	lw t0, 1188(sp)
	bnez t0, B2.label_true_49
	j B2.label_false_50

B2.label_true_49:
	li a0, 3
	call printlnInt
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1192(sp)
	lw t1, 1192(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 1196(sp)
	lw t0, 1196(sp)
	lw t1, 52(sp)
	sw t0, 0(t1)
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 1200(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1204(sp)
	lw t0, 1200(sp)
	lw t1, 1204(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1208(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1212(sp)
	lw t0, 1212(sp)
	lw t1, 1208(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 1216(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1220(sp)
	lw t0, 1216(sp)
	lw t1, 1220(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1224(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1228(sp)
	lw t0, 1228(sp)
	lw t1, 1224(sp)
	sw t0, 0(t1)
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 1232(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1236(sp)
	lw t0, 1232(sp)
	lw t1, 1236(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1240(sp)
	lw t0, 1240(sp)
	lw t1, 0(t0)
	sw t1, 1244(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1248(sp)
	lw t0, 1244(sp)
	lw t1, 1248(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1252(sp)
	lw t0, 68(sp)
	lw t1, 0(t0)
	sw t1, 1256(sp)
	lw t1, 1256(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 1260(sp)
	lw t0, 1260(sp)
	lw t1, 1252(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1264(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 1268(sp)
	lw t1, 1264(sp)
	lw t2, 1268(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1272(sp)
	lw t0, 1272(sp)
	lw t1, 196(sp)
	sw t0, 0(t1)
	lw t0, 1272(sp)
	bnez t0, B2.label_logicT_52
	j B2.label_logicF_53

B2.label_logicT_52:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1276(sp)
	lw t0, 44(sp)
	lw t1, 0(t0)
	sw t1, 1280(sp)
	lw t1, 1276(sp)
	lw t2, 1280(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1284(sp)
	lw t0, 1284(sp)
	lw t1, 196(sp)
	sw t0, 0(t1)
	j B2.label_logicF_53

B2.label_logicF_53:
	lw t0, 196(sp)
	lw t1, 0(t0)
	sw t1, 1288(sp)
	lw t0, 1288(sp)
	bnez t0, B2.label_true_54
	j B2.label_false_55

B2.label_true_54:
	li t0, 1
	lw t1, 60(sp)
	sw t0, 0(t1)
	j B2.label_skip_56

B2.label_false_55:
	j B2.label_skip_56

B2.label_skip_56:
	j B2.label_skip_51

B2.label_false_50:
	j B2.label_skip_51

B2.label_skip_51:
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 1292(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 1296(sp)
	lw t0, 1292(sp)
	lw t1, 1296(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1300(sp)
	lw t0, 1300(sp)
	lw t1, 0(t0)
	sw t1, 1304(sp)
	lw t1, 1304(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 1308(sp)
	lw t0, 1308(sp)
	lw t1, 76(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 1312(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 1316(sp)
	lw t0, 1312(sp)
	lw t1, 1316(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1320(sp)
	lw t0, 1320(sp)
	lw t1, 0(t0)
	sw t1, 1324(sp)
	lw t1, 1324(sp)
	li t2, 2
	add t0, t1, t2
	sw t0, 1328(sp)
	lw t0, 1328(sp)
	lw t1, 84(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1332(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 1336(sp)
	lw a0, 1332(sp)
	lw a1, 1336(sp)
	call check
	sw a0, 1340(sp)
	lw t0, 1340(sp)
	lw t1, 212(sp)
	sw t0, 0(t1)
	lw t0, 1340(sp)
	bnez t0, B2.label_logicT_57
	j B2.label_logicF_58

B2.label_logicT_57:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1344(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 1348(sp)
	lw a0, 1344(sp)
	lw a1, 1348(sp)
	call check
	sw a0, 1352(sp)
	lw t0, 1352(sp)
	lw t1, 212(sp)
	sw t0, 0(t1)
	j B2.label_logicF_58

B2.label_logicF_58:
	lw t0, 212(sp)
	lw t1, 0(t0)
	sw t1, 1356(sp)
	lw t0, 1356(sp)
	lw t1, 204(sp)
	sw t0, 0(t1)
	lw t0, 1356(sp)
	bnez t0, B2.label_logicT_59
	j B2.label_logicF_60

B2.label_logicT_59:
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 1360(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1364(sp)
	lw t0, 1360(sp)
	lw t1, 1364(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1368(sp)
	lw t0, 1368(sp)
	lw t1, 0(t0)
	sw t1, 1372(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1376(sp)
	lw t0, 1372(sp)
	lw t1, 1376(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1380(sp)
	lw t0, 1380(sp)
	lw t1, 0(t0)
	sw t1, 1384(sp)
	li t1, 0
	li t2, 1
	sub t0, t1, t2
	sw t0, 1388(sp)
	lw t1, 1384(sp)
	lw t2, 1388(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1392(sp)
	lw t0, 1392(sp)
	lw t1, 204(sp)
	sw t0, 0(t1)
	j B2.label_logicF_60

B2.label_logicF_60:
	lw t0, 204(sp)
	lw t1, 0(t0)
	sw t1, 1396(sp)
	lw t0, 1396(sp)
	bnez t0, B2.label_true_61
	j B2.label_false_62

B2.label_true_61:
	li a0, 4
	call printlnInt
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1400(sp)
	lw t1, 1400(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 1404(sp)
	lw t0, 1404(sp)
	lw t1, 52(sp)
	sw t0, 0(t1)
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 1408(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1412(sp)
	lw t0, 1408(sp)
	lw t1, 1412(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1416(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1420(sp)
	lw t0, 1420(sp)
	lw t1, 1416(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 1424(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1428(sp)
	lw t0, 1424(sp)
	lw t1, 1428(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1432(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1436(sp)
	lw t0, 1436(sp)
	lw t1, 1432(sp)
	sw t0, 0(t1)
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 1440(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1444(sp)
	lw t0, 1440(sp)
	lw t1, 1444(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1448(sp)
	lw t0, 1448(sp)
	lw t1, 0(t0)
	sw t1, 1452(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1456(sp)
	lw t0, 1452(sp)
	lw t1, 1456(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1460(sp)
	lw t0, 68(sp)
	lw t1, 0(t0)
	sw t1, 1464(sp)
	lw t1, 1464(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 1468(sp)
	lw t0, 1468(sp)
	lw t1, 1460(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1472(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 1476(sp)
	lw t1, 1472(sp)
	lw t2, 1476(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1480(sp)
	lw t0, 1480(sp)
	lw t1, 220(sp)
	sw t0, 0(t1)
	lw t0, 1480(sp)
	bnez t0, B2.label_logicT_64
	j B2.label_logicF_65

B2.label_logicT_64:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1484(sp)
	lw t0, 44(sp)
	lw t1, 0(t0)
	sw t1, 1488(sp)
	lw t1, 1484(sp)
	lw t2, 1488(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1492(sp)
	lw t0, 1492(sp)
	lw t1, 220(sp)
	sw t0, 0(t1)
	j B2.label_logicF_65

B2.label_logicF_65:
	lw t0, 220(sp)
	lw t1, 0(t0)
	sw t1, 1496(sp)
	lw t0, 1496(sp)
	bnez t0, B2.label_true_66
	j B2.label_false_67

B2.label_true_66:
	li t0, 1
	lw t1, 60(sp)
	sw t0, 0(t1)
	j B2.label_skip_68

B2.label_false_67:
	j B2.label_skip_68

B2.label_skip_68:
	j B2.label_skip_63

B2.label_false_62:
	j B2.label_skip_63

B2.label_skip_63:
	la a0, .str.pre_1
	call println
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 1500(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 1504(sp)
	lw t0, 1500(sp)
	lw t1, 1504(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1508(sp)
	lw t0, 1508(sp)
	lw t1, 0(t0)
	sw t1, 1512(sp)
	lw t1, 1512(sp)
	li t2, 2
	sub t0, t1, t2
	sw t0, 1516(sp)
	lw t0, 1516(sp)
	lw t1, 76(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 1520(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 1524(sp)
	lw t0, 1520(sp)
	lw t1, 1524(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1528(sp)
	lw t0, 1528(sp)
	lw t1, 0(t0)
	sw t1, 1532(sp)
	lw t1, 1532(sp)
	li t2, 1
	sub t0, t1, t2
	sw t0, 1536(sp)
	lw t0, 1536(sp)
	lw t1, 84(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1540(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 1544(sp)
	lw a0, 1540(sp)
	lw a1, 1544(sp)
	call check
	sw a0, 1548(sp)
	lw t0, 1548(sp)
	lw t1, 236(sp)
	sw t0, 0(t1)
	lw t0, 1548(sp)
	bnez t0, B2.label_logicT_69
	j B2.label_logicF_70

B2.label_logicT_69:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1552(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 1556(sp)
	lw a0, 1552(sp)
	lw a1, 1556(sp)
	call check
	sw a0, 1560(sp)
	lw t0, 1560(sp)
	lw t1, 236(sp)
	sw t0, 0(t1)
	j B2.label_logicF_70

B2.label_logicF_70:
	lw t0, 236(sp)
	lw t1, 0(t0)
	sw t1, 1564(sp)
	lw t0, 1564(sp)
	lw t1, 228(sp)
	sw t0, 0(t1)
	lw t0, 1564(sp)
	bnez t0, B2.label_logicT_71
	j B2.label_logicF_72

B2.label_logicT_71:
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 1568(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1572(sp)
	lw t0, 1568(sp)
	lw t1, 1572(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1576(sp)
	lw t0, 1576(sp)
	lw t1, 0(t0)
	sw t1, 1580(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1584(sp)
	lw t0, 1580(sp)
	lw t1, 1584(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1588(sp)
	lw t0, 1588(sp)
	lw t1, 0(t0)
	sw t1, 1592(sp)
	li t1, 0
	li t2, 1
	sub t0, t1, t2
	sw t0, 1596(sp)
	lw t1, 1592(sp)
	lw t2, 1596(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1600(sp)
	lw t0, 1600(sp)
	lw t1, 228(sp)
	sw t0, 0(t1)
	j B2.label_logicF_72

B2.label_logicF_72:
	lw t0, 228(sp)
	lw t1, 0(t0)
	sw t1, 1604(sp)
	lw t0, 1604(sp)
	bnez t0, B2.label_true_73
	j B2.label_false_74

B2.label_true_73:
	li a0, 5
	call printlnInt
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1608(sp)
	lw t1, 1608(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 1612(sp)
	lw t0, 1612(sp)
	lw t1, 52(sp)
	sw t0, 0(t1)
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 1616(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1620(sp)
	lw t0, 1616(sp)
	lw t1, 1620(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1624(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1628(sp)
	lw t0, 1628(sp)
	lw t1, 1624(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 1632(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1636(sp)
	lw t0, 1632(sp)
	lw t1, 1636(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1640(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1644(sp)
	lw t0, 1644(sp)
	lw t1, 1640(sp)
	sw t0, 0(t1)
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 1648(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1652(sp)
	lw t0, 1648(sp)
	lw t1, 1652(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1656(sp)
	lw t0, 1656(sp)
	lw t1, 0(t0)
	sw t1, 1660(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1664(sp)
	lw t0, 1660(sp)
	lw t1, 1664(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1668(sp)
	lw t0, 68(sp)
	lw t1, 0(t0)
	sw t1, 1672(sp)
	lw t1, 1672(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 1676(sp)
	lw t0, 1676(sp)
	lw t1, 1668(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1680(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 1684(sp)
	lw t1, 1680(sp)
	lw t2, 1684(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1688(sp)
	lw t0, 1688(sp)
	lw t1, 244(sp)
	sw t0, 0(t1)
	lw t0, 1688(sp)
	bnez t0, B2.label_logicT_76
	j B2.label_logicF_77

B2.label_logicT_76:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1692(sp)
	lw t0, 44(sp)
	lw t1, 0(t0)
	sw t1, 1696(sp)
	lw t1, 1692(sp)
	lw t2, 1696(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1700(sp)
	lw t0, 1700(sp)
	lw t1, 244(sp)
	sw t0, 0(t1)
	j B2.label_logicF_77

B2.label_logicF_77:
	lw t0, 244(sp)
	lw t1, 0(t0)
	sw t1, 1704(sp)
	lw t0, 1704(sp)
	bnez t0, B2.label_true_78
	j B2.label_false_79

B2.label_true_78:
	li t0, 1
	lw t1, 60(sp)
	sw t0, 0(t1)
	j B2.label_skip_80

B2.label_false_79:
	j B2.label_skip_80

B2.label_skip_80:
	j B2.label_skip_75

B2.label_false_74:
	j B2.label_skip_75

B2.label_skip_75:
	la a0, .str.pre_2
	call println
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 1708(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 1712(sp)
	lw t0, 1708(sp)
	lw t1, 1712(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1716(sp)
	lw t0, 1716(sp)
	lw t1, 0(t0)
	sw t1, 1720(sp)
	lw t1, 1720(sp)
	li t2, 2
	sub t0, t1, t2
	sw t0, 1724(sp)
	lw t0, 1724(sp)
	lw t1, 76(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 1728(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 1732(sp)
	lw t0, 1728(sp)
	lw t1, 1732(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1736(sp)
	lw t0, 1736(sp)
	lw t1, 0(t0)
	sw t1, 1740(sp)
	lw t1, 1740(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 1744(sp)
	lw t0, 1744(sp)
	lw t1, 84(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1748(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 1752(sp)
	lw a0, 1748(sp)
	lw a1, 1752(sp)
	call check
	sw a0, 1756(sp)
	lw t0, 1756(sp)
	lw t1, 260(sp)
	sw t0, 0(t1)
	lw t0, 1756(sp)
	bnez t0, B2.label_logicT_81
	j B2.label_logicF_82

B2.label_logicT_81:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1760(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 1764(sp)
	lw a0, 1760(sp)
	lw a1, 1764(sp)
	call check
	sw a0, 1768(sp)
	lw t0, 1768(sp)
	lw t1, 260(sp)
	sw t0, 0(t1)
	j B2.label_logicF_82

B2.label_logicF_82:
	lw t0, 260(sp)
	lw t1, 0(t0)
	sw t1, 1772(sp)
	lw t0, 1772(sp)
	lw t1, 252(sp)
	sw t0, 0(t1)
	lw t0, 1772(sp)
	bnez t0, B2.label_logicT_83
	j B2.label_logicF_84

B2.label_logicT_83:
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 1776(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1780(sp)
	lw t0, 1776(sp)
	lw t1, 1780(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1784(sp)
	lw t0, 1784(sp)
	lw t1, 0(t0)
	sw t1, 1788(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1792(sp)
	lw t0, 1788(sp)
	lw t1, 1792(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1796(sp)
	lw t0, 1796(sp)
	lw t1, 0(t0)
	sw t1, 1800(sp)
	li t1, 0
	li t2, 1
	sub t0, t1, t2
	sw t0, 1804(sp)
	lw t1, 1800(sp)
	lw t2, 1804(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1808(sp)
	lw t0, 1808(sp)
	lw t1, 252(sp)
	sw t0, 0(t1)
	j B2.label_logicF_84

B2.label_logicF_84:
	lw t0, 252(sp)
	lw t1, 0(t0)
	sw t1, 1812(sp)
	lw t0, 1812(sp)
	bnez t0, B2.label_true_85
	j B2.label_false_86

B2.label_true_85:
	li a0, 6
	call printlnInt
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1816(sp)
	lw t1, 1816(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 1820(sp)
	lw t0, 1820(sp)
	lw t1, 52(sp)
	sw t0, 0(t1)
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 1824(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1828(sp)
	lw t0, 1824(sp)
	lw t1, 1828(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1832(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1836(sp)
	lw t0, 1836(sp)
	lw t1, 1832(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 1840(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 1844(sp)
	lw t0, 1840(sp)
	lw t1, 1844(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1848(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1852(sp)
	lw t0, 1852(sp)
	lw t1, 1848(sp)
	sw t0, 0(t1)
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 1856(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1860(sp)
	lw t0, 1856(sp)
	lw t1, 1860(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1864(sp)
	lw t0, 1864(sp)
	lw t1, 0(t0)
	sw t1, 1868(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1872(sp)
	lw t0, 1868(sp)
	lw t1, 1872(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1876(sp)
	lw t0, 68(sp)
	lw t1, 0(t0)
	sw t1, 1880(sp)
	lw t1, 1880(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 1884(sp)
	lw t0, 1884(sp)
	lw t1, 1876(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1888(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 1892(sp)
	lw t1, 1888(sp)
	lw t2, 1892(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1896(sp)
	lw t0, 1896(sp)
	lw t1, 268(sp)
	sw t0, 0(t1)
	lw t0, 1896(sp)
	bnez t0, B2.label_logicT_88
	j B2.label_logicF_89

B2.label_logicT_88:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1900(sp)
	lw t0, 44(sp)
	lw t1, 0(t0)
	sw t1, 1904(sp)
	lw t1, 1900(sp)
	lw t2, 1904(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 1908(sp)
	lw t0, 1908(sp)
	lw t1, 268(sp)
	sw t0, 0(t1)
	j B2.label_logicF_89

B2.label_logicF_89:
	lw t0, 268(sp)
	lw t1, 0(t0)
	sw t1, 1912(sp)
	lw t0, 1912(sp)
	bnez t0, B2.label_true_90
	j B2.label_false_91

B2.label_true_90:
	li t0, 1
	lw t1, 60(sp)
	sw t0, 0(t1)
	j B2.label_skip_92

B2.label_false_91:
	j B2.label_skip_92

B2.label_skip_92:
	j B2.label_skip_87

B2.label_false_86:
	j B2.label_skip_87

B2.label_skip_87:
	la a0, .str.pre_3
	call println
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 1916(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 1920(sp)
	lw t0, 1916(sp)
	lw t1, 1920(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1924(sp)
	lw t0, 1924(sp)
	lw t1, 0(t0)
	sw t1, 1928(sp)
	lw t1, 1928(sp)
	li t2, 2
	add t0, t1, t2
	sw t0, 1932(sp)
	lw t0, 1932(sp)
	lw t1, 76(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	sw t1, 1936(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 1940(sp)
	lw t0, 1936(sp)
	lw t1, 1940(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1944(sp)
	lw t0, 1944(sp)
	lw t1, 0(t0)
	sw t1, 1948(sp)
	lw t1, 1948(sp)
	li t2, 1
	sub t0, t1, t2
	sw t0, 1952(sp)
	lw t0, 1952(sp)
	lw t1, 84(sp)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1956(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 1960(sp)
	lw a0, 1956(sp)
	lw a1, 1960(sp)
	call check
	sw a0, 1964(sp)
	lw t0, 1964(sp)
	lw t1, 284(sp)
	sw t0, 0(t1)
	lw t0, 1964(sp)
	bnez t0, B2.label_logicT_93
	j B2.label_logicF_94

B2.label_logicT_93:
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 1968(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 1972(sp)
	lw a0, 1968(sp)
	lw a1, 1972(sp)
	call check
	sw a0, 1976(sp)
	lw t0, 1976(sp)
	lw t1, 284(sp)
	sw t0, 0(t1)
	j B2.label_logicF_94

B2.label_logicF_94:
	lw t0, 284(sp)
	lw t1, 0(t0)
	sw t1, 1980(sp)
	lw t0, 1980(sp)
	lw t1, 276(sp)
	sw t0, 0(t1)
	lw t0, 1980(sp)
	bnez t0, B2.label_logicT_95
	j B2.label_logicF_96

B2.label_logicT_95:
	lw t0, 108(sp)
	lw t1, 0(t0)
	sw t1, 1984(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 1988(sp)
	lw t0, 1984(sp)
	lw t1, 1988(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 1992(sp)
	lw t0, 1992(sp)
	lw t1, 0(t0)
	sw t1, 1996(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	sw t1, 2000(sp)
	lw t0, 1996(sp)
	lw t1, 2000(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 2004(sp)
	lw t0, 2004(sp)
	lw t1, 0(t0)
	sw t1, 2008(sp)
	li t1, 0
	li t2, 1
	sub t0, t1, t2
	sw t0, 2012(sp)
	lw t1, 2008(sp)
	lw t2, 2012(sp)
	xor t3, t1, t2
	sltiu t0, t3, 1
	sw t0, 2016(sp)
	lw t0, 2016(sp)
	lw t1, 276(sp)
	sw t0, 0(t1)
	j B2.label_logicF_96

B2.label_logicF_96:
	lw t0, 276(sp)
	lw t1, 0(t0)
	sw t1, 2020(sp)
	lw t0, 2020(sp)
	bnez t0, B2.label_true_97
	j B2.label_false_98

B2.label_true_97:
	li a0, 7
	call printlnInt
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 2024(sp)
	lw t1, 2024(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 2028(sp)
	lw t0, 2028(sp)
	lw t1, 52(sp)
	sw t0, 0(t1)
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 2032(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 2036(sp)
	lw t0, 2032(sp)
	lw t1, 2036(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 2040(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	sw t1, 2044(sp)
	lw t0, 2044(sp)
	lw t1, 2040(sp)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	li t6, 2048
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	li t6, 2052
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2048
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2052
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2056
	add t6, sp, t6
	sw t2, 0(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	li t6, 2060
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2060
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2056
	add t6, sp, t6
	lw t1, 0(t6)
	sw t0, 0(t1)
	lw t0, 108(sp)
	lw t1, 0(t0)
	li t6, 2064
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	li t6, 2068
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2064
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2068
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2072
	add t6, sp, t6
	sw t2, 0(sp)
	li t6, 2072
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 0(t0)
	li t6, 2076
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	li t6, 2080
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2076
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2080
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2084
	add t6, sp, t6
	sw t2, 0(sp)
	lw t0, 68(sp)
	lw t1, 0(t0)
	li t6, 2088
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2088
	add t6, sp, t6
	lw t1, 0(t6)
	li t2, 1
	add t0, t1, t2
	li t6, 2092
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2092
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2084
	add t6, sp, t6
	lw t1, 0(t6)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	li t6, 2096
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	li t6, 2100
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2096
	add t6, sp, t6
	lw t1, 0(t6)
	li t6, 2100
	add t6, sp, t6
	lw t2, 0(t6)
	xor t3, t1, t2
	sltiu t0, t3, 1
	li t6, 2104
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2104
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 292(sp)
	sw t0, 0(t1)
	li t6, 2104
	add t6, sp, t6
	lw t0, 0(t6)
	bnez t0, B2.label_logicT_100
	j B2.label_logicF_101

B2.label_logicT_100:
	lw t0, 84(sp)
	lw t1, 0(t0)
	li t6, 2108
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 44(sp)
	lw t1, 0(t0)
	li t6, 2112
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2108
	add t6, sp, t6
	lw t1, 0(t6)
	li t6, 2112
	add t6, sp, t6
	lw t2, 0(t6)
	xor t3, t1, t2
	sltiu t0, t3, 1
	li t6, 2116
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2116
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 292(sp)
	sw t0, 0(t1)
	j B2.label_logicF_101

B2.label_logicF_101:
	lw t0, 292(sp)
	lw t1, 0(t0)
	li t6, 2120
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2120
	add t6, sp, t6
	lw t0, 0(t6)
	bnez t0, B2.label_true_102
	j B2.label_false_103

B2.label_true_102:
	li t0, 1
	lw t1, 60(sp)
	sw t0, 0(t1)
	j B2.label_skip_104

B2.label_false_103:
	j B2.label_skip_104

B2.label_skip_104:
	j B2.label_skip_99

B2.label_false_98:
	j B2.label_skip_99

B2.label_skip_99:
	la a0, .str.pre_4
	call println
	li t1, 1
	li t2, 10
	add t0, t1, t2
	li t6, 2124
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2124
	add t6, sp, t6
	lw a0, 0(t6)
	call printlnInt
	lw t0, 92(sp)
	lw t1, 0(t0)
	li t6, 2128
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	li t6, 2132
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2128
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2132
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2136
	add t6, sp, t6
	sw t2, 0(sp)
	li t6, 2136
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 0(t0)
	li t6, 2140
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2140
	add t6, sp, t6
	lw t1, 0(t6)
	li t2, 2
	add t0, t1, t2
	li t6, 2144
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2144
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 76(sp)
	sw t0, 0(t1)
	la a0, .str.pre_5
	call println
	lw t0, 100(sp)
	lw t1, 0(t0)
	li t6, 2148
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 12(sp)
	lw t1, 0(t0)
	li t6, 2152
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2148
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2152
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2156
	add t6, sp, t6
	sw t2, 0(sp)
	li t6, 2156
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 0(t0)
	li t6, 2160
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2160
	add t6, sp, t6
	lw t1, 0(t6)
	li t2, 1
	add t0, t1, t2
	li t6, 2164
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2164
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 84(sp)
	sw t0, 0(t1)
	la a0, .str.pre_6
	call println
	lw t0, 76(sp)
	lw t1, 0(t0)
	li t6, 2168
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	li t6, 2172
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2168
	add t6, sp, t6
	lw a0, 0(t6)
	li t6, 2172
	add t6, sp, t6
	lw a1, 0(t6)
	call check
	li t6, 2176
	add t6, sp, t6
	sw a0, 0(sp)
	li t6, 2176
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 308(sp)
	sw t0, 0(t1)
	li t6, 2176
	add t6, sp, t6
	lw t0, 0(t6)
	bnez t0, B2.label_logicT_105
	j B2.label_logicF_106

B2.label_logicT_105:
	lw t0, 84(sp)
	lw t1, 0(t0)
	li t6, 2180
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	li t6, 2184
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2180
	add t6, sp, t6
	lw a0, 0(t6)
	li t6, 2184
	add t6, sp, t6
	lw a1, 0(t6)
	call check
	li t6, 2188
	add t6, sp, t6
	sw a0, 0(sp)
	li t6, 2188
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 308(sp)
	sw t0, 0(t1)
	j B2.label_logicF_106

B2.label_logicF_106:
	lw t0, 308(sp)
	lw t1, 0(t0)
	li t6, 2192
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2192
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 300(sp)
	sw t0, 0(t1)
	li t6, 2192
	add t6, sp, t6
	lw t0, 0(t6)
	bnez t0, B2.label_logicT_107
	j B2.label_logicF_108

B2.label_logicT_107:
	lw t0, 108(sp)
	lw t1, 0(t0)
	li t6, 2196
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	li t6, 2200
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2196
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2200
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2204
	add t6, sp, t6
	sw t2, 0(sp)
	li t6, 2204
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 0(t0)
	li t6, 2208
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	li t6, 2212
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2208
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2212
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2216
	add t6, sp, t6
	sw t2, 0(sp)
	li t6, 2216
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 0(t0)
	li t6, 2220
	add t6, sp, t6
	sw t1, 0(sp)
	li t1, 0
	li t2, 1
	sub t0, t1, t2
	li t6, 2224
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2220
	add t6, sp, t6
	lw t1, 0(t6)
	li t6, 2224
	add t6, sp, t6
	lw t2, 0(t6)
	xor t3, t1, t2
	sltiu t0, t3, 1
	li t6, 2228
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2228
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 300(sp)
	sw t0, 0(t1)
	j B2.label_logicF_108

B2.label_logicF_108:
	lw t0, 300(sp)
	lw t1, 0(t0)
	li t6, 2232
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2232
	add t6, sp, t6
	lw t0, 0(t6)
	bnez t0, B2.label_true_109
	j B2.label_false_110

B2.label_true_109:
	li a0, 8
	call printlnInt
	lw t0, 52(sp)
	lw t1, 0(t0)
	li t6, 2236
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2236
	add t6, sp, t6
	lw t1, 0(t6)
	li t2, 1
	add t0, t1, t2
	li t6, 2240
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2240
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 52(sp)
	sw t0, 0(t1)
	lw t0, 92(sp)
	lw t1, 0(t0)
	li t6, 2244
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	li t6, 2248
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2244
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2248
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2252
	add t6, sp, t6
	sw t2, 0(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	li t6, 2256
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2256
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2252
	add t6, sp, t6
	lw t1, 0(t6)
	sw t0, 0(t1)
	lw t0, 100(sp)
	lw t1, 0(t0)
	li t6, 2260
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	li t6, 2264
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2260
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2264
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2268
	add t6, sp, t6
	sw t2, 0(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	li t6, 2272
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2272
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2268
	add t6, sp, t6
	lw t1, 0(t6)
	sw t0, 0(t1)
	lw t0, 108(sp)
	lw t1, 0(t0)
	li t6, 2276
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 76(sp)
	lw t1, 0(t0)
	li t6, 2280
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2276
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2280
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2284
	add t6, sp, t6
	sw t2, 0(sp)
	li t6, 2284
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 0(t0)
	li t6, 2288
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 84(sp)
	lw t1, 0(t0)
	li t6, 2292
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2288
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2292
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2296
	add t6, sp, t6
	sw t2, 0(sp)
	lw t0, 68(sp)
	lw t1, 0(t0)
	li t6, 2300
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2300
	add t6, sp, t6
	lw t1, 0(t6)
	li t2, 1
	add t0, t1, t2
	li t6, 2304
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2304
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2296
	add t6, sp, t6
	lw t1, 0(t6)
	sw t0, 0(t1)
	lw t0, 76(sp)
	lw t1, 0(t0)
	li t6, 2308
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	li t6, 2312
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2308
	add t6, sp, t6
	lw t1, 0(t6)
	li t6, 2312
	add t6, sp, t6
	lw t2, 0(t6)
	xor t3, t1, t2
	sltiu t0, t3, 1
	li t6, 2316
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2316
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 316(sp)
	sw t0, 0(t1)
	li t6, 2316
	add t6, sp, t6
	lw t0, 0(t6)
	bnez t0, B2.label_logicT_112
	j B2.label_logicF_113

B2.label_logicT_112:
	lw t0, 84(sp)
	lw t1, 0(t0)
	li t6, 2320
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 44(sp)
	lw t1, 0(t0)
	li t6, 2324
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2320
	add t6, sp, t6
	lw t1, 0(t6)
	li t6, 2324
	add t6, sp, t6
	lw t2, 0(t6)
	xor t3, t1, t2
	sltiu t0, t3, 1
	li t6, 2328
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2328
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 316(sp)
	sw t0, 0(t1)
	j B2.label_logicF_113

B2.label_logicF_113:
	lw t0, 316(sp)
	lw t1, 0(t0)
	li t6, 2332
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2332
	add t6, sp, t6
	lw t0, 0(t6)
	bnez t0, B2.label_true_114
	j B2.label_false_115

B2.label_true_114:
	li t0, 1
	lw t1, 60(sp)
	sw t0, 0(t1)
	j B2.label_skip_116

B2.label_false_115:
	j B2.label_skip_116

B2.label_skip_116:
	j B2.label_skip_111

B2.label_false_110:
	j B2.label_skip_111

B2.label_skip_111:
	la a0, .str.pre_7
	call println
	la a0, .str.pre_8
	call println
	lw t0, 60(sp)
	lw t1, 0(t0)
	li t6, 2336
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2336
	add t6, sp, t6
	lw t1, 0(t6)
	li t2, 1
	xor t3, t1, t2
	sltiu t0, t3, 1
	li t6, 2340
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2340
	add t6, sp, t6
	lw t0, 0(t6)
	bnez t0, B2.label_true_117
	j B2.label_false_118

B2.label_true_117:
	j B2.label_skip_19
	j B2.label_skip_119

B2.label_false_118:
	j B2.label_skip_119

B2.label_skip_119:
	lw t0, 12(sp)
	lw t1, 0(t0)
	li t6, 2344
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2344
	add t6, sp, t6
	lw t1, 0(t6)
	li t2, 1
	add t0, t1, t2
	li t6, 2348
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2348
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 12(sp)
	sw t0, 0(t1)
	j B2.label_loop_18

B2.label_skip_19:
	lw t0, 60(sp)
	lw t1, 0(t0)
	li t6, 2352
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2352
	add t6, sp, t6
	lw t1, 0(t6)
	li t2, 1
	xor t3, t1, t2
	sltiu t0, t3, 1
	li t6, 2356
	add t6, sp, t6
	sw t0, 0(sp)
	li t6, 2356
	add t6, sp, t6
	lw t0, 0(t6)
	bnez t0, B2.label_true_120
	j B2.label_false_121

B2.label_true_120:
	lw t0, 108(sp)
	lw t1, 0(t0)
	li t6, 2360
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	li t6, 2364
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2360
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2364
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2368
	add t6, sp, t6
	sw t2, 0(sp)
	li t6, 2368
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 0(t0)
	li t6, 2372
	add t6, sp, t6
	sw t1, 0(sp)
	lw t0, 44(sp)
	lw t1, 0(t0)
	li t6, 2376
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2372
	add t6, sp, t6
	lw t0, 0(t6)
	li t6, 2376
	add t6, sp, t6
	lw t1, 0(t6)
	slli t1, t1, 2
	add t2, t0, t1
	li t6, 2380
	add t6, sp, t6
	sw t2, 0(sp)
	li t6, 2380
	add t6, sp, t6
	lw t0, 0(t6)
	lw t1, 0(t0)
	li t6, 2384
	add t6, sp, t6
	sw t1, 0(sp)
	li t6, 2384
	add t6, sp, t6
	lw a0, 0(t6)
	call toString
	li t6, 2388
	add t6, sp, t6
	sw a0, 0(sp)
	li t6, 2388
	add t6, sp, t6
	lw a0, 0(t6)
	call println
	j B2.label_skip_122

B2.label_false_121:
	la a0, .str.pre_9
	call print
	j B2.label_skip_122

B2.label_skip_122:
	li a0, 0
	lw ra, 0(sp)
	li t6, 2432
	add sp, sp, t6
	ret


.type .init, @function
.p2align 2
.globl .init
.init:
	addi sp, sp, -48
	sw ra, 0(sp)
	lw ra, 0(sp)
	addi sp, sp, 48
	ret


.section .data
.section .rodata
.p2align 1
.globl .str.pre_0
.str.pre_0:
	.asciz "loop"

.p2align 1
.globl .str.pre_1
.str.pre_1:
	.asciz "4 finish"

.p2align 1
.globl .str.pre_2
.str.pre_2:
	.asciz "5 finish"

.p2align 1
.globl .str.pre_3
.str.pre_3:
	.asciz "6 finish"

.p2align 1
.globl .str.pre_4
.str.pre_4:
	.asciz "7 finish"

.p2align 1
.globl .str.pre_5
.str.pre_5:
	.asciz "?"

.p2align 1
.globl .str.pre_6
.str.pre_6:
	.asciz "?"

.p2align 1
.globl .str.pre_7
.str.pre_7:
	.asciz "8 finish"

.p2align 1
.globl .str.pre_8
.str.pre_8:
	.asciz "finish if"

.p2align 1
.globl .str.pre_9
.str.pre_9:
	.asciz "no solution!\n"

