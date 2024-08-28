@.str.pre_0 = private unnamed_addr constant [15 x i8] c"no solution!\n\00"
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
  %.result.0 = load i32, ptr %a.1
  %.result.1 = load i32, ptr %N.1
  %.result.2 = icmp slt i32 %.result.0, %.result.1
  %.result.3 = load i32, ptr %a.1
  %.result.4 = icmp sge i32 %.result.3, 0
  %.result.5 = and i1 %.result.2, %.result.4
  ret i1 %.result.5
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
  %.result.6 = call i32 @getInt()
  store i32 %.result.6, ptr %N.1
  store i32 0, ptr %head.1
  store i32 0, ptr %tail.1
  store i32 0, ptr %startx.1
  store i32 0, ptr %starty.1
  %.result.7 = load i32, ptr %N.1
  %.result.8 = sub i32 %.result.7, 1
  store i32 %.result.8, ptr %targetx.1
  %.result.9 = load i32, ptr %N.1
  %.result.10 = sub i32 %.result.9, 1
  store i32 %.result.10, ptr %targety.1
  store i32 0, ptr %x.1
  store i32 0, ptr %y.1
  store i32 0, ptr %now.1
  store i32 0, ptr %ok.1
  %.result.11 = load i32, ptr %N.1
  %.result.12 = load i32, ptr %N.1
  %.result.13 = mul i32 %.result.11, %.result.12
  %.result.14 = call ptr @.malloc_array(i32 4, i32 %.result.13)
  store ptr %.result.14, ptr %xlist.1
  store i32 0, ptr %i.1
  br label %label_loop_0
label_loop_0:
  %.result.15 = load i32, ptr %i.1
  %.result.16 = load i32, ptr %N.1
  %.result.17 = load i32, ptr %N.1
  %.result.18 = mul i32 %.result.16, %.result.17
  %.result.19 = icmp slt i32 %.result.15, %.result.18
  br i1 %.result.19, label %label_body_2, label %label_skip_1
label_body_2:
  %.result.20 = load ptr, ptr %xlist.1
  %.result.21 = load i32, ptr %i.1
  %.result.22 = getelementptr i32, ptr %.result.20, i32 %.result.21
  store i32 0, ptr %.result.22
  %.result.23 = load i32, ptr %i.1
  %.result.24 = add i32 %.result.23, 1
  store i32 %.result.24, ptr %i.1
  br label %label_loop_0
label_skip_1:
  %.result.25 = load i32, ptr %N.1
  %.result.26 = load i32, ptr %N.1
  %.result.27 = mul i32 %.result.25, %.result.26
  %.result.28 = call ptr @.malloc_array(i32 4, i32 %.result.27)
  store ptr %.result.28, ptr %ylist.1
  store i32 0, ptr %i.1
  br label %label_loop_3
label_loop_3:
  %.result.29 = load i32, ptr %i.1
  %.result.30 = load i32, ptr %N.1
  %.result.31 = load i32, ptr %N.1
  %.result.32 = mul i32 %.result.30, %.result.31
  %.result.33 = icmp slt i32 %.result.29, %.result.32
  br i1 %.result.33, label %label_body_5, label %label_skip_4
label_body_5:
  %.result.34 = load ptr, ptr %ylist.1
  %.result.35 = load i32, ptr %i.1
  %.result.36 = getelementptr i32, ptr %.result.34, i32 %.result.35
  store i32 0, ptr %.result.36
  %.result.37 = load i32, ptr %i.1
  %.result.38 = add i32 %.result.37, 1
  store i32 %.result.38, ptr %i.1
  br label %label_loop_3
label_skip_4:
  %.result.39 = load i32, ptr %N.1
  %.result.40 = call ptr @.malloc_array(i32 4, i32 %.result.39)
  store ptr %.result.40, ptr %step.1
  store i32 0, ptr %i.1
  br label %label_loop_6
label_loop_6:
  %.result.41 = load i32, ptr %i.1
  %.result.42 = load i32, ptr %N.1
  %.result.43 = icmp slt i32 %.result.41, %.result.42
  br i1 %.result.43, label %label_body_8, label %label_skip_7
label_body_8:
  %.result.44 = load ptr, ptr %step.1
  %.result.45 = load i32, ptr %i.1
  %.result.46 = getelementptr ptr, ptr %.result.44, i32 %.result.45
  %.result.47 = load i32, ptr %N.1
  %.result.48 = call ptr @.malloc_array(i32 4, i32 %.result.47)
  store ptr %.result.48, ptr %.result.46
  store i32 0, ptr %j.1
  br label %label_loop_9
label_loop_9:
  %.result.49 = load i32, ptr %j.1
  %.result.50 = load i32, ptr %N.1
  %.result.51 = icmp slt i32 %.result.49, %.result.50
  br i1 %.result.51, label %label_body_11, label %label_skip_10
