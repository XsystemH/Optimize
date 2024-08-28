@.str.pre_0 = private unnamed_addr constant [2 x i8] c" \00"
@.str.pre_1 = private unnamed_addr constant [2 x i8] c"\0A\00"
declare i32 @scanf(ptr, ...);
declare i32 @printf(ptr, ...);
declare i32 @sprintf(ptr, ptr, ...);
declare void @print(ptr);
declare void @println(ptr);
declare void @printInt(i32);
declare void @printlnInt(i32);
declare ptr @malloc(i32);
declare ptr @.malloc(i32);
declare ptr @.malloc_array(i32, i32);
declare i32 @.arr.size(ptr);
declare ptr @getString();
declare i32 @getInt();
declare ptr @toString(i32);
declare ptr @.str.add(ptr, ptr);
declare i1 @.str.eq(ptr, ptr);
declare i1 @.str.ne(ptr, ptr);
declare i1 @.str.lt(ptr, ptr);
declare i1 @.str.le(ptr, ptr);
declare i1 @.str.gt(ptr, ptr);
declare i1 @.str.ge(ptr, ptr);
declare i32 @.str.length(ptr);
declare ptr @.str.substr(ptr, i32, i32);
declare i32 @.str.parseInt(ptr);
declare i32 @.str.ord(ptr, i32);
@n = global i32 0
@a = global ptr null
define void @exchange(i32 %x, i32 %y) {
entry:
  %x.1 = alloca i32
  store i32 %x, ptr %x.1
  %y.1 = alloca i32
  store i32 %y, ptr %y.1
  %t.1 = alloca i32
  %.result.0 = load ptr, ptr @a
  %.result.1 = load i32, ptr %x.1
  %.result.2 = getelementptr i32, ptr %.result.0, i32 %.result.1
  %.result.3 = load i32, ptr %.result.2
  store i32 %.result.3, ptr %t.1
  %.result.4 = load ptr, ptr @a
  %.result.5 = load i32, ptr %x.1
  %.result.6 = getelementptr i32, ptr %.result.4, i32 %.result.5
  %.result.7 = load ptr, ptr @a
  %.result.8 = load i32, ptr %y.1
  %.result.9 = getelementptr i32, ptr %.result.7, i32 %.result.8
  %.result.10 = load i32, ptr %.result.9
  store i32 %.result.10, ptr %.result.6
  %.result.11 = load ptr, ptr @a
  %.result.12 = load i32, ptr %y.1
  %.result.13 = getelementptr i32, ptr %.result.11, i32 %.result.12
  %.result.14 = load i32, ptr %t.1
  store i32 %.result.14, ptr %.result.13
ret void
}

