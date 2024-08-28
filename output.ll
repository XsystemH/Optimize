@.str.pre_0 = private unnamed_addr constant [2 x i8] c"h\00"
@.str.pre_1 = private unnamed_addr constant [2 x i8] c"t\00"
@.str.pre_2 = private unnamed_addr constant [2 x i8] c" \00"
@.str.pre_3 = private unnamed_addr constant [2 x i8] c"?\00"
@.str.pre_4 = private unnamed_addr constant [2 x i8] c"2\00"
@.str.pre_5 = private unnamed_addr constant [15 x i8] c"no solution!\n\00"
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
  %a.1 = alloca i32
  store i32 %a, ptr %a.1
  %N.1 = alloca i32
  store i32 %N, ptr %N.1
  %.result.0 = alloca i1
  %.result.1 = load i32, ptr %a.1
  %.result.2 = load i32, ptr %N.1
  %.result.3 = icmp slt i32 %.result.1, %.result.2
  store i1 %.result.3, ptr %.result.0
  br i1 %.result.3, label %label_logicT_0, label %label_logicF_1
label_logicT_0:
  %.result.4 = load i32, ptr %a.1
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
  call void @.init()
  %N.1 = alloca i32
  %head.1 = alloca i32
  %startx.1 = alloca i32
  %starty.1 = alloca i32
  %targetx.1 = alloca i32
  %targety.1 = alloca i32
  %tail.1 = alloca i32
  %ok.1 = alloca i32
  %now.1 = alloca i32
  %x.1 = alloca i32
  %y.1 = alloca i32
  %xlist.1 = alloca ptr
  %ylist.1 = alloca ptr
  %step.1 = alloca ptr
  %i.1 = alloca i32
  %j.1 = alloca i32
  %.result.7 = call i32 @getInt()
  store i32 %.result.7, ptr %N.1
  store i32 0, ptr %head.1
  store i32 0, ptr %tail.1
  store i32 0, ptr %startx.1
  store i32 0, ptr %starty.1
  %.result.8 = load i32, ptr %N.1
  %.result.9 = sub i32 %.result.8, 1
  store i32 %.result.9, ptr %targetx.1
  %.result.10 = load i32, ptr %N.1
  %.result.11 = sub i32 %.result.10, 1
  store i32 %.result.11, ptr %targety.1
  store i32 0, ptr %x.1
  store i32 0, ptr %y.1
  store i32 0, ptr %now.1
  store i32 0, ptr %ok.1
  %.result.12 = load i32, ptr %N.1
  %.result.13 = load i32, ptr %N.1
  %.result.14 = mul i32 %.result.12, %.result.13
  %.result.15 = call ptr @.malloc_array(i32 4, i32 %.result.14)
  store ptr %.result.15, ptr %xlist.1
  store i32 0, ptr %i.1
  br label %label_loop_2
label_loop_2:
  %.result.16 = load i32, ptr %i.1
  %.result.17 = load i32, ptr %N.1
  %.result.18 = load i32, ptr %N.1
  %.result.19 = mul i32 %.result.17, %.result.18
  %.result.20 = icmp slt i32 %.result.16, %.result.19
  br i1 %.result.20, label %label_body_4, label %label_skip_3
label_body_4:
  %.result.21 = load ptr, ptr %xlist.1
  %.result.22 = load i32, ptr %i.1
  %.result.23 = getelementptr i32, ptr %.result.21, i32 %.result.22
  store i32 0, ptr %.result.23
  %.result.24 = load i32, ptr %i.1
  %.result.25 = add i32 %.result.24, 1
  store i32 %.result.25, ptr %i.1
  br label %label_loop_2
label_skip_3:
  %.result.26 = load i32, ptr %N.1
  %.result.27 = load i32, ptr %N.1
  %.result.28 = mul i32 %.result.26, %.result.27
  %.result.29 = call ptr @.malloc_array(i32 4, i32 %.result.28)
  store ptr %.result.29, ptr %ylist.1
  store i32 0, ptr %i.1
  br label %label_loop_5
label_loop_5:
  %.result.30 = load i32, ptr %i.1
  %.result.31 = load i32, ptr %N.1
  %.result.32 = load i32, ptr %N.1
  %.result.33 = mul i32 %.result.31, %.result.32
  %.result.34 = icmp slt i32 %.result.30, %.result.33
  br i1 %.result.34, label %label_body_7, label %label_skip_6
label_body_7:
  %.result.35 = load ptr, ptr %ylist.1
  %.result.36 = load i32, ptr %i.1
  %.result.37 = getelementptr i32, ptr %.result.35, i32 %.result.36
  store i32 0, ptr %.result.37
  %.result.38 = load i32, ptr %i.1
  %.result.39 = add i32 %.result.38, 1
  store i32 %.result.39, ptr %i.1
  br label %label_loop_5
label_skip_6:
  %.result.40 = load i32, ptr %N.1
  %.result.41 = call ptr @.malloc_array(i32 4, i32 %.result.40)
  store ptr %.result.41, ptr %step.1
  store i32 0, ptr %i.1
  br label %label_loop_8
label_loop_8:
  %.result.42 = load i32, ptr %i.1
  %.result.43 = load i32, ptr %N.1
  %.result.44 = icmp slt i32 %.result.42, %.result.43
  br i1 %.result.44, label %label_body_10, label %label_skip_9
label_body_10:
  %.result.45 = load ptr, ptr %step.1
  %.result.46 = load i32, ptr %i.1
  %.result.47 = getelementptr ptr, ptr %.result.45, i32 %.result.46
  %.result.48 = load i32, ptr %N.1
  %.result.49 = call ptr @.malloc_array(i32 4, i32 %.result.48)
  store ptr %.result.49, ptr %.result.47
  store i32 0, ptr %j.1
  br label %label_loop_11
label_loop_11:
  %.result.50 = load i32, ptr %j.1
  %.result.51 = load i32, ptr %N.1
  %.result.52 = icmp slt i32 %.result.50, %.result.51
  br i1 %.result.52, label %label_body_13, label %label_skip_12