label_body_11:
  %.result.52 = load ptr, ptr %step.1
  %.result.53 = load i32, ptr %i.1
  %.result.54 = getelementptr ptr, ptr %.result.52, i32 %.result.53
  %.result.55 = load ptr, ptr %.result.54
  %.result.56 = load i32, ptr %j.1
  %.result.57 = getelementptr i32, ptr %.result.55, i32 %.result.56
  %.result.58 = sub i32 0, 1
  store i32 %.result.58, ptr %.result.57
  %.result.59 = load i32, ptr %j.1
  %.result.60 = add i32 %.result.59, 1
  store i32 %.result.60, ptr %j.1
  br label %label_loop_9
label_skip_10:
  %.result.61 = load i32, ptr %i.1
  %.result.62 = add i32 %.result.61, 1
  store i32 %.result.62, ptr %i.1
  br label %label_loop_6
label_skip_7:
  %.result.63 = load ptr, ptr %xlist.1
  %.result.64 = getelementptr i32, ptr %.result.63, i32 0
  %.result.65 = load i32, ptr %startx.1
  store i32 %.result.65, ptr %.result.64
  %.result.66 = load ptr, ptr %ylist.1
  %.result.67 = getelementptr i32, ptr %.result.66, i32 0
  %.result.68 = load i32, ptr %starty.1
  store i32 %.result.68, ptr %.result.67
  %.result.69 = load ptr, ptr %step.1
  %.result.70 = load i32, ptr %startx.1
  %.result.71 = getelementptr ptr, ptr %.result.69, i32 %.result.70
  %.result.72 = load ptr, ptr %.result.71
  %.result.73 = load i32, ptr %starty.1
  %.result.74 = getelementptr i32, ptr %.result.72, i32 %.result.73
  store i32 0, ptr %.result.74
label_loop_12:
  %.result.75 = load i32, ptr %head.1
  %.result.76 = load i32, ptr %tail.1
  %.result.77 = icmp sle i32 %.result.75, %.result.76
  br i1 %.result.77, label %label_body_14, label %label_skip_13
label_body_14:
  %.result.78 = load ptr, ptr %step.1
  %.result.79 = load ptr, ptr %xlist.1
  %.result.80 = load i32, ptr %head.1
  %.result.81 = getelementptr i32, ptr %.result.79, i32 %.result.80
  %.result.82 = load i32, ptr %.result.81
  %.result.83 = getelementptr ptr, ptr %.result.78, i32 %.result.82
  %.result.84 = load ptr, ptr %.result.83
  %.result.85 = load ptr, ptr %ylist.1
  %.result.86 = load i32, ptr %head.1
  %.result.87 = getelementptr i32, ptr %.result.85, i32 %.result.86
  %.result.88 = load i32, ptr %.result.87
  %.result.89 = getelementptr i32, ptr %.result.84, i32 %.result.88
  %.result.90 = load i32, ptr %.result.89
  store i32 %.result.90, ptr %now.1
  %.result.91 = load ptr, ptr %xlist.1
  %.result.92 = load i32, ptr %head.1
  %.result.93 = getelementptr i32, ptr %.result.91, i32 %.result.92
  %.result.94 = load i32, ptr %.result.93
  %.result.95 = sub i32 %.result.94, 1
  store i32 %.result.95, ptr %x.1
  %.result.96 = load ptr, ptr %ylist.1
  %.result.97 = load i32, ptr %head.1
  %.result.98 = getelementptr i32, ptr %.result.96, i32 %.result.97
  %.result.99 = load i32, ptr %.result.98
  %.result.100 = sub i32 %.result.99, 2
  store i32 %.result.100, ptr %y.1
  %.result.101 = load i32, ptr %x.1
  %.result.102 = load i32, ptr %N.1
  %.result.103 = call i1 @check(i32 %.result.101, i32 %.result.102)
  %.result.104 = load i32, ptr %y.1
  %.result.105 = load i32, ptr %N.1
  %.result.106 = call i1 @check(i32 %.result.104, i32 %.result.105)
  %.result.107 = and i1 %.result.103, %.result.106
  %.result.108 = load ptr, ptr %step.1
  %.result.109 = load i32, ptr %x.1
  %.result.110 = getelementptr ptr, ptr %.result.108, i32 %.result.109
  %.result.111 = load ptr, ptr %.result.110
  %.result.112 = load i32, ptr %y.1
  %.result.113 = getelementptr i32, ptr %.result.111, i32 %.result.112
  %.result.114 = load i32, ptr %.result.113
  %.result.115 = sub i32 0, 1
  %.result.116 = icmp eq i32 %.result.114, %.result.115
  %.result.117 = and i1 %.result.107, %.result.116
  br i1 %.result.117, label %label_true_15, label %label_false_16
