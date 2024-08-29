@.str.pre_0 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.pre_1 = private unnamed_addr constant [3 x i8] c", \00"
@.str.pre_2 = private unnamed_addr constant [3 x i8] c", \00"
@.str.pre_3 = private unnamed_addr constant [2 x i8] c")\00"
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
%class.point = type { i32, i32, i32 }

%.result.0 = getelementptr i32, ptr %this, i32 0
store i32 0, ptr %.result.0
%.result.1 = getelementptr i32, ptr %this, i32 1
store i32 0, ptr %.result.1
%.result.2 = getelementptr i32, ptr %this, i32 2
store i32 0, ptr %.result.2
define void @point..set(ptr %this, i32 %a_x, i32 %a_y, i32 %a_z) {
entry:
  %a_x.2 = alloca i32
  store i32 %a_x, ptr %a_x.2
  %a_y.2 = alloca i32
  store i32 %a_y, ptr %a_y.2
  %a_z.2 = alloca i32
  store i32 %a_z, ptr %a_z.2
  %.result.3 = getelementptr i32, ptr %this, i32 0
  %.result.4 = load i32, ptr %a_x.2
  store i32 %.result.4, ptr %.result.3
  %.result.5 = getelementptr i32, ptr %this, i32 1
  %.result.6 = load i32, ptr %a_y.2
  store i32 %.result.6, ptr %.result.5
  %.result.7 = getelementptr i32, ptr %this, i32 2
  %.result.8 = load i32, ptr %a_z.2
  store i32 %.result.8, ptr %.result.7
ret void
}

define i32 @point..sqrLen(ptr %this) {
entry:
  %.result.9 = getelementptr i32, ptr %this, i32 0
  %.result.10 = load i32, ptr %this
  %.result.11 = getelementptr i32, ptr %this, i32 0
  %.result.12 = load i32, ptr %this
  %.result.13 = mul i32 %.result.10, %.result.12
  %.result.14 = getelementptr i32, ptr %this, i32 1
  %.result.15 = load i32, ptr %this
  %.result.16 = getelementptr i32, ptr %this, i32 1
  %.result.17 = load i32, ptr %this
  %.result.18 = mul i32 %.result.15, %.result.17
  %.result.19 = add i32 %.result.13, %.result.18
  %.result.20 = getelementptr i32, ptr %this, i32 2
  %.result.21 = load i32, ptr %this
  %.result.22 = getelementptr i32, ptr %this, i32 2
  %.result.23 = load i32, ptr %this
  %.result.24 = mul i32 %.result.21, %.result.23
  %.result.25 = add i32 %.result.19, %.result.24
  ret i32 %.result.25
}

define i32 @point..sqrDis(ptr %this, ptr %other) {
entry:
  %other.2 = alloca ptr
  store ptr %other, ptr %other.2
  %.result.26 = getelementptr i32, ptr %this, i32 0
  %.result.27 = load i32, ptr %this
  %.result.28 = load ptr, ptr %other.2
  %.result.29 = getelementptr %class.point, ptr %.result.28, i32 0
  %.result.30 = getelementptr %class.point, ptr %.result.29, i32 0
  %.result.31 = load i32, ptr %.result.30
  %.result.32 = sub i32 %.result.27, %.result.31
  %.result.33 = getelementptr i32, ptr %this, i32 0
  %.result.34 = load i32, ptr %this
  %.result.35 = load ptr, ptr %other.2
  %.result.36 = getelementptr %class.point, ptr %.result.35, i32 0
  %.result.37 = getelementptr %class.point, ptr %.result.36, i32 0
  %.result.38 = load i32, ptr %.result.37
  %.result.39 = sub i32 %.result.34, %.result.38
  %.result.40 = mul i32 %.result.32, %.result.39
  %.result.41 = getelementptr i32, ptr %this, i32 1
  %.result.42 = load i32, ptr %this
  %.result.43 = load ptr, ptr %other.2
  %.result.44 = getelementptr %class.point, ptr %.result.43, i32 0
  %.result.45 = getelementptr %class.point, ptr %.result.44, i32 1
  %.result.46 = load i32, ptr %.result.45
  %.result.47 = sub i32 %.result.42, %.result.46
  %.result.48 = getelementptr i32, ptr %this, i32 1
  %.result.49 = load i32, ptr %this
  %.result.50 = load ptr, ptr %other.2
  %.result.51 = getelementptr %class.point, ptr %.result.50, i32 0
  %.result.52 = getelementptr %class.point, ptr %.result.51, i32 1
  %.result.53 = load i32, ptr %.result.52
  %.result.54 = sub i32 %.result.49, %.result.53
  %.result.55 = mul i32 %.result.47, %.result.54
  %.result.56 = add i32 %.result.40, %.result.55
  %.result.57 = getelementptr i32, ptr %this, i32 2
  %.result.58 = load i32, ptr %this
  %.result.59 = load ptr, ptr %other.2
  %.result.60 = getelementptr %class.point, ptr %.result.59, i32 0
  %.result.61 = getelementptr %class.point, ptr %.result.60, i32 2
  %.result.62 = load i32, ptr %.result.61
  %.result.63 = sub i32 %.result.58, %.result.62
  %.result.64 = getelementptr i32, ptr %this, i32 2
  %.result.65 = load i32, ptr %this
  %.result.66 = load ptr, ptr %other.2
  %.result.67 = getelementptr %class.point, ptr %.result.66, i32 0
  %.result.68 = getelementptr %class.point, ptr %.result.67, i32 2
  %.result.69 = load i32, ptr %.result.68
  %.result.70 = sub i32 %.result.65, %.result.69
  %.result.71 = mul i32 %.result.63, %.result.70
  %.result.72 = add i32 %.result.56, %.result.71
  ret i32 %.result.72
}