label_body_13:
  %.result.53 = load ptr, ptr %step.1
  %.result.54 = load i32, ptr %i.1
  %.result.55 = getelementptr ptr, ptr %.result.53, i32 %.result.54
  %.result.56 = load ptr, ptr %.result.55
  %.result.57 = load i32, ptr %j.1
  %.result.58 = getelementptr i32, ptr %.result.56, i32 %.result.57
  %.result.59 = sub i32 0, 1
  store i32 %.result.59, ptr %.result.58
  %.result.60 = load i32, ptr %j.1
  %.result.61 = add i32 %.result.60, 1
  store i32 %.result.61, ptr %j.1
  br label %label_loop_11
label_skip_12:
  %.result.62 = load i32, ptr %i.1
  %.result.63 = add i32 %.result.62, 1
  store i32 %.result.63, ptr %i.1
  br label %label_loop_8
label_skip_9:
  %.result.64 = load ptr, ptr %xlist.1
  %.result.65 = getelementptr i32, ptr %.result.64, i32 0
  %.result.66 = load i32, ptr %startx.1
  store i32 %.result.66, ptr %.result.65
  %.result.67 = load ptr, ptr %ylist.1
  %.result.68 = getelementptr i32, ptr %.result.67, i32 0
  %.result.69 = load i32, ptr %starty.1
  store i32 %.result.69, ptr %.result.68
  %.result.70 = load ptr, ptr %step.1
  %.result.71 = load i32, ptr %startx.1
  %.result.72 = getelementptr ptr, ptr %.result.70, i32 %.result.71
  %.result.73 = load ptr, ptr %.result.72
  %.result.74 = load i32, ptr %starty.1
  %.result.75 = getelementptr i32, ptr %.result.73, i32 %.result.74
  store i32 0, ptr %.result.75
  br label %label_loop_14
label_loop_14:
  %.result.76 = load i32, ptr %head.1
  %.result.77 = load i32, ptr %tail.1
  %.result.78 = icmp sle i32 %.result.76, %.result.77
  br i1 %.result.78, label %label_body_16, label %label_skip_15
label_body_16:
  call void @print(ptr @.str.pre_0)
  %.result.79 = load i32, ptr %head.1
  call void @printInt(i32 %.result.79)
  call void @print(ptr @.str.pre_1)
  %.result.80 = load i32, ptr %tail.1
  call void @printInt(i32 %.result.80)
  call void @print(ptr @.str.pre_2)
  %.result.81 = load ptr, ptr %step.1
  %.result.82 = load ptr, ptr %xlist.1
  %.result.83 = load i32, ptr %head.1
  %.result.84 = getelementptr i32, ptr %.result.82, i32 %.result.83
  %.result.85 = load i32, ptr %.result.84
  %.result.86 = getelementptr ptr, ptr %.result.81, i32 %.result.85
  %.result.87 = load ptr, ptr %.result.86
  %.result.88 = load ptr, ptr %ylist.1
  %.result.89 = load i32, ptr %head.1
  %.result.90 = getelementptr i32, ptr %.result.88, i32 %.result.89
  %.result.91 = load i32, ptr %.result.90
  %.result.92 = getelementptr i32, ptr %.result.87, i32 %.result.91
  %.result.93 = load i32, ptr %.result.92
  store i32 %.result.93, ptr %now.1
  %.result.94 = load ptr, ptr %xlist.1
  %.result.95 = load i32, ptr %head.1
  %.result.96 = getelementptr i32, ptr %.result.94, i32 %.result.95
  %.result.97 = load i32, ptr %.result.96
  %.result.98 = sub i32 %.result.97, 1
  store i32 %.result.98, ptr %x.1
  %.result.99 = load ptr, ptr %ylist.1
  %.result.100 = load i32, ptr %head.1
  %.result.101 = getelementptr i32, ptr %.result.99, i32 %.result.100
  %.result.102 = load i32, ptr %.result.101
  %.result.103 = sub i32 %.result.102, 2
  store i32 %.result.103, ptr %y.1
  %.result.104 = alloca i1
  %.result.105 = alloca i1
  %.result.106 = load i32, ptr %x.1
  %.result.107 = load i32, ptr %N.1
  %.result.108 = call i1 @check(i32 %.result.106, i32 %.result.107)
  store i1 %.result.108, ptr %.result.105
  br i1 %.result.108, label %label_logicT_17, label %label_logicF_18
label_logicT_17:
  %.result.109 = load i32, ptr %y.1
  %.result.110 = load i32, ptr %N.1
  %.result.111 = call i1 @check(i32 %.result.109, i32 %.result.110)
  store i1 %.result.111, ptr %.result.105
  br label %label_logicF_18
label_logicF_18:
  %.result.112 = load i1, ptr %.result.105
  store i1 %.result.112, ptr %.result.104
  br i1 %.result.112, label %label_logicT_19, label %label_logicF_20
label_logicT_19:
  %.result.113 = load ptr, ptr %step.1
  %.result.114 = load i32, ptr %x.1
  %.result.115 = getelementptr ptr, ptr %.result.113, i32 %.result.114
  %.result.116 = load ptr, ptr %.result.115
  %.result.117 = load i32, ptr %y.1
  %.result.118 = getelementptr i32, ptr %.result.116, i32 %.result.117
  %.result.119 = load i32, ptr %.result.118
  %.result.120 = sub i32 0, 1
  %.result.121 = icmp eq i32 %.result.119, %.result.120
  store i1 %.result.121, ptr %.result.104
  br label %label_logicF_20
label_logicF_20:
  %.result.122 = load i1, ptr %.result.104
  br i1 %.result.122, label %label_true_21, label %label_false_22