label_true_15:
  %.result.118 = load i32, ptr %tail.1
  %.result.119 = add i32 %.result.118, 1
  store i32 %.result.119, ptr %tail.1
  %.result.120 = load ptr, ptr %xlist.1
  %.result.121 = load i32, ptr %tail.1
  %.result.122 = getelementptr i32, ptr %.result.120, i32 %.result.121
  %.result.123 = load i32, ptr %x.1
  store i32 %.result.123, ptr %.result.122
  %.result.124 = load ptr, ptr %ylist.1
  %.result.125 = load i32, ptr %tail.1
  %.result.126 = getelementptr i32, ptr %.result.124, i32 %.result.125
  %.result.127 = load i32, ptr %y.1
  store i32 %.result.127, ptr %.result.126
  %.result.128 = load ptr, ptr %step.1
  %.result.129 = load i32, ptr %x.1
  %.result.130 = getelementptr ptr, ptr %.result.128, i32 %.result.129
  %.result.131 = load ptr, ptr %.result.130
  %.result.132 = load i32, ptr %y.1
  %.result.133 = getelementptr i32, ptr %.result.131, i32 %.result.132
  %.result.134 = load i32, ptr %now.1
  %.result.135 = add i32 %.result.134, 1
  store i32 %.result.135, ptr %.result.133
  %.result.136 = load i32, ptr %x.1
  %.result.137 = load i32, ptr %targetx.1
  %.result.138 = icmp eq i32 %.result.136, %.result.137
  %.result.139 = load i32, ptr %y.1
  %.result.140 = load i32, ptr %targety.1
  %.result.141 = icmp eq i32 %.result.139, %.result.140
  %.result.142 = and i1 %.result.138, %.result.141
  br i1 %.result.142, label %label_true_18, label %label_false_19
label_true_18:
  store i32 1, ptr %ok.1
  br label %label_skip_20
label_false_19:
  br label %label_skip_20
label_skip_20:
  br label %label_skip_17
label_false_16:
  br label %label_skip_17
label_skip_17:
  %.result.143 = load ptr, ptr %xlist.1
  %.result.144 = load i32, ptr %head.1
  %.result.145 = getelementptr i32, ptr %.result.143, i32 %.result.144
  %.result.146 = load i32, ptr %.result.145
  %.result.147 = sub i32 %.result.146, 1
  store i32 %.result.147, ptr %x.1
  %.result.148 = load ptr, ptr %ylist.1
  %.result.149 = load i32, ptr %head.1
  %.result.150 = getelementptr i32, ptr %.result.148, i32 %.result.149
  %.result.151 = load i32, ptr %.result.150
  %.result.152 = add i32 %.result.151, 2
  store i32 %.result.152, ptr %y.1
  %.result.153 = load i32, ptr %x.1
  %.result.154 = load i32, ptr %N.1
  %.result.155 = call i1 @check(i32 %.result.153, i32 %.result.154)
  %.result.156 = load i32, ptr %y.1
  %.result.157 = load i32, ptr %N.1
  %.result.158 = call i1 @check(i32 %.result.156, i32 %.result.157)
  %.result.159 = and i1 %.result.155, %.result.158
  %.result.160 = load ptr, ptr %step.1
  %.result.161 = load i32, ptr %x.1
  %.result.162 = getelementptr ptr, ptr %.result.160, i32 %.result.161
  %.result.163 = load ptr, ptr %.result.162
  %.result.164 = load i32, ptr %y.1
  %.result.165 = getelementptr i32, ptr %.result.163, i32 %.result.164
  %.result.166 = load i32, ptr %.result.165
  %.result.167 = sub i32 0, 1
  %.result.168 = icmp eq i32 %.result.166, %.result.167
  %.result.169 = and i1 %.result.159, %.result.168
  br i1 %.result.169, label %label_true_21, label %label_false_22
label_true_21:
  %.result.170 = load i32, ptr %tail.1
  %.result.171 = add i32 %.result.170, 1
  store i32 %.result.171, ptr %tail.1
  %.result.172 = load ptr, ptr %xlist.1
  %.result.173 = load i32, ptr %tail.1
  %.result.174 = getelementptr i32, ptr %.result.172, i32 %.result.173
  %.result.175 = load i32, ptr %x.1
  store i32 %.result.175, ptr %.result.174
  %.result.176 = load ptr, ptr %ylist.1
  %.result.177 = load i32, ptr %tail.1
  %.result.178 = getelementptr i32, ptr %.result.176, i32 %.result.177
  %.result.179 = load i32, ptr %y.1
  store i32 %.result.179, ptr %.result.178
  %.result.180 = load ptr, ptr %step.1
  %.result.181 = load i32, ptr %x.1
  %.result.182 = getelementptr ptr, ptr %.result.180, i32 %.result.181
  %.result.183 = load ptr, ptr %.result.182
  %.result.184 = load i32, ptr %y.1
  %.result.185 = getelementptr i32, ptr %.result.183, i32 %.result.184
  %.result.186 = load i32, ptr %now.1
  %.result.187 = add i32 %.result.186, 1
  store i32 %.result.187, ptr %.result.185
  %.result.188 = load i32, ptr %x.1
  %.result.189 = load i32, ptr %targetx.1
  %.result.190 = icmp eq i32 %.result.188, %.result.189
  %.result.191 = load i32, ptr %y.1
  %.result.192 = load i32, ptr %targety.1
  %.result.193 = icmp eq i32 %.result.191, %.result.192
  %.result.194 = and i1 %.result.190, %.result.193
  br i1 %.result.194, label %label_true_24, label %label_false_25
