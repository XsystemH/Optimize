@.str.pre_0 = private unnamed_addr constant [3 x i8] c"( \00"
@.str.pre_1 = private unnamed_addr constant [3 x i8] c", \00"
@.str.pre_2 = private unnamed_addr constant [3 x i8] c" )\00"
@.str.pre_3 = private unnamed_addr constant [11 x i8] c"vector x: \00"
@.str.pre_4 = private unnamed_addr constant [9 x i8] c"excited!\00"
@.str.pre_5 = private unnamed_addr constant [11 x i8] c"vector y: \00"
@.str.pre_6 = private unnamed_addr constant [8 x i8] c"x + y: \00"
@.str.pre_7 = private unnamed_addr constant [8 x i8] c"x * y: \00"
@.str.pre_8 = private unnamed_addr constant [15 x i8] c"(1 << 3) * y: \00"
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
%class.vector = type { ptr }

define void @vector..init(ptr %this, ptr %vec) {
entry:
  %i.2 = alloca i32
  %vec.2 = alloca ptr
  store ptr %vec, ptr %vec.2
  %.result.0 = load ptr, ptr %vec.2
  %.result.1 = icmp eq ptr %.result.0, null
  br i1 %.result.1, label %label_true_0, label %label_false_1
label_true_0:
  ret void
  br label %label_skip_2
label_false_1:
  br label %label_skip_2
label_skip_2:
  %.result.2 = getelementptr ptr, ptr %this, i32 0
  %.result.3 = load ptr, ptr %vec.2
  %.result.4 = call i32 @.arr.size(ptr %.result.3)
  %.result.5 = call ptr @.malloc_array(i32 4, i32 %.result.4)
  store ptr %.result.5, ptr %.result.2
  store i32 0, ptr %i.2
  br label %label_loop_3
label_loop_3:
  %.result.6 = load i32, ptr %i.2
  %.result.7 = load ptr, ptr %vec.2
  %.result.8 = call i32 @.arr.size(ptr %.result.7)
  %.result.9 = icmp slt i32 %.result.6, %.result.8
  br i1 %.result.9, label %label_body_5, label %label_skip_4
label_body_5:
  %.result.10 = getelementptr ptr, ptr %this, i32 0
  %.result.11 = load i32, ptr %i.2
  %.result.12 = getelementptr i32, ptr %.result.10, i32 %.result.11
  %.result.13 = load ptr, ptr %vec.2
  %.result.14 = load i32, ptr %i.2
  %.result.15 = getelementptr i32, ptr %.result.13, i32 %.result.14
  %.result.16 = load i32, ptr %.result.15
  store i32 %.result.16, ptr %.result.12
  %.result.17 = load i32, ptr %i.2
  %.result.18 = add i32 %.result.17, 1
  store i32 %.result.18, ptr %i.2
  br label %label_loop_3
label_skip_4:
ret void
}

define i32 @vector..getDim(ptr %this) {
entry:
  %.result.19 = getelementptr ptr, ptr %this, i32 0
  %.result.20 = icmp eq ptr %.result.19, null
  br i1 %.result.20, label %label_true_6, label %label_false_7
label_true_6:
  ret i32 0
  br label %label_skip_8
label_false_7:
  br label %label_skip_8
label_skip_8:
  %.result.21 = getelementptr ptr, ptr %this, i32 0
  %.result.22 = call i32 @.arr.size(ptr %.result.21)
  ret i32 %.result.22
}

