; ModuleID = 'builtin.c'
source_filename = "builtin.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind
define dso_local void @print(i8* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* noundef %0) #11
  ret void
}

declare dso_local i32 @printf(i8* noundef, ...) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @println(i8* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* noundef %0) #11
  ret void
}

; Function Attrs: nounwind
define dso_local void @printInt(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32 noundef %0) #11
  ret void
}

; Function Attrs: nounwind
define dso_local void @printlnInt(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 noundef %0) #11
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn
define dso_local noalias nonnull i32* @_malloc_array(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = mul nsw i32 %1, %0
  %4 = add nsw i32 %3, 4
  %5 = tail call i8* @malloc(i32 noundef %4) #12
  %6 = bitcast i8* %5 to i32*
  store i32 %1, i32* %6, align 4, !tbaa !4
  %7 = getelementptr inbounds i32, i32* %6, i32 1
  ret i32* %7
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i32 noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind readonly willreturn
define dso_local i32 @_arr_size(i8* nocapture noundef readonly %0) local_unnamed_addr #5 {
  %2 = getelementptr inbounds i8, i8* %0, i32 -4
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 4, !tbaa !4
  ret i32 %4
}

; Function Attrs: mustprogress nofree nounwind willreturn
define dso_local noalias i8* @_malloc(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call i8* @malloc(i32 noundef %0) #12
  ret i8* %2
}

; Function Attrs: nofree nounwind
define dso_local i8* @getString() local_unnamed_addr #6 {
  %1 = tail call dereferenceable_or_null(256) i8* @malloc(i32 noundef 256) #12
  %2 = tail call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* noundef %1) #12
  ret i8* %1
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @scanf(i8* nocapture noundef readonly, ...) local_unnamed_addr #7

; Function Attrs: nofree nounwind
define dso_local i32 @getInt() local_unnamed_addr #6 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #13
  %3 = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* noundef nonnull %1) #12
  %4 = load i32, i32* %1, align 4, !tbaa !4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #13
  ret i32 %4
}

; Function Attrs: nofree nounwind
define dso_local noalias i8* @toString(i32 noundef %0) local_unnamed_addr #6 {
  %2 = tail call dereferenceable_or_null(12) i8* @malloc(i32 noundef 12) #12
  %3 = tail call i32 (i8*, i8*, ...) @sprintf(i8* noundef nonnull dereferenceable(1) %2, i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32 noundef %0) #12
  ret i8* %2
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @sprintf(i8* noalias nocapture noundef writeonly, i8* nocapture noundef readonly, ...) local_unnamed_addr #7

; Function Attrs: mustprogress nofree nounwind willreturn
define dso_local i8* @_str_add(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) local_unnamed_addr #2 {
  %3 = tail call i32 @strlen(i8* noundef nonnull dereferenceable(1) %0) #12
  %4 = tail call i32 @strlen(i8* noundef nonnull dereferenceable(1) %1) #12
  %5 = add i32 %3, 1
  %6 = add i32 %5, %4
  %7 = tail call i8* @malloc(i32 noundef %6) #12
  %8 = tail call i8* @strcpy(i8* noundef nonnull dereferenceable(1) %7, i8* noundef nonnull dereferenceable(1) %0) #12
  %9 = tail call i8* @strcat(i8* noundef nonnull dereferenceable(1) %7, i8* noundef nonnull dereferenceable(1) %1) #12
  ret i8* %7
}

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare dso_local i32 @strlen(i8* nocapture noundef) local_unnamed_addr #8

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare dso_local i8* @strcpy(i8* noalias noundef returned writeonly, i8* noalias nocapture noundef readonly) local_unnamed_addr #9

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare dso_local i8* @strcat(i8* noalias noundef returned, i8* noalias nocapture noundef readonly) local_unnamed_addr #9

; Function Attrs: mustprogress nofree nounwind readonly willreturn
define dso_local zeroext i1 @_str_eq(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) local_unnamed_addr #10 {
  %3 = tail call i32 @strcmp(i8* noundef nonnull dereferenceable(1) %0, i8* noundef nonnull dereferenceable(1) %1) #12
  %4 = icmp eq i32 %3, 0
  ret i1 %4
}

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare dso_local i32 @strcmp(i8* nocapture noundef, i8* nocapture noundef) local_unnamed_addr #8