label_true_24:
  store i32 1, ptr %ok.1
  br label %label_skip_26
label_false_25:
  br label %label_skip_26
label_skip_26:
  br label %label_skip_23
label_false_22:
  br label %label_skip_23
label_skip_23:
  %.result.195 = load ptr, ptr %xlist.1
  %.result.196 = load i32, ptr %head.1
  %.result.197 = getelementptr i32, ptr %.result.195, i32 %.result.196
  %.result.198 = load i32, ptr %.result.197
  %.result.199 = add i32 %.result.198, 1
  store i32 %.result.199, ptr %x.1
  %.result.200 = load ptr, ptr %ylist.1
  %.result.201 = load i32, ptr %head.1
  %.result.202 = getelementptr i32, ptr %.result.200, i32 %.result.201
  %.result.203 = load i32, ptr %.result.202
  %.result.204 = sub i32 %.result.203, 2
  store i32 %.result.204, ptr %y.1
  %.result.205 = load i32, ptr %x.1
  %.result.206 = load i32, ptr %N.1
  %.result.207 = call i1 @check(i32 %.result.205, i32 %.result.206)
  %.result.208 = load i32, ptr %y.1
  %.result.209 = load i32, ptr %N.1
  %.result.210 = call i1 @check(i32 %.result.208, i32 %.result.209)
  %.result.211 = and i1 %.result.207, %.result.210
  %.result.212 = load ptr, ptr %step.1
  %.result.213 = load i32, ptr %x.1
  %.result.214 = getelementptr ptr, ptr %.result.212, i32 %.result.213
  %.result.215 = load ptr, ptr %.result.214
  %.result.216 = load i32, ptr %y.1
  %.result.217 = getelementptr i32, ptr %.result.215, i32 %.result.216
  %.result.218 = load i32, ptr %.result.217
  %.result.219 = sub i32 0, 1
  %.result.220 = icmp eq i32 %.result.218, %.result.219
  %.result.221 = and i1 %.result.211, %.result.220
  br i1 %.result.221, label %label_true_27, label %label_false_28
label_true_27:
  %.result.222 = load i32, ptr %tail.1
  %.result.223 = add i32 %.result.222, 1
  store i32 %.result.223, ptr %tail.1
  %.result.224 = load ptr, ptr %xlist.1
  %.result.225 = load i32, ptr %tail.1
  %.result.226 = getelementptr i32, ptr %.result.224, i32 %.result.225
  %.result.227 = load i32, ptr %x.1
  store i32 %.result.227, ptr %.result.226
  %.result.228 = load ptr, ptr %ylist.1
  %.result.229 = load i32, ptr %tail.1
  %.result.230 = getelementptr i32, ptr %.result.228, i32 %.result.229
  %.result.231 = load i32, ptr %y.1
  store i32 %.result.231, ptr %.result.230
  %.result.232 = load ptr, ptr %step.1
  %.result.233 = load i32, ptr %x.1
  %.result.234 = getelementptr ptr, ptr %.result.232, i32 %.result.233
  %.result.235 = load ptr, ptr %.result.234
  %.result.236 = load i32, ptr %y.1
  %.result.237 = getelementptr i32, ptr %.result.235, i32 %.result.236
  %.result.238 = load i32, ptr %now.1
  %.result.239 = add i32 %.result.238, 1
  store i32 %.result.239, ptr %.result.237
  %.result.240 = load i32, ptr %x.1
  %.result.241 = load i32, ptr %targetx.1
  %.result.242 = icmp eq i32 %.result.240, %.result.241
  %.result.243 = load i32, ptr %y.1
  %.result.244 = load i32, ptr %targety.1
  %.result.245 = icmp eq i32 %.result.243, %.result.244
  %.result.246 = and i1 %.result.242, %.result.245
  br i1 %.result.246, label %label_true_30, label %label_false_31
label_true_30:
  store i32 1, ptr %ok.1
  br label %label_skip_32
label_false_31:
  br label %label_skip_32
label_skip_32:
  br label %label_skip_29
label_false_28:
  br label %label_skip_29
