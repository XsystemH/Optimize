	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_c2p0"
	.file	"builtin.c"
	.globl	print                           # -- Begin function print
	.p2align	1
	.type	print,@function
print:                                  # @print
# %bb.0:
	mv	a1, a0
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	tail	printf
.Lfunc_end0:
	.size	print, .Lfunc_end0-print
                                        # -- End function
	.globl	println                         # -- Begin function println
	.p2align	1
	.type	println,@function
println:                                # @println
# %bb.0:
	mv	a1, a0
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	tail	printf
.Lfunc_end1:
	.size	println, .Lfunc_end1-println
                                        # -- End function
	.globl	printInt                        # -- Begin function printInt
	.p2align	1
	.type	printInt,@function
printInt:                               # @printInt
# %bb.0:
	mv	a1, a0
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	tail	printf
.Lfunc_end2:
	.size	printInt, .Lfunc_end2-printInt
                                        # -- End function
	.globl	printlnInt                      # -- Begin function printlnInt
	.p2align	1
	.type	printlnInt,@function
printlnInt:                             # @printlnInt
# %bb.0:
	mv	a1, a0
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	tail	printf
.Lfunc_end3:
	.size	printlnInt, .Lfunc_end3-printlnInt
                                        # -- End function
	.globl	.malloc_array                   # -- Begin function .malloc_array
	.p2align	1
	.type	.malloc_array,@function
.malloc_array:                          # @.malloc_array
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	a1, 8(sp)                       # 4-byte Folded Spill
	mul	a0, a1, a0
	addi	a0, a0, 4
	call	malloc
	lw	a1, 8(sp)                       # 4-byte Folded Reload
	sw	a1, 0(a0)
	addi	a0, a0, 4
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end4:
	.size	.malloc_array, .Lfunc_end4-.malloc_array
                                        # -- End function
	.globl	.arr.size                       # -- Begin function .arr.size
	.p2align	1
	.type	.arr.size,@function
.arr.size:                              # @.arr.size
# %bb.0:
	lw	a0, -4(a0)
	ret
.Lfunc_end5:
	.size	.arr.size, .Lfunc_end5-.arr.size
                                        # -- End function
	.globl	.malloc                         # -- Begin function .malloc
	.p2align	1
	.type	.malloc,@function
.malloc:                                # @.malloc
# %bb.0:
	tail	malloc
.Lfunc_end6:
	.size	.malloc, .Lfunc_end6-.malloc
                                        # -- End function
	.globl	getString                       # -- Begin function getString
	.p2align	1
	.type	getString,@function
getString:                              # @getString
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	li	a0, 256
	call	malloc
	mv	a1, a0
	sw	a1, 8(sp)                       # 4-byte Folded Spill
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	scanf
                                        # kill: def $x11 killed $x10
	lw	a0, 8(sp)                       # 4-byte Folded Reload
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end7:
	.size	getString, .Lfunc_end7-getString
                                        # -- End function
	.globl	getInt                          # -- Begin function getInt
	.p2align	1
	.type	getInt,@function
getInt:                                 # @getInt
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	addi	a1, sp, 8
	call	scanf
	lw	a0, 8(sp)
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end8:
	.size	getInt, .Lfunc_end8-getInt
                                        # -- End function
	.globl	toString                        # -- Begin function toString
	.p2align	1
	.type	toString,@function
toString:                               # @toString
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	a0, 4(sp)                       # 4-byte Folded Spill
	li	a0, 12
	call	malloc
	lw	a2, 4(sp)                       # 4-byte Folded Reload
	sw	a0, 8(sp)                       # 4-byte Folded Spill
	lui	a1, %hi(.L.str.2)
	addi	a1, a1, %lo(.L.str.2)
	call	sprintf
                                        # kill: def $x11 killed $x10
	lw	a0, 8(sp)                       # 4-byte Folded Reload
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end9:
	.size	toString, .Lfunc_end9-toString
                                        # -- End function
	.globl	.str.length                     # -- Begin function .str.length
	.p2align	1
	.type	.str.length,@function
.str.length:                            # @.str.length
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	a0, 4(sp)                       # 4-byte Folded Spill
	li	a1, 0
	sw	a1, 8(sp)                       # 4-byte Folded Spill
	beqz	a0, .LBB10_2
	j	.LBB10_1
