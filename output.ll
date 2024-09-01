@.str.pre_0 = private unnamed_addr constant [5 x i8] c"loop\00"
@.str.pre_1 = private unnamed_addr constant [9 x i8] c"4 finish\00"
@.str.pre_2 = private unnamed_addr constant [9 x i8] c"5 finish\00"
@.str.pre_3 = private unnamed_addr constant [9 x i8] c"6 finish\00"
@.str.pre_4 = private unnamed_addr constant [9 x i8] c"7 finish\00"
@.str.pre_5 = private unnamed_addr constant [2 x i8] c"?\00"
@.str.pre_6 = private unnamed_addr constant [2 x i8] c"?\00"
@.str.pre_7 = private unnamed_addr constant [9 x i8] c"8 finish\00"
@.str.pre_8 = private unnamed_addr constant [10 x i8] c"finish if\00"
@.str.pre_9 = private unnamed_addr constant [14 x i8] c"no solution!\0A\00"
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
define i1 @check(i32 %a, i32 %N) {
entry:
  %a.1.0 = alloca i32
  %N.1.0 = alloca i32
  %.result.0 = alloca i1
  store i32 %a, ptr %a.1.0
  store i32 %N, ptr %N.1.0
  %.result.1 = load i32, ptr %a.1.0
  %.result.2 = load i32, ptr %N.1.0
  %.result.3 = icmp slt i32 %.result.1, %.result.2
  store i1 %.result.3, ptr %.result.0
  br i1 %.result.3, label %label_logicT_0, label %label_logicF_1
label_logicT_0:
  %.result.4 = load i32, ptr %a.1.0
  %.result.5 = icmp sge i32 %.result.4, 0
  store i1 %.result.5, ptr %.result.0
  br label %label_logicF_1
label_logicF_1:
  %.result.6 = load i1, ptr %.result.0
  ret i1 %.result.6
}

