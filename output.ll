@.str.pre_0 = private unnamed_addr constant [2 x i8] c" \00"
@.str.pre_1 = private unnamed_addr constant [2 x i8] c" \00"
@.str.pre_2 = private unnamed_addr constant [2 x i8] c"\0A\00"
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
@a = global ptr null
@n = global i32 0
define i32 @qsrt(i32 %l, i32 %r) {
entry:
  %i.1 = alloca i32
  %j.1 = alloca i32
  %x.1 = alloca i32
  %temp.5 = alloca i32
  %l.1 = alloca i32
  store i32 %l, ptr %l.1
  %r.1 = alloca i32
  store i32 %r, ptr %r.1
  %.result.1 = load i32, ptr %l.1
  store i32 %.result.1, ptr %i.1
  %.result.2 = load i32, ptr %r.1
  store i32 %.result.2, ptr %j.1
  %.result.3 = load ptr, ptr @a
  %.result.4 = load i32, ptr %l.1
  %.result.5 = load i32, ptr %r.1
  %.result.6 = add i32 %.result.4, %.result.5
  %.result.7 = sdiv i32 %.result.6, 2
  %.result.8 = getelementptr i32, ptr %.result.3, i32 %.result.7
  %.result.9 = load i32, ptr %.result.8
  store i32 %.result.9, ptr %x.1
  br label %label_loop_0
label_loop_0:
  %.result.10 = load i32, ptr %i.1
  %.result.11 = load i32, ptr %j.1
  %.result.12 = icmp sle i32 %.result.10, %.result.11
  br i1 %.result.12, label %label_body_2, label %label_skip_1
label_body_2:
  br label %label_loop_3
label_loop_3:
  %.result.13 = load ptr, ptr @a
  %.result.14 = load i32, ptr %i.1
  %.result.15 = getelementptr i32, ptr %.result.13, i32 %.result.14
  %.result.16 = load i32, ptr %.result.15
  %.result.17 = load i32, ptr %x.1
  %.result.18 = icmp slt i32 %.result.16, %.result.17
  br i1 %.result.18, label %label_body_5, label %label_skip_4
label_body_5:
  %.result.19 = load i32, ptr %i.1
  %.result.20 = add i32 %.result.19, 1
  store i32 %.result.20, ptr %i.1
  br label %label_loop_3
label_skip_4:
  br label %label_loop_6
label_loop_6:
  %.result.21 = load ptr, ptr @a
  %.result.22 = load i32, ptr %j.1
  %.result.23 = getelementptr i32, ptr %.result.21, i32 %.result.22
  %.result.24 = load i32, ptr %.result.23
  %.result.25 = load i32, ptr %x.1
  %.result.26 = icmp sgt i32 %.result.24, %.result.25
  br i1 %.result.26, label %label_body_8, label %label_skip_7
label_body_8:
  %.result.27 = load i32, ptr %j.1
  %.result.28 = sub i32 %.result.27, 1
  store i32 %.result.28, ptr %j.1
  br label %label_loop_6
label_skip_7:
  %.result.29 = load i32, ptr %i.1
  %.result.30 = load i32, ptr %j.1
  %.result.31 = icmp sle i32 %.result.29, %.result.30
  br i1 %.result.31, label %label_true_9, label %label_false_10
label_true_9:
  %.result.32 = load ptr, ptr @a
  %.result.33 = load i32, ptr %i.1
  %.result.34 = getelementptr i32, ptr %.result.32, i32 %.result.33
  %.result.35 = load i32, ptr %.result.34
  store i32 %.result.35, ptr %temp.5
  %.result.36 = load ptr, ptr @a
  %.result.37 = load i32, ptr %i.1
  %.result.38 = getelementptr i32, ptr %.result.36, i32 %.result.37
  %.result.39 = load ptr, ptr @a
  %.result.40 = load i32, ptr %j.1
  %.result.41 = getelementptr i32, ptr %.result.39, i32 %.result.40
  %.result.42 = load i32, ptr %.result.41
  store i32 %.result.42, ptr %.result.38
  %.result.43 = load ptr, ptr @a
  %.result.44 = load i32, ptr %j.1
  %.result.45 = getelementptr i32, ptr %.result.43, i32 %.result.44
  %.result.46 = load i32, ptr %temp.5
  store i32 %.result.46, ptr %.result.45
  %.result.47 = load i32, ptr %i.1
  %.result.48 = add i32 %.result.47, 1
  store i32 %.result.48, ptr %i.1
  %.result.49 = load i32, ptr %j.1
  %.result.50 = sub i32 %.result.49, 1
  store i32 %.result.50, ptr %j.1
  br label %label_skip_11
label_false_10:
  br label %label_skip_11
label_skip_11:
  %.result.51 = load i32, ptr %i.1
  call void @printInt(i32 %.result.51)
  call void @print(ptr @.str.pre_0)
  %.result.52 = load i32, ptr %j.1
  call void @printlnInt(i32 %.result.52)
  br label %label_loop_0
label_skip_1:
  %.result.53 = load i32, ptr %l.1
  %.result.54 = load i32, ptr %j.1
  %.result.55 = icmp slt i32 %.result.53, %.result.54
  br i1 %.result.55, label %label_true_12, label %label_false_13
label_true_12:
  %.result.56 = load i32, ptr %l.1
  %.result.57 = load i32, ptr %j.1
  %.result.58 = call i32 @qsrt(i32 %.result.56, i32 %.result.57)
  br label %label_skip_14
label_false_13:
  br label %label_skip_14
label_skip_14:
  %.result.59 = load i32, ptr %i.1
  %.result.60 = load i32, ptr %r.1
  %.result.61 = icmp slt i32 %.result.59, %.result.60
  br i1 %.result.61, label %label_true_15, label %label_false_16
label_true_15:
  %.result.62 = load i32, ptr %i.1
  %.result.63 = load i32, ptr %r.1
  %.result.64 = call i32 @qsrt(i32 %.result.62, i32 %.result.63)
  br label %label_skip_17
label_false_16:
  br label %label_skip_17
label_skip_17:
  ret i32 0
}

