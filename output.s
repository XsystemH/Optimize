.section .text
.type main, @function
.p2align 2
.global main
main:
	add sp, sp, -176
	sw ra, 0(sp)
	call .init
	call getInt
	sw a0, 4(sp)
	lw t0, 4(sp)
	la t1, n
	sw t0, 0(t1)
	call getInt
	sw a0, 8(sp)
	lw t0, 8(sp)
	la t1, p
	sw t0, 0(t1)
	call getInt
	sw a0, 12(sp)
	lw t0, 12(sp)
	la t1, k
	sw t0, 0(t1)
	la t0, p
	lw t1, 0(t0)
	sw t1, 16(sp)
	la t0, k
	lw t1, 0(t0)
	sw t1, 20(sp)
	lw t1, 24(sp)
	lw t2, 28(sp)
	sub t0, t1, t2
	sw t0, 32(sp)
	lw t1, 32(sp)
	li t2, 1
	slt t0, t1, t2
	sw t0, 36(sp)
	lw t0, 36(sp)
	bnez t0, B1.label_true_0
	j B1.label_false_1

B1.label_true_0:
	la a0, .str.pre_0
	call print
	j B1.label_skip_2

B1.label_false_1:
	j B1.label_skip_2

B1.label_skip_2:
	la t0, p
	lw t1, 0(t0)
	sw t1, 16(sp)
	la t0, k
	lw t1, 0(t0)
	sw t1, 20(sp)
	lw t1, 40(sp)
	lw t2, 44(sp)
	sub t0, t1, t2
	sw t0, 48(sp)
	lw t0, 48(sp)
	la t1, i
	sw t0, 0(t1)
	j B1.label_loop_5

B1.label_loop_5:
	la t0, i
	lw t1, 0(t0)
	sw t1, 52(sp)
	la t0, p
	lw t1, 0(t0)
	sw t1, 16(sp)
	la t0, k
	lw t1, 0(t0)
	sw t1, 20(sp)
	lw t1, 56(sp)
	lw t2, 60(sp)
	add t0, t1, t2
	sw t0, 64(sp)
	lw t1, 68(sp)
	lw t2, 64(sp)
	slt t0, t1, t2
	slt t0, t0, 1
	sw t0, 72(sp)
	lw t0, 72(sp)
	bnez t0, B1.label_body_6
	j B1.label_skip_4

B1.label_step_3:
	la t0, i
	lw t1, 0(t0)
	sw t1, 52(sp)
	lw t1, 76(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 80(sp)
	lw t0, 80(sp)
	la t1, i
	sw t0, 0(t1)
	j B1.label_loop_5

B1.label_body_6:
	la t0, i
	lw t1, 0(t0)
	sw t1, 52(sp)
	li t1, 1
	lw t2, 84(sp)
	slt t0, t1, t2
	slt t0, t0, 1
	sw t0, 88(sp)
	lw t0, 88(sp)
	lw t1, 92(sp)
	sw t0, 0(t1)
	lw t0, 88(sp)
	bnez t0, B1.label_logicT_7
	j B1.label_logicF_8

B1.label_logicT_7:
	la t0, i
	lw t1, 0(t0)
	sw t1, 52(sp)
	la t0, n
	lw t1, 0(t0)
	sw t1, 96(sp)
	lw t1, 100(sp)
	lw t2, 104(sp)
	slt t0, t1, t2
	slt t0, t0, 1
	sw t0, 108(sp)
	lw t0, 108(sp)
	lw t1, 92(sp)
	sw t0, 0(t1)
	j B1.label_logicF_8

B1.label_logicF_8:
	lw t0, 92(sp)
	lw t1, 0(t0)
	sw t1, 92(sp)
	lw t0, 112(sp)
	bnez t0, B1.label_true_9
	j B1.label_false_10

B1.label_true_9:
	la t0, i
	lw t1, 0(t0)
	sw t1, 52(sp)
	la t0, p
	lw t1, 0(t0)
	sw t1, 16(sp)
	lw t1, 116(sp)
	lw t2, 120(sp)
	xor t3, t1, t2
	sltu t0, t3, 1
	sw t0, 124(sp)
	lw t0, 124(sp)
	bnez t0, B1.label_true_12
	j B1.label_false_13

B1.label_true_12:
	la a0, .str.pre_1
	call print
	la t0, i
	lw t1, 0(t0)
	sw t1, 52(sp)
	lw a0, 128(sp)
	call toString
	sw a0, 132(sp)
	lw a0, 132(sp)
	call print
	la a0, .str.pre_2
	call print
	j B1.label_skip_14

B1.label_false_13:
	la t0, i
	lw t1, 0(t0)
	sw t1, 52(sp)
	lw a0, 136(sp)
	call printInt
	la a0, .str.pre_3
	call print
	j B1.label_skip_14

B1.label_skip_14:
	j B1.label_skip_11

B1.label_false_10:
	j B1.label_skip_11

B1.label_skip_11:
	j B1.label_step_3

B1.label_skip_4:
	la t0, p
	lw t1, 0(t0)
	sw t1, 16(sp)
	la t0, k
	lw t1, 0(t0)
	sw t1, 20(sp)
	lw t1, 140(sp)
	lw t2, 144(sp)
	add t0, t1, t2
	sw t0, 148(sp)
	la t0, n
	lw t1, 0(t0)
	sw t1, 96(sp)
	lw t1, 148(sp)
	lw t2, 152(sp)
	slt t0, t2, t1
	sw t0, 156(sp)
	lw t0, 156(sp)
	bnez t0, B1.label_true_15
	j B1.label_false_16

B1.label_true_15:
	la a0, .str.pre_4
	call print
	j B1.label_skip_17

B1.label_false_16:
	j B1.label_skip_17

B1.label_skip_17:
	li a0, 0
	lw ra, 0(sp)
	add sp, sp, 176
	ret


.section .data
.p2align 4
.global n
n:
	.word 0

.p2align 4
.global p
p:
	.word 0

.p2align 4
.global k
k:
	.word 0

.p2align 4
.global i
i:
	.word 0

.section .rodata
.p2align 1
.global .str.pre_0
.str.pre_0:
	.asciz "<< "

.p2align 1
.global .str.pre_1
.str.pre_1:
	.asciz "("

.p2align 1
.global .str.pre_2
.str.pre_2:
	.asciz ") "

.p2align 1
.global .str.pre_3
.str.pre_3:
	.asciz " "

.p2align 1
.global .str.pre_4
.str.pre_4:
	.asciz ">> "