define i32 @vector..dot(ptr %this, ptr %rhs) {
entry:
  %i.2 = alloca i32
  %result.2 = alloca i32
  %rhs.2 = alloca ptr
  store ptr %rhs, ptr %rhs.2
  store i32 0, ptr %i.2
  store i32 0, ptr %result.2
  br label %label_loop_9
label_loop_9:
  %.result.23 = load i32, ptr %i.2
  %.result.24 = call i32 @getDim()
  %.result.25 = icmp slt i32 %.result.23, %.result.24
  br i1 %.result.25, label %label_body_11, label %label_skip_10
label_body_11:
  %.result.26 = getelementptr ptr, ptr %this, i32 0
  %.result.27 = load i32, ptr %i.2
  %.result.28 = getelementptr i32, ptr %.result.26, i32 %.result.27
  %.result.29 = load i32, ptr %.result.28
  %.result.30 = load ptr, ptr %rhs.2
  %.result.31 = getelementptr %class.vector, ptr %.result.30, i32 0
  %.result.32 = getelementptr %class.vector, ptr %.result.31, i32 0
  %.result.33 = load ptr, ptr %.result.32
  %.result.34 = load i32, ptr %i.2
  %.result.35 = getelementptr i32, ptr %.result.33, i32 %.result.34
  %.result.36 = load i32, ptr %.result.35
  %.result.37 = mul i32 %.result.29, %.result.36
  store i32 %.result.37, ptr %result.2
  %.result.38 = load i32, ptr %i.2
  %.result.39 = add i32 %.result.38, 1
  store i32 %.result.39, ptr %i.2
  br label %label_loop_9
label_skip_10:
  %.result.40 = load i32, ptr %result.2
  ret i32 %.result.40
}

define ptr @vector..scalarInPlaceMultiply(ptr %this, i32 %c) {
entry:
  %i.2 = alloca i32
  %c.2 = alloca i32
  store i32 %c, ptr %c.2
  %.result.41 = getelementptr ptr, ptr %this, i32 0
  %.result.42 = icmp eq ptr %.result.41, null
  br i1 %.result.42, label %label_true_12, label %label_false_13
label_true_12:
  ret ptr null
  br label %label_skip_14
label_false_13:
  br label %label_skip_14
label_skip_14:
  store i32 0, ptr %i.2
  br label %label_loop_15
label_loop_15:
  %.result.43 = load i32, ptr %i.2
  %.result.44 = call i32 @getDim()
  %.result.45 = icmp slt i32 %.result.43, %.result.44
  br i1 %.result.45, label %label_body_17, label %label_skip_16
label_body_17:
  %.result.46 = getelementptr %class.vector, ptr %this, i32 0
  %.result.47 = getelementptr %class.vector, ptr %.result.46, i32 0
  %.result.48 = load ptr, ptr %.result.47
  %.result.49 = load i32, ptr %i.2
  %.result.50 = getelementptr i32, ptr %.result.48, i32 %.result.49
  %.result.51 = load i32, ptr %c.2
  %.result.52 = getelementptr %class.vector, ptr %this, i32 0
  %.result.53 = getelementptr %class.vector, ptr %.result.52, i32 0
  %.result.54 = load ptr, ptr %.result.53
  %.result.55 = load i32, ptr %i.2
  %.result.56 = getelementptr i32, ptr %.result.54, i32 %.result.55
  %.result.57 = load i32, ptr %.result.56
  %.result.58 = mul i32 %.result.51, %.result.57
  store i32 %.result.58, ptr %.result.50
  %.result.59 = load i32, ptr %i.2
  %.result.60 = add i32 %.result.59, 1
  store i32 %.result.60, ptr %i.2
  br label %label_loop_15
label_skip_16:
  ret ptr %this
}