.LBB10_1:
	lw	a0, 4(sp)                       # 4-byte Folded Reload
	call	strlen
	sw	a0, 8(sp)                       # 4-byte Folded Spill
	j	.LBB10_2
.LBB10_2:
	lw	a0, 8(sp)                       # 4-byte Folded Reload
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end10:
	.size	.str.length, .Lfunc_end10-.str.length
                                        # -- End function
	.globl	.str.add                        # -- Begin function .str.add
	.p2align	1
	.type	.str.add,@function
.str.add:                               # @.str.add
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)                      # 4-byte Folded Spill
	sw	a1, 32(sp)                      # 4-byte Folded Spill
	sw	a0, 36(sp)                      # 4-byte Folded Spill
	li	a1, 0
	sw	a1, 40(sp)                      # 4-byte Folded Spill
	beqz	a0, .LBB11_2
	j	.LBB11_1
.LBB11_1:
	lw	a0, 36(sp)                      # 4-byte Folded Reload
	call	strlen
	sw	a0, 40(sp)                      # 4-byte Folded Spill
	j	.LBB11_2
.LBB11_2:
	lw	a0, 32(sp)                      # 4-byte Folded Reload
	lw	a1, 40(sp)                      # 4-byte Folded Reload
	sw	a1, 24(sp)                      # 4-byte Folded Spill
	li	a1, 0
	sw	a1, 28(sp)                      # 4-byte Folded Spill
	beqz	a0, .LBB11_4
	j	.LBB11_3
.LBB11_3:
	lw	a0, 32(sp)                      # 4-byte Folded Reload
	call	strlen
	sw	a0, 28(sp)                      # 4-byte Folded Spill
	j	.LBB11_4