define i32 @makeHeap() {
entry:
  %.result.22 = alloca i1
  %i.1 = alloca i32
  %t.1 = alloca i32
  %j.1 = alloca i32
  %.result.15 = load i32, ptr @n
  %.result.16 = sub i32 %.result.15, 1
  %.result.17 = sdiv i32 %.result.16, 2
  store i32 %.result.17, ptr %i.1
  store i32 0, ptr %t.1
  store i32 0, ptr %j.1
  br label %label_loop_0
label_loop_0:
  %.result.18 = load i32, ptr %i.1
  %.result.19 = icmp sge i32 %.result.18, 0
  br i1 %.result.19, label %label_body_2, label %label_skip_1
label_body_2:
  %.result.20 = load i32, ptr %i.1
  %.result.21 = mul i32 %.result.20, 2
  store i32 %.result.21, ptr %j.1
  %.result.23 = load i32, ptr %i.1
  %.result.24 = mul i32 %.result.23, 2
  %.result.25 = add i32 %.result.24, 1
  %.result.26 = load i32, ptr @n
  %.result.27 = icmp slt i32 %.result.25, %.result.26
  store i1 %.result.27, ptr %.result.22
  br i1 %.result.27, label %label_logicT_3, label %label_logicF_4
label_logicT_3:
  %.result.28 = load ptr, ptr @a
  %.result.29 = load i32, ptr %i.1
  %.result.30 = mul i32 %.result.29, 2
  %.result.31 = add i32 %.result.30, 1
  %.result.32 = getelementptr i32, ptr %.result.28, i32 %.result.31
  %.result.33 = load i32, ptr %.result.32
  %.result.34 = load ptr, ptr @a
  %.result.35 = load i32, ptr %i.1
  %.result.36 = mul i32 %.result.35, 2
  %.result.37 = getelementptr i32, ptr %.result.34, i32 %.result.36
  %.result.38 = load i32, ptr %.result.37
  %.result.39 = icmp slt i32 %.result.33, %.result.38
  store i1 %.result.39, ptr %.result.22
  br label %label_logicF_4
label_logicF_4:
  %.result.40 = load i1, ptr %.result.22
  br i1 %.result.40, label %label_true_5, label %label_false_6
label_true_5:
  %.result.41 = load i32, ptr %i.1
  %.result.42 = mul i32 %.result.41, 2
  %.result.43 = add i32 %.result.42, 1
  store i32 %.result.43, ptr %j.1
  br label %label_skip_7
label_false_6:
  br label %label_skip_7
label_skip_7:
  %.result.44 = load ptr, ptr @a
  %.result.45 = load i32, ptr %i.1
  %.result.46 = getelementptr i32, ptr %.result.44, i32 %.result.45
  %.result.47 = load i32, ptr %.result.46
  %.result.48 = load ptr, ptr @a
  %.result.49 = load i32, ptr %j.1
  %.result.50 = getelementptr i32, ptr %.result.48, i32 %.result.49
  %.result.51 = load i32, ptr %.result.50
  %.result.52 = icmp sgt i32 %.result.47, %.result.51
  br i1 %.result.52, label %label_true_8, label %label_false_9
label_true_8:
  %.result.53 = load i32, ptr %i.1
  %.result.54 = load i32, ptr %j.1
  call void @exchange(i32 %.result.53, i32 %.result.54)
  br label %label_skip_10
label_false_9:
  br label %label_skip_10
label_skip_10:
  %.result.55 = load i32, ptr %i.1
  %.result.56 = sub i32 %.result.55, 1
  store i32 %.result.56, ptr %i.1
  br label %label_loop_0
label_skip_1:
  ret i32 0
}

