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
@t = global i32 0
@l = global i32 0
@i = global i32 0
@s = global ptr null
define void @.init() {
entry:
  ret void
}
define i32 @main() {
entry:
  call void @.init()
  %.result.0 = call i32 @getInt()
  store i32 %.result.0, ptr @t
  store i32 0, ptr @i
  br label %label_loop_0
label_loop_0:
  %.result.1 = load i32, ptr @i
  %.result.2 = load i32, ptr @t
  %.result.3 = icmp slt i32 %.result.1, %.result.2
  br i1 %.result.3, label %label_body_2, label %label_skip_1
label_body_2:
  %.result.4 = call ptr @getString()
  store ptr %.result.4, ptr @s
  %.result.5 = load ptr, ptr @s
  %.result.6 = call i32 @.str.length(ptr %.result.5)
  store i32 %.result.6, ptr @l
  %.result.7 = load i32, ptr @l
  %.result.8 = icmp sgt i32 %.result.7, 10
  br i1 %.result.8, label %label_true_3, label %label_false_4
label_true_3:
  %.result.9 = load ptr, ptr @s
  %.result.10 = call ptr @.str.substring(ptr %.result.9, i32 0, i32 1)
  %.result.11 = load i32, ptr @l
  %.result.12 = sub i32 %.result.11, 2
  %.result.13 = call ptr @toString(i32 %.result.12)
  %.result.14 = call ptr @.str.add(ptr %.result.10, ptr %.result.13)
  %.result.15 = load ptr, ptr @s
  %.result.16 = load i32, ptr @l
  %.result.17 = sub i32 %.result.16, 1
  %.result.18 = load i32, ptr @l
  %.result.19 = call ptr @.str.substring(ptr %.result.15, i32 %.result.17, i32 %.result.18)
  %.result.20 = call ptr @.str.add(ptr %.result.14, ptr %.result.19)
  call void @println(ptr %.result.20)
  br label %label_skip_5
label_false_4:
  %.result.21 = load ptr, ptr @s
  call void @println(ptr %.result.21)
  br label %label_skip_5
label_skip_5:
  %.result.22 = load i32, ptr @i
  %.result.22 = add i32 1, %.result.22
  store i32 %.result.22, ptr @i
  br label %label_loop_0
label_skip_1:
}
