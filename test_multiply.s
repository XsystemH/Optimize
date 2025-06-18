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
	addi sp, sp, -96
	sw ra, 0(sp)
	call .init
	li t1, 0
	li t2, 0
	add t0, t1, t2
	mv a0, t0
	li t1, 10
	li t2, 0
	add t0, t1, t2
	mv a1, t0
	li t1, 20
	li t2, 0
	add t0, t1, t2
	mv a2, t0
	li t1, 40
	li t2, 0
	add t0, t1, t2
	mv a3, t0
	li t1, 80
	li t2, 0
	add t0, t1, t2
	mv a4, t0
	li t1, 160
	li t2, 0
	add t0, t1, t2
	mv a5, t0
	li t1, -10
	li t2, 0
	add t0, t1, t2
	mv a6, t0
	mv s0, a0
	mv s1, a1
	mv s2, a2
	mv s3, a3
	mv s4, a4
	mv s5, a5
	mv s6, a6
	call toString
	mv t0, a0
	mv a0, s0
	mv a1, s1
	mv a2, s2
	mv a3, s3
	mv a4, s4
	mv a5, s5
	mv a6, s6
	mv a7, t0
	mv s0, a1
	mv s1, a2
	mv s2, a3
	mv s3, a4
	mv s4, a5
	mv s5, a6
	mv s6, a7
	mv a0, a7
	la a1, .str.pre_0
	call .str.add
	mv t0, a0
	mv a1, s0
	mv a2, s1
	mv a3, s2
	mv a4, s3
	mv a5, s4
	mv a6, s5
	mv a7, s6
	mv a0, t0
	mv s0, a0
	mv s1, a1
	mv s2, a2
	mv s3, a3
	mv s4, a4
	mv s5, a5
	mv s6, a6
	call print
	mv a0, s0
	mv a1, s1
	mv a2, s2
	mv a3, s3
	mv a4, s4
	mv a5, s5
	mv a6, s6
	mv s0, a1
	mv s1, a2
	mv s2, a3
	mv s3, a4
	mv s4, a5
	mv s5, a6
	mv a0, a1
	call toString
	mv t0, a0
	mv a1, s0
	mv a2, s1
	mv a3, s2
	mv a4, s3
	mv a5, s4
	mv a6, s5
	mv a0, t0
	mv s0, a0
	mv s1, a2
	mv s2, a3
	mv s3, a4
	mv s4, a5
	mv s5, a6
	la a1, .str.pre_1
	call .str.add
	mv t0, a0
	mv a0, s0
	mv a2, s1
	mv a3, s2
	mv a4, s3
	mv a5, s4
	mv a6, s5
	mv a1, t0
	mv s0, a1
	mv s1, a2
	mv s2, a3
	mv s3, a4
	mv s4, a5
	mv s5, a6
	mv a0, a1
	call print
	mv a1, s0
	mv a2, s1
	mv a3, s2
	mv a4, s3
	mv a5, s4
	mv a6, s5
	mv s0, a2
	mv s1, a3
	mv s2, a4
	mv s3, a5
	mv s4, a6
	mv a0, a2
	call toString
	mv t0, a0
	mv a2, s0
	mv a3, s1
	mv a4, s2
	mv a5, s3
	mv a6, s4
	mv a0, t0
	mv s0, a0
	mv s1, a3
	mv s2, a4
	mv s3, a5
	mv s4, a6
	la a1, .str.pre_2
	call .str.add
	mv t0, a0
	mv a0, s0
	mv a3, s1
	mv a4, s2
	mv a5, s3
	mv a6, s4
	mv a1, t0
	mv s0, a1
	mv s1, a3
	mv s2, a4
	mv s3, a5
	mv s4, a6
	mv a0, a1
	call print
	mv a1, s0
	mv a3, s1
	mv a4, s2
	mv a5, s3
	mv a6, s4
	mv s0, a3
	mv s1, a4
	mv s2, a5
	mv s3, a6
	mv a0, a3
	call toString
	mv t0, a0
	mv a3, s0
	mv a4, s1
	mv a5, s2
	mv a6, s3
	mv a0, t0
	mv s0, a0
	mv s1, a4
	mv s2, a5
	mv s3, a6
	la a1, .str.pre_3
	call .str.add
	mv t0, a0
	mv a0, s0
	mv a4, s1
	mv a5, s2
	mv a6, s3
	mv a1, t0
	mv s0, a1
	mv s1, a4
	mv s2, a5
	mv s3, a6
	mv a0, a1
	call print
	mv a1, s0
	mv a4, s1
	mv a5, s2
	mv a6, s3
	mv s0, a4
	mv s1, a5
	mv s2, a6
	mv a0, a4
	call toString
	mv t0, a0
	mv a4, s0
	mv a5, s1
	mv a6, s2
	mv a0, t0
	mv s0, a0
	mv s1, a5
	mv s2, a6
	la a1, .str.pre_4
	call .str.add
	mv t0, a0
	mv a0, s0
	mv a5, s1
	mv a6, s2
	mv a1, t0
	mv s0, a1
	mv s1, a5
	mv s2, a6
	mv a0, a1
	call print
	mv a1, s0
	mv a5, s1
	mv a6, s2
	mv s0, a5
	mv s1, a6
	mv a0, a5
	call toString
	mv t0, a0
	mv a5, s0
	mv a6, s1
	mv a0, t0
	mv s0, a0
	mv s1, a6
	la a1, .str.pre_5
	call .str.add
	mv t0, a0
	mv a0, s0
	mv a6, s1
	mv a1, t0
	mv s0, a1
	mv s1, a6
	mv a0, a1
	call print
	mv a1, s0
	mv a6, s1
	mv s0, a6
	mv a0, a6
	call toString
	mv t0, a0
	mv a6, s0
	mv a0, t0
	mv s0, a0
	la a1, .str.pre_6
	call .str.add
	mv t0, a0
	mv a0, s0
	mv a1, t0
	mv s0, a1
	mv a0, a1
	call print
	mv a1, s0
	li a0, 15
	call toString
	mv t0, a0
	mv a0, t0
	mv s0, a0
	call print
	mv a0, s0
	la a0, .str.pre_7
	call println
	li a0, 0
	lw ra, 0(sp)
	addi sp, sp, 96
	ret


.type .init, @function
.p2align 2
.globl .init
.init:
	addi sp, sp, -96
	sw ra, 0(sp)
	lw ra, 0(sp)
	addi sp, sp, 96
	ret


.section .data
.section .rodata
.p2align 1
.globl .str.pre_0
.str.pre_0:
	.asciz " "

.p2align 1
.globl .str.pre_1
.str.pre_1:
	.asciz " "

.p2align 1
.globl .str.pre_2
.str.pre_2:
	.asciz " "

.p2align 1
.globl .str.pre_3
.str.pre_3:
	.asciz " "

.p2align 1
.globl .str.pre_4
.str.pre_4:
	.asciz " "

.p2align 1
.globl .str.pre_5
.str.pre_5:
	.asciz " "

.p2align 1
.globl .str.pre_6
.str.pre_6:
	.asciz " "

.p2align 1
.globl .str.pre_7
.str.pre_7:
	.asciz ""