define i32 @point..dot(ptr %this, ptr %other) {
entry:
  %other.2 = alloca ptr
  store ptr %other, ptr %other.2
  %.result.73 = getelementptr i32, ptr %this, i32 0
  %.result.74 = load i32, ptr %this
  %.result.75 = load ptr, ptr %other.2
  %.result.76 = getelementptr %class.point, ptr %.result.75, i32 0
  %.result.77 = getelementptr %class.point, ptr %.result.76, i32 0
  %.result.78 = load i32, ptr %.result.77
  %.result.79 = mul i32 %.result.74, %.result.78
  %.result.80 = getelementptr i32, ptr %this, i32 1
  %.result.81 = load i32, ptr %this
  %.result.82 = load ptr, ptr %other.2
  %.result.83 = getelementptr %class.point, ptr %.result.82, i32 0
  %.result.84 = getelementptr %class.point, ptr %.result.83, i32 1
  %.result.85 = load i32, ptr %.result.84
  %.result.86 = mul i32 %.result.81, %.result.85
  %.result.87 = add i32 %.result.79, %.result.86
  %.result.88 = getelementptr i32, ptr %this, i32 2
  %.result.89 = load i32, ptr %this
  %.result.90 = load ptr, ptr %other.2
  %.result.91 = getelementptr %class.point, ptr %.result.90, i32 0
  %.result.92 = getelementptr %class.point, ptr %.result.91, i32 2
  %.result.93 = load i32, ptr %.result.92
  %.result.94 = mul i32 %.result.89, %.result.93
  %.result.95 = add i32 %.result.87, %.result.94
  ret i32 %.result.95
}