label_skip_29:
  %.result.247 = load ptr, ptr %xlist.1
  %.result.248 = load i32, ptr %head.1
  %.result.249 = getelementptr i32, ptr %.result.247, i32 %.result.248
  %.result.250 = load i32, ptr %.result.249
  %.result.251 = add i32 %.result.250, 1
  store i32 %.result.251, ptr %x.1
  %.result.252 = load ptr, ptr %ylist.1
  %.result.253 = load i32, ptr %head.1
  %.result.254 = getelementptr i32, ptr %.result.252, i32 %.result.253
  %.result.255 = load i32, ptr %.result.254
  %.result.256 = add i32 %.result.255, 2
  store i32 %.result.256, ptr %y.1
  %.result.257 = load i32, ptr %x.1
  %.result.258 = load i32, ptr %N.1
  %.result.259 = call i1 @check(i32 %.result.257, i32 %.result.258)
  %.result.260 = load i32, ptr %y.1
  %.result.261 = load i32, ptr %N.1
  %.result.262 = call i1 @check(i32 %.result.260, i32 %.result.261)
  %.result.263 = and i1 %.result.259, %.result.262
  %.result.264 = load ptr, ptr %step.1
  %.result.265 = load i32, ptr %x.1
  %.result.266 = getelementptr ptr, ptr %.result.264, i32 %.result.265
  %.result.267 = load ptr, ptr %.result.266
  %.result.268 = load i32, ptr %y.1
  %.result.269 = getelementptr i32, ptr %.result.267, i32 %.result.268
  %.result.270 = load i32, ptr %.result.269
  %.result.271 = sub i32 0, 1
  %.result.272 = icmp eq i32 %.result.270, %.result.271
  %.result.273 = and i1 %.result.263, %.result.272
  br i1 %.result.273, label %label_true_33, label %label_false_34
label_true_33:
  %.result.274 = load i32, ptr %tail.1
  %.result.275 = add i32 %.result.274, 1
  store i32 %.result.275, ptr %tail.1
  %.result.276 = load ptr, ptr %xlist.1
  %.result.277 = load i32, ptr %tail.1
  %.result.278 = getelementptr i32, ptr %.result.276, i32 %.result.277
  %.result.279 = load i32, ptr %x.1
  store i32 %.result.279, ptr %.result.278
  %.result.280 = load ptr, ptr %ylist.1
  %.result.281 = load i32, ptr %tail.1
  %.result.282 = getelementptr i32, ptr %.result.280, i32 %.result.281
  %.result.283 = load i32, ptr %y.1
  store i32 %.result.283, ptr %.result.282
  %.result.284 = load ptr, ptr %step.1
  %.result.285 = load i32, ptr %x.1
  %.result.286 = getelementptr ptr, ptr %.result.284, i32 %.result.285
  %.result.287 = load ptr, ptr %.result.286
  %.result.288 = load i32, ptr %y.1
  %.result.289 = getelementptr i32, ptr %.result.287, i32 %.result.288
  %.result.290 = load i32, ptr %now.1
  %.result.291 = add i32 %.result.290, 1
  store i32 %.result.291, ptr %.result.289
  %.result.292 = load i32, ptr %x.1
  %.result.293 = load i32, ptr %targetx.1
  %.result.294 = icmp eq i32 %.result.292, %.result.293
  %.result.295 = load i32, ptr %y.1
  %.result.296 = load i32, ptr %targety.1
  %.result.297 = icmp eq i32 %.result.295, %.result.296
  %.result.298 = and i1 %.result.294, %.result.297
  br i1 %.result.298, label %label_true_36, label %label_false_37
label_true_36:
  store i32 1, ptr %ok.1
  br label %label_skip_38
label_false_37:
  br label %label_skip_38
label_skip_38:
  br label %label_skip_35
label_false_34:
  br label %label_skip_35
label_skip_35:
  %.result.299 = load ptr, ptr %xlist.1
  %.result.300 = load i32, ptr %head.1
  %.result.301 = getelementptr i32, ptr %.result.299, i32 %.result.300
  %.result.302 = load i32, ptr %.result.301
  %.result.303 = sub i32 %.result.302, 2
  store i32 %.result.303, ptr %x.1
  %.result.304 = load ptr, ptr %ylist.1
  %.result.305 = load i32, ptr %head.1
  %.result.306 = getelementptr i32, ptr %.result.304, i32 %.result.305
  %.result.307 = load i32, ptr %.result.306
  %.result.308 = sub i32 %.result.307, 1
  store i32 %.result.308, ptr %y.1
  %.result.309 = load i32, ptr %x.1
  %.result.310 = load i32, ptr %N.1
  %.result.311 = call i1 @check(i32 %.result.309, i32 %.result.310)
  %.result.312 = load i32, ptr %y.1
  %.result.313 = load i32, ptr %N.1
  %.result.314 = call i1 @check(i32 %.result.312, i32 %.result.313)
  %.result.315 = and i1 %.result.311, %.result.314
  %.result.316 = load ptr, ptr %step.1
  %.result.317 = load i32, ptr %x.1
  %.result.318 = getelementptr ptr, ptr %.result.316, i32 %.result.317
  %.result.319 = load ptr, ptr %.result.318
  %.result.320 = load i32, ptr %y.1
  %.result.321 = getelementptr i32, ptr %.result.319, i32 %.result.320
  %.result.322 = load i32, ptr %.result.321
  %.result.323 = sub i32 0, 1
  %.result.324 = icmp eq i32 %.result.322, %.result.323
  %.result.325 = and i1 %.result.315, %.result.324
  br i1 %.result.325, label %label_true_39, label %label_false_40