define void @.init() {
entry:
  ret void
}
define i32 @main() {
entry:
  %N.1.0 = alloca i32
  %head.1.1 = alloca i32
  %startx.1.2 = alloca i32
  %starty.1.3 = alloca i32
  %targetx.1.4 = alloca i32
  %targety.1.5 = alloca i32
  %tail.1.6 = alloca i32
  %ok.1.7 = alloca i32
  %now.1.8 = alloca i32
  %x.1.9 = alloca i32
  %y.1.10 = alloca i32
  %xlist.1.11 = alloca ptr
  %ylist.1.12 = alloca ptr
  %step.1.13 = alloca ptr
  %i.1.14 = alloca i32
  %j.1.15 = alloca i32
  %.result.103 = alloca i1
  %.result.104 = alloca i1
  %.result.140 = alloca i1
  %.result.158 = alloca i1
  %.result.159 = alloca i1
  %.result.195 = alloca i1
  %.result.213 = alloca i1
  %.result.214 = alloca i1
  %.result.250 = alloca i1
  %.result.268 = alloca i1
  %.result.269 = alloca i1
  %.result.305 = alloca i1
  %.result.323 = alloca i1
  %.result.324 = alloca i1
  %.result.360 = alloca i1
  %.result.378 = alloca i1
  %.result.379 = alloca i1
  %.result.415 = alloca i1
  %.result.433 = alloca i1
  %.result.434 = alloca i1
  %.result.470 = alloca i1
  %.result.488 = alloca i1
  %.result.489 = alloca i1
  %.result.525 = alloca i1
  call void @.init()
  %.result.7 = call i32 @getInt()
  store i32 %.result.7, ptr %N.1.0
  store i32 0, ptr %head.1.1
  store i32 0, ptr %tail.1.6
  store i32 0, ptr %startx.1.2
  store i32 0, ptr %starty.1.3
  %.result.8 = load i32, ptr %N.1.0
  %.result.9 = sub i32 %.result.8, 1
  store i32 %.result.9, ptr %targetx.1.4
  %.result.10 = load i32, ptr %N.1.0
  %.result.11 = sub i32 %.result.10, 1
  store i32 %.result.11, ptr %targety.1.5
  store i32 0, ptr %x.1.9
  store i32 0, ptr %y.1.10
  store i32 0, ptr %now.1.8
  store i32 0, ptr %ok.1.7
  %.result.12 = load i32, ptr %N.1.0
  %.result.13 = load i32, ptr %N.1.0
  %.result.14 = mul i32 %.result.12, %.result.13
  %.result.15 = call ptr @.malloc_array(i32 4, i32 %.result.14)
  store ptr %.result.15, ptr %xlist.1.11
  store i32 0, ptr %i.1.14
  br label %label_loop_4
label_loop_4:
  %.result.16 = load i32, ptr %i.1.14
  %.result.17 = load i32, ptr %N.1.0
  %.result.18 = load i32, ptr %N.1.0
  %.result.19 = mul i32 %.result.17, %.result.18
  %.result.20 = icmp slt i32 %.result.16, %.result.19
  br i1 %.result.20, label %label_body_5, label %label_skip_3
label_step_2:
  %.result.21 = load i32, ptr %i.1.14
  %.result.22 = add i32 %.result.21, 1
  store i32 %.result.22, ptr %i.1.14
  br label %label_loop_4
label_body_5:
  %.result.23 = load ptr, ptr %xlist.1.11
  %.result.24 = load i32, ptr %i.1.14
  %.result.25 = getelementptr ptr, ptr %.result.23, i32 %.result.24
  store i32 0, ptr %.result.25
  br label %label_step_2
label_skip_3:
  %.result.26 = load i32, ptr %N.1.0
  %.result.27 = load i32, ptr %N.1.0
  %.result.28 = mul i32 %.result.26, %.result.27
  %.result.29 = call ptr @.malloc_array(i32 4, i32 %.result.28)
  store ptr %.result.29, ptr %ylist.1.12
  store i32 0, ptr %i.1.14
  br label %label_loop_8
label_loop_8:
  %.result.30 = load i32, ptr %i.1.14
  %.result.31 = load i32, ptr %N.1.0
  %.result.32 = load i32, ptr %N.1.0
  %.result.33 = mul i32 %.result.31, %.result.32
  %.result.34 = icmp slt i32 %.result.30, %.result.33
  br i1 %.result.34, label %label_body_9, label %label_skip_7
label_step_6:
  %.result.35 = load i32, ptr %i.1.14
  %.result.36 = add i32 %.result.35, 1
  store i32 %.result.36, ptr %i.1.14
  br label %label_loop_8
label_body_9:
  %.result.37 = load ptr, ptr %ylist.1.12
  %.result.38 = load i32, ptr %i.1.14
  %.result.39 = getelementptr ptr, ptr %.result.37, i32 %.result.38
  store i32 0, ptr %.result.39
  br label %label_step_6
label_skip_7:
  %.result.40 = load i32, ptr %N.1.0
  %.result.41 = call ptr @.malloc_array(i32 4, i32 %.result.40)
  store ptr %.result.41, ptr %step.1.13
  store i32 0, ptr %i.1.14
  br label %label_loop_12
label_loop_12:
  %.result.42 = load i32, ptr %i.1.14
  %.result.43 = load i32, ptr %N.1.0
  %.result.44 = icmp slt i32 %.result.42, %.result.43
  br i1 %.result.44, label %label_body_13, label %label_skip_11
label_step_10:
  %.result.45 = load i32, ptr %i.1.14
  %.result.46 = add i32 %.result.45, 1
  store i32 %.result.46, ptr %i.1.14
  br label %label_loop_12
label_body_13:
  %.result.47 = load ptr, ptr %step.1.13
  %.result.48 = load i32, ptr %i.1.14
  %.result.49 = getelementptr ptr, ptr %.result.47, i32 %.result.48
  %.result.50 = load i32, ptr %N.1.0
  %.result.51 = call ptr @.malloc_array(i32 4, i32 %.result.50)
  store ptr %.result.51, ptr %.result.49
  store i32 0, ptr %j.1.15
  br label %label_loop_16
label_loop_16:
  %.result.52 = load i32, ptr %j.1.15
  %.result.53 = load i32, ptr %N.1.0
  %.result.54 = icmp slt i32 %.result.52, %.result.53
  br i1 %.result.54, label %label_body_17, label %label_skip_15
label_step_14:
  %.result.55 = load i32, ptr %j.1.15
  %.result.56 = add i32 %.result.55, 1
  store i32 %.result.56, ptr %j.1.15
  br label %label_loop_16
label_body_17:
  %.result.57 = load ptr, ptr %step.1.13
  %.result.58 = load i32, ptr %i.1.14
  %.result.59 = getelementptr ptr, ptr %.result.57, i32 %.result.58
  %.result.60 = load ptr, ptr %.result.59
  %.result.61 = load i32, ptr %j.1.15
  %.result.62 = getelementptr ptr, ptr %.result.60, i32 %.result.61
  %.result.63 = sub i32 0, 1
  store i32 %.result.63, ptr %.result.62
  br label %label_step_14
label_skip_15:
  br label %label_step_10
label_skip_11:
  %.result.64 = load ptr, ptr %xlist.1.11
  %.result.65 = getelementptr ptr, ptr %.result.64, i32 0
  %.result.66 = load i32, ptr %startx.1.2
  store i32 %.result.66, ptr %.result.65
  %.result.67 = load ptr, ptr %ylist.1.12
  %.result.68 = getelementptr ptr, ptr %.result.67, i32 0
  %.result.69 = load i32, ptr %starty.1.3
  store i32 %.result.69, ptr %.result.68
  %.result.70 = load ptr, ptr %step.1.13
  %.result.71 = load i32, ptr %startx.1.2
  %.result.72 = getelementptr ptr, ptr %.result.70, i32 %.result.71
  %.result.73 = load ptr, ptr %.result.72
  %.result.74 = load i32, ptr %starty.1.3
  %.result.75 = getelementptr ptr, ptr %.result.73, i32 %.result.74
  store i32 0, ptr %.result.75
  br label %label_loop_18
label_loop_18:
  %.result.76 = load i32, ptr %head.1.1
  %.result.77 = load i32, ptr %tail.1.6
  %.result.78 = icmp sle i32 %.result.76, %.result.77
  br i1 %.result.78, label %label_body_20, label %label_skip_19
label_body_20:
  call void @print(ptr @.str.pre_0)
  %.result.79 = load i32, ptr %head.1.1
  call void @printlnInt(i32 %.result.79)
  %.result.80 = load ptr, ptr %step.1.13
  %.result.81 = load ptr, ptr %xlist.1.11
  %.result.82 = load i32, ptr %head.1.1
  %.result.83 = getelementptr ptr, ptr %.result.81, i32 %.result.82
  %.result.84 = load i32, ptr %.result.83
  %.result.85 = getelementptr ptr, ptr %.result.80, i32 %.result.84
  %.result.86 = load ptr, ptr %.result.85
  %.result.87 = load ptr, ptr %ylist.1.12
  %.result.88 = load i32, ptr %head.1.1
  %.result.89 = getelementptr ptr, ptr %.result.87, i32 %.result.88
  %.result.90 = load i32, ptr %.result.89
  %.result.91 = getelementptr ptr, ptr %.result.86, i32 %.result.90
  %.result.92 = load i32, ptr %.result.91
  store i32 %.result.92, ptr %now.1.8
  %.result.93 = load ptr, ptr %xlist.1.11
  %.result.94 = load i32, ptr %head.1.1
  %.result.95 = getelementptr ptr, ptr %.result.93, i32 %.result.94
  %.result.96 = load i32, ptr %.result.95
  %.result.97 = sub i32 %.result.96, 1
  store i32 %.result.97, ptr %x.1.9
  %.result.98 = load ptr, ptr %ylist.1.12
  %.result.99 = load i32, ptr %head.1.1
  %.result.100 = getelementptr ptr, ptr %.result.98, i32 %.result.99
  %.result.101 = load i32, ptr %.result.100
  %.result.102 = sub i32 %.result.101, 2
  store i32 %.result.102, ptr %y.1.10
  %.result.105 = load i32, ptr %x.1.9
  %.result.106 = load i32, ptr %N.1.0
  %.result.107 = call i1 @check(i32 %.result.105, i32 %.result.106)
  store i1 %.result.107, ptr %.result.104
  br i1 %.result.107, label %label_logicT_21, label %label_logicF_22
label_logicT_21:
  %.result.108 = load i32, ptr %y.1.10
  %.result.109 = load i32, ptr %N.1.0
  %.result.110 = call i1 @check(i32 %.result.108, i32 %.result.109)
  store i1 %.result.110, ptr %.result.104
  br label %label_logicF_22
label_logicF_22:
  %.result.111 = load i1, ptr %.result.104
  store i1 %.result.111, ptr %.result.103
  br i1 %.result.111, label %label_logicT_23, label %label_logicF_24
label_logicT_23:
  %.result.112 = load ptr, ptr %step.1.13
  %.result.113 = load i32, ptr %x.1.9
  %.result.114 = getelementptr ptr, ptr %.result.112, i32 %.result.113
  %.result.115 = load ptr, ptr %.result.114
  %.result.116 = load i32, ptr %y.1.10
  %.result.117 = getelementptr ptr, ptr %.result.115, i32 %.result.116
  %.result.118 = load i32, ptr %.result.117
  %.result.119 = sub i32 0, 1
  %.result.120 = icmp eq i32 %.result.118, %.result.119
  store i1 %.result.120, ptr %.result.103
  br label %label_logicF_24
label_logicF_24:
  %.result.121 = load i1, ptr %.result.103
  br i1 %.result.121, label %label_true_25, label %label_false_26
label_true_25:
  call void @printlnInt(i32 1)
  %.result.122 = load i32, ptr %tail.1.6
  %.result.123 = add i32 %.result.122, 1
  store i32 %.result.123, ptr %tail.1.6
  %.result.124 = load ptr, ptr %xlist.1.11
  %.result.125 = load i32, ptr %tail.1.6
  %.result.126 = getelementptr ptr, ptr %.result.124, i32 %.result.125
  %.result.127 = load i32, ptr %x.1.9
  store i32 %.result.127, ptr %.result.126
  %.result.128 = load ptr, ptr %ylist.1.12
  %.result.129 = load i32, ptr %tail.1.6
  %.result.130 = getelementptr ptr, ptr %.result.128, i32 %.result.129
  %.result.131 = load i32, ptr %y.1.10
  store i32 %.result.131, ptr %.result.130
  %.result.132 = load ptr, ptr %step.1.13
  %.result.133 = load i32, ptr %x.1.9
  %.result.134 = getelementptr ptr, ptr %.result.132, i32 %.result.133
  %.result.135 = load ptr, ptr %.result.134
  %.result.136 = load i32, ptr %y.1.10
  %.result.137 = getelementptr ptr, ptr %.result.135, i32 %.result.136
  %.result.138 = load i32, ptr %now.1.8
  %.result.139 = add i32 %.result.138, 1
  store i32 %.result.139, ptr %.result.137
  %.result.141 = load i32, ptr %x.1.9
  %.result.142 = load i32, ptr %targetx.1.4
  %.result.143 = icmp eq i32 %.result.141, %.result.142
  store i1 %.result.143, ptr %.result.140
  br i1 %.result.143, label %label_logicT_28, label %label_logicF_29
label_logicT_28:
  %.result.144 = load i32, ptr %y.1.10
  %.result.145 = load i32, ptr %targety.1.5
  %.result.146 = icmp eq i32 %.result.144, %.result.145
  store i1 %.result.146, ptr %.result.140
  br label %label_logicF_29
label_logicF_29:
  %.result.147 = load i1, ptr %.result.140
  br i1 %.result.147, label %label_true_30, label %label_false_31
label_true_30:
  store i32 1, ptr %ok.1.7
  br label %label_skip_32
label_false_31:
  br label %label_skip_32
label_skip_32:
  br label %label_skip_27
label_false_26:
  br label %label_skip_27
label_skip_27:
  %.result.148 = load ptr, ptr %xlist.1.11
  %.result.149 = load i32, ptr %head.1.1
  %.result.150 = getelementptr ptr, ptr %.result.148, i32 %.result.149
  %.result.151 = load i32, ptr %.result.150
  %.result.152 = sub i32 %.result.151, 1
  store i32 %.result.152, ptr %x.1.9
  %.result.153 = load ptr, ptr %ylist.1.12
  %.result.154 = load i32, ptr %head.1.1
  %.result.155 = getelementptr ptr, ptr %.result.153, i32 %.result.154
  %.result.156 = load i32, ptr %.result.155
  %.result.157 = add i32 %.result.156, 2
  store i32 %.result.157, ptr %y.1.10
  %.result.160 = load i32, ptr %x.1.9
  %.result.161 = load i32, ptr %N.1.0
  %.result.162 = call i1 @check(i32 %.result.160, i32 %.result.161)
  store i1 %.result.162, ptr %.result.159
  br i1 %.result.162, label %label_logicT_33, label %label_logicF_34
label_logicT_33:
  %.result.163 = load i32, ptr %y.1.10
  %.result.164 = load i32, ptr %N.1.0
  %.result.165 = call i1 @check(i32 %.result.163, i32 %.result.164)
  store i1 %.result.165, ptr %.result.159
  br label %label_logicF_34
label_logicF_34:
  %.result.166 = load i1, ptr %.result.159
  store i1 %.result.166, ptr %.result.158
  br i1 %.result.166, label %label_logicT_35, label %label_logicF_36
label_logicT_35:
  %.result.167 = load ptr, ptr %step.1.13
  %.result.168 = load i32, ptr %x.1.9
  %.result.169 = getelementptr ptr, ptr %.result.167, i32 %.result.168
  %.result.170 = load ptr, ptr %.result.169
  %.result.171 = load i32, ptr %y.1.10
  %.result.172 = getelementptr ptr, ptr %.result.170, i32 %.result.171
  %.result.173 = load i32, ptr %.result.172
  %.result.174 = sub i32 0, 1
  %.result.175 = icmp eq i32 %.result.173, %.result.174
  store i1 %.result.175, ptr %.result.158
  br label %label_logicF_36
label_logicF_36:
  %.result.176 = load i1, ptr %.result.158
  br i1 %.result.176, label %label_true_37, label %label_false_38
label_true_37:
  call void @printlnInt(i32 2)
  %.result.177 = load i32, ptr %tail.1.6
  %.result.178 = add i32 %.result.177, 1
  store i32 %.result.178, ptr %tail.1.6
  %.result.179 = load ptr, ptr %xlist.1.11
  %.result.180 = load i32, ptr %tail.1.6
  %.result.181 = getelementptr ptr, ptr %.result.179, i32 %.result.180
  %.result.182 = load i32, ptr %x.1.9
  store i32 %.result.182, ptr %.result.181
  %.result.183 = load ptr, ptr %ylist.1.12
  %.result.184 = load i32, ptr %tail.1.6
  %.result.185 = getelementptr ptr, ptr %.result.183, i32 %.result.184
  %.result.186 = load i32, ptr %y.1.10
  store i32 %.result.186, ptr %.result.185
  %.result.187 = load ptr, ptr %step.1.13
  %.result.188 = load i32, ptr %x.1.9
  %.result.189 = getelementptr ptr, ptr %.result.187, i32 %.result.188
  %.result.190 = load ptr, ptr %.result.189
  %.result.191 = load i32, ptr %y.1.10
  %.result.192 = getelementptr ptr, ptr %.result.190, i32 %.result.191
  %.result.193 = load i32, ptr %now.1.8
  %.result.194 = add i32 %.result.193, 1
  store i32 %.result.194, ptr %.result.192
  %.result.196 = load i32, ptr %x.1.9
  %.result.197 = load i32, ptr %targetx.1.4
  %.result.198 = icmp eq i32 %.result.196, %.result.197
  store i1 %.result.198, ptr %.result.195
  br i1 %.result.198, label %label_logicT_40, label %label_logicF_41
label_logicT_40:
  %.result.199 = load i32, ptr %y.1.10
  %.result.200 = load i32, ptr %targety.1.5
  %.result.201 = icmp eq i32 %.result.199, %.result.200
  store i1 %.result.201, ptr %.result.195
  br label %label_logicF_41
label_logicF_41:
  %.result.202 = load i1, ptr %.result.195
  br i1 %.result.202, label %label_true_42, label %label_false_43
label_true_42:
  store i32 1, ptr %ok.1.7
  br label %label_skip_44
label_false_43:
  br label %label_skip_44
label_skip_44:
  br label %label_skip_39
label_false_38:
  br label %label_skip_39
label_skip_39:
  %.result.203 = load ptr, ptr %xlist.1.11
  %.result.204 = load i32, ptr %head.1.1
  %.result.205 = getelementptr ptr, ptr %.result.203, i32 %.result.204
  %.result.206 = load i32, ptr %.result.205
  %.result.207 = add i32 %.result.206, 1
  store i32 %.result.207, ptr %x.1.9
  %.result.208 = load ptr, ptr %ylist.1.12
  %.result.209 = load i32, ptr %head.1.1
  %.result.210 = getelementptr ptr, ptr %.result.208, i32 %.result.209
  %.result.211 = load i32, ptr %.result.210
  %.result.212 = sub i32 %.result.211, 2
  store i32 %.result.212, ptr %y.1.10
  %.result.215 = load i32, ptr %x.1.9
  %.result.216 = load i32, ptr %N.1.0
  %.result.217 = call i1 @check(i32 %.result.215, i32 %.result.216)
  store i1 %.result.217, ptr %.result.214
  br i1 %.result.217, label %label_logicT_45, label %label_logicF_46
label_logicT_45:
  %.result.218 = load i32, ptr %y.1.10
  %.result.219 = load i32, ptr %N.1.0
  %.result.220 = call i1 @check(i32 %.result.218, i32 %.result.219)
  store i1 %.result.220, ptr %.result.214
  br label %label_logicF_46
label_logicF_46:
  %.result.221 = load i1, ptr %.result.214
  store i1 %.result.221, ptr %.result.213
  br i1 %.result.221, label %label_logicT_47, label %label_logicF_48
label_logicT_47:
  %.result.222 = load ptr, ptr %step.1.13
  %.result.223 = load i32, ptr %x.1.9
  %.result.224 = getelementptr ptr, ptr %.result.222, i32 %.result.223
  %.result.225 = load ptr, ptr %.result.224
  %.result.226 = load i32, ptr %y.1.10
  %.result.227 = getelementptr ptr, ptr %.result.225, i32 %.result.226
  %.result.228 = load i32, ptr %.result.227
  %.result.229 = sub i32 0, 1
  %.result.230 = icmp eq i32 %.result.228, %.result.229
  store i1 %.result.230, ptr %.result.213
  br label %label_logicF_48
label_logicF_48:
  %.result.231 = load i1, ptr %.result.213
  br i1 %.result.231, label %label_true_49, label %label_false_50
label_true_49:
  call void @printlnInt(i32 3)
  %.result.232 = load i32, ptr %tail.1.6
  %.result.233 = add i32 %.result.232, 1
  store i32 %.result.233, ptr %tail.1.6
  %.result.234 = load ptr, ptr %xlist.1.11
  %.result.235 = load i32, ptr %tail.1.6
  %.result.236 = getelementptr ptr, ptr %.result.234, i32 %.result.235
  %.result.237 = load i32, ptr %x.1.9
  store i32 %.result.237, ptr %.result.236
  %.result.238 = load ptr, ptr %ylist.1.12
  %.result.239 = load i32, ptr %tail.1.6
  %.result.240 = getelementptr ptr, ptr %.result.238, i32 %.result.239
  %.result.241 = load i32, ptr %y.1.10
  store i32 %.result.241, ptr %.result.240
  %.result.242 = load ptr, ptr %step.1.13
  %.result.243 = load i32, ptr %x.1.9
  %.result.244 = getelementptr ptr, ptr %.result.242, i32 %.result.243
  %.result.245 = load ptr, ptr %.result.244
  %.result.246 = load i32, ptr %y.1.10
  %.result.247 = getelementptr ptr, ptr %.result.245, i32 %.result.246
  %.result.248 = load i32, ptr %now.1.8
  %.result.249 = add i32 %.result.248, 1
  store i32 %.result.249, ptr %.result.247
  %.result.251 = load i32, ptr %x.1.9
  %.result.252 = load i32, ptr %targetx.1.4
  %.result.253 = icmp eq i32 %.result.251, %.result.252
  store i1 %.result.253, ptr %.result.250
  br i1 %.result.253, label %label_logicT_52, label %label_logicF_53
label_logicT_52:
  %.result.254 = load i32, ptr %y.1.10
  %.result.255 = load i32, ptr %targety.1.5
  %.result.256 = icmp eq i32 %.result.254, %.result.255
  store i1 %.result.256, ptr %.result.250
  br label %label_logicF_53
label_logicF_53:
  %.result.257 = load i1, ptr %.result.250
  br i1 %.result.257, label %label_true_54, label %label_false_55
label_true_54:
  store i32 1, ptr %ok.1.7
  br label %label_skip_56
label_false_55:
  br label %label_skip_56
label_skip_56:
  br label %label_skip_51
label_false_50:
  br label %label_skip_51
label_skip_51:
  %.result.258 = load ptr, ptr %xlist.1.11
  %.result.259 = load i32, ptr %head.1.1
  %.result.260 = getelementptr ptr, ptr %.result.258, i32 %.result.259
  %.result.261 = load i32, ptr %.result.260
  %.result.262 = add i32 %.result.261, 1
  store i32 %.result.262, ptr %x.1.9
  %.result.263 = load ptr, ptr %ylist.1.12
  %.result.264 = load i32, ptr %head.1.1
  %.result.265 = getelementptr ptr, ptr %.result.263, i32 %.result.264
  %.result.266 = load i32, ptr %.result.265
  %.result.267 = add i32 %.result.266, 2
  store i32 %.result.267, ptr %y.1.10
  %.result.270 = load i32, ptr %x.1.9
  %.result.271 = load i32, ptr %N.1.0
  %.result.272 = call i1 @check(i32 %.result.270, i32 %.result.271)
  store i1 %.result.272, ptr %.result.269
  br i1 %.result.272, label %label_logicT_57, label %label_logicF_58
label_logicT_57:
  %.result.273 = load i32, ptr %y.1.10
  %.result.274 = load i32, ptr %N.1.0
  %.result.275 = call i1 @check(i32 %.result.273, i32 %.result.274)
  store i1 %.result.275, ptr %.result.269
  br label %label_logicF_58
label_logicF_58:
  %.result.276 = load i1, ptr %.result.269
  store i1 %.result.276, ptr %.result.268
  br i1 %.result.276, label %label_logicT_59, label %label_logicF_60
label_logicT_59:
  %.result.277 = load ptr, ptr %step.1.13
  %.result.278 = load i32, ptr %x.1.9
  %.result.279 = getelementptr ptr, ptr %.result.277, i32 %.result.278
  %.result.280 = load ptr, ptr %.result.279
  %.result.281 = load i32, ptr %y.1.10
  %.result.282 = getelementptr ptr, ptr %.result.280, i32 %.result.281
  %.result.283 = load i32, ptr %.result.282
  %.result.284 = sub i32 0, 1
  %.result.285 = icmp eq i32 %.result.283, %.result.284
  store i1 %.result.285, ptr %.result.268
  br label %label_logicF_60
label_logicF_60:
  %.result.286 = load i1, ptr %.result.268
  br i1 %.result.286, label %label_true_61, label %label_false_62
label_true_61:
  call void @printlnInt(i32 4)
  %.result.287 = load i32, ptr %tail.1.6
  %.result.288 = add i32 %.result.287, 1
  store i32 %.result.288, ptr %tail.1.6
  %.result.289 = load ptr, ptr %xlist.1.11
  %.result.290 = load i32, ptr %tail.1.6
  %.result.291 = getelementptr ptr, ptr %.result.289, i32 %.result.290
  %.result.292 = load i32, ptr %x.1.9
  store i32 %.result.292, ptr %.result.291
  %.result.293 = load ptr, ptr %ylist.1.12
  %.result.294 = load i32, ptr %tail.1.6
  %.result.295 = getelementptr ptr, ptr %.result.293, i32 %.result.294
  %.result.296 = load i32, ptr %y.1.10
  store i32 %.result.296, ptr %.result.295
  %.result.297 = load ptr, ptr %step.1.13
  %.result.298 = load i32, ptr %x.1.9
  %.result.299 = getelementptr ptr, ptr %.result.297, i32 %.result.298
  %.result.300 = load ptr, ptr %.result.299
  %.result.301 = load i32, ptr %y.1.10
  %.result.302 = getelementptr ptr, ptr %.result.300, i32 %.result.301
  %.result.303 = load i32, ptr %now.1.8
  %.result.304 = add i32 %.result.303, 1
  store i32 %.result.304, ptr %.result.302
  %.result.306 = load i32, ptr %x.1.9
  %.result.307 = load i32, ptr %targetx.1.4
  %.result.308 = icmp eq i32 %.result.306, %.result.307
  store i1 %.result.308, ptr %.result.305
  br i1 %.result.308, label %label_logicT_64, label %label_logicF_65
label_logicT_64:
  %.result.309 = load i32, ptr %y.1.10
  %.result.310 = load i32, ptr %targety.1.5
  %.result.311 = icmp eq i32 %.result.309, %.result.310
  store i1 %.result.311, ptr %.result.305
  br label %label_logicF_65
label_logicF_65:
  %.result.312 = load i1, ptr %.result.305
  br i1 %.result.312, label %label_true_66, label %label_false_67
label_true_66:
  store i32 1, ptr %ok.1.7
  br label %label_skip_68
label_false_67:
  br label %label_skip_68
label_skip_68:
  br label %label_skip_63
label_false_62:
  br label %label_skip_63
label_skip_63:
  call void @println(ptr @.str.pre_1)
  %.result.313 = load ptr, ptr %xlist.1.11
  %.result.314 = load i32, ptr %head.1.1
  %.result.315 = getelementptr ptr, ptr %.result.313, i32 %.result.314
  %.result.316 = load i32, ptr %.result.315
  %.result.317 = sub i32 %.result.316, 2
  store i32 %.result.317, ptr %x.1.9
  %.result.318 = load ptr, ptr %ylist.1.12
  %.result.319 = load i32, ptr %head.1.1
  %.result.320 = getelementptr ptr, ptr %.result.318, i32 %.result.319
  %.result.321 = load i32, ptr %.result.320
  %.result.322 = sub i32 %.result.321, 1
  store i32 %.result.322, ptr %y.1.10
  %.result.325 = load i32, ptr %x.1.9
  %.result.326 = load i32, ptr %N.1.0
  %.result.327 = call i1 @check(i32 %.result.325, i32 %.result.326)
  store i1 %.result.327, ptr %.result.324
  br i1 %.result.327, label %label_logicT_69, label %label_logicF_70
label_logicT_69:
  %.result.328 = load i32, ptr %y.1.10
  %.result.329 = load i32, ptr %N.1.0
  %.result.330 = call i1 @check(i32 %.result.328, i32 %.result.329)
  store i1 %.result.330, ptr %.result.324
  br label %label_logicF_70
label_logicF_70:
  %.result.331 = load i1, ptr %.result.324
  store i1 %.result.331, ptr %.result.323
  br i1 %.result.331, label %label_logicT_71, label %label_logicF_72
label_logicT_71:
  %.result.332 = load ptr, ptr %step.1.13
  %.result.333 = load i32, ptr %x.1.9
  %.result.334 = getelementptr ptr, ptr %.result.332, i32 %.result.333
  %.result.335 = load ptr, ptr %.result.334
  %.result.336 = load i32, ptr %y.1.10
  %.result.337 = getelementptr ptr, ptr %.result.335, i32 %.result.336
  %.result.338 = load i32, ptr %.result.337
  %.result.339 = sub i32 0, 1
  %.result.340 = icmp eq i32 %.result.338, %.result.339
  store i1 %.result.340, ptr %.result.323
  br label %label_logicF_72
label_logicF_72:
  %.result.341 = load i1, ptr %.result.323
  br i1 %.result.341, label %label_true_73, label %label_false_74
label_true_73:
  call void @printlnInt(i32 5)
  %.result.342 = load i32, ptr %tail.1.6
  %.result.343 = add i32 %.result.342, 1
  store i32 %.result.343, ptr %tail.1.6
  %.result.344 = load ptr, ptr %xlist.1.11
  %.result.345 = load i32, ptr %tail.1.6
  %.result.346 = getelementptr ptr, ptr %.result.344, i32 %.result.345
  %.result.347 = load i32, ptr %x.1.9
  store i32 %.result.347, ptr %.result.346
  %.result.348 = load ptr, ptr %ylist.1.12
  %.result.349 = load i32, ptr %tail.1.6
  %.result.350 = getelementptr ptr, ptr %.result.348, i32 %.result.349
  %.result.351 = load i32, ptr %y.1.10
  store i32 %.result.351, ptr %.result.350
  %.result.352 = load ptr, ptr %step.1.13
  %.result.353 = load i32, ptr %x.1.9
  %.result.354 = getelementptr ptr, ptr %.result.352, i32 %.result.353
  %.result.355 = load ptr, ptr %.result.354
  %.result.356 = load i32, ptr %y.1.10
  %.result.357 = getelementptr ptr, ptr %.result.355, i32 %.result.356
  %.result.358 = load i32, ptr %now.1.8
  %.result.359 = add i32 %.result.358, 1
  store i32 %.result.359, ptr %.result.357
  %.result.361 = load i32, ptr %x.1.9
  %.result.362 = load i32, ptr %targetx.1.4
  %.result.363 = icmp eq i32 %.result.361, %.result.362
  store i1 %.result.363, ptr %.result.360
  br i1 %.result.363, label %label_logicT_76, label %label_logicF_77
label_logicT_76:
  %.result.364 = load i32, ptr %y.1.10
  %.result.365 = load i32, ptr %targety.1.5
  %.result.366 = icmp eq i32 %.result.364, %.result.365
  store i1 %.result.366, ptr %.result.360
  br label %label_logicF_77
label_logicF_77:
  %.result.367 = load i1, ptr %.result.360
  br i1 %.result.367, label %label_true_78, label %label_false_79
label_true_78:
  store i32 1, ptr %ok.1.7
  br label %label_skip_80
label_false_79:
  br label %label_skip_80
label_skip_80:
  br label %label_skip_75
label_false_74:
  br label %label_skip_75
label_skip_75:
  call void @println(ptr @.str.pre_2)
  %.result.368 = load ptr, ptr %xlist.1.11
  %.result.369 = load i32, ptr %head.1.1
  %.result.370 = getelementptr ptr, ptr %.result.368, i32 %.result.369
  %.result.371 = load i32, ptr %.result.370
  %.result.372 = sub i32 %.result.371, 2
  store i32 %.result.372, ptr %x.1.9
  %.result.373 = load ptr, ptr %ylist.1.12
  %.result.374 = load i32, ptr %head.1.1
  %.result.375 = getelementptr ptr, ptr %.result.373, i32 %.result.374
  %.result.376 = load i32, ptr %.result.375
  %.result.377 = add i32 %.result.376, 1
  store i32 %.result.377, ptr %y.1.10
  %.result.380 = load i32, ptr %x.1.9
  %.result.381 = load i32, ptr %N.1.0
  %.result.382 = call i1 @check(i32 %.result.380, i32 %.result.381)
  store i1 %.result.382, ptr %.result.379
  br i1 %.result.382, label %label_logicT_81, label %label_logicF_82
label_logicT_81:
  %.result.383 = load i32, ptr %y.1.10
  %.result.384 = load i32, ptr %N.1.0
  %.result.385 = call i1 @check(i32 %.result.383, i32 %.result.384)
  store i1 %.result.385, ptr %.result.379
  br label %label_logicF_82
label_logicF_82:
  %.result.386 = load i1, ptr %.result.379
  store i1 %.result.386, ptr %.result.378
  br i1 %.result.386, label %label_logicT_83, label %label_logicF_84
label_logicT_83:
  %.result.387 = load ptr, ptr %step.1.13
  %.result.388 = load i32, ptr %x.1.9
  %.result.389 = getelementptr ptr, ptr %.result.387, i32 %.result.388
  %.result.390 = load ptr, ptr %.result.389
  %.result.391 = load i32, ptr %y.1.10
  %.result.392 = getelementptr ptr, ptr %.result.390, i32 %.result.391
  %.result.393 = load i32, ptr %.result.392
  %.result.394 = sub i32 0, 1
  %.result.395 = icmp eq i32 %.result.393, %.result.394
  store i1 %.result.395, ptr %.result.378
  br label %label_logicF_84
label_logicF_84:
  %.result.396 = load i1, ptr %.result.378
  br i1 %.result.396, label %label_true_85, label %label_false_86
label_true_85:
  call void @printlnInt(i32 6)
  %.result.397 = load i32, ptr %tail.1.6
  %.result.398 = add i32 %.result.397, 1
  store i32 %.result.398, ptr %tail.1.6
  %.result.399 = load ptr, ptr %xlist.1.11
  %.result.400 = load i32, ptr %tail.1.6
  %.result.401 = getelementptr ptr, ptr %.result.399, i32 %.result.400
  %.result.402 = load i32, ptr %x.1.9
  store i32 %.result.402, ptr %.result.401
  %.result.403 = load ptr, ptr %ylist.1.12
  %.result.404 = load i32, ptr %tail.1.6
  %.result.405 = getelementptr ptr, ptr %.result.403, i32 %.result.404
  %.result.406 = load i32, ptr %y.1.10
  store i32 %.result.406, ptr %.result.405
  %.result.407 = load ptr, ptr %step.1.13
  %.result.408 = load i32, ptr %x.1.9
  %.result.409 = getelementptr ptr, ptr %.result.407, i32 %.result.408
  %.result.410 = load ptr, ptr %.result.409
  %.result.411 = load i32, ptr %y.1.10
  %.result.412 = getelementptr ptr, ptr %.result.410, i32 %.result.411
  %.result.413 = load i32, ptr %now.1.8
  %.result.414 = add i32 %.result.413, 1
  store i32 %.result.414, ptr %.result.412
  %.result.416 = load i32, ptr %x.1.9
  %.result.417 = load i32, ptr %targetx.1.4
  %.result.418 = icmp eq i32 %.result.416, %.result.417
  store i1 %.result.418, ptr %.result.415
  br i1 %.result.418, label %label_logicT_88, label %label_logicF_89
label_logicT_88:
  %.result.419 = load i32, ptr %y.1.10
  %.result.420 = load i32, ptr %targety.1.5
  %.result.421 = icmp eq i32 %.result.419, %.result.420
  store i1 %.result.421, ptr %.result.415
  br label %label_logicF_89
label_logicF_89:
  %.result.422 = load i1, ptr %.result.415
  br i1 %.result.422, label %label_true_90, label %label_false_91
label_true_90:
  store i32 1, ptr %ok.1.7
  br label %label_skip_92
label_false_91:
  br label %label_skip_92
label_skip_92:
  br label %label_skip_87
label_false_86:
  br label %label_skip_87
label_skip_87:
  call void @println(ptr @.str.pre_3)
  %.result.423 = load ptr, ptr %xlist.1.11
  %.result.424 = load i32, ptr %head.1.1
  %.result.425 = getelementptr ptr, ptr %.result.423, i32 %.result.424
  %.result.426 = load i32, ptr %.result.425
  %.result.427 = add i32 %.result.426, 2
  store i32 %.result.427, ptr %x.1.9
  %.result.428 = load ptr, ptr %ylist.1.12
  %.result.429 = load i32, ptr %head.1.1
  %.result.430 = getelementptr ptr, ptr %.result.428, i32 %.result.429
  %.result.431 = load i32, ptr %.result.430
  %.result.432 = sub i32 %.result.431, 1
  store i32 %.result.432, ptr %y.1.10
  %.result.435 = load i32, ptr %x.1.9
  %.result.436 = load i32, ptr %N.1.0
  %.result.437 = call i1 @check(i32 %.result.435, i32 %.result.436)
  store i1 %.result.437, ptr %.result.434
  br i1 %.result.437, label %label_logicT_93, label %label_logicF_94
label_logicT_93:
  %.result.438 = load i32, ptr %y.1.10
  %.result.439 = load i32, ptr %N.1.0
  %.result.440 = call i1 @check(i32 %.result.438, i32 %.result.439)
  store i1 %.result.440, ptr %.result.434
  br label %label_logicF_94
label_logicF_94:
  %.result.441 = load i1, ptr %.result.434
  store i1 %.result.441, ptr %.result.433
  br i1 %.result.441, label %label_logicT_95, label %label_logicF_96
label_logicT_95:
  %.result.442 = load ptr, ptr %step.1.13
  %.result.443 = load i32, ptr %x.1.9
  %.result.444 = getelementptr ptr, ptr %.result.442, i32 %.result.443
  %.result.445 = load ptr, ptr %.result.444
  %.result.446 = load i32, ptr %y.1.10
  %.result.447 = getelementptr ptr, ptr %.result.445, i32 %.result.446
  %.result.448 = load i32, ptr %.result.447
  %.result.449 = sub i32 0, 1
  %.result.450 = icmp eq i32 %.result.448, %.result.449
  store i1 %.result.450, ptr %.result.433
  br label %label_logicF_96
label_logicF_96:
  %.result.451 = load i1, ptr %.result.433
  br i1 %.result.451, label %label_true_97, label %label_false_98
label_true_97:
  call void @printlnInt(i32 7)
  %.result.452 = load i32, ptr %tail.1.6
  %.result.453 = add i32 %.result.452, 1
  store i32 %.result.453, ptr %tail.1.6
  %.result.454 = load ptr, ptr %xlist.1.11
  %.result.455 = load i32, ptr %tail.1.6
  %.result.456 = getelementptr ptr, ptr %.result.454, i32 %.result.455
  %.result.457 = load i32, ptr %x.1.9
  store i32 %.result.457, ptr %.result.456
  %.result.458 = load ptr, ptr %ylist.1.12
  %.result.459 = load i32, ptr %tail.1.6
  %.result.460 = getelementptr ptr, ptr %.result.458, i32 %.result.459
  %.result.461 = load i32, ptr %y.1.10
  store i32 %.result.461, ptr %.result.460
  %.result.462 = load ptr, ptr %step.1.13
  %.result.463 = load i32, ptr %x.1.9
  %.result.464 = getelementptr ptr, ptr %.result.462, i32 %.result.463
  %.result.465 = load ptr, ptr %.result.464
  %.result.466 = load i32, ptr %y.1.10
  %.result.467 = getelementptr ptr, ptr %.result.465, i32 %.result.466
  %.result.468 = load i32, ptr %now.1.8
  %.result.469 = add i32 %.result.468, 1
  store i32 %.result.469, ptr %.result.467
  %.result.471 = load i32, ptr %x.1.9
  %.result.472 = load i32, ptr %targetx.1.4
  %.result.473 = icmp eq i32 %.result.471, %.result.472
  store i1 %.result.473, ptr %.result.470
  br i1 %.result.473, label %label_logicT_100, label %label_logicF_101
label_logicT_100:
  %.result.474 = load i32, ptr %y.1.10
  %.result.475 = load i32, ptr %targety.1.5
  %.result.476 = icmp eq i32 %.result.474, %.result.475
  store i1 %.result.476, ptr %.result.470
  br label %label_logicF_101
label_logicF_101:
  %.result.477 = load i1, ptr %.result.470
  br i1 %.result.477, label %label_true_102, label %label_false_103
label_true_102:
  store i32 1, ptr %ok.1.7
  br label %label_skip_104
label_false_103:
  br label %label_skip_104
label_skip_104:
  br label %label_skip_99
label_false_98:
  br label %label_skip_99
label_skip_99:
  call void @println(ptr @.str.pre_4)
  %.result.478 = load ptr, ptr %xlist.1.11
  %.result.479 = load i32, ptr %head.1.1
  %.result.480 = getelementptr ptr, ptr %.result.478, i32 %.result.479
  %.result.481 = load i32, ptr %.result.480
  %.result.482 = add i32 %.result.481, 2
  store i32 %.result.482, ptr %x.1.9
  call void @println(ptr @.str.pre_5)
  %.result.483 = load ptr, ptr %ylist.1.12
  %.result.484 = load i32, ptr %head.1.1
  %.result.485 = getelementptr ptr, ptr %.result.483, i32 %.result.484
  %.result.486 = load i32, ptr %.result.485
  %.result.487 = add i32 %.result.486, 1
  store i32 %.result.487, ptr %y.1.10
  call void @println(ptr @.str.pre_6)
  %.result.490 = load i32, ptr %x.1.9
  %.result.491 = load i32, ptr %N.1.0
  %.result.492 = call i1 @check(i32 %.result.490, i32 %.result.491)
  store i1 %.result.492, ptr %.result.489
  br i1 %.result.492, label %label_logicT_105, label %label_logicF_106
label_logicT_105:
  %.result.493 = load i32, ptr %y.1.10
  %.result.494 = load i32, ptr %N.1.0
  %.result.495 = call i1 @check(i32 %.result.493, i32 %.result.494)
  store i1 %.result.495, ptr %.result.489
  br label %label_logicF_106
label_logicF_106:
  %.result.496 = load i1, ptr %.result.489
  store i1 %.result.496, ptr %.result.488
  br i1 %.result.496, label %label_logicT_107, label %label_logicF_108
label_logicT_107:
  %.result.497 = load ptr, ptr %step.1.13
  %.result.498 = load i32, ptr %x.1.9
  %.result.499 = getelementptr ptr, ptr %.result.497, i32 %.result.498
  %.result.500 = load ptr, ptr %.result.499
  %.result.501 = load i32, ptr %y.1.10
  %.result.502 = getelementptr ptr, ptr %.result.500, i32 %.result.501
  %.result.503 = load i32, ptr %.result.502
  %.result.504 = sub i32 0, 1
  %.result.505 = icmp eq i32 %.result.503, %.result.504
  store i1 %.result.505, ptr %.result.488
  br label %label_logicF_108
label_logicF_108:
  %.result.506 = load i1, ptr %.result.488
  br i1 %.result.506, label %label_true_109, label %label_false_110
label_true_109:
  call void @printlnInt(i32 8)
  %.result.507 = load i32, ptr %tail.1.6
  %.result.508 = add i32 %.result.507, 1
  store i32 %.result.508, ptr %tail.1.6
  %.result.509 = load ptr, ptr %xlist.1.11
  %.result.510 = load i32, ptr %tail.1.6
  %.result.511 = getelementptr ptr, ptr %.result.509, i32 %.result.510
  %.result.512 = load i32, ptr %x.1.9
  store i32 %.result.512, ptr %.result.511
  %.result.513 = load ptr, ptr %ylist.1.12
  %.result.514 = load i32, ptr %tail.1.6
  %.result.515 = getelementptr ptr, ptr %.result.513, i32 %.result.514
  %.result.516 = load i32, ptr %y.1.10
  store i32 %.result.516, ptr %.result.515
  %.result.517 = load ptr, ptr %step.1.13
  %.result.518 = load i32, ptr %x.1.9
  %.result.519 = getelementptr ptr, ptr %.result.517, i32 %.result.518
  %.result.520 = load ptr, ptr %.result.519
  %.result.521 = load i32, ptr %y.1.10
  %.result.522 = getelementptr ptr, ptr %.result.520, i32 %.result.521
  %.result.523 = load i32, ptr %now.1.8
  %.result.524 = add i32 %.result.523, 1
  store i32 %.result.524, ptr %.result.522
  %.result.526 = load i32, ptr %x.1.9
  %.result.527 = load i32, ptr %targetx.1.4
  %.result.528 = icmp eq i32 %.result.526, %.result.527
  store i1 %.result.528, ptr %.result.525
  br i1 %.result.528, label %label_logicT_112, label %label_logicF_113
label_logicT_112:
  %.result.529 = load i32, ptr %y.1.10
  %.result.530 = load i32, ptr %targety.1.5
  %.result.531 = icmp eq i32 %.result.529, %.result.530
  store i1 %.result.531, ptr %.result.525
  br label %label_logicF_113
label_logicF_113:
  %.result.532 = load i1, ptr %.result.525
  br i1 %.result.532, label %label_true_114, label %label_false_115
label_true_114:
  store i32 1, ptr %ok.1.7
  br label %label_skip_116
label_false_115:
  br label %label_skip_116
label_skip_116:
  br label %label_skip_111
label_false_110:
  br label %label_skip_111
label_skip_111:
  call void @println(ptr @.str.pre_7)
  call void @println(ptr @.str.pre_8)
  %.result.533 = load i32, ptr %ok.1.7
  %.result.534 = icmp eq i32 %.result.533, 1
  br i1 %.result.534, label %label_true_117, label %label_false_118
label_true_117:
  br label %label_skip_19
  br label %label_skip_119
label_false_118:
  br label %label_skip_119
label_skip_119:
  %.result.535 = load i32, ptr %head.1.1
  %.result.536 = add i32 %.result.535, 1
  store i32 %.result.536, ptr %head.1.1
  br label %label_loop_18
label_skip_19:
  %.result.537 = load i32, ptr %ok.1.7
  %.result.538 = icmp eq i32 %.result.537, 1
  br i1 %.result.538, label %label_true_120, label %label_false_121
label_true_120:
  %.result.539 = load ptr, ptr %step.1.13
  %.result.540 = load i32, ptr %targetx.1.4
  %.result.541 = getelementptr ptr, ptr %.result.539, i32 %.result.540
  %.result.542 = load ptr, ptr %.result.541
  %.result.543 = load i32, ptr %targety.1.5
  %.result.544 = getelementptr ptr, ptr %.result.542, i32 %.result.543
  %.result.545 = load i32, ptr %.result.544
  %.result.546 = call ptr @toString(i32 %.result.545)
  call void @println(ptr %.result.546)
  br label %label_skip_122
label_false_121:
  call void @print(ptr @.str.pre_9)
  br label %label_skip_122
label_skip_122:
  ret i32 0
}
