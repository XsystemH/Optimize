.section .text
.type A, @function
.p2align 2
.global A
A:
	add sp, sp, -48
	sw ra, 0(sp)
	sw a0, 4(sp)
	lw ra, 0(sp)
	add sp, sp, 48
	ret


.type B, @function
.p2align 2
.global B
B:
	add sp, sp, -48
	sw ra, 0(sp)
	sw a0, 4(sp)
	lw ra, 0(sp)
	add sp, sp, 48
	ret


.type C, @function
.p2align 2
.global C
C:
	add sp, sp, -48
	sw ra, 0(sp)
	sw a0, 4(sp)
	lw ra, 0(sp)
	add sp, sp, 48
	ret


.type func, @function
.p2align 2
.global func
func:
	add sp, sp, -48
	sw ra, 0(sp)
	sw a0, 4(sp)
	li a0, 93
	lw ra, 0(sp)
	add sp, sp, 48
	ret


.type main, @function
.p2align 2
.global main
main:
	add sp, sp, -48
	sw ra, 0(sp)
	call .init
	li a0, 0
	lw ra, 0(sp)
	add sp, sp, 48
	ret


.type .init, @function
.p2align 2
.global .init
.init:
	add sp, sp, -48
	sw ra, 0(sp)
	lw ra, 0(sp)
	add sp, sp, 48
	ret


.type func, @function
.p2align 2
.global func
func:
	add sp, sp, -64
	sw ra, 0(sp)
	li t0, 0
	bnez t0, B7.label_true_0
	j B7.label_false_1

B7.label_true_0:
	j B7.label_skip_2

B7.label_false_1:
	j B7.label_skip_2

B7.label_skip_2:
	j B7.label_loop_3

B7.label_loop_3:
	li t0, 1
	bnez t0, B7.label_body_5
	j B7.label_skip_4

B7.label_body_5:
	j B7.label_loop_3

B7.label_skip_4:
	j B7.label_loop_8

B7.label_loop_8:
	li t0, 1
	bnez t0, B7.label_body_9
	j B7.label_skip_7

B7.label_step_6:
	j B7.label_loop_8

B7.label_body_9:
	j B7.label_step_6

B7.label_skip_7:
	lw ra, 0(sp)
	add sp, sp, 64
	ret
	li a0, 4
	li a1, 10
	call .malloc_array
	sw a0, 4(sp)
	li a0, 0
	call .malloc
	sw a0, 8(sp)
	lw a0, 8(sp)
	call C..C
	lw a0, 8(sp)
	call C..func
	sw a0, 12(sp)
	li a0, 0
	call .malloc
	sw a0, 16(sp)
	lw a0, 16(sp)
	call C..C
	lw a0, 16(sp)
	call C..func
	sw a0, 20(sp)
	lw t1, 12(sp)
	lw t2, 20(sp)
	add t0, t1, t2
	sw t0, 24(sp)
	lw ra, 0(sp)
	add sp, sp, 64
	ret


.section .data
.section .rodata