label_true_39:
  %.result.326 = load i32, ptr %tail.1
  %.result.327 = add i32 %.result.326, 1
  store i32 %.result.327, ptr %tail.1
  %.result.328 = load ptr, ptr %xlist.1
  %.result.329 = load i32, ptr %tail.1
  %.result.330 = getelementptr i32, ptr %.result.328, i32 %.result.329
  %.result.331 = load i32, ptr %x.1
  store i32 %.result.331, ptr %.result.330
  %.result.332 = load ptr, ptr %ylist.1
  %.result.333 = load i32, ptr %tail.1
  %.result.334 = getelementptr i32, ptr %.result.332, i32 %.result.333
  %.result.335 = load i32, ptr %y.1
  store i32 %.result.335, ptr %.result.334
  %.result.336 = load ptr, ptr %step.1
  %.result.337 = load i32, ptr %x.1
  %.result.338 = getelementptr ptr, ptr %.result.336, i32 %.result.337
  %.result.339 = load ptr, ptr %.result.338
  %.result.340 = load i32, ptr %y.1
  %.result.341 = getelementptr i32, ptr %.result.339, i32 %.result.340
  %.result.342 = load i32, ptr %now.1
  %.result.343 = add i32 %.result.342, 1
  store i32 %.result.343, ptr %.result.341
  %.result.344 = load i32, ptr %x.1
  %.result.345 = load i32, ptr %targetx.1
  %.result.346 = icmp eq i32 %.result.344, %.result.345
  %.result.347 = load i32, ptr %y.1
  %.result.348 = load i32, ptr %targety.1
  %.result.349 = icmp eq i32 %.result.347, %.result.348
  %.result.350 = and i1 %.result.346, %.result.349
  br i1 %.result.350, label %label_true_42, label %label_false_43
label_true_42:
  store i32 1, ptr %ok.1
  br label %label_skip_44
label_false_43:
  br label %label_skip_44
label_skip_44:
  br label %label_skip_41
label_false_40:
  br label %label_skip_41
label_skip_41:
  %.result.351 = load ptr, ptr %xlist.1
  %.result.352 = load i32, ptr %head.1
  %.result.353 = getelementptr i32, ptr %.result.351, i32 %.result.352
  %.result.354 = load i32, ptr %.result.353
  %.result.355 = sub i32 %.result.354, 2
  store i32 %.result.355, ptr %x.1
  %.result.356 = load ptr, ptr %ylist.1
  %.result.357 = load i32, ptr %head.1
  %.result.358 = getelementptr i32, ptr %.result.356, i32 %.result.357
  %.result.359 = load i32, ptr %.result.358
  %.result.360 = add i32 %.result.359, 1
  store i32 %.result.360, ptr %y.1
  %.result.361 = load i32, ptr %x.1
  %.result.362 = load i32, ptr %N.1
  %.result.363 = call i1 @check(i32 %.result.361, i32 %.result.362)
  %.result.364 = load i32, ptr %y.1
  %.result.365 = load i32, ptr %N.1
  %.result.366 = call i1 @check(i32 %.result.364, i32 %.result.365)
  %.result.367 = and i1 %.result.363, %.result.366
  %.result.368 = load ptr, ptr %step.1
  %.result.369 = load i32, ptr %x.1
  %.result.370 = getelementptr ptr, ptr %.result.368, i32 %.result.369
  %.result.371 = load ptr, ptr %.result.370
  %.result.372 = load i32, ptr %y.1
  %.result.373 = getelementptr i32, ptr %.result.371, i32 %.result.372
  %.result.374 = load i32, ptr %.result.373
  %.result.375 = sub i32 0, 1
  %.result.376 = icmp eq i32 %.result.374, %.result.375
  %.result.377 = and i1 %.result.367, %.result.376
  br i1 %.result.377, label %label_true_45, label %label_false_46
label_true_45:
  %.result.378 = load i32, ptr %tail.1
  %.result.379 = add i32 %.result.378, 1
  store i32 %.result.379, ptr %tail.1
  %.result.380 = load ptr, ptr %xlist.1
  %.result.381 = load i32, ptr %tail.1
  %.result.382 = getelementptr i32, ptr %.result.380, i32 %.result.381
  %.result.383 = load i32, ptr %x.1
  store i32 %.result.383, ptr %.result.382
  %.result.384 = load ptr, ptr %ylist.1
  %.result.385 = load i32, ptr %tail.1
  %.result.386 = getelementptr i32, ptr %.result.384, i32 %.result.385
  %.result.387 = load i32, ptr %y.1
  store i32 %.result.387, ptr %.result.386
  %.result.388 = load ptr, ptr %step.1
  %.result.389 = load i32, ptr %x.1
  %.result.390 = getelementptr ptr, ptr %.result.388, i32 %.result.389
  %.result.391 = load ptr, ptr %.result.390
  %.result.392 = load i32, ptr %y.1
  %.result.393 = getelementptr i32, ptr %.result.391, i32 %.result.392
  %.result.394 = load i32, ptr %now.1
  %.result.395 = add i32 %.result.394, 1
  store i32 %.result.395, ptr %.result.393
  %.result.396 = load i32, ptr %x.1
  %.result.397 = load i32, ptr %targetx.1
  %.result.398 = icmp eq i32 %.result.396, %.result.397
  %.result.399 = load i32, ptr %y.1
  %.result.400 = load i32, ptr %targety.1
  %.result.401 = icmp eq i32 %.result.399, %.result.400
  %.result.402 = and i1 %.result.398, %.result.401
  br i1 %.result.402, label %label_true_48, label %label_false_49
