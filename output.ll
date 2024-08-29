@.str.pre_0 = private unnamed_addr constant [3 x i8] c", \00"
@.str.pre_1 = private unnamed_addr constant [22 x i8] c" enjoys this work. XD\00"
@.str.pre_2 = private unnamed_addr constant [3 x i8] c", \00"
@.str.pre_3 = private unnamed_addr constant [23 x i8] c" wants to give up!!!!!\00"
@.str.pre_4 = private unnamed_addr constant [15 x i8] c"the leading TA\00"
@.str.pre_5 = private unnamed_addr constant [16 x i8] c"the striking TA\00"
@.str.pre_6 = private unnamed_addr constant [3 x i8] c"MR\00"
@.str.pre_7 = private unnamed_addr constant [5 x i8] c"Mars\00"
@.str.pre_8 = private unnamed_addr constant [5 x i8] c"Mars\00"
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
%class.TA = type { ptr, i32 }

@init_anger = global i32 0
@work_anger = global i32 0
define void @work(ptr %st, ptr %ta) {
entry:
  %st.1 = alloca ptr
  store ptr %st, ptr %st.1
  %ta.1 = alloca ptr
  store ptr %ta, ptr %ta.1
  %.result.0 = load ptr, ptr %ta.1
  %.result.1 = getelementptr %class.TA, ptr %.result.0, i32 0
  %.result.2 = getelementptr %class.TA, ptr %.result.1, i32 1
  %.result.3 = load i32, ptr %.result.2
  %.result.4 = icmp sle i32 %.result.3, 100
  br i1 %.result.4, label %label_true_0, label %label_false_1
label_true_0:
  %.result.5 = load ptr, ptr %st.1
  %.result.6 = call ptr @.str.add(ptr %.result.5, ptr @.str.pre_0)
  %.result.7 = load ptr, ptr %ta.1
  %.result.8 = getelementptr %class.TA, ptr %.result.7, i32 0
  %.result.9 = getelementptr %class.TA, ptr %.result.8, i32 0
  %.result.10 = load ptr, ptr %.result.9
  %.result.11 = call ptr @.str.add(ptr %.result.6, ptr %.result.10)
  %.result.12 = call ptr @.str.add(ptr %.result.11, ptr @.str.pre_1)
  call void @println(ptr %.result.12)
  br label %label_skip_2
label_false_1:
  %.result.13 = load ptr, ptr %st.1
  %.result.14 = call ptr @.str.add(ptr %.result.13, ptr @.str.pre_2)
  %.result.15 = load ptr, ptr %ta.1
  %.result.16 = getelementptr %class.TA, ptr %.result.15, i32 0
  %.result.17 = getelementptr %class.TA, ptr %.result.16, i32 0
  %.result.18 = load ptr, ptr %.result.17
  %.result.19 = call ptr @.str.add(ptr %.result.14, ptr %.result.18)
  %.result.20 = call ptr @.str.add(ptr %.result.19, ptr @.str.pre_3)
  call void @println(ptr %.result.20)
  br label %label_skip_2
label_skip_2:
  %.result.21 = load ptr, ptr %ta.1
  %.result.22 = getelementptr %class.TA, ptr %.result.21, i32 0
  %.result.23 = getelementptr %class.TA, ptr %.result.22, i32 1
  %.result.24 = load ptr, ptr %ta.1
  %.result.25 = getelementptr %class.TA, ptr %.result.24, i32 0
  %.result.26 = getelementptr %class.TA, ptr %.result.25, i32 1
  %.result.27 = load i32, ptr %.result.26
  %.result.28 = load i32, ptr @work_anger
  %.result.29 = add i32 %.result.27, %.result.28
  store i32 %.result.29, ptr %.result.23
ret void
}

define void @.init() {
entry:
  store i32 100, ptr @init_anger
  store i32 10, ptr @work_anger
  ret void
}
define i32 @main() {
entry:
  call void @.init()
  %mr.1 = alloca ptr
  %mars.1 = alloca ptr
  %.result.30 = call ptr @.malloc(i32 8)
  %.result.31 = getelementptr ptr, ptr %.result.30, i32 0
  %.result.32 = call ptr @.malloc(i32 4)
  store ptr %.result.32, ptr %.result.31
  %.result.33 = getelementptr ptr, ptr %.result.30, i32 1
  %.result.34 = call ptr @.malloc(i32 4)
  store ptr %.result.34, ptr %.result.33
  store ptr %.result.30, ptr %mr.1
  %.result.35 = load ptr, ptr %mr.1
  %.result.36 = getelementptr %class.TA, ptr %.result.35, i32 0
  %.result.37 = getelementptr %class.TA, ptr %.result.36, i32 0
  store ptr @.str.pre_4, ptr %.result.37
  %.result.38 = load ptr, ptr %mr.1
  %.result.39 = getelementptr %class.TA, ptr %.result.38, i32 0
  %.result.40 = getelementptr %class.TA, ptr %.result.39, i32 1
  store i32 0, ptr %.result.40
  %.result.41 = call ptr @.malloc(i32 8)
  %.result.42 = getelementptr ptr, ptr %.result.41, i32 0
  %.result.43 = call ptr @.malloc(i32 4)
  store ptr %.result.43, ptr %.result.42
  %.result.44 = getelementptr ptr, ptr %.result.41, i32 1
  %.result.45 = call ptr @.malloc(i32 4)
  store ptr %.result.45, ptr %.result.44
  store ptr %.result.41, ptr %mars.1
  %.result.46 = load ptr, ptr %mars.1
  %.result.47 = getelementptr %class.TA, ptr %.result.46, i32 0
  %.result.48 = getelementptr %class.TA, ptr %.result.47, i32 0
  store ptr @.str.pre_5, ptr %.result.48
  %.result.49 = load ptr, ptr %mars.1
  %.result.50 = getelementptr %class.TA, ptr %.result.49, i32 0
  %.result.51 = getelementptr %class.TA, ptr %.result.50, i32 1
  %.result.52 = load i32, ptr @init_anger
  store i32 %.result.52, ptr %.result.51
  %.result.53 = load ptr, ptr %mr.1
  call void @work(ptr @.str.pre_6, ptr %.result.53)
  %.result.54 = load ptr, ptr %mars.1
  call void @work(ptr @.str.pre_7, ptr %.result.54)
  %.result.55 = load ptr, ptr %mars.1
  call void @work(ptr @.str.pre_8, ptr %.result.55)
  ret i32 0
}