define ptr @point..cross(ptr %this, ptr %other) {
entry:
  %retval.2 = alloca ptr
  %other.2 = alloca ptr
  store ptr %other, ptr %other.2
  %.result.96 = call ptr @.malloc(i32 16)
  store ptr %.result.96, ptr %retval.2
  %.result.97 = load ptr, ptr %retval.2
  %.result.98 = getelementptr i32, ptr %this, i32 1
  %.result.99 = load i32, ptr %this
  %.result.100 = load ptr, ptr %other.2
  %.result.101 = getelementptr %class.point, ptr %.result.100, i32 0
  %.result.102 = getelementptr %class.point, ptr %.result.101, i32 2
  %.result.103 = load i32, ptr %.result.102
  %.result.104 = mul i32 %.result.99, %.result.103
  %.result.105 = getelementptr i32, ptr %this, i32 2
  %.result.106 = load i32, ptr %this
  %.result.107 = load ptr, ptr %other.2
  %.result.108 = getelementptr %class.point, ptr %.result.107, i32 0
  %.result.109 = getelementptr %class.point, ptr %.result.108, i32 1
  %.result.110 = load i32, ptr %.result.109
  %.result.111 = mul i32 %.result.106, %.result.110
  %.result.112 = sub i32 %.result.104, %.result.111
  %.result.113 = getelementptr i32, ptr %this, i32 2
  %.result.114 = load i32, ptr %this
  %.result.115 = load ptr, ptr %other.2
  %.result.116 = getelementptr %class.point, ptr %.result.115, i32 0
  %.result.117 = getelementptr %class.point, ptr %.result.116, i32 0
  %.result.118 = load i32, ptr %.result.117
  %.result.119 = mul i32 %.result.114, %.result.118
  %.result.120 = getelementptr i32, ptr %this, i32 0
  %.result.121 = load i32, ptr %this
  %.result.122 = load ptr, ptr %other.2
  %.result.123 = getelementptr %class.point, ptr %.result.122, i32 0
  %.result.124 = getelementptr %class.point, ptr %.result.123, i32 2
  %.result.125 = load i32, ptr %.result.124
  %.result.126 = mul i32 %.result.121, %.result.125
  %.result.127 = sub i32 %.result.119, %.result.126
  %.result.128 = getelementptr i32, ptr %this, i32 0
  %.result.129 = load i32, ptr %this
  %.result.130 = load ptr, ptr %other.2
  %.result.131 = getelementptr %class.point, ptr %.result.130, i32 0
  %.result.132 = getelementptr %class.point, ptr %.result.131, i32 1
  %.result.133 = load i32, ptr %.result.132
  %.result.134 = mul i32 %.result.129, %.result.133
  %.result.135 = getelementptr i32, ptr %this, i32 1
  %.result.136 = load i32, ptr %this
  %.result.137 = load ptr, ptr %other.2
  %.result.138 = getelementptr %class.point, ptr %.result.137, i32 0
  %.result.139 = getelementptr %class.point, ptr %.result.138, i32 0
  %.result.140 = load i32, ptr %.result.139
  %.result.141 = mul i32 %.result.136, %.result.140
  %.result.142 = sub i32 %.result.134, %.result.141
  call void @point..set(ptr %.result.97, i32 %.result.112, i32 %.result.127, i32 %.result.142)
  %.result.143 = load ptr, ptr %retval.2
  ret ptr %.result.143
}

define ptr @point..add(ptr %this, ptr %other) {
entry:
  %other.2 = alloca ptr
  store ptr %other, ptr %other.2
  %.result.144 = getelementptr i32, ptr %this, i32 0
  %.result.145 = getelementptr i32, ptr %this, i32 0
  %.result.146 = load i32, ptr %this
  %.result.147 = load ptr, ptr %other.2
  %.result.148 = getelementptr %class.point, ptr %.result.147, i32 0
  %.result.149 = getelementptr %class.point, ptr %.result.148, i32 0
  %.result.150 = load i32, ptr %.result.149
  %.result.151 = add i32 %.result.146, %.result.150
  store i32 %.result.151, ptr %.result.144
  %.result.152 = getelementptr i32, ptr %this, i32 1
  %.result.153 = getelementptr i32, ptr %this, i32 1
  %.result.154 = load i32, ptr %this
  %.result.155 = load ptr, ptr %other.2
  %.result.156 = getelementptr %class.point, ptr %.result.155, i32 0
  %.result.157 = getelementptr %class.point, ptr %.result.156, i32 1
  %.result.158 = load i32, ptr %.result.157
  %.result.159 = add i32 %.result.154, %.result.158
  store i32 %.result.159, ptr %.result.152
  %.result.160 = getelementptr i32, ptr %this, i32 2
  %.result.161 = getelementptr i32, ptr %this, i32 2
  %.result.162 = load i32, ptr %this
  %.result.163 = load ptr, ptr %other.2
  %.result.164 = getelementptr %class.point, ptr %.result.163, i32 0
  %.result.165 = getelementptr %class.point, ptr %.result.164, i32 2
  %.result.166 = load i32, ptr %.result.165
  %.result.167 = add i32 %.result.162, %.result.166
  store i32 %.result.167, ptr %.result.160
  ret ptr %this
}