label_true_48:
  store i32 1, ptr %ok.1
  br label %label_skip_50
label_false_49:
  br label %label_skip_50
label_skip_50:
  br label %label_skip_47
label_false_46:
  br label %label_skip_47
label_skip_47:
  %.result.403 = load ptr, ptr %xlist.1
  %.result.404 = load i32, ptr %head.1
  %.result.405 = getelementptr i32, ptr %.result.403, i32 %.result.404
  %.result.406 = load i32, ptr %.result.405
  %.result.407 = add i32 %.result.406, 2
  store i32 %.result.407, ptr %x.1
  %.result.408 = load ptr, ptr %ylist.1
  %.result.409 = load i32, ptr %head.1
  %.result.410 = getelementptr i32, ptr %.result.408, i32 %.result.409
  %.result.411 = load i32, ptr %.result.410
  %.result.412 = sub i32 %.result.411, 1
  store i32 %.result.412, ptr %y.1
  %.result.413 = load i32, ptr %x.1
  %.result.414 = load i32, ptr %N.1
  %.result.415 = call i1 @check(i32 %.result.413, i32 %.result.414)
  %.result.416 = load i32, ptr %y.1
  %.result.417 = load i32, ptr %N.1
  %.result.418 = call i1 @check(i32 %.result.416, i32 %.result.417)
  %.result.419 = and i1 %.result.415, %.result.418
  %.result.420 = load ptr, ptr %step.1
  %.result.421 = load i32, ptr %x.1
  %.result.422 = getelementptr ptr, ptr %.result.420, i32 %.result.421
  %.result.423 = load ptr, ptr %.result.422
  %.result.424 = load i32, ptr %y.1
  %.result.425 = getelementptr i32, ptr %.result.423, i32 %.result.424
  %.result.426 = load i32, ptr %.result.425
  %.result.427 = sub i32 0, 1
  %.result.428 = icmp eq i32 %.result.426, %.result.427
  %.result.429 = and i1 %.result.419, %.result.428
  br i1 %.result.429, label %label_true_51, label %label_false_52
label_true_51:
  %.result.430 = load i32, ptr %tail.1
  %.result.431 = add i32 %.result.430, 1
  store i32 %.result.431, ptr %tail.1
  %.result.432 = load ptr, ptr %xlist.1
  %.result.433 = load i32, ptr %tail.1
  %.result.434 = getelementptr i32, ptr %.result.432, i32 %.result.433
  %.result.435 = load i32, ptr %x.1
  store i32 %.result.435, ptr %.result.434
  %.result.436 = load ptr, ptr %ylist.1
  %.result.437 = load i32, ptr %tail.1
  %.result.438 = getelementptr i32, ptr %.result.436, i32 %.result.437
  %.result.439 = load i32, ptr %y.1
  store i32 %.result.439, ptr %.result.438
  %.result.440 = load ptr, ptr %step.1
  %.result.441 = load i32, ptr %x.1
  %.result.442 = getelementptr ptr, ptr %.result.440, i32 %.result.441
  %.result.443 = load ptr, ptr %.result.442
  %.result.444 = load i32, ptr %y.1
  %.result.445 = getelementptr i32, ptr %.result.443, i32 %.result.444
  %.result.446 = load i32, ptr %now.1
  %.result.447 = add i32 %.result.446, 1
  store i32 %.result.447, ptr %.result.445
  %.result.448 = load i32, ptr %x.1
  %.result.449 = load i32, ptr %targetx.1
  %.result.450 = icmp eq i32 %.result.448, %.result.449
  %.result.451 = load i32, ptr %y.1
  %.result.452 = load i32, ptr %targety.1
  %.result.453 = icmp eq i32 %.result.451, %.result.452
  %.result.454 = and i1 %.result.450, %.result.453
  br i1 %.result.454, label %label_true_54, label %label_false_55
label_true_54:
  store i32 1, ptr %ok.1
  br label %label_skip_56
label_false_55:
  br label %label_skip_56
label_skip_56:
  br label %label_skip_53
label_false_52:
  br label %label_skip_53