define i32 @adjustHeap(i32 %n) {
entry:
  %.result.63 = alloca i1
  %n.1 = alloca i32
  store i32 %n, ptr %n.1
  %i.1 = alloca i32
  store i32 0, ptr %i.1
  %j.1 = alloca i32
  store i32 0, ptr %j.1
  %t.1 = alloca i32
  store i32 0, ptr %t.1
  br label %label_loop_11
label_loop_11:
  %.result.57 = load i32, ptr %i.1
  %.result.58 = mul i32 %.result.57, 2
  %.result.59 = load i32, ptr %n.1
  %.result.60 = icmp slt i32 %.result.58, %.result.59
  br i1 %.result.60, label %label_body_13, label %label_skip_12
label_body_13:
  %.result.61 = load i32, ptr %i.1
  %.result.62 = mul i32 %.result.61, 2
  store i32 %.result.62, ptr %j.1
  %.result.64 = load i32, ptr %i.1
  %.result.65 = mul i32 %.result.64, 2
  %.result.66 = add i32 %.result.65, 1
  %.result.67 = load i32, ptr %n.1
  %.result.68 = icmp slt i32 %.result.66, %.result.67
  store i1 %.result.68, ptr %.result.63
  br i1 %.result.68, label %label_logicT_14, label %label_logicF_15
label_logicT_14:
  %.result.69 = load ptr, ptr @a
  %.result.70 = load i32, ptr %i.1
  %.result.71 = mul i32 %.result.70, 2
  %.result.72 = add i32 %.result.71, 1
  %.result.73 = getelementptr i32, ptr %.result.69, i32 %.result.72
  %.result.74 = load i32, ptr %.result.73
  %.result.75 = load ptr, ptr @a
  %.result.76 = load i32, ptr %i.1
  %.result.77 = mul i32 %.result.76, 2
  %.result.78 = getelementptr i32, ptr %.result.75, i32 %.result.77
  %.result.79 = load i32, ptr %.result.78
  %.result.80 = icmp slt i32 %.result.74, %.result.79
  store i1 %.result.80, ptr %.result.63
  br label %label_logicF_15
label_logicF_15:
  %.result.81 = load i1, ptr %.result.63
  br i1 %.result.81, label %label_true_16, label %label_false_17
label_true_16:
  %.result.82 = load i32, ptr %i.1
  %.result.83 = mul i32 %.result.82, 2
  %.result.84 = add i32 %.result.83, 1
  store i32 %.result.84, ptr %j.1
  br label %label_skip_18
label_false_17:
  br label %label_skip_18
label_skip_18:
  %.result.85 = load ptr, ptr @a
  %.result.86 = load i32, ptr %i.1
  %.result.87 = getelementptr i32, ptr %.result.85, i32 %.result.86
  %.result.88 = load i32, ptr %.result.87
  %.result.89 = load ptr, ptr @a
  %.result.90 = load i32, ptr %j.1
  %.result.91 = getelementptr i32, ptr %.result.89, i32 %.result.90
  %.result.92 = load i32, ptr %.result.91
  %.result.93 = icmp sgt i32 %.result.88, %.result.92
  br i1 %.result.93, label %label_true_19, label %label_false_20
label_true_19:
  %t.5 = alloca i32
  %.result.94 = load ptr, ptr @a
  %.result.95 = load i32, ptr %i.1
  %.result.96 = getelementptr i32, ptr %.result.94, i32 %.result.95
  %.result.97 = load i32, ptr %.result.96
  store i32 %.result.97, ptr %t.5
  %.result.98 = load ptr, ptr @a
  %.result.99 = load i32, ptr %i.1
  %.result.100 = getelementptr i32, ptr %.result.98, i32 %.result.99
  %.result.101 = load ptr, ptr @a
  %.result.102 = load i32, ptr %j.1
  %.result.103 = getelementptr i32, ptr %.result.101, i32 %.result.102
  %.result.104 = load i32, ptr %.result.103
  store i32 %.result.104, ptr %.result.100
  %.result.105 = load ptr, ptr @a
  %.result.106 = load i32, ptr %j.1
  %.result.107 = getelementptr i32, ptr %.result.105, i32 %.result.106
  %.result.108 = load i32, ptr %t.5
  store i32 %.result.108, ptr %.result.107
  %.result.109 = load i32, ptr %j.1
  store i32 %.result.109, ptr %i.1
  br label %label_skip_21
label_false_20:
  br label %label_skip_12
  br label %label_skip_21
label_skip_21:
  br label %label_loop_11
label_skip_12:
  ret i32 0
}