.LBB11_4:
	lw	a1, 24(sp)                      # 4-byte Folded Reload
	lw	a0, 28(sp)                      # 4-byte Folded Reload
	sw	a0, 12(sp)                      # 4-byte Folded Spill
	add	a0, a0, a1
	sw	a0, 16(sp)                      # 4-byte Folded Spill
	addi	a0, a0, 1
	call	malloc
	lw	a1, 36(sp)                      # 4-byte Folded Reload
	lw	a2, 24(sp)                      # 4-byte Folded Reload
	sw	a0, 20(sp)                      # 4-byte Folded Spill
	call	memcpy
	lw	a3, 24(sp)                      # 4-byte Folded Reload
	lw	a1, 32(sp)                      # 4-byte Folded Reload
	lw	a2, 12(sp)                      # 4-byte Folded Reload
                                        # kill: def $x14 killed $x10
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	add	a0, a0, a3
	call	memcpy
	lw	a1, 16(sp)                      # 4-byte Folded Reload
                                        # kill: def $x12 killed $x10
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	add	a2, a0, a1
	li	a1, 0
	sb	a1, 0(a2)
	lw	ra, 44(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end11:
	.size	.str.add, .Lfunc_end11-.str.add
                                        # -- End function
	.globl	.str.eq                         # -- Begin function .str.eq
	.p2align	1
	.type	.str.eq,@function
.str.eq:                                # @.str.eq
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	call	strcmp
	seqz	a0, a0
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end12:
	.size	.str.eq, .Lfunc_end12-.str.eq
                                        # -- End function
	.globl	.str.ne                         # -- Begin function .str.ne
	.p2align	1
	.type	.str.ne,@function
.str.ne:                                # @.str.ne
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	call	strcmp
	snez	a0, a0
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end13:
	.size	.str.ne, .Lfunc_end13-.str.ne
                                        # -- End function
	.globl	.str.lt                         # -- Begin function .str.lt
	.p2align	1
	.type	.str.lt,@function
.str.lt:                                # @.str.lt
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	call	strcmp
	srli	a0, a0, 31
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end14:
	.size	.str.lt, .Lfunc_end14-.str.lt
                                        # -- End function
	.globl	.str.le                         # -- Begin function .str.le
	.p2align	1
	.type	.str.le,@function
.str.le:                                # @.str.le
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	call	strcmp
	slti	a0, a0, 1
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end15:
	.size	.str.le, .Lfunc_end15-.str.le
                                        # -- End function
	.globl	.str.gt                         # -- Begin function .str.gt
	.p2align	1
	.type	.str.gt,@function
.str.gt:                                # @.str.gt
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	call	strcmp
	mv	a1, a0
	li	a0, 0
	slt	a0, a0, a1
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end16:
	.size	.str.gt, .Lfunc_end16-.str.gt
                                        # -- End function
	.globl	.str.ge                         # -- Begin function .str.ge
	.p2align	1
	.type	.str.ge,@function
.str.ge:                                # @.str.ge
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	call	strcmp
	not	a0, a0
	srli	a0, a0, 31
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end17:
	.size	.str.ge, .Lfunc_end17-.str.ge
                                        # -- End function
	.globl	.str.substr                     # -- Begin function .str.substr
	.p2align	1
	.type	.str.substr,@function
.str.substr:                            # @.str.substr
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	a1, 12(sp)                      # 4-byte Folded Spill
	sw	a0, 16(sp)                      # 4-byte Folded Spill
	sub	a0, a2, a1
	sw	a0, 20(sp)                      # 4-byte Folded Spill
	addi	a0, a0, 1
	call	malloc
	lw	a3, 12(sp)                      # 4-byte Folded Reload
	lw	a1, 16(sp)                      # 4-byte Folded Reload
	lw	a2, 20(sp)                      # 4-byte Folded Reload
	sw	a0, 24(sp)                      # 4-byte Folded Spill
	add	a1, a1, a3
	call	memcpy
	lw	a1, 20(sp)                      # 4-byte Folded Reload
                                        # kill: def $x12 killed $x10
	lw	a0, 24(sp)                      # 4-byte Folded Reload
	add	a2, a0, a1
	li	a1, 0
	sb	a1, 0(a2)
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end18:
	.size	.str.substr, .Lfunc_end18-.str.substr
                                        # -- End function
	.globl	.str.parseInt                   # -- Begin function .str.parseInt
	.p2align	1
	.type	.str.parseInt,@function
.str.parseInt:                          # @.str.parseInt
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	lui	a1, %hi(.L.str.2)
	addi	a1, a1, %lo(.L.str.2)
	addi	a2, sp, 8
	call	sscanf
	lw	a0, 8(sp)
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end19:
	.size	.str.parseInt, .Lfunc_end19-.str.parseInt
                                        # -- End function
	.globl	.str.ord                        # -- Begin function .str.ord
	.p2align	1
	.type	.str.ord,@function
.str.ord:                               # @.str.ord
# %bb.0:
	add	a0, a0, a1
	lbu	a0, 0(a0)
	ret
.Lfunc_end20:
	.size	.str.ord, .Lfunc_end20-.str.ord
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%s\n"
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"%d"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%d\n"
	.size	.L.str.3, 4

	.ident	"Ubuntu clang version 18.1.8 (++20240731024944+3b5b5c1ec4a3-1~exp1~20240731145000.144)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
.text
.type main, @function
.p2align 2
.globl main
main:
	addi sp, sp, -992
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
	call .init
	li a0, 4
	li a1, 5
	call .malloc_array
	sw a0, 76(sp)
	li t0, 0
	lw t1, 12(sp)
	sw t0, 0(t1)
	j B1.label_loop_0

B1.label_loop_0:
	lw t0, 12(sp)
	lw t1, 0(t0)
	sw t1, 80(sp)
	lw t1, 80(sp)
	li t2, 5
	slt t0, t1, t2
	sw t0, 84(sp)
	lw t0, 84(sp)
	bnez t0, B1.label_body_2
	j B1.label_skip_1

B1.label_body_2:
	lw t0, 76(sp)
	lw t1, 80(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 88(sp)
	lw t1, 80(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 92(sp)
	lw t0, 92(sp)
	lw t1, 12(sp)
	sw t0, 0(t1)
	li a0, 4
	li a1, 5
	call .malloc_array
	sw a0, 96(sp)
	lw t0, 96(sp)
	lw t1, 88(sp)
	sw t0, 0(t1)
	j B1.label_loop_0

B1.label_skip_1:
	lw t0, 76(sp)
	lw t1, 4(sp)
	sw t0, 0(t1)
	li a0, 4
	li a1, 5
	call .malloc_array
	sw a0, 100(sp)
	li t0, 0
	lw t1, 28(sp)
	sw t0, 0(t1)
	j B1.label_loop_3

B1.label_loop_3:
	lw t0, 28(sp)
	lw t1, 0(t0)
	sw t1, 104(sp)
	lw t1, 104(sp)
	li t2, 5
	slt t0, t1, t2
	sw t0, 108(sp)
	lw t0, 108(sp)
	bnez t0, B1.label_body_5
	j B1.label_skip_4

B1.label_body_5:
	lw t0, 100(sp)
	lw t1, 104(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 112(sp)
	lw t1, 104(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 116(sp)
	lw t0, 116(sp)
	lw t1, 28(sp)
	sw t0, 0(t1)
	li a0, 4
	li a1, 5
	call .malloc_array
	sw a0, 120(sp)
	lw t0, 120(sp)
	lw t1, 112(sp)
	sw t0, 0(t1)
	j B1.label_loop_3

B1.label_skip_4:
	lw t0, 100(sp)
	lw t1, 20(sp)
	sw t0, 0(t1)
	li a0, 4
	li a1, 5
	call .malloc_array
	sw a0, 124(sp)
	li t0, 0
	lw t1, 44(sp)
	sw t0, 0(t1)
	j B1.label_loop_6

B1.label_loop_6:
	lw t0, 44(sp)
	lw t1, 0(t0)
	sw t1, 128(sp)
	lw t1, 128(sp)
	li t2, 5
	slt t0, t1, t2
	sw t0, 132(sp)
	lw t0, 132(sp)
	bnez t0, B1.label_body_8
	j B1.label_skip_7

B1.label_body_8:
	lw t0, 124(sp)
	lw t1, 128(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 136(sp)
	lw t1, 128(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 140(sp)
	lw t0, 140(sp)
	lw t1, 44(sp)
	sw t0, 0(t1)
	li a0, 4
	li a1, 5
	call .malloc_array
	sw a0, 144(sp)
	lw t0, 144(sp)
	lw t1, 136(sp)
	sw t0, 0(t1)
	j B1.label_loop_6

B1.label_skip_7:
	lw t0, 124(sp)
	lw t1, 36(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 148(sp)
	lw t0, 148(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 152(sp)
	lw t0, 152(sp)
	lw t1, 0(t0)
	sw t1, 156(sp)
	lw t0, 156(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 160(sp)
	li t0, 1
	lw t1, 160(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 164(sp)
	lw t0, 164(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 168(sp)
	lw t0, 168(sp)
	lw t1, 0(t0)
	sw t1, 172(sp)
	lw t0, 172(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 176(sp)
	li t0, 1
	lw t1, 176(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 180(sp)
	lw t0, 180(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 184(sp)
	lw t0, 184(sp)
	lw t1, 0(t0)
	sw t1, 188(sp)
	lw t0, 188(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 192(sp)
	li t0, 1
	lw t1, 192(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 196(sp)
	lw t0, 196(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 200(sp)
	lw t0, 200(sp)
	lw t1, 0(t0)
	sw t1, 204(sp)
	lw t0, 204(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 208(sp)
	li t0, 1
	lw t1, 208(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 212(sp)
	lw t0, 212(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 216(sp)
	lw t0, 216(sp)
	lw t1, 0(t0)
	sw t1, 220(sp)
	lw t0, 220(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 224(sp)
	li t0, 0
	lw t1, 224(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 228(sp)
	lw t0, 228(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 232(sp)
	lw t0, 232(sp)
	lw t1, 0(t0)
	sw t1, 236(sp)
	lw t0, 236(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 240(sp)
	li t0, 1
	lw t1, 240(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 244(sp)
	lw t0, 244(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 248(sp)
	lw t0, 248(sp)
	lw t1, 0(t0)
	sw t1, 252(sp)
	lw t0, 252(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 256(sp)
	li t0, 3
	lw t1, 256(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 260(sp)
	lw t0, 260(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 264(sp)
	lw t0, 264(sp)
	lw t1, 0(t0)
	sw t1, 268(sp)
	lw t0, 268(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 272(sp)
	li t0, 6
	lw t1, 272(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 276(sp)
	lw t0, 276(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 280(sp)
	lw t0, 280(sp)
	lw t1, 0(t0)
	sw t1, 284(sp)
	lw t0, 284(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 288(sp)
	li t0, 0
	lw t1, 288(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 292(sp)
	lw t0, 292(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 296(sp)
	lw t0, 296(sp)
	lw t1, 0(t0)
	sw t1, 300(sp)
	lw t0, 300(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 304(sp)
	li t0, 0
	lw t1, 304(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 308(sp)
	lw t0, 308(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 312(sp)
	lw t0, 312(sp)
	lw t1, 0(t0)
	sw t1, 316(sp)
	lw t0, 316(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 320(sp)
	li t0, 1
	lw t1, 320(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 324(sp)
	lw t0, 324(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 328(sp)
	lw t0, 328(sp)
	lw t1, 0(t0)
	sw t1, 332(sp)
	lw t0, 332(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 336(sp)
	li t0, 7
	lw t1, 336(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 340(sp)
	lw t0, 340(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 344(sp)
	lw t0, 344(sp)
	lw t1, 0(t0)
	sw t1, 348(sp)
	lw t0, 348(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 352(sp)
	li t0, 0
	lw t1, 352(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 356(sp)
	lw t0, 356(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 360(sp)
	lw t0, 360(sp)
	lw t1, 0(t0)
	sw t1, 364(sp)
	lw t0, 364(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 368(sp)
	li t0, 0
	lw t1, 368(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 372(sp)
	lw t0, 372(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 376(sp)
	lw t0, 376(sp)
	lw t1, 0(t0)
	sw t1, 380(sp)
	lw t0, 380(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 384(sp)
	li t0, 0
	lw t1, 384(sp)
	sw t0, 0(t1)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 388(sp)
	lw t0, 388(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 392(sp)
	lw t0, 392(sp)
	lw t1, 0(t0)
	sw t1, 396(sp)
	lw t0, 396(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 400(sp)
	li t0, 1
	lw t1, 400(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 404(sp)
	lw t0, 404(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 408(sp)
	lw t0, 408(sp)
	lw t1, 0(t0)
	sw t1, 412(sp)
	lw t0, 412(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 416(sp)
	li t0, 1
	lw t1, 416(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 420(sp)
	lw t0, 420(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 424(sp)
	lw t0, 424(sp)
	lw t1, 0(t0)
	sw t1, 428(sp)
	lw t0, 428(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 432(sp)
	li t0, 1
	lw t1, 432(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 436(sp)
	lw t0, 436(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 440(sp)
	lw t0, 440(sp)
	lw t1, 0(t0)
	sw t1, 444(sp)
	lw t0, 444(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 448(sp)
	li t0, 1
	lw t1, 448(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 452(sp)
	lw t0, 452(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 456(sp)
	lw t0, 456(sp)
	lw t1, 0(t0)
	sw t1, 460(sp)
	lw t0, 460(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 464(sp)
	li t0, 1
	lw t1, 464(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 468(sp)
	lw t0, 468(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 472(sp)
	lw t0, 472(sp)
	lw t1, 0(t0)
	sw t1, 476(sp)
	lw t0, 476(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 480(sp)
	li t0, 0
	lw t1, 480(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 484(sp)
	lw t0, 484(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 488(sp)
	lw t0, 488(sp)
	lw t1, 0(t0)
	sw t1, 492(sp)
	lw t0, 492(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 496(sp)
	li t1, 0
	li t2, 1
	sub t0, t1, t2
	sw t0, 500(sp)
	lw t0, 500(sp)
	lw t1, 496(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 504(sp)
	lw t0, 504(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 508(sp)
	lw t0, 508(sp)
	lw t1, 0(t0)
	sw t1, 512(sp)
	lw t0, 512(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 516(sp)
	li t0, 3
	lw t1, 516(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 520(sp)
	lw t0, 520(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 524(sp)
	lw t0, 524(sp)
	lw t1, 0(t0)
	sw t1, 528(sp)
	lw t0, 528(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 532(sp)
	li t1, 0
	li t2, 6
	sub t0, t1, t2
	sw t0, 536(sp)
	lw t0, 536(sp)
	lw t1, 532(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 540(sp)
	lw t0, 540(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 544(sp)
	lw t0, 544(sp)
	lw t1, 0(t0)
	sw t1, 548(sp)
	lw t0, 548(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 552(sp)
	li t0, 0
	lw t1, 552(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 556(sp)
	lw t0, 556(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 560(sp)
	lw t0, 560(sp)
	lw t1, 0(t0)
	sw t1, 564(sp)
	lw t0, 564(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 568(sp)
	li t0, 0
	lw t1, 568(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 572(sp)
	lw t0, 572(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 576(sp)
	lw t0, 576(sp)
	lw t1, 0(t0)
	sw t1, 580(sp)
	lw t0, 580(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 584(sp)
	li t0, 2
	lw t1, 584(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 588(sp)
	lw t0, 588(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 592(sp)
	lw t0, 592(sp)
	lw t1, 0(t0)
	sw t1, 596(sp)
	lw t0, 596(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 600(sp)
	li t0, 11
	lw t1, 600(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 604(sp)
	lw t0, 604(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 608(sp)
	lw t0, 608(sp)
	lw t1, 0(t0)
	sw t1, 612(sp)
	lw t0, 612(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 616(sp)
	li t0, 0
	lw t1, 616(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 620(sp)
	lw t0, 620(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 624(sp)
	lw t0, 624(sp)
	lw t1, 0(t0)
	sw t1, 628(sp)
	lw t0, 628(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 632(sp)
	li t0, 0
	lw t1, 632(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 636(sp)
	lw t0, 636(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 640(sp)
	lw t0, 640(sp)
	lw t1, 0(t0)
	sw t1, 644(sp)
	lw t0, 644(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 648(sp)
	li t0, 0
	lw t1, 648(sp)
	sw t0, 0(t1)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 652(sp)
	lw t0, 652(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 656(sp)
	lw t0, 656(sp)
	lw t1, 0(t0)
	sw t1, 660(sp)
	lw t0, 660(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 664(sp)
	li t1, 0
	li t2, 6
	sub t0, t1, t2
	sw t0, 668(sp)
	lw t0, 668(sp)
	lw t1, 664(sp)
	sw t0, 0(t1)
	li t0, 1
	lw t1, 52(sp)
	sw t0, 0(t1)
	j B1.label_loop_11

B1.label_loop_11:
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 672(sp)
	lw t1, 672(sp)
	li t2, 4
	slt t0, t2, t1
	xori t0, t0, 1
	sw t0, 676(sp)
	lw t0, 676(sp)
	bnez t0, B1.label_body_12
	j B1.label_skip_10

B1.label_step_9:
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 680(sp)
	lw t1, 680(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 684(sp)
	lw t0, 684(sp)
	lw t1, 52(sp)
	sw t0, 0(t1)
	j B1.label_loop_11

B1.label_body_12:
	li t0, 1
	lw t1, 60(sp)
	sw t0, 0(t1)
	j B1.label_loop_15

B1.label_loop_15:
	lw t0, 60(sp)
	lw t1, 0(t0)
	sw t1, 688(sp)
	lw t1, 688(sp)
	li t2, 4
	slt t0, t2, t1
	xori t0, t0, 1
	sw t0, 692(sp)
	lw t0, 692(sp)
	bnez t0, B1.label_body_16
	j B1.label_skip_14

B1.label_step_13:
	lw t0, 60(sp)
	lw t1, 0(t0)
	sw t1, 696(sp)
	lw t1, 696(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 700(sp)
	lw t0, 700(sp)
	lw t1, 60(sp)
	sw t0, 0(t1)
	j B1.label_loop_15

B1.label_body_16:
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 704(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 708(sp)
	lw t0, 704(sp)
	lw t1, 708(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 712(sp)
	lw t0, 712(sp)
	lw t1, 0(t0)
	sw t1, 716(sp)
	lw t0, 60(sp)
	lw t1, 0(t0)
	sw t1, 720(sp)
	lw t0, 716(sp)
	lw t1, 720(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 724(sp)
	li t0, 0
	lw t1, 724(sp)
	sw t0, 0(t1)
	li t0, 1
	lw t1, 68(sp)
	sw t0, 0(t1)
	j B1.label_loop_19

B1.label_loop_19:
	lw t0, 68(sp)
	lw t1, 0(t0)
	sw t1, 728(sp)
	lw t1, 728(sp)
	li t2, 4
	slt t0, t2, t1
	xori t0, t0, 1
	sw t0, 732(sp)
	lw t0, 732(sp)
	bnez t0, B1.label_body_20
	j B1.label_skip_18

B1.label_step_17:
	lw t0, 68(sp)
	lw t1, 0(t0)
	sw t1, 736(sp)
	lw t1, 736(sp)
	li t2, 1
	add t0, t1, t2
	sw t0, 740(sp)
	lw t0, 740(sp)
	lw t1, 68(sp)
	sw t0, 0(t1)
	j B1.label_loop_19

B1.label_body_20:
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 744(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 748(sp)
	lw t0, 744(sp)
	lw t1, 748(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 752(sp)
	lw t0, 752(sp)
	lw t1, 0(t0)
	sw t1, 756(sp)
	lw t0, 60(sp)
	lw t1, 0(t0)
	sw t1, 760(sp)
	lw t0, 756(sp)
	lw t1, 760(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 764(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 768(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 772(sp)
	lw t0, 768(sp)
	lw t1, 772(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 776(sp)
	lw t0, 776(sp)
	lw t1, 0(t0)
	sw t1, 780(sp)
	lw t0, 60(sp)
	lw t1, 0(t0)
	sw t1, 784(sp)
	lw t0, 780(sp)
	lw t1, 784(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 788(sp)
	lw t0, 788(sp)
	lw t1, 0(t0)
	sw t1, 792(sp)
	lw t0, 4(sp)
	lw t1, 0(t0)
	sw t1, 796(sp)
	lw t0, 52(sp)
	lw t1, 0(t0)
	sw t1, 800(sp)
	lw t0, 796(sp)
	lw t1, 800(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 804(sp)
	lw t0, 804(sp)
	lw t1, 0(t0)
	sw t1, 808(sp)
	lw t0, 68(sp)
	lw t1, 0(t0)
	sw t1, 812(sp)
	lw t0, 808(sp)
	lw t1, 812(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 816(sp)
	lw t0, 816(sp)
	lw t1, 0(t0)
	sw t1, 820(sp)
	lw t0, 20(sp)
	lw t1, 0(t0)
	sw t1, 824(sp)
	lw t0, 68(sp)
	lw t1, 0(t0)
	sw t1, 828(sp)
	lw t0, 824(sp)
	lw t1, 828(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 832(sp)
	lw t0, 832(sp)
	lw t1, 0(t0)
	sw t1, 836(sp)
	lw t0, 60(sp)
	lw t1, 0(t0)
	sw t1, 840(sp)
	lw t0, 836(sp)
	lw t1, 840(sp)
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 844(sp)
	lw t0, 844(sp)
	lw t1, 0(t0)
	sw t1, 848(sp)
	lw t1, 820(sp)
	lw t2, 848(sp)
	mul t0, t1, t2
	sw t0, 852(sp)
	lw t1, 792(sp)
	lw t2, 852(sp)
	add t0, t1, t2
	sw t0, 856(sp)
	lw t0, 856(sp)
	lw t1, 764(sp)
	sw t0, 0(t1)
	j B1.label_step_17

B1.label_skip_18:
	j B1.label_step_13

B1.label_skip_14:
	j B1.label_step_9

B1.label_skip_10:
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 860(sp)
	lw t0, 860(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 864(sp)
	lw t0, 864(sp)
	lw t1, 0(t0)
	sw t1, 868(sp)
	lw t0, 868(sp)
	li t1, 1
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 872(sp)
	lw t0, 872(sp)
	lw t1, 0(t0)
	sw t1, 876(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 880(sp)
	lw t0, 880(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 884(sp)
	lw t0, 884(sp)
	lw t1, 0(t0)
	sw t1, 888(sp)
	lw t0, 888(sp)
	li t1, 2
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 892(sp)
	lw t0, 892(sp)
	lw t1, 0(t0)
	sw t1, 896(sp)
	lw t1, 876(sp)
	lw t2, 896(sp)
	add t0, t1, t2
	sw t0, 900(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 904(sp)
	lw t0, 904(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 908(sp)
	lw t0, 908(sp)
	lw t1, 0(t0)
	sw t1, 912(sp)
	lw t0, 912(sp)
	li t1, 3
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 916(sp)
	lw t0, 916(sp)
	lw t1, 0(t0)
	sw t1, 920(sp)
	lw t1, 900(sp)
	lw t2, 920(sp)
	add t0, t1, t2
	sw t0, 924(sp)
	lw t0, 36(sp)
	lw t1, 0(t0)
	sw t1, 928(sp)
	lw t0, 928(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 932(sp)
	lw t0, 932(sp)
	lw t1, 0(t0)
	sw t1, 936(sp)
	lw t0, 936(sp)
	li t1, 4
	slli t1, t1, 2
	add t2, t0, t1
	sw t2, 940(sp)
	lw t0, 940(sp)
	lw t1, 0(t0)
	sw t1, 944(sp)
	lw t1, 924(sp)
	lw t2, 944(sp)
	add t0, t1, t2
	sw t0, 948(sp)
	lw a0, 948(sp)
	lw ra, 0(sp)
	addi sp, sp, 992
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
