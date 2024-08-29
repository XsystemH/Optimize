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
define void @.init() {
entry:
  ret void
}
define i32 @main() {
entry:
  %a.1.0 = alloca i32
  %b.1.1 = alloca i32
  %c.1.2 = alloca i32
  %d.1.3 = alloca i32
  %.result.3 = alloca i32
  %.result.8 = alloca i32
  %.result.20 = alloca i32
  %.result.25 = alloca i32
  %.result.40 = alloca i32
  %.result.54 = alloca i32
  call void @.init()
  %.result.0 = call i32 @getInt()
  store i32 %.result.0, ptr %a.1.0
  %.result.1 = call i32 @getInt()
  store i32 %.result.1, ptr %b.1.1
  %.result.2 = call i32 @getInt()
  store i32 %.result.2, ptr %c.1.2
  %.result.4 = load i32, ptr %a.1.0
  %.result.5 = add i32 %.result.4, 1
  store i32 %.result.5, ptr %a.1.0
  %.result.6 = load i32, ptr %b.1.1
  %.result.7 = icmp eq i32 %.result.4, %.result.6
  br i1 %.result.7, label %label_expr1_0, label %label_expr2_1
label_expr1_0:
  %.result.9 = load i32, ptr %a.1.0
  %.result.10 = add i32 %.result.9, 1
  store i32 %.result.10, ptr %a.1.0
  %.result.11 = load i32, ptr %b.1.1
  %.result.12 = icmp eq i32 %.result.9, %.result.11
  br i1 %.result.12, label %label_expr1_2, label %label_expr2_3
label_expr1_2:
  %.result.13 = load i32, ptr %c.1.2
  %.result.14 = add i32 %.result.13, 1
  store i32 %.result.14, ptr %c.1.2
  store i32 %.result.14, ptr %.result.8
  br label %label_skip_4
label_expr2_3:
  %.result.15 = load i32, ptr %a.1.0
  %.result.16 = add i32 %.result.15, 1
  store i32 %.result.16, ptr %a.1.0
  %.result.17 = load i32, ptr %c.1.2
  %.result.18 = add i32 %.result.17, 1
  store i32 %.result.18, ptr %c.1.2
  store i32 %.result.18, ptr %.result.8
  br label %label_skip_4
label_skip_4:
  %.result.19 = load i32, ptr %.result.8
  store i32 %.result.19, ptr %.result.3
  br label %label_skip_5
label_expr2_1:
  %.result.21 = load i32, ptr %a.1.0
  %.result.22 = add i32 %.result.21, 1
  store i32 %.result.22, ptr %a.1.0
  %.result.23 = load i32, ptr %b.1.1
  %.result.24 = icmp eq i32 %.result.21, %.result.23
  br i1 %.result.24, label %label_expr1_6, label %label_expr2_7
label_expr1_6:
  %.result.26 = load i32, ptr %b.1.1
  %.result.27 = add i32 %.result.26, 1
  store i32 %.result.27, ptr %b.1.1
  %.result.28 = load i32, ptr %c.1.2
  %.result.29 = add i32 %.result.28, 1
  store i32 %.result.29, ptr %c.1.2
  %.result.30 = icmp eq i32 %.result.27, %.result.28
  br i1 %.result.30, label %label_expr1_8, label %label_expr2_9
label_expr1_8:
  %.result.31 = load i32, ptr %b.1.1
  %.result.32 = add i32 %.result.31, 1
  store i32 %.result.32, ptr %b.1.1
  store i32 %.result.32, ptr %.result.25
  br label %label_skip_10
label_expr2_9:
  %.result.33 = load i32, ptr %c.1.2
  %.result.34 = add i32 %.result.33, 1
  store i32 %.result.34, ptr %c.1.2
  %.result.35 = load i32, ptr %b.1.1
  %.result.36 = add i32 %.result.35, 1
  store i32 %.result.36, ptr %b.1.1
  store i32 %.result.36, ptr %.result.25
  br label %label_skip_10
label_skip_10:
  %.result.37 = load i32, ptr %.result.25
  store i32 %.result.37, ptr %.result.20
  br label %label_skip_11
label_expr2_7:
  %.result.38 = load i32, ptr %a.1.0
  %.result.39 = add i32 %.result.38, 1
  store i32 %.result.39, ptr %a.1.0
  %.result.41 = load i32, ptr %b.1.1
  %.result.42 = add i32 %.result.41, 1
  store i32 %.result.42, ptr %b.1.1
  %.result.43 = load i32, ptr %c.1.2
  %.result.44 = add i32 %.result.43, 1
  store i32 %.result.44, ptr %c.1.2
  %.result.45 = icmp eq i32 %.result.42, %.result.43
  br i1 %.result.45, label %label_expr1_12, label %label_expr2_13
label_expr1_12:
  %.result.46 = load i32, ptr %b.1.1
  %.result.47 = add i32 %.result.46, 1
  store i32 %.result.47, ptr %b.1.1
  store i32 %.result.47, ptr %.result.40
  br label %label_skip_14
label_expr2_13:
  %.result.48 = load i32, ptr %c.1.2
  %.result.49 = add i32 %.result.48, 1
  store i32 %.result.49, ptr %c.1.2
  %.result.50 = load i32, ptr %b.1.1
  %.result.51 = add i32 %.result.50, 1
  store i32 %.result.51, ptr %b.1.1
  store i32 %.result.51, ptr %.result.40
  br label %label_skip_14
label_skip_14:
  %.result.52 = load i32, ptr %.result.40
  store i32 %.result.52, ptr %.result.20
  br label %label_skip_11
label_skip_11:
  %.result.53 = load i32, ptr %.result.20
  %.result.55 = load i32, ptr %a.1.0
  %.result.56 = add i32 %.result.55, 1
  store i32 %.result.56, ptr %a.1.0
  %.result.57 = load i32, ptr %b.1.1
  %.result.58 = icmp eq i32 %.result.55, %.result.57
  br i1 %.result.58, label %label_expr1_15, label %label_expr2_16
label_expr1_15:
  %.result.59 = load i32, ptr %c.1.2
  %.result.60 = add i32 %.result.59, 1
  store i32 %.result.60, ptr %c.1.2
  store i32 %.result.60, ptr %.result.54
  br label %label_skip_17
label_expr2_16:
  %.result.61 = load i32, ptr %a.1.0
  %.result.62 = add i32 %.result.61, 1
  store i32 %.result.62, ptr %a.1.0
  %.result.63 = load i32, ptr %c.1.2
  %.result.64 = add i32 %.result.63, 1
  store i32 %.result.64, ptr %c.1.2
  store i32 %.result.64, ptr %.result.54
  br label %label_skip_17
label_skip_17:
  %.result.65 = load i32, ptr %.result.54
  store i32 %.result.65, ptr %.result.3
  br label %label_skip_5
label_skip_5:
  %.result.66 = load i32, ptr %.result.3
  store i32 %.result.66, ptr %d.1.3
  %.result.67 = load i32, ptr %a.1.0
  call void @printlnInt(i32 %.result.67)
  %.result.68 = load i32, ptr %b.1.1
  call void @printlnInt(i32 %.result.68)
  %.result.69 = load i32, ptr %c.1.2
  call void @printlnInt(i32 %.result.69)
  %.result.70 = load i32, ptr %d.1.3
  call void @printlnInt(i32 %.result.70)
ret i32 0
}
