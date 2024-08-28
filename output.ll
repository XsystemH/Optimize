@.str.pre_0 = private unnamed_addr constant [5 x i8] c"str1\00"
@.str.pre_1 = private unnamed_addr constant [5 x i8] c"str2\00"
@.str.pre_2 = private unnamed_addr constant [5 x i8] c"str3\00"
@.str.pre_3 = private unnamed_addr constant [5 x i8] c"str4\00"
@.str.pre_4 = private unnamed_addr constant [5 x i8] c"str5\00"
@.str.pre_5 = private unnamed_addr constant [5 x i8] c"str6\00"
@.str.pre_6 = private unnamed_addr constant [5 x i8] c"str7\00"
@.str.pre_7 = private unnamed_addr constant [5 x i8] c"str8\00"
@.str.pre_8 = private unnamed_addr constant [5 x i8] c"str9\00"
@.str.pre_9 = private unnamed_addr constant [6 x i8] c"str10\00"
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
@str = global ptr null
define void @.init() {
entry:
  %.result.1 = alloca i32
  %.result.0 = call ptr @.malloc_array(i32 4, i32 30)
  store i32 0, ptr %.result.1
  br label %label_loop_0
label_loop_0:
  %.result.2 = load i32, ptr %.result.1
  %.result.3 = icmp slt i32 %.result.2, 30
  br i1 %.result.3, label %label_body_2, label %label_skip_1
label_body_2:
  %.result.4 = getelementptr ptr, ptr %.result.0, i32 %.result.2
  %.result.5 = add i32 %.result.2, 1
  store i32 %.result.5, ptr %.result.1
  %.result.4 = call ptr @.malloc_array(i32 4, i32 30)
  br label %label_loop_0
label_skip_1:
  store ptr %.result.0, ptr @a
  %.result.6 = call ptr @.malloc_array(i32 4, i32 30)
  store ptr %.result.6, ptr @str
  ret void
}
define i32 @main() {
entry:
  call void @.init()
  %i.1 = alloca i32
  %j.1 = alloca i32
  store i32 0, ptr %i.1
  br label %label_loop_3
label_loop_3:
  %.result.7 = load i32, ptr %i.1
  %.result.8 = icmp sle i32 %.result.7, 29
  br i1 %.result.8, label %label_body_5, label %label_skip_4
label_body_5:
  %sum.3 = alloca i32
  store i32 0, ptr %sum.3
  %.result.9 = load ptr, ptr @str
  %.result.10 = load i32, ptr %i.1
  %.result.11 = getelementptr ptr, ptr %.result.9, i32 %.result.10
  %.result.12 = load ptr, ptr @a
  %.result.13 = load i32, ptr %i.1
  %.result.14 = getelementptr ptr, ptr %.result.12, i32 %.result.13
  %.result.15 = load ptr, ptr %.result.14
  %.result.16 = getelementptr i32, ptr %.result.15, i32 0
  %.result.17 = load i32, ptr %.result.16
  %.result.18 = call ptr @toString(i32 %.result.17)
  store ptr %.result.18, ptr %.result.11
  store i32 0, ptr %j.1
  br label %label_loop_6
label_loop_6:
  %.result.19 = load i32, ptr %j.1
  %.result.20 = load i32, ptr %i.1
  %.result.21 = icmp slt i32 %.result.19, %.result.20
  br i1 %.result.21, label %label_body_8, label %label_skip_7
label_body_8:
  %.result.22 = load i32, ptr %j.1
  %.result.23 = and i32 %.result.22, 1
  %.result.24 = icmp eq i32 %.result.23, 0
  br i1 %.result.24, label %label_true_9, label %label_false_10
label_true_9:
  %.result.25 = load i32, ptr %sum.3
  %.result.26 = load ptr, ptr @a
  %.result.27 = load i32, ptr %i.1
  %.result.28 = getelementptr ptr, ptr %.result.26, i32 %.result.27
  %.result.29 = load ptr, ptr %.result.28
  %.result.30 = getelementptr i32, ptr %.result.29, i32 0
  %.result.31 = load i32, ptr %.result.30
  %.result.32 = add i32 %.result.25, %.result.31
  store i32 %.result.32, ptr %sum.3
  br label %label_skip_11
label_false_10:
  br label %label_skip_11
label_skip_11:
  %.result.33 = load i32, ptr %j.1
  %.result.34 = and i32 %.result.33, 1
  %.result.35 = icmp eq i32 %.result.34, 1
  br i1 %.result.35, label %label_true_12, label %label_false_13
label_true_12:
  %.result.36 = load i32, ptr %sum.3
  %.result.37 = load ptr, ptr @a
  %.result.38 = load i32, ptr %i.1
  %.result.39 = getelementptr ptr, ptr %.result.37, i32 %.result.38
  %.result.40 = load ptr, ptr %.result.39
  %.result.41 = getelementptr i32, ptr %.result.40, i32 29
  %.result.42 = load i32, ptr %.result.41
  %.result.43 = add i32 %.result.36, %.result.42
  store i32 %.result.43, ptr %sum.3
  br label %label_skip_14
label_false_13:
  br label %label_skip_14
label_skip_14:
  %.result.44 = load i32, ptr %j.1
  %.result.45 = add i32 %.result.44, 1
  store i32 %.result.45, ptr %j.1
  br label %label_loop_6
label_skip_7:
  %.result.46 = call ptr @.str.add(ptr @.str.pre_0, ptr @.str.pre_1)
  %.result.47 = call ptr @.str.add(ptr %.result.46, ptr @.str.pre_2)
  %.result.48 = call ptr @.str.add(ptr %.result.47, ptr @.str.pre_3)
  %.result.49 = call ptr @.str.add(ptr %.result.48, ptr @.str.pre_4)
  %.result.50 = call ptr @.str.add(ptr %.result.49, ptr @.str.pre_5)
  %.result.51 = call ptr @.str.add(ptr %.result.50, ptr @.str.pre_6)
  %.result.52 = call ptr @.str.add(ptr %.result.51, ptr @.str.pre_7)
  %.result.53 = call ptr @.str.add(ptr %.result.52, ptr @.str.pre_8)
  %.result.54 = call ptr @.str.add(ptr %.result.53, ptr @.str.pre_9)
  call void @println(ptr %.result.54)
  %.result.55 = load i32, ptr %i.1
  %.result.56 = add i32 %.result.55, 1
  store i32 %.result.56, ptr %i.1
  br label %label_loop_3
label_skip_4:
  ret i32 0
}
