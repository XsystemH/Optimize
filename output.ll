@.str.pre_0 = private unnamed_addr constant [9 x i8] c"eternal!\00"
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
%class.older = type { i32 }

define void @older..older(ptr %this) {
entry:
ret void
}

define void @older..solveAge(ptr %this) {
entry:
  %i.2.0 = alloca i32
  %j.2.1 = alloca i32
  %k.2.2 = alloca i32
  store i32 1, ptr %i.2.0
  br label %label_loop_2
label_loop_2:
  %.result.0 = load i32, ptr %i.2.0
  %.result.1 = icmp slt i32 %.result.0, 100
  br i1 %.result.1, label %label_body_3, label %label_skip_1
label_step_0:
  %.result.2 = load i32, ptr %i.2.0
  %.result.3 = add i32 %.result.2, 1
  store i32 %.result.3, ptr %i.2.0
  br label %label_loop_2
label_body_3:
  %.result.4 = load i32, ptr %i.2.0
  %.result.5 = add i32 %.result.4, 1
  store i32 %.result.5, ptr %j.2.1
  br label %label_loop_6
label_loop_6:
  %.result.6 = load i32, ptr %j.2.1
  %.result.7 = icmp slt i32 %.result.6, 100
  br i1 %.result.7, label %label_body_7, label %label_skip_5
label_step_4:
  %.result.8 = load i32, ptr %j.2.1
  %.result.9 = add i32 %.result.8, 1
  store i32 %.result.9, ptr %j.2.1
  br label %label_loop_6
label_body_7:
  %.result.10 = load i32, ptr %j.2.1
  %.result.11 = add i32 %.result.10, 1
  store i32 %.result.11, ptr %k.2.2
  br label %label_loop_10
label_loop_10:
  %.result.12 = load i32, ptr %k.2.2
  %.result.13 = icmp slt i32 %.result.12, 100
  br i1 %.result.13, label %label_body_11, label %label_skip_9
label_step_8:
  %.result.14 = load i32, ptr %k.2.2
  %.result.15 = add i32 %.result.14, 1
  store i32 %.result.15, ptr %k.2.2
  br label %label_loop_10
label_body_11:
  %.result.16 = load i32, ptr %i.2.0
  %.result.17 = load i32, ptr %i.2.0
  %.result.18 = sub i32 %.result.16, %.result.17
  %.result.19 = load i32, ptr %i.2.0
  %.result.20 = add i32 %.result.18, %.result.19
  %.result.21 = load i32, ptr %j.2.1
  %.result.22 = add i32 %.result.20, %.result.21
  %.result.23 = load i32, ptr %j.2.1
  %.result.24 = sub i32 %.result.22, %.result.23
  %.result.25 = load i32, ptr %j.2.1
  %.result.26 = add i32 %.result.24, %.result.25
  %.result.27 = load i32, ptr %k.2.2
  %.result.28 = add i32 %.result.26, %.result.27
  %.result.29 = load i32, ptr %k.2.2
  %.result.30 = sub i32 %.result.28, %.result.29
  %.result.31 = load i32, ptr %k.2.2
  %.result.32 = add i32 %.result.30, %.result.31
  %.result.33 = load i32, ptr %i.2.0
  %.result.34 = mul i32 100, %.result.33
  %.result.35 = load i32, ptr %j.2.1
  %.result.36 = mul i32 10, %.result.35
  %.result.37 = add i32 %.result.34, %.result.36
  %.result.38 = load i32, ptr %k.2.2
  %.result.39 = add i32 %.result.37, %.result.38
  %.result.40 = mul i32 %.result.32, %.result.39
  %.result.41 = srem i32 %.result.40, 1926
  %.result.42 = icmp eq i32 %.result.41, 0
  br i1 %.result.42, label %label_true_12, label %label_false_13
label_true_12:
  %.result.43 = getelementptr %class.older, ptr %this, i32 0, i32 0
  %.result.43 = getelementptr %class.older, ptr %this, i32 0, i32 0
  %.result.44 = load i32, ptr %i.2.0
  %.result.45 = load i32, ptr %i.2.0
  %.result.46 = sub i32 %.result.44, %.result.45
  %.result.47 = load i32, ptr %i.2.0
  %.result.48 = add i32 %.result.46, %.result.47
  %.result.49 = load i32, ptr %j.2.1
  %.result.50 = add i32 %.result.48, %.result.49
  %.result.51 = load i32, ptr %j.2.1
  %.result.52 = sub i32 %.result.50, %.result.51
  %.result.53 = load i32, ptr %j.2.1
  %.result.54 = add i32 %.result.52, %.result.53
  %.result.55 = load i32, ptr %k.2.2
  %.result.56 = add i32 %.result.54, %.result.55
  %.result.57 = load i32, ptr %k.2.2
  %.result.58 = sub i32 %.result.56, %.result.57
  %.result.59 = load i32, ptr %k.2.2
  %.result.60 = add i32 %.result.58, %.result.59
  %.result.61 = load i32, ptr %i.2.0
  %.result.62 = mul i32 100, %.result.61
  %.result.63 = load i32, ptr %j.2.1
  %.result.64 = mul i32 10, %.result.63
  %.result.65 = add i32 %.result.62, %.result.64
  %.result.66 = load i32, ptr %k.2.2
  %.result.67 = add i32 %.result.65, %.result.66
  %.result.68 = mul i32 %.result.60, %.result.67
  store i32 %.result.68, ptr %.result.43
  br label %label_skip_14
label_false_13:
  br label %label_skip_14
label_skip_14:
  br label %label_step_8
label_skip_9:
  br label %label_step_4
label_skip_5:
  br label %label_step_0
label_skip_1:
ret void
}

define void @.init() {
entry:
  ret void
}
define i32 @main() {
entry:
  %mrJiang.1.3 = alloca ptr
  call void @.init()
  %.result.69 = call ptr @.malloc(i32 4)
  call void @older..older(ptr %.result.69)
  store ptr %.result.69, ptr %mrJiang.1.3
  %.result.70 = load ptr, ptr %mrJiang.1.3
  call void @older..solveAge(ptr %.result.70)
  %.result.71 = load ptr, ptr %mrJiang.1.3
  %.result.72 = getelementptr %class.older, ptr %.result.71, i32 0, i32 0
  %.result.73 = load i32, ptr %.result.72
  %.result.74 = icmp sgt i32 %.result.73, 10000
  br i1 %.result.74, label %label_true_15, label %label_false_16
label_true_15:
  call void @println(ptr @.str.pre_0)
  br label %label_skip_17
label_false_16:
  br label %label_skip_17
label_skip_17:
  ret i32 0
}