label_true_21:
  call void @print(ptr @.str.pre_3)
  %.result.123 = load i32, ptr %tail.1
  %.result.124 = add i32 %.result.123, 1
  store i32 %.result.124, ptr %tail.1
  %.result.125 = load ptr, ptr %xlist.1
  %.result.126 = load i32, ptr %tail.1
  %.result.127 = getelementptr i32, ptr %.result.125, i32 %.result.126
  %.result.128 = load i32, ptr %x.1
  store i32 %.result.128, ptr %.result.127
  %.result.129 = load ptr, ptr %ylist.1
  %.result.130 = load i32, ptr %tail.1
  %.result.131 = getelementptr i32, ptr %.result.129, i32 %.result.130
  %.result.132 = load i32, ptr %y.1
  store i32 %.result.132, ptr %.result.131
  %.result.133 = load ptr, ptr %step.1
  %.result.134 = load i32, ptr %x.1
  %.result.135 = getelementptr ptr, ptr %.result.133, i32 %.result.134
  %.result.136 = load ptr, ptr %.result.135
  %.result.137 = load i32, ptr %y.1
  %.result.138 = getelementptr i32, ptr %.result.136, i32 %.result.137
  %.result.139 = load i32, ptr %now.1
  %.result.140 = add i32 %.result.139, 1
  store i32 %.result.140, ptr %.result.138
  %.result.141 = alloca i1
  %.result.142 = load i32, ptr %x.1
  %.result.143 = load i32, ptr %targetx.1
  %.result.144 = icmp eq i32 %.result.142, %.result.143
  store i1 %.result.144, ptr %.result.141
  br i1 %.result.144, label %label_logicT_24, label %label_logicF_25
label_logicT_24:
  %.result.145 = load i32, ptr %y.1
  %.result.146 = load i32, ptr %targety.1
  %.result.147 = icmp eq i32 %.result.145, %.result.146
  store i1 %.result.147, ptr %.result.141
  br label %label_logicF_25
label_logicF_25:
  %.result.148 = load i1, ptr %.result.141
  br i1 %.result.148, label %label_true_26, label %label_false_27
label_true_26:
  store i32 1, ptr %ok.1
  br label %label_skip_28
label_false_27:
  br label %label_skip_28
label_skip_28:
  br label %label_skip_23
label_false_22:
  br label %label_skip_23
label_skip_23:
  %.result.149 = load ptr, ptr %xlist.1
  %.result.150 = load i32, ptr %head.1
  %.result.151 = getelementptr i32, ptr %.result.149, i32 %.result.150
  %.result.152 = load i32, ptr %.result.151
  %.result.153 = sub i32 %.result.152, 1
  store i32 %.result.153, ptr %x.1
  %.result.154 = load ptr, ptr %ylist.1
  %.result.155 = load i32, ptr %head.1
  %.result.156 = getelementptr i32, ptr %.result.154, i32 %.result.155
  %.result.157 = load i32, ptr %.result.156
  %.result.158 = add i32 %.result.157, 2
  store i32 %.result.158, ptr %y.1
  %.result.159 = alloca i1
  %.result.160 = alloca i1
  %.result.161 = load i32, ptr %x.1
  %.result.162 = load i32, ptr %N.1
  %.result.163 = call i1 @check(i32 %.result.161, i32 %.result.162)
  store i1 %.result.163, ptr %.result.160
  br i1 %.result.163, label %label_logicT_29, label %label_logicF_30
label_logicT_29:
  %.result.164 = load i32, ptr %y.1
  %.result.165 = load i32, ptr %N.1
  %.result.166 = call i1 @check(i32 %.result.164, i32 %.result.165)
  store i1 %.result.166, ptr %.result.160
  br label %label_logicF_30
label_logicF_30:
  %.result.167 = load i1, ptr %.result.160
  store i1 %.result.167, ptr %.result.159
  br i1 %.result.167, label %label_logicT_31, label %label_logicF_32
label_logicT_31:
  %.result.168 = load ptr, ptr %step.1
  %.result.169 = load i32, ptr %x.1
  %.result.170 = getelementptr ptr, ptr %.result.168, i32 %.result.169
  %.result.171 = load ptr, ptr %.result.170
  %.result.172 = load i32, ptr %y.1
  %.result.173 = getelementptr i32, ptr %.result.171, i32 %.result.172
  %.result.174 = load i32, ptr %.result.173
  %.result.175 = sub i32 0, 1
  %.result.176 = icmp eq i32 %.result.174, %.result.175
  store i1 %.result.176, ptr %.result.159
  br label %label_logicF_32
label_logicF_32:
  %.result.177 = load i1, ptr %.result.159
  br i1 %.result.177, label %label_true_33, label %label_false_34
label_true_33:
  %.result.178 = load i32, ptr %tail.1
  %.result.179 = add i32 %.result.178, 1
  store i32 %.result.179, ptr %tail.1
  %.result.180 = load ptr, ptr %xlist.1
  %.result.181 = load i32, ptr %tail.1
  %.result.182 = getelementptr i32, ptr %.result.180, i32 %.result.181
  %.result.183 = load i32, ptr %x.1
  store i32 %.result.183, ptr %.result.182
  %.result.184 = load ptr, ptr %ylist.1
  %.result.185 = load i32, ptr %tail.1
  %.result.186 = getelementptr i32, ptr %.result.184, i32 %.result.185
  %.result.187 = load i32, ptr %y.1
  store i32 %.result.187, ptr %.result.186
  %.result.188 = load ptr, ptr %step.1
  %.result.189 = load i32, ptr %x.1
  %.result.190 = getelementptr ptr, ptr %.result.188, i32 %.result.189
  %.result.191 = load ptr, ptr %.result.190
  %.result.192 = load i32, ptr %y.1
  %.result.193 = getelementptr i32, ptr %.result.191, i32 %.result.192
  %.result.194 = load i32, ptr %now.1
  %.result.195 = add i32 %.result.194, 1
  store i32 %.result.195, ptr %.result.193
  %.result.196 = alloca i1
  %.result.197 = load i32, ptr %x.1
  %.result.198 = load i32, ptr %targetx.1
  %.result.199 = icmp eq i32 %.result.197, %.result.198
  store i1 %.result.199, ptr %.result.196
  br i1 %.result.199, label %label_logicT_36, label %label_logicF_37
