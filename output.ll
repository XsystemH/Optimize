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
define i32 @jud(i32 %x) {
entry:
  %x.1 = alloca i32
  store i32 %x, ptr %x.1
  %i.1 = alloca i32
  %j.1 = alloca i32
  store i32 0, ptr %i.1
  br label %label_loop_0
label_loop_0:
  %.result.1 = load i32, ptr %i.1
  %.result.2 = load i32, ptr @n
  %.result.3 = load i32, ptr %x.1
  %.result.4 = sdiv i32 %.result.2, %.result.3
  %.result.5 = icmp slt i32 %.result.1, %.result.4
  br i1 %.result.5, label %label_body_2, label %label_skip_1
label_body_2:
  %flag.3 = alloca i1
  store i1 false, ptr %flag.3
  store i32 0, ptr %j.1
  br label %label_loop_3
label_loop_3:
  %.result.6 = load i32, ptr %j.1
  %.result.7 = load i32, ptr %x.1
  %.result.8 = sub i32 %.result.7, 1
  %.result.9 = icmp slt i32 %.result.6, %.result.8
  br i1 %.result.9, label %label_body_5, label %label_skip_4
label_body_5:
  %.result.10 = load ptr, ptr @a
  %.result.11 = load i32, ptr %i.1
  %.result.12 = load i32, ptr %x.1
  %.result.13 = mul i32 %.result.11, %.result.12
  %.result.14 = load i32, ptr %j.1
  %.result.15 = add i32 %.result.13, %.result.14
  %.result.16 = getelementptr i32, ptr %.result.10, i32 %.result.15
  %.result.17 = load i32, ptr %.result.16
  %.result.18 = load ptr, ptr @a
  %.result.19 = load i32, ptr %i.1
  %.result.20 = load i32, ptr %x.1
  %.result.21 = mul i32 %.result.19, %.result.20
  %.result.22 = load i32, ptr %j.1
  %.result.23 = add i32 %.result.21, %.result.22
  %.result.24 = add i32 %.result.23, 1
  %.result.25 = getelementptr i32, ptr %.result.18, i32 %.result.24
  %.result.26 = load i32, ptr %.result.25
  %.result.27 = icmp sgt i32 %.result.17, %.result.26
  br i1 %.result.27, label %label_true_6, label %label_false_7
label_true_6:
  store i1 true, ptr %flag.3
  br label %label_skip_8
label_false_7:
  br label %label_skip_8
label_skip_8:
  %.result.28 = load i32, ptr %j.1
  %.result.29 = add i32 %.result.28, 1
  store i32 %.result.29, ptr %j.1
  br label %label_loop_3
label_skip_4:
  %.result.30 = load i1, ptr %flag.3
  %.result.31 = xor i1 %.result.30, true
  br i1 %.result.31, label %label_true_9, label %label_false_10
label_true_9:
  ret i32 1
  br label %label_skip_11
label_false_10:
  br label %label_skip_11
label_skip_11:
  %.result.32 = load i32, ptr %i.1
  %.result.33 = add i32 %.result.32, 1
  store i32 %.result.33, ptr %i.1
  br label %label_loop_0
label_skip_1:
  ret i32 0
}

@i = global i32 0
define void @.init() {
entry:
  %.result.0 = call ptr @.malloc_array(i32 4, i32 20)
  store ptr %.result.0, ptr @a
  ret void
}
define i32 @main() {
entry:
  call void @.init()
  %.result.34 = call i32 @getInt()
  store i32 %.result.34, ptr @n
  store i32 0, ptr @i
  br label %label_loop_12
label_loop_12:
  %.result.35 = load i32, ptr @i
  %.result.36 = load i32, ptr @n
  %.result.37 = icmp slt i32 %.result.35, %.result.36
  br i1 %.result.37, label %label_body_14, label %label_skip_13
label_body_14:
  %.result.38 = load i32, ptr @i
  %.result.39 = getelementptr i32, ptr @a, i32 %.result.38
  %.result.40 = call i32 @getInt()
  store i32 %.result.40, ptr %.result.39
  %.result.41 = load i32, ptr @i
  %.result.42 = add i32 %.result.41, 1
  store i32 %.result.42, ptr @i
  br label %label_loop_12
label_skip_13:
  %.result.43 = load i32, ptr @n
  store i32 %.result.43, ptr @i
  br label %label_loop_15
label_loop_15:
  %.result.44 = load i32, ptr @i
  %.result.45 = icmp sgt i32 %.result.44, 0
  br i1 %.result.45, label %label_body_17, label %label_skip_16
label_body_17:
  %.result.46 = load i32, ptr @i
  %.result.47 = call i32 @jud(i32 %.result.46)
  %.result.48 = icmp sgt i32 %.result.47, 0
  br i1 %.result.48, label %label_true_18, label %label_false_19
label_true_18:
  %.result.49 = load i32, ptr @i
  %.result.50 = call ptr @toString(i32 %.result.49)
  call void @print(ptr %.result.50)
  ret i32 0
  br label %label_skip_20
label_false_19:
  br label %label_skip_20
label_skip_20:
  %.result.51 = load i32, ptr @i
  %.result.52 = sdiv i32 %.result.51, 2
  store i32 %.result.52, ptr @i
  br label %label_loop_15
label_skip_16:
  ret i32 0
}