; Function Attrs: nounwind
define dso_local zeroext i1 @_str_ne(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 bitcast (i32 (...)* @strtrcmp to i32 (i8*, i8*)*)(i8* noundef %0, i8* noundef %1) #14
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

declare dso_local i32 @strtrcmp(...) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nounwind readonly willreturn
define dso_local zeroext i1 @_str_lt(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) local_unnamed_addr #10 {
  %3 = tail call i32 @strcmp(i8* noundef nonnull dereferenceable(1) %0, i8* noundef nonnull dereferenceable(1) %1) #12
  %4 = icmp slt i32 %3, 0
  ret i1 %4
}

; Function Attrs: mustprogress nofree nounwind readonly willreturn
define dso_local zeroext i1 @_str_le(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) local_unnamed_addr #10 {
  %3 = tail call i32 @strcmp(i8* noundef nonnull dereferenceable(1) %0, i8* noundef nonnull dereferenceable(1) %1) #12
  %4 = icmp slt i32 %3, 1
  ret i1 %4
}

; Function Attrs: mustprogress nofree nounwind readonly willreturn
define dso_local zeroext i1 @_str_gt(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) local_unnamed_addr #10 {
  %3 = tail call i32 @strcmp(i8* noundef nonnull dereferenceable(1) %0, i8* noundef nonnull dereferenceable(1) %1) #12
  %4 = icmp sgt i32 %3, 0
  ret i1 %4
}

; Function Attrs: mustprogress nofree nounwind readonly willreturn
define dso_local zeroext i1 @_str_ge(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) local_unnamed_addr #10 {
  %3 = tail call i32 @strcmp(i8* noundef nonnull dereferenceable(1) %0, i8* noundef nonnull dereferenceable(1) %1) #12
  %4 = icmp sgt i32 %3, -1
  ret i1 %4
}

; Function Attrs: mustprogress nofree nounwind readonly willreturn
define dso_local i32 @_str_length(i8* nocapture noundef readonly %0) local_unnamed_addr #10 {
  %2 = tail call i32 @strlen(i8* noundef nonnull dereferenceable(1) %0) #12
  ret i32 %2
}

; Function Attrs: nounwind
define dso_local i8* @_str_substr(i8* noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = sub nsw i32 %2, %1
  %5 = add nsw i32 %4, 1
  %6 = tail call i8* @malloc(i32 noundef %5) #12
  %7 = getelementptr inbounds i8, i8* %0, i32 %1
  %8 = tail call i32 bitcast (i32 (...)* @memcpy to i32 (i8*, i8*, i32)*)(i8* noundef %6, i8* noundef %7, i32 noundef %4) #14
  %9 = getelementptr inbounds i8, i8* %6, i32 %4
  store i8 0, i8* %9, align 1, !tbaa !8
  ret i8* %6
}

declare dso_local i32 @memcpy(...) local_unnamed_addr #1

; Function Attrs: nofree nounwind
define dso_local i32 @_str_parseInt(i8* nocapture noundef readonly %0) local_unnamed_addr #6 {
  %2 = alloca i32, align 4
  %3 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #13
  %4 = call i32 (i8*, i8*, ...) @sscanf(i8* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* noundef nonnull %2) #12
  %5 = load i32, i32* %2, align 4, !tbaa !4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #13
  ret i32 %5
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @sscanf(i8* nocapture noundef readonly, i8* nocapture noundef readonly, ...) local_unnamed_addr #7

; Function Attrs: mustprogress nofree norecurse nosync nounwind readonly willreturn
define dso_local i32 @_str_ord(i8* nocapture noundef readonly %0, i32 noundef %1) local_unnamed_addr #5 {
  %3 = getelementptr inbounds i8, i8* %0, i32 %1
  %4 = load i8, i8* %3, align 1, !tbaa !8
  %5 = zext i8 %4 to i32
  ret i32 %5
}

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m" }
attributes #1 = { "frame-pointer"="none" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m" }
attributes #2 = { mustprogress nofree nounwind willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m" }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m" }
attributes #6 = { nofree nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m" }
attributes #7 = { nofree nounwind "frame-pointer"="none" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m" }
attributes #8 = { argmemonly mustprogress nofree nounwind readonly willreturn "frame-pointer"="none" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m" }
attributes #9 = { argmemonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m" }
attributes #10 = { mustprogress nofree nounwind readonly willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m" }
attributes #11 = { nobuiltin nounwind "no-builtin-memcpy" "no-builtin-printf" }
attributes #12 = { "no-builtin-memcpy" "no-builtin-printf" }
attributes #13 = { nounwind }
attributes #14 = { nounwind "no-builtin-memcpy" "no-builtin-printf" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