label_logicT_36:
  %.result.200 = load i32, ptr %y.1
  %.result.201 = load i32, ptr %targety.1
  %.result.202 = icmp eq i32 %.result.200, %.result.201
  store i1 %.result.202, ptr %.result.196
  br label %label_logicF_37
label_logicF_37:
  %.result.203 = load i1, ptr %.result.196
  br i1 %.result.203, label %label_true_38, label %label_false_39
label_true_38:
  store i32 1, ptr %ok.1
  br label %label_skip_40
label_false_39:
  br label %label_skip_40
label_skip_40:
  br label %label_skip_35
label_false_34:
  br label %label_skip_35
label_skip_35:
  %.result.204 = load ptr, ptr %xlist.1
  %.result.205 = load i32, ptr %head.1
  %.result.206 = getelementptr i32, ptr %.result.204, i32 %.result.205
  %.result.207 = load i32, ptr %.result.206
  %.result.208 = add i32 %.result.207, 1
  store i32 %.result.208, ptr %x.1
  %.result.209 = load ptr, ptr %ylist.1
  %.result.210 = load i32, ptr %head.1
  %.result.211 = getelementptr i32, ptr %.result.209, i32 %.result.210
  %.result.212 = load i32, ptr %.result.211
  %.result.213 = sub i32 %.result.212, 2
  store i32 %.result.213, ptr %y.1
  %.result.214 = alloca i1
  %.result.215 = alloca i1
  %.result.216 = load i32, ptr %x.1
  %.result.217 = load i32, ptr %N.1
  %.result.218 = call i1 @check(i32 %.result.216, i32 %.result.217)
  store i1 %.result.218, ptr %.result.215
  br i1 %.result.218, label %label_logicT_41, label %label_logicF_42
label_logicT_41:
  %.result.219 = load i32, ptr %y.1
  %.result.220 = load i32, ptr %N.1
  %.result.221 = call i1 @check(i32 %.result.219, i32 %.result.220)
  store i1 %.result.221, ptr %.result.215
  br label %label_logicF_42
label_logicF_42:
  %.result.222 = load i1, ptr %.result.215
  store i1 %.result.222, ptr %.result.214
  br i1 %.result.222, label %label_logicT_43, label %label_logicF_44
label_logicT_43:
  %.result.223 = load ptr, ptr %step.1
  %.result.224 = load i32, ptr %x.1
  %.result.225 = getelementptr ptr, ptr %.result.223, i32 %.result.224
  %.result.226 = load ptr, ptr %.result.225
  %.result.227 = load i32, ptr %y.1
  %.result.228 = getelementptr i32, ptr %.result.226, i32 %.result.227
  %.result.229 = load i32, ptr %.result.228
  %.result.230 = sub i32 0, 1
  %.result.231 = icmp eq i32 %.result.229, %.result.230
  store i1 %.result.231, ptr %.result.214
  br label %label_logicF_44
label_logicF_44:
  %.result.232 = load i1, ptr %.result.214
  br i1 %.result.232, label %label_true_45, label %label_false_46
label_true_45:
  %.result.233 = load i32, ptr %tail.1
  %.result.234 = add i32 %.result.233, 1
  store i32 %.result.234, ptr %tail.1
  %.result.235 = load ptr, ptr %xlist.1
  %.result.236 = load i32, ptr %tail.1
  %.result.237 = getelementptr i32, ptr %.result.235, i32 %.result.236
  %.result.238 = load i32, ptr %x.1
  store i32 %.result.238, ptr %.result.237
  %.result.239 = load ptr, ptr %ylist.1
  %.result.240 = load i32, ptr %tail.1
  %.result.241 = getelementptr i32, ptr %.result.239, i32 %.result.240
  %.result.242 = load i32, ptr %y.1
  store i32 %.result.242, ptr %.result.241
  %.result.243 = load ptr, ptr %step.1
  %.result.244 = load i32, ptr %x.1
  %.result.245 = getelementptr ptr, ptr %.result.243, i32 %.result.244
  %.result.246 = load ptr, ptr %.result.245
  %.result.247 = load i32, ptr %y.1
  %.result.248 = getelementptr i32, ptr %.result.246, i32 %.result.247
  %.result.249 = load i32, ptr %now.1
  %.result.250 = add i32 %.result.249, 1
  store i32 %.result.250, ptr %.result.248
  %.result.251 = alloca i1
  %.result.252 = load i32, ptr %x.1
  %.result.253 = load i32, ptr %targetx.1
  %.result.254 = icmp eq i32 %.result.252, %.result.253
  store i1 %.result.254, ptr %.result.251
  br i1 %.result.254, label %label_logicT_48, label %label_logicF_49
label_logicT_48:
  %.result.255 = load i32, ptr %y.1
  %.result.256 = load i32, ptr %targety.1
  %.result.257 = icmp eq i32 %.result.255, %.result.256
  store i1 %.result.257, ptr %.result.251
  br label %label_logicF_49
label_logicF_49:
  %.result.258 = load i1, ptr %.result.251
  br i1 %.result.258, label %label_true_50, label %label_false_51
label_true_50:
  store i32 1, ptr %ok.1
  br label %label_skip_52
label_false_51:
  br label %label_skip_52
label_skip_52:
  br label %label_skip_47
label_false_46:
  br label %label_skip_47
label_skip_47:
  %.result.259 = load ptr, ptr %xlist.1
  %.result.260 = load i32, ptr %head.1
  %.result.261 = getelementptr i32, ptr %.result.259, i32 %.result.260
  %.result.262 = load i32, ptr %.result.261
  %.result.263 = add i32 %.result.262, 1
  store i32 %.result.263, ptr %x.1
  %.result.264 = load ptr, ptr %ylist.1
  %.result.265 = load i32, ptr %head.1
  %.result.266 = getelementptr i32, ptr %.result.264, i32 %.result.265
  %.result.267 = load i32, ptr %.result.266
  %.result.268 = add i32 %.result.267, 2
  store i32 %.result.268, ptr %y.1
  %.result.269 = alloca i1
  %.result.270 = alloca i1
  %.result.271 = load i32, ptr %x.1
  %.result.272 = load i32, ptr %N.1
  %.result.273 = call i1 @check(i32 %.result.271, i32 %.result.272)
  store i1 %.result.273, ptr %.result.270
  br i1 %.result.273, label %label_logicT_53, label %label_logicF_54