define ptr @vector..add(ptr %this, ptr %rhs) {
entry:
  %.result.61 = alloca i1
  %temp.2 = alloca ptr
  %i.2 = alloca i32
  %rhs.2 = alloca ptr
  store ptr %rhs, ptr %rhs.2
  %.result.62 = call i32 @getDim()
  %.result.63 = load ptr, ptr %rhs.2
  %.result.64 = call i32 @vector..getDim(ptr %.result.63)
  %.result.65 = icmp ne i32 %.result.62, %.result.64
  store i1 %.result.65, ptr %.result.61
  br i1 %.result.65, label %label_logicT_18, label %label_logicF_19
label_logicF_19:
  %.result.66 = call i32 @getDim()
  %.result.67 = icmp eq i32 %.result.66, 0
  store i1 %.result.67, ptr %.result.61
  br label %label_logicT_18
label_logicT_18:
  %.result.68 = load i1, ptr %.result.61
  br i1 %.result.68, label %label_true_20, label %label_false_21
label_true_20:
  ret ptr null
  br label %label_skip_22
label_false_21:
  br label %label_skip_22
label_skip_22:
  %.result.69 = call ptr @.malloc(i32 4)
  %.result.70 = getelementptr ptr, ptr %.result.69, i32 0
  %.result.71 = call ptr @.malloc(i32 4)
  store ptr %.result.71, ptr %.result.70
  store ptr %.result.69, ptr %temp.2
  %.result.72 = load ptr, ptr %temp.2
  %.result.73 = getelementptr %class.vector, ptr %.result.72, i32 0
  %.result.74 = getelementptr %class.vector, ptr %.result.73, i32 0
  %.result.75 = call i32 @getDim()
  %.result.76 = call ptr @.malloc_array(i32 4, i32 %.result.75)
  store ptr %.result.76, ptr %.result.74
  store i32 0, ptr %i.2
  br label %label_loop_23
label_loop_23:
  %.result.77 = load i32, ptr %i.2
  %.result.78 = call i32 @getDim()
  %.result.79 = icmp slt i32 %.result.77, %.result.78
  br i1 %.result.79, label %label_body_25, label %label_skip_24
label_body_25:
  %.result.80 = load ptr, ptr %temp.2
  %.result.81 = getelementptr %class.vector, ptr %.result.80, i32 0
  %.result.82 = getelementptr %class.vector, ptr %.result.81, i32 0
  %.result.83 = load ptr, ptr %.result.82
  %.result.84 = load i32, ptr %i.2
  %.result.85 = getelementptr i32, ptr %.result.83, i32 %.result.84
  %.result.86 = getelementptr ptr, ptr %this, i32 0
  %.result.87 = load i32, ptr %i.2
  %.result.88 = getelementptr i32, ptr %.result.86, i32 %.result.87
  %.result.89 = load i32, ptr %.result.88
  %.result.90 = load ptr, ptr %rhs.2
  %.result.91 = getelementptr %class.vector, ptr %.result.90, i32 0
  %.result.92 = getelementptr %class.vector, ptr %.result.91, i32 0
  %.result.93 = load ptr, ptr %.result.92
  %.result.94 = load i32, ptr %i.2
  %.result.95 = getelementptr i32, ptr %.result.93, i32 %.result.94
  %.result.96 = load i32, ptr %.result.95
  %.result.97 = add i32 %.result.89, %.result.96
  store i32 %.result.97, ptr %.result.85
  %.result.98 = load i32, ptr %i.2
  %.result.99 = add i32 %.result.98, 1
  store i32 %.result.99, ptr %i.2
  br label %label_loop_23
label_skip_24:
  %.result.100 = load ptr, ptr %temp.2
  ret ptr %.result.100
}

define i1 @vector..set(ptr %this, i32 %idx, i32 %value) {
entry:
  %idx.2 = alloca i32
  store i32 %idx, ptr %idx.2
  %value.2 = alloca i32
  store i32 %value, ptr %value.2
  %.result.101 = call i32 @getDim()
  %.result.102 = load i32, ptr %idx.2
  %.result.103 = icmp slt i32 %.result.101, %.result.102
  br i1 %.result.103, label %label_true_26, label %label_false_27
label_true_26:
  ret i1 false
  br label %label_skip_28
label_false_27:
  br label %label_skip_28
label_skip_28:
  %.result.104 = getelementptr ptr, ptr %this, i32 0
  %.result.105 = load i32, ptr %idx.2
  %.result.106 = getelementptr i32, ptr %.result.104, i32 %.result.105
  %.result.107 = load i32, ptr %value.2
  store i32 %.result.107, ptr %.result.106
  ret i1 true
}

