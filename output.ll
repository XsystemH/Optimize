@.str.pre_0 = private unnamed_addr constant [14 x i8] c"2nd loop, j: \00"
@.str.pre_1 = private unnamed_addr constant [2 x i8] c" \00"
@.str.pre_2 = private unnamed_addr constant [1 x i8] c"\00"
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
define void @bubble_sort(ptr %a) {
entry:
  %a.1.0 = alloca ptr
  %i.1.0 = alloca i32
  %j.1.1 = alloca i32
  %n.1.2 = alloca i32
  %t.5.3 = alloca i32
  store ptr %a, ptr %a.1.0
  %.result.0 = load ptr, ptr %a.1.0
  %.result.1 = call i32 @.arr.size(ptr %.result.0)
  store i32 %.result.1, ptr %n.1.2
  %.result.2 = load ptr, ptr %a.1.0
  %.result.3 = call i32 @.arr.size(ptr %.result.2)
  call void @printlnInt(i32 %.result.3)
  store i32 0, ptr %i.1.0
  br label %label_loop_2
label_loop_2:
  %.result.4 = load i32, ptr %i.1.0
  %.result.5 = load i32, ptr %n.1.2
  %.result.6 = sub i32 %.result.5, 1
  %.result.7 = icmp slt i32 %.result.4, %.result.6
  br i1 %.result.7, label %label_body_3, label %label_skip_1
label_step_0:
  %.result.8 = load i32, ptr %i.1.0
  %.result.9 = add i32 %.result.8, 1
  store i32 %.result.9, ptr %i.1.0
  br label %label_loop_2
label_body_3:
  store i32 0, ptr %j.1.1
  br label %label_loop_6
label_loop_6:
  %.result.10 = load i32, ptr %j.1.1
  %.result.11 = load i32, ptr %n.1.2
  %.result.12 = load i32, ptr %i.1.0
  %.result.13 = sub i32 %.result.11, %.result.12
  %.result.14 = sub i32 %.result.13, 1
  %.result.15 = icmp slt i32 %.result.10, %.result.14
  br i1 %.result.15, label %label_body_7, label %label_skip_5
label_step_4:
  %.result.16 = load i32, ptr %j.1.1
  %.result.17 = add i32 %.result.16, 1
  store i32 %.result.17, ptr %j.1.1
  br label %label_loop_6
label_body_7:
  call void @print(ptr @.str.pre_0)
  %.result.18 = load i32, ptr %j.1.1
  call void @printlnInt(i32 %.result.18)
  %.result.19 = load ptr, ptr %a.1.0
  %.result.20 = load i32, ptr %j.1.1
  %.result.21 = getelementptr i32, ptr %.result.19, i32 %.result.20
  %.result.22 = load i32, ptr %.result.21
  %.result.23 = load ptr, ptr %a.1.0
  %.result.24 = load i32, ptr %j.1.1
  %.result.25 = add i32 %.result.24, 1
  %.result.26 = getelementptr i32, ptr %.result.23, i32 %.result.25
  %.result.27 = load i32, ptr %.result.26
  %.result.28 = icmp slt i32 %.result.22, %.result.27
  br i1 %.result.28, label %label_true_8, label %label_false_9
label_true_8:
  br label %label_step_4
  br label %label_skip_10
label_false_9:
  br label %label_skip_10
label_skip_10:
  %.result.29 = load ptr, ptr %a.1.0
  %.result.30 = load i32, ptr %j.1.1
  %.result.31 = getelementptr i32, ptr %.result.29, i32 %.result.30
  %.result.32 = load i32, ptr %.result.31
  store i32 %.result.32, ptr %t.5.3
  %.result.33 = load ptr, ptr %a.1.0
  %.result.34 = load i32, ptr %j.1.1
  %.result.35 = getelementptr i32, ptr %.result.33, i32 %.result.34
  %.result.36 = load ptr, ptr %a.1.0
  %.result.37 = load i32, ptr %j.1.1
  %.result.38 = add i32 %.result.37, 1
  %.result.39 = getelementptr i32, ptr %.result.36, i32 %.result.38
  %.result.40 = load i32, ptr %.result.39
  store i32 %.result.40, ptr %.result.35
  %.result.41 = load ptr, ptr %a.1.0
  %.result.42 = load i32, ptr %j.1.1
  %.result.43 = add i32 %.result.42, 1
  %.result.44 = getelementptr i32, ptr %.result.41, i32 %.result.43
  %.result.45 = load i32, ptr %t.5.3
  store i32 %.result.45, ptr %.result.44
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
  %n.1.4 = alloca i32
  %a.1.5 = alloca ptr
  %i.1.6 = alloca i32
  call void @.init()
  %.result.46 = call i32 @getInt()
  store i32 %.result.46, ptr %n.1.4
  %.result.47 = load i32, ptr %n.1.4
  %.result.48 = call ptr @.malloc_array(i32 4, i32 %.result.47)
  store ptr %.result.48, ptr %a.1.5
  store i32 0, ptr %i.1.6
  br label %label_loop_13
label_loop_13:
  %.result.49 = load i32, ptr %i.1.6
  %.result.50 = load i32, ptr %n.1.4
  %.result.51 = icmp slt i32 %.result.49, %.result.50
  br i1 %.result.51, label %label_body_14, label %label_skip_12
label_step_11:
  %.result.52 = load i32, ptr %i.1.6
  %.result.53 = add i32 %.result.52, 1
  store i32 %.result.53, ptr %i.1.6
  br label %label_loop_13
label_body_14:
  %.result.54 = load ptr, ptr %a.1.5
  %.result.55 = load i32, ptr %i.1.6
  %.result.56 = getelementptr i32, ptr %.result.54, i32 %.result.55
  %.result.57 = call i32 @getInt()
  store i32 %.result.57, ptr %.result.56
  br label %label_step_11
label_skip_12:
  %.result.58 = load ptr, ptr %a.1.5
  call void @bubble_sort(ptr %.result.58)
  store i32 0, ptr %i.1.6
  br label %label_loop_17
label_loop_17:
  %.result.59 = load i32, ptr %i.1.6
  %.result.60 = load i32, ptr %n.1.4
  %.result.61 = icmp slt i32 %.result.59, %.result.60
  br i1 %.result.61, label %label_body_18, label %label_skip_16
label_step_15:
  %.result.62 = load i32, ptr %i.1.6
  %.result.63 = add i32 %.result.62, 1
  store i32 %.result.63, ptr %i.1.6
  br label %label_loop_17
label_body_18:
  %.result.64 = load ptr, ptr %a.1.5
  %.result.65 = load i32, ptr %i.1.6
  %.result.66 = getelementptr i32, ptr %.result.64, i32 %.result.65
  %.result.67 = load i32, ptr %.result.66
  %.result.68 = call ptr @toString(i32 %.result.67)
  %.result.69 = call ptr @.str.add(ptr %.result.68, ptr @.str.pre_1)
  call void @print(ptr %.result.69)
  br label %label_step_15
label_skip_16:
  call void @println(ptr @.str.pre_2)
  ret i32 0
}