label_logicT_53:
  %.result.274 = load i32, ptr %y.1
  %.result.275 = load i32, ptr %N.1
  %.result.276 = call i1 @check(i32 %.result.274, i32 %.result.275)
  store i1 %.result.276, ptr %.result.270
  br label %label_logicF_54
label_logicF_54:
  %.result.277 = load i1, ptr %.result.270
  store i1 %.result.277, ptr %.result.269
  br i1 %.result.277, label %label_logicT_55, label %label_logicF_56
label_logicT_55:
  %.result.278 = load ptr, ptr %step.1
  %.result.279 = load i32, ptr %x.1
  %.result.280 = getelementptr ptr, ptr %.result.278, i32 %.result.279
  %.result.281 = load ptr, ptr %.result.280
  %.result.282 = load i32, ptr %y.1
  %.result.283 = getelementptr i32, ptr %.result.281, i32 %.result.282
  %.result.284 = load i32, ptr %.result.283
  %.result.285 = sub i32 0, 1
  %.result.286 = icmp eq i32 %.result.284, %.result.285
  store i1 %.result.286, ptr %.result.269
  br label %label_logicF_56
label_logicF_56:
  %.result.287 = load i1, ptr %.result.269
  br i1 %.result.287, label %label_true_57, label %label_false_58
label_true_57:
  %.result.288 = load i32, ptr %tail.1
  %.result.289 = add i32 %.result.288, 1
  store i32 %.result.289, ptr %tail.1
  %.result.290 = load ptr, ptr %xlist.1
  %.result.291 = load i32, ptr %tail.1
  %.result.292 = getelementptr i32, ptr %.result.290, i32 %.result.291
  %.result.293 = load i32, ptr %x.1
  store i32 %.result.293, ptr %.result.292
  %.result.294 = load ptr, ptr %ylist.1
  %.result.295 = load i32, ptr %tail.1
  %.result.296 = getelementptr i32, ptr %.result.294, i32 %.result.295
  %.result.297 = load i32, ptr %y.1
  store i32 %.result.297, ptr %.result.296
  %.result.298 = load ptr, ptr %step.1
  %.result.299 = load i32, ptr %x.1
  %.result.300 = getelementptr ptr, ptr %.result.298, i32 %.result.299
  %.result.301 = load ptr, ptr %.result.300
  %.result.302 = load i32, ptr %y.1
  %.result.303 = getelementptr i32, ptr %.result.301, i32 %.result.302
  %.result.304 = load i32, ptr %now.1
  %.result.305 = add i32 %.result.304, 1
  store i32 %.result.305, ptr %.result.303
  %.result.306 = alloca i1
  %.result.307 = load i32, ptr %x.1
  %.result.308 = load i32, ptr %targetx.1
  %.result.309 = icmp eq i32 %.result.307, %.result.308
  store i1 %.result.309, ptr %.result.306
  br i1 %.result.309, label %label_logicT_60, label %label_logicF_61
label_logicT_60:
  %.result.310 = load i32, ptr %y.1
  %.result.311 = load i32, ptr %targety.1
  %.result.312 = icmp eq i32 %.result.310, %.result.311
  store i1 %.result.312, ptr %.result.306
  br label %label_logicF_61
label_logicF_61:
  %.result.313 = load i1, ptr %.result.306
  br i1 %.result.313, label %label_true_62, label %label_false_63
label_true_62:
  store i32 1, ptr %ok.1
  br label %label_skip_64
label_false_63:
  br label %label_skip_64
label_skip_64:
  br label %label_skip_59
label_false_58:
  br label %label_skip_59
label_skip_59:
  %.result.314 = load ptr, ptr %xlist.1
  %.result.315 = load i32, ptr %head.1
  %.result.316 = getelementptr i32, ptr %.result.314, i32 %.result.315
  %.result.317 = load i32, ptr %.result.316
  %.result.318 = sub i32 %.result.317, 2
  store i32 %.result.318, ptr %x.1
  %.result.319 = load ptr, ptr %ylist.1
  %.result.320 = load i32, ptr %head.1
  %.result.321 = getelementptr i32, ptr %.result.319, i32 %.result.320
  %.result.322 = load i32, ptr %.result.321
  %.result.323 = sub i32 %.result.322, 1
  store i32 %.result.323, ptr %y.1
  %.result.324 = alloca i1
  %.result.325 = alloca i1
  %.result.326 = load i32, ptr %x.1
  %.result.327 = load i32, ptr %N.1
  %.result.328 = call i1 @check(i32 %.result.326, i32 %.result.327)
  store i1 %.result.328, ptr %.result.325
  br i1 %.result.328, label %label_logicT_65, label %label_logicF_66
label_logicT_65:
  %.result.329 = load i32, ptr %y.1
  %.result.330 = load i32, ptr %N.1
  %.result.331 = call i1 @check(i32 %.result.329, i32 %.result.330)
  store i1 %.result.331, ptr %.result.325
  br label %label_logicF_66
label_logicF_66:
  %.result.332 = load i1, ptr %.result.325
  store i1 %.result.332, ptr %.result.324
  br i1 %.result.332, label %label_logicT_67, label %label_logicF_68
label_logicT_67:
  %.result.333 = load ptr, ptr %step.1
  %.result.334 = load i32, ptr %x.1
  %.result.335 = getelementptr ptr, ptr %.result.333, i32 %.result.334
  %.result.336 = load ptr, ptr %.result.335
  %.result.337 = load i32, ptr %y.1
  %.result.338 = getelementptr i32, ptr %.result.336, i32 %.result.337
  %.result.339 = load i32, ptr %.result.338
  %.result.340 = sub i32 0, 1
  %.result.341 = icmp eq i32 %.result.339, %.result.340
  store i1 %.result.341, ptr %.result.324
  br label %label_logicF_68