define void @.init() {
entry:
  %.result.0 = call ptr @.malloc_array(i32 4, i32 10100)
  store ptr %.result.0, ptr @a
  store i32 10000, ptr @n
  ret void
}
define i32 @main() {
entry:
  %i.1 = alloca i32
  call void @.init()
  store i32 1, ptr %i.1
  br label %label_loop_18
label_loop_18:
  %.result.65 = load i32, ptr %i.1
  %.result.66 = load i32, ptr @n
  %.result.67 = icmp sle i32 %.result.65, %.result.66
  br i1 %.result.67, label %label_body_20, label %label_skip_19
label_body_20:
  %.result.68 = load ptr, ptr @a
  %.result.69 = load i32, ptr %i.1
  %.result.70 = getelementptr i32, ptr %.result.68, i32 %.result.69
  %.result.71 = load i32, ptr @n
  %.result.72 = add i32 %.result.71, 1
  %.result.73 = load i32, ptr %i.1
  %.result.74 = sub i32 %.result.72, %.result.73
  store i32 %.result.74, ptr %.result.70
  %.result.75 = load i32, ptr %i.1
  %.result.76 = add i32 %.result.75, 1
  store i32 %.result.76, ptr %i.1
  br label %label_loop_18
label_skip_19:
  %.result.77 = load i32, ptr @n
  %.result.78 = call i32 @qsrt(i32 1, i32 %.result.77)
  store i32 1, ptr %i.1
  br label %label_loop_21
label_loop_21:
  %.result.79 = load i32, ptr %i.1
  %.result.80 = load i32, ptr @n
  %.result.81 = icmp sle i32 %.result.79, %.result.80
  br i1 %.result.81, label %label_body_23, label %label_skip_22
label_body_23:
  %.result.82 = load ptr, ptr @a
  %.result.83 = load i32, ptr %i.1
  %.result.84 = getelementptr i32, ptr %.result.82, i32 %.result.83
  %.result.85 = load i32, ptr %.result.84
  %.result.86 = call ptr @toString(i32 %.result.85)
  call void @print(ptr %.result.86)
  call void @print(ptr @.str.pre_1)
  %.result.87 = load i32, ptr %i.1
  %.result.88 = add i32 %.result.87, 1
  store i32 %.result.88, ptr %i.1
  br label %label_loop_21
label_skip_22:
  call void @print(ptr @.str.pre_2)
  ret i32 0
}