define ptr @vector..tostring(ptr %this) {
entry:
  %temp.2 = alloca ptr
  %i.2 = alloca i32
  store ptr @.str.pre_0, ptr %temp.2
  %.result.108 = call i32 @getDim()
  %.result.109 = icmp sgt i32 %.result.108, 0
  br i1 %.result.109, label %label_true_29, label %label_false_30
label_true_29:
  %.result.110 = load ptr, ptr %temp.2
  %.result.111 = getelementptr ptr, ptr %this, i32 0
  %.result.112 = getelementptr i32, ptr %.result.111, i32 0
  %.result.113 = load i32, ptr %.result.112
  %.result.114 = call ptr @toString(i32 %.result.113)
  %.result.115 = call ptr @.str.add(ptr %.result.110, ptr %.result.114)
  store ptr %.result.115, ptr %temp.2
  br label %label_skip_31
label_false_30:
  br label %label_skip_31
label_skip_31:
  store i32 1, ptr %i.2
  br label %label_loop_32
label_loop_32:
  %.result.116 = load i32, ptr %i.2
  %.result.117 = call i32 @getDim()
  %.result.118 = icmp slt i32 %.result.116, %.result.117
  br i1 %.result.118, label %label_body_34, label %label_skip_33
label_body_34:
  %.result.119 = load ptr, ptr %temp.2
  %.result.120 = call ptr @.str.add(ptr %.result.119, ptr @.str.pre_1)
  %.result.121 = getelementptr ptr, ptr %this, i32 0
  %.result.122 = load i32, ptr %i.2
  %.result.123 = getelementptr i32, ptr %.result.121, i32 %.result.122
  %.result.124 = load i32, ptr %.result.123
  %.result.125 = call ptr @toString(i32 %.result.124)
  %.result.126 = call ptr @.str.add(ptr %.result.120, ptr %.result.125)
  store ptr %.result.126, ptr %temp.2
  %.result.127 = load i32, ptr %i.2
  %.result.128 = add i32 %.result.127, 1
  store i32 %.result.128, ptr %i.2
  br label %label_loop_32
label_skip_33:
  %.result.129 = load ptr, ptr %temp.2
  %.result.130 = call ptr @.str.add(ptr %.result.129, ptr @.str.pre_2)
  store ptr %.result.130, ptr %temp.2
  %.result.131 = load ptr, ptr %temp.2
  ret ptr %.result.131
}

define i1 @vector..copy(ptr %this, ptr %rhs) {
entry:
  %i.4 = alloca i32
  %rhs.2 = alloca ptr
  store ptr %rhs, ptr %rhs.2
  %.result.132 = load ptr, ptr %rhs.2
  %.result.133 = icmp eq ptr %.result.132, null
  br i1 %.result.133, label %label_true_35, label %label_false_36
label_true_35:
  ret i1 false
  br label %label_skip_37
label_false_36:
  br label %label_skip_37
label_skip_37:
  %.result.134 = load ptr, ptr %rhs.2
  %.result.135 = call i32 @vector..getDim(ptr %.result.134)
  %.result.136 = icmp eq i32 %.result.135, 0
  br i1 %.result.136, label %label_true_38, label %label_false_39
label_true_38:
  %.result.137 = getelementptr ptr, ptr %this, i32 0
  store ptr null, ptr %.result.137
  br label %label_skip_40
label_false_39:
  %.result.138 = getelementptr ptr, ptr %this, i32 0
  %.result.139 = load ptr, ptr %rhs.2
  %.result.140 = call i32 @vector..getDim(ptr %.result.139)
  %.result.141 = call ptr @.malloc_array(i32 4, i32 %.result.140)
  store ptr %.result.141, ptr %.result.138
  store i32 0, ptr %i.4
  br label %label_loop_41
label_loop_41:
  %.result.142 = load i32, ptr %i.4
  %.result.143 = call i32 @getDim()
  %.result.144 = icmp slt i32 %.result.142, %.result.143
  br i1 %.result.144, label %label_body_43, label %label_skip_42
label_body_43:
  %.result.145 = getelementptr ptr, ptr %this, i32 0
  %.result.146 = load i32, ptr %i.4
  %.result.147 = getelementptr i32, ptr %.result.145, i32 %.result.146
  %.result.148 = load ptr, ptr %rhs.2
  %.result.149 = getelementptr %class.vector, ptr %.result.148, i32 0
  %.result.150 = getelementptr %class.vector, ptr %.result.149, i32 0
  %.result.151 = load ptr, ptr %.result.150
  %.result.152 = load i32, ptr %i.4
  %.result.153 = getelementptr i32, ptr %.result.151, i32 %.result.152
  %.result.154 = load i32, ptr %.result.153
  store i32 %.result.154, ptr %.result.147
  %.result.155 = load i32, ptr %i.4
  %.result.156 = add i32 %.result.155, 1
  store i32 %.result.156, ptr %i.4
  br label %label_loop_41
label_skip_42:
  br label %label_skip_40
label_skip_40:
  ret i1 true
}