label_logicF_68:
  %.result.342 = load i1, ptr %.result.324
  br i1 %.result.342, label %label_true_69, label %label_false_70
label_true_69:
  %.result.343 = load i32, ptr %tail.1
  %.result.344 = add i32 %.result.343, 1
  store i32 %.result.344, ptr %tail.1
  %.result.345 = load ptr, ptr %xlist.1
  %.result.346 = load i32, ptr %tail.1
  %.result.347 = getelementptr i32, ptr %.result.345, i32 %.result.346
  %.result.348 = load i32, ptr %x.1
  store i32 %.result.348, ptr %.result.347
  %.result.349 = load ptr, ptr %ylist.1
  %.result.350 = load i32, ptr %tail.1
  %.result.351 = getelementptr i32, ptr %.result.349, i32 %.result.350
  %.result.352 = load i32, ptr %y.1
  store i32 %.result.352, ptr %.result.351
  %.result.353 = load ptr, ptr %step.1
  %.result.354 = load i32, ptr %x.1
  %.result.355 = getelementptr ptr, ptr %.result.353, i32 %.result.354
  %.result.356 = load ptr, ptr %.result.355
  %.result.357 = load i32, ptr %y.1
  %.result.358 = getelementptr i32, ptr %.result.356, i32 %.result.357
  %.result.359 = load i32, ptr %now.1
  %.result.360 = add i32 %.result.359, 1
  store i32 %.result.360, ptr %.result.358
  %.result.361 = alloca i1
  %.result.362 = load i32, ptr %x.1
  %.result.363 = load i32, ptr %targetx.1
  %.result.364 = icmp eq i32 %.result.362, %.result.363
  store i1 %.result.364, ptr %.result.361
  br i1 %.result.364, label %label_logicT_72, label %label_logicF_73
label_logicT_72:
  %.result.365 = load i32, ptr %y.1
  %.result.366 = load i32, ptr %targety.1
  %.result.367 = icmp eq i32 %.result.365, %.result.366
  store i1 %.result.367, ptr %.result.361
  br label %label_logicF_73
label_logicF_73:
  %.result.368 = load i1, ptr %.result.361
  br i1 %.result.368, label %label_true_74, label %label_false_75
label_true_74:
  store i32 1, ptr %ok.1
  br label %label_skip_76
label_false_75:
  br label %label_skip_76
label_skip_76:
  br label %label_skip_71
label_false_70:
  br label %label_skip_71
label_skip_71:
  %.result.369 = load ptr, ptr %xlist.1
  %.result.370 = load i32, ptr %head.1
  %.result.371 = getelementptr i32, ptr %.result.369, i32 %.result.370
  %.result.372 = load i32, ptr %.result.371
  %.result.373 = sub i32 %.result.372, 2
  store i32 %.result.373, ptr %x.1
  %.result.374 = load ptr, ptr %ylist.1
  %.result.375 = load i32, ptr %head.1
  %.result.376 = getelementptr i32, ptr %.result.374, i32 %.result.375
  %.result.377 = load i32, ptr %.result.376
  %.result.378 = add i32 %.result.377, 1
  store i32 %.result.378, ptr %y.1
  %.result.379 = alloca i1
  %.result.380 = alloca i1
  %.result.381 = load i32, ptr %x.1
  %.result.382 = load i32, ptr %N.1
  %.result.383 = call i1 @check(i32 %.result.381, i32 %.result.382)
  store i1 %.result.383, ptr %.result.380
  br i1 %.result.383, label %label_logicT_77, label %label_logicF_78
label_logicT_77:
  %.result.384 = load i32, ptr %y.1
  %.result.385 = load i32, ptr %N.1
  %.result.386 = call i1 @check(i32 %.result.384, i32 %.result.385)
  store i1 %.result.386, ptr %.result.380
  br label %label_logicF_78
label_logicF_78:
  %.result.387 = load i1, ptr %.result.380
  store i1 %.result.387, ptr %.result.379
  br i1 %.result.387, label %label_logicT_79, label %label_logicF_80
label_logicT_79:
  %.result.388 = load ptr, ptr %step.1
  %.result.389 = load i32, ptr %x.1
  %.result.390 = getelementptr ptr, ptr %.result.388, i32 %.result.389
  %.result.391 = load ptr, ptr %.result.390
  %.result.392 = load i32, ptr %y.1
  %.result.393 = getelementptr i32, ptr %.result.391, i32 %.result.392
  %.result.394 = load i32, ptr %.result.393
  %.result.395 = sub i32 0, 1
  %.result.396 = icmp eq i32 %.result.394, %.result.395
  store i1 %.result.396, ptr %.result.379
  br label %label_logicF_80
label_logicF_80:
  %.result.397 = load i1, ptr %.result.379
  br i1 %.result.397, label %label_true_81, label %label_false_82
label_true_81:
  %.result.398 = load i32, ptr %tail.1
  %.result.399 = add i32 %.result.398, 1
  store i32 %.result.399, ptr %tail.1
  %.result.400 = load ptr, ptr %xlist.1
  %.result.401 = load i32, ptr %tail.1
  %.result.402 = getelementptr i32, ptr %.result.400, i32 %.result.401
  %.result.403 = load i32, ptr %x.1
  store i32 %.result.403, ptr %.result.402
  %.result.404 = load ptr, ptr %ylist.1
  %.result.405 = load i32, ptr %tail.1
  %.result.406 = getelementptr i32, ptr %.result.404, i32 %.result.405
  %.result.407 = load i32, ptr %y.1
  store i32 %.result.407, ptr %.result.406
  %.result.408 = load ptr, ptr %step.1
  %.result.409 = load i32, ptr %x.1
  %.result.410 = getelementptr ptr, ptr %.result.408, i32 %.result.409
  %.result.411 = load ptr, ptr %.result.410
  %.result.412 = load i32, ptr %y.1
  %.result.413 = getelementptr i32, ptr %.result.411, i32 %.result.412
  %.result.414 = load i32, ptr %now.1
  %.result.415 = add i32 %.result.414, 1
  store i32 %.result.415, ptr %.result.413
  %.result.416 = alloca i1
  %.result.417 = load i32, ptr %x.1
  %.result.418 = load i32, ptr %targetx.1
  %.result.419 = icmp eq i32 %.result.417, %.result.418
  store i1 %.result.419, ptr %.result.416
  br i1 %.result.419, label %label_logicT_84, label %label_logicF_85