label_skip_53:
  %.result.455 = load ptr, ptr %xlist.1
  %.result.456 = load i32, ptr %head.1
  %.result.457 = getelementptr i32, ptr %.result.455, i32 %.result.456
  %.result.458 = load i32, ptr %.result.457
  %.result.459 = add i32 %.result.458, 2
  store i32 %.result.459, ptr %x.1
  %.result.460 = load ptr, ptr %ylist.1
  %.result.461 = load i32, ptr %head.1
  %.result.462 = getelementptr i32, ptr %.result.460, i32 %.result.461
  %.result.463 = load i32, ptr %.result.462
  %.result.464 = add i32 %.result.463, 1
  store i32 %.result.464, ptr %y.1
  %.result.465 = load i32, ptr %x.1
  %.result.466 = load i32, ptr %N.1
  %.result.467 = call i1 @check(i32 %.result.465, i32 %.result.466)
  %.result.468 = load i32, ptr %y.1
  %.result.469 = load i32, ptr %N.1
  %.result.470 = call i1 @check(i32 %.result.468, i32 %.result.469)
  %.result.471 = and i1 %.result.467, %.result.470
  %.result.472 = load ptr, ptr %step.1
  %.result.473 = load i32, ptr %x.1
  %.result.474 = getelementptr ptr, ptr %.result.472, i32 %.result.473
  %.result.475 = load ptr, ptr %.result.474
  %.result.476 = load i32, ptr %y.1
  %.result.477 = getelementptr i32, ptr %.result.475, i32 %.result.476
  %.result.478 = load i32, ptr %.result.477
  %.result.479 = sub i32 0, 1
  %.result.480 = icmp eq i32 %.result.478, %.result.479
  %.result.481 = and i1 %.result.471, %.result.480
  br i1 %.result.481, label %label_true_57, label %label_false_58
label_true_57:
  %.result.482 = load i32, ptr %tail.1
  %.result.483 = add i32 %.result.482, 1
  store i32 %.result.483, ptr %tail.1
  %.result.484 = load ptr, ptr %xlist.1
  %.result.485 = load i32, ptr %tail.1
  %.result.486 = getelementptr i32, ptr %.result.484, i32 %.result.485
  %.result.487 = load i32, ptr %x.1
  store i32 %.result.487, ptr %.result.486
  %.result.488 = load ptr, ptr %ylist.1
  %.result.489 = load i32, ptr %tail.1
  %.result.490 = getelementptr i32, ptr %.result.488, i32 %.result.489
  %.result.491 = load i32, ptr %y.1
  store i32 %.result.491, ptr %.result.490
  %.result.492 = load ptr, ptr %step.1
  %.result.493 = load i32, ptr %x.1
  %.result.494 = getelementptr ptr, ptr %.result.492, i32 %.result.493
  %.result.495 = load ptr, ptr %.result.494
  %.result.496 = load i32, ptr %y.1
  %.result.497 = getelementptr i32, ptr %.result.495, i32 %.result.496
  %.result.498 = load i32, ptr %now.1
  %.result.499 = add i32 %.result.498, 1
  store i32 %.result.499, ptr %.result.497
  %.result.500 = load i32, ptr %x.1
  %.result.501 = load i32, ptr %targetx.1
  %.result.502 = icmp eq i32 %.result.500, %.result.501
  %.result.503 = load i32, ptr %y.1
  %.result.504 = load i32, ptr %targety.1
  %.result.505 = icmp eq i32 %.result.503, %.result.504
  %.result.506 = and i1 %.result.502, %.result.505
  br i1 %.result.506, label %label_true_60, label %label_false_61
label_true_60:
  store i32 1, ptr %ok.1
  br label %label_skip_62
label_false_61:
  br label %label_skip_62
label_skip_62:
  br label %label_skip_59
label_false_58:
  br label %label_skip_59
label_skip_59:
  %.result.507 = load i32, ptr %ok.1
  %.result.508 = icmp eq i32 %.result.507, 1
  br i1 %.result.508, label %label_true_63, label %label_false_64
label_true_63:
  br label %label_skip_13
  br label %label_skip_65
label_false_64:
  br label %label_skip_65
label_skip_65:
  %.result.509 = load i32, ptr %head.1
  %.result.510 = add i32 %.result.509, 1
  store i32 %.result.510, ptr %head.1
label_skip_13:
  %.result.511 = load i32, ptr %ok.1
  %.result.512 = icmp eq i32 %.result.511, 1
  br i1 %.result.512, label %label_true_66, label %label_false_67
label_true_66:
  %.result.513 = load ptr, ptr %step.1
  %.result.514 = load i32, ptr %targetx.1
  %.result.515 = getelementptr ptr, ptr %.result.513, i32 %.result.514
  %.result.516 = load ptr, ptr %.result.515
  %.result.517 = load i32, ptr %targety.1
  %.result.518 = getelementptr i32, ptr %.result.516, i32 %.result.517
  %.result.519 = load i32, ptr %.result.518
  %.result.520 = call ptr @toString(i32 %.result.519)
  call void @println(ptr %.result.520)
  br label %label_skip_68
label_false_67:
  call void @print(ptr @.str.pre_0)
  br label %label_skip_68
label_skip_68:
  ret i32 0
}
