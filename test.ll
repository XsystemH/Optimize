@.str.pre_0 = private unnamed_addr constant [4 x i8] c"<< \00"
@.str.pre_1 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.pre_2 = private unnamed_addr constant [3 x i8] c") \00"
@.str.pre_3 = private unnamed_addr constant [2 x i8] c" \00"
@.str.pre_4 = private unnamed_addr constant [4 x i8] c">> \00"
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
@p = global i32 0
@k = global i32 0
@i = global i32 0
define void @.init() {
entry:
  ret void
}
define i32 @main() {
entry:
  %.result.17 = alloca i1
  call void @.init()
  %.result.0 = call i32 @getInt()
  store i32 %.result.0, ptr @n
  %.result.1 = call i32 @getInt()
  store i32 %.result.1, ptr @p
  %.result.2 = call i32 @getInt()
  store i32 %.result.2, ptr @k
  %.result.3 = load i32, ptr @p
  %.result.4 = load i32, ptr @k
  %.result.5 = sub i32 %.result.3, %.result.4
  %.result.6 = icmp sgt i32 %.result.5, 1
  br i1 %.result.6, label %label_true_0, label %label_false_1
label_true_0:
  call void @print(ptr @.str.pre_0)
  br label %label_skip_2
label_false_1:
  br label %label_skip_2
label_skip_2:
  %.result.7 = load i32, ptr @p
  %.result.8 = load i32, ptr @k
  %.result.9 = sub i32 %.result.7, %.result.8
  store i32 %.result.9, ptr @i
  br label %label_loop_5
label_loop_5:
  %.result.10 = load i32, ptr @i
  %.result.11 = load i32, ptr @p
  %.result.12 = load i32, ptr @k
  %.result.13 = add i32 %.result.11, %.result.12
  %.result.14 = icmp sle i32 %.result.10, %.result.13
  br i1 %.result.14, label %label_body_6, label %label_skip_4
label_step_3:
  %.result.15 = load i32, ptr @i
  %.result.16 = add i32 %.result.15, 1
  store i32 %.result.16, ptr @i
  br label %label_loop_5
label_body_6:
  %.result.18 = load i32, ptr @i
  %.result.19 = icmp sle i32 1, %.result.18
  store i1 %.result.19, ptr %.result.17
  br i1 %.result.19, label %label_logicT_7, label %label_logicF_8
label_logicT_7:
  %.result.20 = load i32, ptr @i
  %.result.21 = load i32, ptr @n
  %.result.22 = icmp sle i32 %.result.20, %.result.21
  store i1 %.result.22, ptr %.result.17
  br label %label_logicF_8
label_logicF_8:
  %.result.23 = load i1, ptr %.result.17
  br i1 %.result.23, label %label_true_9, label %label_false_10
label_true_9:
  %.result.24 = load i32, ptr @i
  %.result.25 = load i32, ptr @p
  %.result.26 = icmp eq i32 %.result.24, %.result.25
  br i1 %.result.26, label %label_true_12, label %label_false_13
label_true_12:
  call void @print(ptr @.str.pre_1)
  %.result.27 = load i32, ptr @i
  %.result.28 = call ptr @toString(i32 %.result.27)
  call void @print(ptr %.result.28)
  call void @print(ptr @.str.pre_2)
  br label %label_skip_14
label_false_13:
  %.result.29 = load i32, ptr @i
  call void @printInt(i32 %.result.29)
  call void @print(ptr @.str.pre_3)
  br label %label_skip_14
label_skip_14:
  br label %label_skip_11
label_false_10:
  br label %label_skip_11
label_skip_11:
  br label %label_step_3
label_skip_4:
  %.result.30 = load i32, ptr @p
  %.result.31 = load i32, ptr @k
  %.result.32 = add i32 %.result.30, %.result.31
  %.result.33 = load i32, ptr @n
  %.result.34 = icmp slt i32 %.result.32, %.result.33
  br i1 %.result.34, label %label_true_15, label %label_false_16
label_true_15:
  call void @print(ptr @.str.pre_4)
  br label %label_skip_17
label_false_16:
  br label %label_skip_17
label_skip_17:
  ret i32 0
}