label_logicT_84:
  %.result.420 = load i32, ptr %y.1
  %.result.421 = load i32, ptr %targety.1
  %.result.422 = icmp eq i32 %.result.420, %.result.421
  store i1 %.result.422, ptr %.result.416
  br label %label_logicF_85
label_logicF_85:
  %.result.423 = load i1, ptr %.result.416
  br i1 %.result.423, label %label_true_86, label %label_false_87
label_true_86:
  store i32 1, ptr %ok.1
  br label %label_skip_88
label_false_87:
  br label %label_skip_88
label_skip_88:
  br label %label_skip_83
label_false_82:
  br label %label_skip_83
label_skip_83:
  %.result.424 = load ptr, ptr %xlist.1
  %.result.425 = load i32, ptr %head.1
  %.result.426 = getelementptr i32, ptr %.result.424, i32 %.result.425
  %.result.427 = load i32, ptr %.result.426
  %.result.428 = add i32 %.result.427, 2
  store i32 %.result.428, ptr %x.1
  %.result.429 = load ptr, ptr %ylist.1
  %.result.430 = load i32, ptr %head.1
  %.result.431 = getelementptr i32, ptr %.result.429, i32 %.result.430
  %.result.432 = load i32, ptr %.result.431
  %.result.433 = sub i32 %.result.432, 1
  store i32 %.result.433, ptr %y.1
  %.result.434 = alloca i1
  %.result.435 = alloca i1
  %.result.436 = load i32, ptr %x.1
  %.result.437 = load i32, ptr %N.1
  %.result.438 = call i1 @check(i32 %.result.436, i32 %.result.437)
  store i1 %.result.438, ptr %.result.435
  br i1 %.result.438, label %label_logicT_89, label %label_logicF_90
label_logicT_89:
  %.result.439 = load i32, ptr %y.1
  %.result.440 = load i32, ptr %N.1
  %.result.441 = call i1 @check(i32 %.result.439, i32 %.result.440)
  store i1 %.result.441, ptr %.result.435
  br label %label_logicF_90
label_logicF_90:
  %.result.442 = load i1, ptr %.result.435
  store i1 %.result.442, ptr %.result.434
  br i1 %.result.442, label %label_logicT_91, label %label_logicF_92
label_logicT_91:
  %.result.443 = load ptr, ptr %step.1
  %.result.444 = load i32, ptr %x.1
  %.result.445 = getelementptr ptr, ptr %.result.443, i32 %.result.444
  %.result.446 = load ptr, ptr %.result.445
  %.result.447 = load i32, ptr %y.1
  %.result.448 = getelementptr i32, ptr %.result.446, i32 %.result.447
  %.result.449 = load i32, ptr %.result.448
  %.result.450 = sub i32 0, 1
  %.result.451 = icmp eq i32 %.result.449, %.result.450
  store i1 %.result.451, ptr %.result.434
  br label %label_logicF_92
label_logicF_92:
  %.result.452 = load i1, ptr %.result.434
  br i1 %.result.452, label %label_true_93, label %label_false_94
label_true_93:
  %.result.453 = load i32, ptr %tail.1
  %.result.454 = add i32 %.result.453, 1
  store i32 %.result.454, ptr %tail.1
  %.result.455 = load ptr, ptr %xlist.1
  %.result.456 = load i32, ptr %tail.1
  %.result.457 = getelementptr i32, ptr %.result.455, i32 %.result.456
  %.result.458 = load i32, ptr %x.1
  store i32 %.result.458, ptr %.result.457
  %.result.459 = load ptr, ptr %ylist.1
  %.result.460 = load i32, ptr %tail.1
  %.result.461 = getelementptr i32, ptr %.result.459, i32 %.result.460
  %.result.462 = load i32, ptr %y.1
  store i32 %.result.462, ptr %.result.461
  %.result.463 = load ptr, ptr %step.1
  %.result.464 = load i32, ptr %x.1
  %.result.465 = getelementptr ptr, ptr %.result.463, i32 %.result.464
  %.result.466 = load ptr, ptr %.result.465
  %.result.467 = load i32, ptr %y.1
  %.result.468 = getelementptr i32, ptr %.result.466, i32 %.result.467
  %.result.469 = load i32, ptr %now.1
  %.result.470 = add i32 %.result.469, 1
  store i32 %.result.470, ptr %.result.468
  %.result.471 = alloca i1
  %.result.472 = load i32, ptr %x.1
  %.result.473 = load i32, ptr %targetx.1
  %.result.474 = icmp eq i32 %.result.472, %.result.473
  store i1 %.result.474, ptr %.result.471
  br i1 %.result.474, label %label_logicT_96, label %label_logicF_97
label_logicT_96:
  %.result.475 = load i32, ptr %y.1
  %.result.476 = load i32, ptr %targety.1
  %.result.477 = icmp eq i32 %.result.475, %.result.476
  store i1 %.result.477, ptr %.result.471
  br label %label_logicF_97
label_logicF_97:
  %.result.478 = load i1, ptr %.result.471
  br i1 %.result.478, label %label_true_98, label %label_false_99
label_true_98:
  store i32 1, ptr %ok.1
  br label %label_skip_100
label_false_99:
  br label %label_skip_100
label_skip_100:
  br label %label_skip_95
label_false_94:
  br label %label_skip_95