define ptr @point..sub(ptr %this, ptr %other) {
entry:
  %other.2 = alloca ptr
  store ptr %other, ptr %other.2
  %.result.168 = getelementptr i32, ptr %this, i32 0
  %.result.169 = getelementptr i32, ptr %this, i32 0
  %.result.170 = load i32, ptr %this
  %.result.171 = load ptr, ptr %other.2
  %.result.172 = getelementptr %class.point, ptr %.result.171, i32 0
  %.result.173 = getelementptr %class.point, ptr %.result.172, i32 0
  %.result.174 = load i32, ptr %.result.173
  %.result.175 = sub i32 %.result.170, %.result.174
  store i32 %.result.175, ptr %.result.168
  %.result.176 = getelementptr i32, ptr %this, i32 1
  %.result.177 = getelementptr i32, ptr %this, i32 1
  %.result.178 = load i32, ptr %this
  %.result.179 = load ptr, ptr %other.2
  %.result.180 = getelementptr %class.point, ptr %.result.179, i32 0
  %.result.181 = getelementptr %class.point, ptr %.result.180, i32 1
  %.result.182 = load i32, ptr %.result.181
  %.result.183 = sub i32 %.result.178, %.result.182
  store i32 %.result.183, ptr %.result.176
  %.result.184 = getelementptr i32, ptr %this, i32 2
  %.result.185 = getelementptr i32, ptr %this, i32 2
  %.result.186 = load i32, ptr %this
  %.result.187 = load ptr, ptr %other.2
  %.result.188 = getelementptr %class.point, ptr %.result.187, i32 0
  %.result.189 = getelementptr %class.point, ptr %.result.188, i32 2
  %.result.190 = load i32, ptr %.result.189
  %.result.191 = sub i32 %.result.186, %.result.190
  store i32 %.result.191, ptr %.result.184
  ret ptr %this
}

define void @point..printPoint(ptr %this) {
entry:
  %.result.192 = getelementptr i32, ptr %this, i32 0
  %.result.193 = load i32, ptr %this
  %.result.194 = call ptr @toString(i32 %.result.193)
  %.result.195 = call ptr @.str.add(ptr @.str.pre_0, ptr %.result.194)
  %.result.196 = call ptr @.str.add(ptr %.result.195, ptr @.str.pre_1)
  %.result.197 = getelementptr i32, ptr %this, i32 1
  %.result.198 = load i32, ptr %this
  %.result.199 = call ptr @toString(i32 %.result.198)
  %.result.200 = call ptr @.str.add(ptr %.result.196, ptr %.result.199)
  %.result.201 = call ptr @.str.add(ptr %.result.200, ptr @.str.pre_2)
  %.result.202 = getelementptr i32, ptr %this, i32 2
  %.result.203 = load i32, ptr %this
  %.result.204 = call ptr @toString(i32 %.result.203)
  %.result.205 = call ptr @.str.add(ptr %.result.201, ptr %.result.204)
  %.result.206 = call ptr @.str.add(ptr %.result.205, ptr @.str.pre_3)
  call void @println(ptr %.result.206)
ret void
}