define i32 @heapSort() {
entry:
  %t.1 = alloca i32
  %k.1 = alloca i32
  store i32 0, ptr %t.1
  store i32 0, ptr %k.1
  br label %label_loop_22
label_loop_22:
  %.result.110 = load i32, ptr %k.1
  %.result.111 = load i32, ptr @n
  %.result.112 = icmp slt i32 %.result.110, %.result.111
  br i1 %.result.112, label %label_body_24, label %label_skip_23
label_body_24:
  %.result.113 = load ptr, ptr @a
  %.result.114 = getelementptr i32, ptr %.result.113, i32 0
  %.result.115 = load i32, ptr %.result.114
  store i32 %.result.115, ptr %t.1
  %.result.116 = load ptr, ptr @a
  %.result.117 = getelementptr i32, ptr %.result.116, i32 0
  %.result.118 = load ptr, ptr @a
  %.result.119 = load i32, ptr @n
  %.result.120 = load i32, ptr %k.1
  %.result.121 = sub i32 %.result.119, %.result.120
  %.result.122 = sub i32 %.result.121, 1
  %.result.123 = getelementptr i32, ptr %.result.118, i32 %.result.122
  %.result.124 = load i32, ptr %.result.123
  store i32 %.result.124, ptr %.result.117
  %.result.125 = load ptr, ptr @a
  %.result.126 = load i32, ptr @n
  %.result.127 = load i32, ptr %k.1
  %.result.128 = sub i32 %.result.126, %.result.127
  %.result.129 = sub i32 %.result.128, 1
  %.result.130 = getelementptr i32, ptr %.result.125, i32 %.result.129
  %.result.131 = load i32, ptr %t.1
  store i32 %.result.131, ptr %.result.130
  %.result.132 = load i32, ptr @n
  %.result.133 = load i32, ptr %k.1
  %.result.134 = sub i32 %.result.132, %.result.133
  %.result.135 = sub i32 %.result.134, 1
  %.result.136 = call i32 @adjustHeap(i32 %.result.135)
  %.result.137 = load i32, ptr %k.1
  %.result.138 = add i32 %.result.137, 1
  store i32 %.result.138, ptr %k.1
  br label %label_loop_22
label_skip_23:
  ret i32 0
}

define void @.init() {
entry:
  ret void
}
define i32 @main() {
entry:
  call void @.init()
  %i.1 = alloca i32
  %.result.139 = call ptr @getString()
  %.result.140 = call i32 @.str.parseInt(ptr %.result.139)
  store i32 %.result.140, ptr @n
  %.result.141 = load i32, ptr @n
  %.result.142 = call ptr @.malloc_array(i32 4, i32 %.result.141)
  store ptr %.result.142, ptr @a
  store i32 0, ptr %i.1
  br label %label_loop_25
label_loop_25:
  %.result.143 = load i32, ptr %i.1
  %.result.144 = load ptr, ptr @a
  %.result.145 = call i32 @.arr.size(ptr %.result.144)
  %.result.146 = icmp slt i32 %.result.143, %.result.145
  br i1 %.result.146, label %label_body_27, label %label_skip_26
label_body_27:
  %.result.147 = load ptr, ptr @a
  %.result.148 = load i32, ptr %i.1
  %.result.149 = getelementptr i32, ptr %.result.147, i32 %.result.148
  %.result.150 = load i32, ptr %i.1
  store i32 %.result.150, ptr %.result.149
  %.result.151 = load i32, ptr %i.1
  %.result.152 = add i32 %.result.151, 1
  store i32 %.result.152, ptr %i.1
  br label %label_loop_25
label_skip_26:
  %.result.153 = call i32 @makeHeap()
  %.result.154 = call i32 @heapSort()
  store i32 0, ptr %i.1
  br label %label_loop_28
label_loop_28:
  %.result.155 = load i32, ptr %i.1
  %.result.156 = load ptr, ptr @a
  %.result.157 = call i32 @.arr.size(ptr %.result.156)
  %.result.158 = icmp slt i32 %.result.155, %.result.157
  br i1 %.result.158, label %label_body_30, label %label_skip_29
label_body_30:
  %.result.159 = load ptr, ptr @a
  %.result.160 = load i32, ptr %i.1
  %.result.161 = getelementptr i32, ptr %.result.159, i32 %.result.160
  %.result.162 = load i32, ptr %.result.161
  %.result.163 = call ptr @toString(i32 %.result.162)
  %.result.164 = call ptr @.str.add(ptr %.result.163, ptr @.str.pre_0)
  call void @print(ptr %.result.164)
  %.result.165 = load i32, ptr %i.1
  %.result.166 = add i32 %.result.165, 1
  store i32 %.result.166, ptr %i.1
  br label %label_loop_28
label_skip_29:
  call void @print(ptr @.str.pre_1)
  ret i32 0
}
