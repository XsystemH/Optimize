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
  br i1 %.result.6, label %label_0, label %label_1
label_0:
  call void @print(ptr @.str.pre_0)
  br label %label_2
label_1:
  br label %label_2
label_2:
  %.result.7 = load i32, ptr @p
  %.result.8 = load i32, ptr @k
  %.result.9 = sub i32 %.result.7, %.result.8
  store i32 %.result.9, ptr @i
  br label %label_3
label_3:
  %.result.10 = load i32, ptr @i
  %.result.11 = load i32, ptr @p
  %.result.12 = load i32, ptr @k
  %.result.13 = add i32 %.result.11, %.result.12
  %.result.14 = icmp sle i32 %.result.10, %.result.13
  br i1 %.result.14, label %label_5, label %label_4
label_5:
  %.result.15 = load i32, ptr @i
  %.result.16 = add i32 %.result.15, 1
  %.result.17 = load i32, ptr @i
  %.result.18 = icmp sle i32 1, %.result.17
  %.result.19 = load i32, ptr @i
  %.result.20 = load i32, ptr @n
  %.result.21 = icmp sle i32 %.result.19, %.result.20
  %.result.22 = and i1 %.result.18, %.result.21
  br i1 %.result.22, label %label_6, label %label_7
label_6:
  %.result.23 = load i32, ptr @i
  %.result.24 = load i32, ptr @p
  %.result.25 = icmp eq i32 %.result.23, %.result.24
  br i1 %.result.25, label %label_9, label %label_10
label_9:
  call void @print(ptr @.str.pre_1)
  %.result.26 = load i32, ptr @i
  %.result.27 = call ptr @toString(i32 %.result.26)
  call void @print(ptr %.result.27)
  call void @print(ptr @.str.pre_2)
  br label %label_11
label_10:
  %.result.28 = load i32, ptr @i
  call void @printInt(i32 %.result.28)
  call void @print(ptr @.str.pre_3)
  br label %label_11
label_11:
  br label %label_8
label_7:
  br label %label_8
label_8:
  br label %label_3
label_4:
  %.result.29 = load i32, ptr @p
  %.result.30 = load i32, ptr @k
  %.result.31 = add i32 %.result.29, %.result.30
  %.result.32 = load i32, ptr @n
  %.result.33 = icmp slt i32 %.result.31, %.result.32
  br i1 %.result.33, label %label_12, label %label_13
label_12:
  call void @print(ptr @.str.pre_4)
  br label %label_14
label_13:
  br label %label_14
label_14:
  ret i32 0
}