define void @.init() {
entry:
  ret void
}
define i32 @main() {
entry:
  %x.1 = alloca ptr
  %a.1 = alloca ptr
  %i.1 = alloca i32
  %y.1 = alloca ptr
  call void @.init()
  %.result.157 = call ptr @.malloc(i32 4)
  %.result.158 = getelementptr ptr, ptr %.result.157, i32 0
  %.result.159 = call ptr @.malloc(i32 4)
  store ptr %.result.159, ptr %.result.158
  store ptr %.result.157, ptr %x.1
  %.result.160 = call ptr @.malloc_array(i32 4, i32 10)
  store ptr %.result.160, ptr %a.1
  store i32 0, ptr %i.1
  br label %label_loop_44
label_loop_44:
  %.result.161 = load i32, ptr %i.1
  %.result.162 = icmp slt i32 %.result.161, 10
  br i1 %.result.162, label %label_body_46, label %label_skip_45
label_body_46:
  %.result.163 = load ptr, ptr %a.1
  %.result.164 = load i32, ptr %i.1
  %.result.165 = getelementptr i32, ptr %.result.163, i32 %.result.164
  %.result.166 = load i32, ptr %i.1
  %.result.167 = sub i32 9, %.result.166
  store i32 %.result.167, ptr %.result.165
  %.result.168 = load i32, ptr %i.1
  %.result.169 = add i32 %.result.168, 1
  store i32 %.result.169, ptr %i.1
  br label %label_loop_44
label_skip_45:
  %.result.170 = load ptr, ptr %x.1
  %.result.171 = load ptr, ptr %a.1
  call void @vector..init(ptr %.result.170, ptr %.result.171)
  call void @print(ptr @.str.pre_3)
  %.result.172 = load ptr, ptr %x.1
  %.result.173 = call ptr @vector..tostring(ptr %.result.172)
  call void @println(ptr %.result.173)
  %.result.174 = call ptr @.malloc(i32 4)
  %.result.175 = getelementptr ptr, ptr %.result.174, i32 0
  %.result.176 = call ptr @.malloc(i32 4)
  store ptr %.result.176, ptr %.result.175
  store ptr %.result.174, ptr %y.1
  %.result.177 = load ptr, ptr %y.1
  %.result.178 = load ptr, ptr %x.1
  %.result.179 = call i1 @vector..copy(ptr %.result.177, ptr %.result.178)
  %.result.180 = load ptr, ptr %y.1
  %.result.181 = call i1 @vector..set(ptr %.result.180, i32 3, i32 817)
  br i1 %.result.181, label %label_true_47, label %label_false_48
label_true_47:
  call void @println(ptr @.str.pre_4)
  br label %label_skip_49
label_false_48:
  br label %label_skip_49
label_skip_49:
  call void @print(ptr @.str.pre_5)
  %.result.182 = load ptr, ptr %y.1
  %.result.183 = call ptr @vector..tostring(ptr %.result.182)
  call void @println(ptr %.result.183)
  call void @print(ptr @.str.pre_6)
  %.result.184 = load ptr, ptr %x.1
  %.result.185 = load ptr, ptr %y.1
  %.result.186 = call ptr @vector..add(ptr %.result.184, ptr %.result.185)
  %.result.187 = call ptr @vector..tostring(ptr %.result.186)
  call void @println(ptr %.result.187)
  call void @print(ptr @.str.pre_7)
  %.result.188 = load ptr, ptr %x.1
  %.result.189 = load ptr, ptr %y.1
  %.result.190 = call i32 @vector..dot(ptr %.result.188, ptr %.result.189)
  %.result.191 = call ptr @toString(i32 %.result.190)
  call void @println(ptr %.result.191)
  call void @print(ptr @.str.pre_8)
  %.result.192 = load ptr, ptr %y.1
  %.result.193 = shl i32 1, 3
  %.result.194 = call ptr @vector..scalarInPlaceMultiply(ptr %.result.192, i32 %.result.193)
  %.result.195 = call ptr @vector..tostring(ptr %.result.194)
  call void @println(ptr %.result.195)
  ret i32 0
}