define void @.init() {
entry:
  ret void
}
define i32 @main() {
entry:
  %a.1 = alloca ptr
  %b.1 = alloca ptr
  %c.1 = alloca ptr
  %d.1 = alloca ptr
  call void @.init()
  %.result.207 = call ptr @.malloc(i32 16)
  store ptr %.result.207, ptr %a.1
  %.result.208 = call ptr @.malloc(i32 16)
  store ptr %.result.208, ptr %b.1
  %.result.209 = call ptr @.malloc(i32 16)
  store ptr %.result.209, ptr %c.1
  %.result.210 = call ptr @.malloc(i32 16)
  store ptr %.result.210, ptr %d.1
  %.result.211 = load ptr, ptr %a.1
  call void @point..printPoint(ptr %.result.211)
  %.result.212 = load ptr, ptr %a.1
  %.result.213 = sub i32 0, 463
  call void @point..set(ptr %.result.212, i32 849, i32 %.result.213, i32 480)
  %.result.214 = load ptr, ptr %b.1
  %.result.215 = sub i32 0, 208
  %.result.216 = sub i32 0, 150
  call void @point..set(ptr %.result.214, i32 %.result.215, i32 585, i32 %.result.216)
  %.result.217 = load ptr, ptr %c.1
  %.result.218 = sub i32 0, 670
  %.result.219 = sub i32 0, 742
  call void @point..set(ptr %.result.217, i32 360, i32 %.result.218, i32 %.result.219)
  %.result.220 = load ptr, ptr %d.1
  %.result.221 = sub i32 0, 29
  %.result.222 = sub i32 0, 591
  %.result.223 = sub i32 0, 960
  call void @point..set(ptr %.result.220, i32 %.result.221, i32 %.result.222, i32 %.result.223)
  %.result.224 = load ptr, ptr %a.1
  %.result.225 = load ptr, ptr %b.1
  %.result.226 = call ptr @point..add(ptr %.result.224, ptr %.result.225)
  %.result.227 = load ptr, ptr %b.1
  %.result.228 = load ptr, ptr %c.1
  %.result.229 = call ptr @point..add(ptr %.result.227, ptr %.result.228)
  %.result.230 = load ptr, ptr %d.1
  %.result.231 = load ptr, ptr %c.1
  %.result.232 = call ptr @point..add(ptr %.result.230, ptr %.result.231)
  %.result.233 = load ptr, ptr %c.1
  %.result.234 = load ptr, ptr %a.1
  %.result.235 = call ptr @point..sub(ptr %.result.233, ptr %.result.234)
  %.result.236 = load ptr, ptr %b.1
  %.result.237 = load ptr, ptr %d.1
  %.result.238 = call ptr @point..sub(ptr %.result.236, ptr %.result.237)
  %.result.239 = load ptr, ptr %d.1
  %.result.240 = load ptr, ptr %c.1
  %.result.241 = call ptr @point..sub(ptr %.result.239, ptr %.result.240)
  %.result.242 = load ptr, ptr %c.1
  %.result.243 = load ptr, ptr %b.1
  %.result.244 = call ptr @point..add(ptr %.result.242, ptr %.result.243)
  %.result.245 = load ptr, ptr %a.1
  %.result.246 = load ptr, ptr %b.1
  %.result.247 = call ptr @point..add(ptr %.result.245, ptr %.result.246)
  %.result.248 = load ptr, ptr %b.1
  %.result.249 = load ptr, ptr %b.1
  %.result.250 = call ptr @point..add(ptr %.result.248, ptr %.result.249)
  %.result.251 = load ptr, ptr %c.1
  %.result.252 = load ptr, ptr %c.1
  %.result.253 = call ptr @point..add(ptr %.result.251, ptr %.result.252)
  %.result.254 = load ptr, ptr %a.1
  %.result.255 = load ptr, ptr %d.1
  %.result.256 = call ptr @point..sub(ptr %.result.254, ptr %.result.255)
  %.result.257 = load ptr, ptr %a.1
  %.result.258 = load ptr, ptr %b.1
  %.result.259 = call ptr @point..add(ptr %.result.257, ptr %.result.258)
  %.result.260 = load ptr, ptr %b.1
  %.result.261 = load ptr, ptr %c.1
  %.result.262 = call ptr @point..sub(ptr %.result.260, ptr %.result.261)
  %.result.263 = load ptr, ptr %a.1
  %.result.264 = call i32 @point..sqrLen(ptr %.result.263)
  %.result.265 = call ptr @toString(i32 %.result.264)
  call void @println(ptr %.result.265)
  %.result.266 = load ptr, ptr %b.1
  %.result.267 = call i32 @point..sqrLen(ptr %.result.266)
  %.result.268 = call ptr @toString(i32 %.result.267)
  call void @println(ptr %.result.268)
  %.result.269 = load ptr, ptr %b.1
  %.result.270 = load ptr, ptr %c.1
  %.result.271 = call i32 @point..sqrDis(ptr %.result.269, ptr %.result.270)
  %.result.272 = call ptr @toString(i32 %.result.271)
  call void @println(ptr %.result.272)
  %.result.273 = load ptr, ptr %d.1
  %.result.274 = load ptr, ptr %a.1
  %.result.275 = call i32 @point..sqrDis(ptr %.result.273, ptr %.result.274)
  %.result.276 = call ptr @toString(i32 %.result.275)
  call void @println(ptr %.result.276)
  %.result.277 = load ptr, ptr %c.1
  %.result.278 = load ptr, ptr %a.1
  %.result.279 = call i32 @point..dot(ptr %.result.277, ptr %.result.278)
  %.result.280 = call ptr @toString(i32 %.result.279)
  call void @println(ptr %.result.280)
  %.result.281 = load ptr, ptr %b.1
  %.result.282 = load ptr, ptr %d.1
  %.result.283 = call ptr @point..cross(ptr %.result.281, ptr %.result.282)
  call void @point..printPoint(ptr %.result.283)
  %.result.284 = load ptr, ptr %a.1
  call void @point..printPoint(ptr %.result.284)
  %.result.285 = load ptr, ptr %b.1
  call void @point..printPoint(ptr %.result.285)
  %.result.286 = load ptr, ptr %c.1
  call void @point..printPoint(ptr %.result.286)
  %.result.287 = load ptr, ptr %d.1
  call void @point..printPoint(ptr %.result.287)
  ret i32 0
}