label_skip_95:
  %.result.479 = load ptr, ptr %xlist.1
  %.result.480 = load i32, ptr %head.1
  %.result.481 = getelementptr i32, ptr %.result.479, i32 %.result.480
  %.result.482 = load i32, ptr %.result.481
  %.result.483 = add i32 %.result.482, 2
  store i32 %.result.483, ptr %x.1
  %.result.484 = load ptr, ptr %ylist.1
  %.result.485 = load i32, ptr %head.1
  %.result.486 = getelementptr i32, ptr %.result.484, i32 %.result.485
  %.result.487 = load i32, ptr %.result.486
  %.result.488 = add i32 %.result.487, 1
  store i32 %.result.488, ptr %y.1
  %.result.489 = alloca i1
  %.result.490 = alloca i1
  %.result.491 = load i32, ptr %x.1
  %.result.492 = load i32, ptr %N.1
  %.result.493 = call i1 @check(i32 %.result.491, i32 %.result.492)
  store i1 %.result.493, ptr %.result.490
  br i1 %.result.493, label %label_logicT_101, label %label_logicF_102
label_logicT_101:
  %.result.494 = load i32, ptr %y.1
  %.result.495 = load i32, ptr %N.1
  %.result.496 = call i1 @check(i32 %.result.494, i32 %.result.495)
  store i1 %.result.496, ptr %.result.490
  br label %label_logicF_102
label_logicF_102:
  %.result.497 = load i1, ptr %.result.490
  store i1 %.result.497, ptr %.result.489
  br i1 %.result.497, label %label_logicT_103, label %label_logicF_104
label_logicT_103:
  %.result.498 = load ptr, ptr %step.1
  %.result.499 = load i32, ptr %x.1
  %.result.500 = getelementptr ptr, ptr %.result.498, i32 %.result.499
  %.result.501 = load ptr, ptr %.result.500
  %.result.502 = load i32, ptr %y.1
  %.result.503 = getelementptr i32, ptr %.result.501, i32 %.result.502
  %.result.504 = load i32, ptr %.result.503
  %.result.505 = sub i32 0, 1
  %.result.506 = icmp eq i32 %.result.504, %.result.505
  store i1 %.result.506, ptr %.result.489
  br label %label_logicF_104
label_logicF_104:
  %.result.507 = load i1, ptr %.result.489
  br i1 %.result.507, label %label_true_105, label %label_false_106
label_true_105:
  %.result.508 = load i32, ptr %tail.1
  %.result.509 = add i32 %.result.508, 1
  store i32 %.result.509, ptr %tail.1
  %.result.510 = load ptr, ptr %xlist.1
  %.result.511 = load i32, ptr %tail.1
  %.result.512 = getelementptr i32, ptr %.result.510, i32 %.result.511
  %.result.513 = load i32, ptr %x.1
  store i32 %.result.513, ptr %.result.512
  %.result.514 = load ptr, ptr %ylist.1
  %.result.515 = load i32, ptr %tail.1
  %.result.516 = getelementptr i32, ptr %.result.514, i32 %.result.515
  %.result.517 = load i32, ptr %y.1
  store i32 %.result.517, ptr %.result.516
  %.result.518 = load ptr, ptr %step.1
  %.result.519 = load i32, ptr %x.1
  %.result.520 = getelementptr ptr, ptr %.result.518, i32 %.result.519
  %.result.521 = load ptr, ptr %.result.520
  %.result.522 = load i32, ptr %y.1
  %.result.523 = getelementptr i32, ptr %.result.521, i32 %.result.522
  %.result.524 = load i32, ptr %now.1
  %.result.525 = add i32 %.result.524, 1
  store i32 %.result.525, ptr %.result.523
  %.result.526 = alloca i1
  %.result.527 = load i32, ptr %x.1
  %.result.528 = load i32, ptr %targetx.1
  %.result.529 = icmp eq i32 %.result.527, %.result.528
  store i1 %.result.529, ptr %.result.526
  br i1 %.result.529, label %label_logicT_108, label %label_logicF_109
label_logicT_108:
  %.result.530 = load i32, ptr %y.1
  %.result.531 = load i32, ptr %targety.1
  %.result.532 = icmp eq i32 %.result.530, %.result.531
  store i1 %.result.532, ptr %.result.526
  br label %label_logicF_109
label_logicF_109:
  %.result.533 = load i1, ptr %.result.526
  br i1 %.result.533, label %label_true_110, label %label_false_111
label_true_110:
  store i32 1, ptr %ok.1
  br label %label_skip_112
label_false_111:
  br label %label_skip_112
label_skip_112:
  br label %label_skip_107
label_false_106:
  br label %label_skip_107
label_skip_107:
  %.result.534 = load i32, ptr %ok.1
  %.result.535 = icmp eq i32 %.result.534, 1
  br i1 %.result.535, label %label_true_113, label %label_false_114
label_true_113:
  call void @print(ptr @.str.pre_4)
  br label %label_skip_15
  br label %label_skip_115
label_false_114:
  br label %label_skip_115
label_skip_115:
  %.result.536 = load i32, ptr %head.1
  %.result.537 = add i32 %.result.536, 1
  store i32 %.result.537, ptr %head.1
  br label %label_loop_14
label_skip_15:
  %.result.538 = load i32, ptr %ok.1
  %.result.539 = icmp eq i32 %.result.538, 1
  br i1 %.result.539, label %label_true_116, label %label_false_117
label_true_116:
  %.result.540 = load ptr, ptr %step.1
  %.result.541 = load i32, ptr %targetx.1
  %.result.542 = getelementptr ptr, ptr %.result.540, i32 %.result.541
  %.result.543 = load ptr, ptr %.result.542
  %.result.544 = load i32, ptr %targety.1
  %.result.545 = getelementptr i32, ptr %.result.543, i32 %.result.544
  %.result.546 = load i32, ptr %.result.545
  %.result.547 = call ptr @toString(i32 %.result.546)
  call void @println(ptr %.result.547)
  br label %label_skip_118
label_false_117:
  call void @print(ptr @.str.pre_5)
  br label %label_skip_118
label_skip_118:
  ret i32 0
}
