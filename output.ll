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
define i32 @gcd(i32 %x, i32 %y) {
entry:
  %x.1 = alloca i32
  store i32 %x, ptr %x.1
  %y.1 = alloca i32
  store i32 %y, ptr %y.1
  %.result.0 = load i32, ptr %x.1
  %.result.1 = load i32, ptr %y.1
  %.result.2 = srem i32 %.result.0, %.result.1
  %.result.3 = icmp eq i32 %.result.2, 0
  br i1 %.result.3, label %label_true_0, label %label_false_1
label_true_0:
  %.result.4 = load i32, ptr %y.1
  ret i32 %.result.4
  br label %label_skip_2
label_false_1:
  %.result.5 = load i32, ptr %y.1
  %.result.6 = load i32, ptr %x.1
  %.result.7 = load i32, ptr %y.1
  %.result.8 = srem i32 %.result.6, %.result.7
  %.result.9 = call i32 @gcd5(i32 %.result.5, i32 %.result.8)
  ret i32 %.result.9
  br label %label_skip_2
label_skip_2:
ret i32 0 
}

define i32 @gcd1(i32 %x, i32 %y) {
entry:
  %x.1 = alloca i32
  store i32 %x, ptr %x.1
  %y.1 = alloca i32
  store i32 %y, ptr %y.1
  %.result.10 = load i32, ptr %x.1
  %.result.11 = load i32, ptr %y.1
  %.result.12 = srem i32 %.result.10, %.result.11
  %.result.13 = icmp eq i32 %.result.12, 0
  br i1 %.result.13, label %label_true_3, label %label_false_4
label_true_3:
  %.result.14 = load i32, ptr %y.1
  ret i32 %.result.14
  br label %label_skip_5
label_false_4:
  %.result.15 = load i32, ptr %y.1
  %.result.16 = load i32, ptr %x.1
  %.result.17 = load i32, ptr %y.1
  %.result.18 = srem i32 %.result.16, %.result.17
  %.result.19 = call i32 @gcd(i32 %.result.15, i32 %.result.18)
  ret i32 %.result.19
  br label %label_skip_5
label_skip_5:
ret i32 0 
}

define i32 @gcd2(i32 %x, i32 %y) {
entry:
  %x.1 = alloca i32
  store i32 %x, ptr %x.1
  %y.1 = alloca i32
  store i32 %y, ptr %y.1
  %.result.20 = load i32, ptr %x.1
  %.result.21 = load i32, ptr %y.1
  %.result.22 = srem i32 %.result.20, %.result.21
  %.result.23 = icmp eq i32 %.result.22, 0
  br i1 %.result.23, label %label_true_6, label %label_false_7
label_true_6:
  %.result.24 = load i32, ptr %y.1
  ret i32 %.result.24
  br label %label_skip_8
label_false_7:
  %.result.25 = load i32, ptr %y.1
  %.result.26 = load i32, ptr %x.1
  %.result.27 = load i32, ptr %y.1
  %.result.28 = srem i32 %.result.26, %.result.27
  %.result.29 = call i32 @gcd1(i32 %.result.25, i32 %.result.28)
  ret i32 %.result.29
  br label %label_skip_8
label_skip_8:
ret i32 0 
}

define i32 @gcd3(i32 %x, i32 %y) {
entry:
  %x.1 = alloca i32
  store i32 %x, ptr %x.1
  %y.1 = alloca i32
  store i32 %y, ptr %y.1
  %.result.30 = load i32, ptr %x.1
  %.result.31 = load i32, ptr %y.1
  %.result.32 = srem i32 %.result.30, %.result.31
  %.result.33 = icmp eq i32 %.result.32, 0
  br i1 %.result.33, label %label_true_9, label %label_false_10
label_true_9:
  %.result.34 = load i32, ptr %y.1
  ret i32 %.result.34
  br label %label_skip_11
label_false_10:
  %.result.35 = load i32, ptr %y.1
  %.result.36 = load i32, ptr %x.1
  %.result.37 = load i32, ptr %y.1
  %.result.38 = srem i32 %.result.36, %.result.37
  %.result.39 = call i32 @gcd2(i32 %.result.35, i32 %.result.38)
  ret i32 %.result.39
  br label %label_skip_11
label_skip_11:
ret i32 0 
}

define i32 @gcd4(i32 %x, i32 %y) {
entry:
  %x.1 = alloca i32
  store i32 %x, ptr %x.1
  %y.1 = alloca i32
  store i32 %y, ptr %y.1
  %.result.40 = load i32, ptr %x.1
  %.result.41 = load i32, ptr %y.1
  %.result.42 = srem i32 %.result.40, %.result.41
  %.result.43 = icmp eq i32 %.result.42, 0
  br i1 %.result.43, label %label_true_12, label %label_false_13
label_true_12:
  %.result.44 = load i32, ptr %y.1
  ret i32 %.result.44
  br label %label_skip_14
label_false_13:
  %.result.45 = load i32, ptr %y.1
  %.result.46 = load i32, ptr %x.1
  %.result.47 = load i32, ptr %y.1
  %.result.48 = srem i32 %.result.46, %.result.47
  %.result.49 = call i32 @gcd(i32 %.result.45, i32 %.result.48)
  ret i32 %.result.49
  br label %label_skip_14
label_skip_14:
ret i32 0 
}

define i32 @gcd5(i32 %x, i32 %y) {
entry:
  %x.1 = alloca i32
  store i32 %x, ptr %x.1
  %y.1 = alloca i32
  store i32 %y, ptr %y.1
  %.result.50 = load i32, ptr %x.1
  %.result.51 = load i32, ptr %y.1
  %.result.52 = srem i32 %.result.50, %.result.51
  %.result.53 = icmp eq i32 %.result.52, 0
  br i1 %.result.53, label %label_true_15, label %label_false_16
label_true_15:
  %.result.54 = load i32, ptr %y.1
  ret i32 %.result.54
  br label %label_skip_17
label_false_16:
  %.result.55 = load i32, ptr %y.1
  %.result.56 = load i32, ptr %x.1
  %.result.57 = load i32, ptr %y.1
  %.result.58 = srem i32 %.result.56, %.result.57
  %.result.59 = call i32 @gcd2(i32 %.result.55, i32 %.result.58)
  ret i32 %.result.59
  br label %label_skip_17
label_skip_17:
ret i32 0 
}

define void @.init() {
entry:
  ret void
}
define i32 @main() {
entry:
  call void @.init()
  %.result.60 = call i32 @gcd(i32 10, i32 1)
  %.result.61 = call ptr @toString(i32 %.result.60)
  call void @println(ptr %.result.61)
  %.result.62 = call i32 @gcd(i32 34986, i32 3087)
  %.result.63 = call ptr @toString(i32 %.result.62)
  call void @println(ptr %.result.63)
  %.result.64 = call i32 @gcd(i32 2907, i32 1539)
  %.result.65 = call ptr @toString(i32 %.result.64)
  call void @println(ptr %.result.65)
  ret i32 0
}
