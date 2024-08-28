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
  store i32 0, ptr @i
  br label %label_loop_0
label_loop_0:
  %.result.1 = load i32, ptr @i
  %.result.2 = icmp slt i32 %.result.1, 9
  br i1 %.result.2, label %label_body_2, label %label_skip_1
label_body_2:
  %.result.3 = load ptr, ptr @a
  %.result.4 = load i32, ptr @i
  %.result.5 = getelementptr i32, ptr %.result.3, i32 %.result.4
  %.result.6 = call i32 @getInt()
  store i32 %.result.6, ptr %.result.5
  %.result.7 = load i32, ptr @i
  %.result.8 = add i32 %.result.7, 1
  store i32 %.result.8, ptr @i
  br label %label_loop_0
label_skip_1:
  %.result.9 = load ptr, ptr @a
  %.result.10 = getelementptr i32, ptr %.result.9, i32 0
  %.result.11 = load i32, ptr %.result.10
  %.result.12 = call ptr @toString(i32 %.result.11)
  call void @print(ptr %.result.12)
  ret i32 0
}
