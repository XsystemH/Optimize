@.str.pre_0 = [4 x i8] c"<< \00"
@.str.pre_1 = [2 x i8] c"(\00"
@.str.pre_2 = [3 x i8] c") \00"
@.str.pre_3 = [2 x i8] c" \00"
@.str.pre_4 = [4 x i8] c">> \00"

@n = alloca i32
@p = alloca i32
@k = alloca i32
@i = alloca i32
define i32 @main() {
entry:
  call void @_init()
  %.result.0 = call i32 @getInt()
  store i32 %.result.0, ptr @n
  %.result.1 = call i32 @getInt()
  store i32 %.result.1, ptr @p
  %.result.2 = call i32 @getInt()
  store i32 %.result.2, ptr @k
  %.result.3 = sub i32 @p @k
  %.result.4 = icmp sgt i1 %.result.3 1
  br i1 %.result.4, label %label_0, label %label_1
label_0:
  store ptr @.str.pre_0, ptr %.result.5
  call void @print(ptr %.result.5)
  br label %label_2
label_1:
  br label %label_2
label_2:
  %.result.6 = sub i32 @p @k
  store i32 %.result.6, ptr @i
  br label %label_3
label_3:
  %.result.7 = add i32 @p @k
  %.result.8 = icmp sle i1 @i %.result.7
  br i1 %.result.8, label %label_5, label %label_4
label_5:
  %.result.9 = add i32 @i 1
  %.result.10 = icmp sle i1 1 @i
  %.result.11 = icmp sle i1 @i @n
  %.result.12 = and i1 %.result.10 %.result.11
  br i1 %.result.12, label %label_6, label %label_7
label_6:
  %.result.13 = icmp eq i1 @i @p
  br i1 %.result.13, label %label_9, label %label_10
label_9:
  store ptr @.str.pre_1, ptr %.result.14
  call void @print(ptr %.result.14)
  %.result.15 = call ptr @toString(i32 @i)
  call void @print(ptr %.result.15)
  store ptr @.str.pre_2, ptr %.result.16
  call void @print(ptr %.result.16)
  br label %label_11
label_10:
  call void @printInt(i32 @i)
  store ptr @.str.pre_3, ptr %.result.17
  call void @print(ptr %.result.17)
  br label %label_11
label_11:
  br label %label_8
label_7:
  br label %label_8
label_8:
  br label %label_3
label_4:
  %.result.18 = add i32 @p @k
  %.result.19 = icmp slt i1 %.result.18 @n
  br i1 %.result.19, label %label_12, label %label_13
label_12:
  store ptr @.str.pre_4, ptr %.result.20
  call void @print(ptr %.result.20)
  br label %label_14
label_13:
  br label %label_14
label_14:
  ret i32 0
}
define void @_init() (  ) {
entry:
  ret void
}
