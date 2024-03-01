; ModuleID = 'probe7.02fca9e8-cgu.0'
source_filename = "probe7.02fca9e8-cgu.0"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32"

@alloc_fb24ee83aa85dfb496f2abc1d22d2cb9 = private unnamed_addr constant <{ [8 x i8] }> <{ [8 x i8] c"\00\00\00\00\00\00\F0?" }>, align 8
@alloc_a2408d0ee32d75bc015427d6310f44b6 = private unnamed_addr constant <{ [8 x i8] }> <{ [8 x i8] c"\00\00\00\00\00\00\00@" }>, align 8

; core::f64::<impl f64>::total_cmp
; Function Attrs: inlinehint nounwind
define internal i8 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$9total_cmp17h10c4982055e21de4E"(ptr align 8 %self, ptr align 8 %other) unnamed_addr #0 {
start:
  %0 = alloca i64, align 8
  %1 = alloca i64, align 8
  %_23 = alloca double, align 8
  %_21 = alloca double, align 8
  %right = alloca i64, align 8
  %left = alloca i64, align 8
  %2 = alloca i8, align 1
  %self1 = load double, ptr %self, align 8, !noundef !0
  store double %self1, ptr %_21, align 8
  %rt = load double, ptr %_21, align 8, !noundef !0
  %3 = bitcast double %rt to i64
  store i64 %3, ptr %1, align 8
  %_4 = load i64, ptr %1, align 8, !noundef !0
  store i64 %_4, ptr %left, align 8
  %self2 = load double, ptr %other, align 8, !noundef !0
  store double %self2, ptr %_23, align 8
  %rt3 = load double, ptr %_23, align 8, !noundef !0
  %4 = bitcast double %rt3 to i64
  store i64 %4, ptr %0, align 8
  %_7 = load i64, ptr %0, align 8, !noundef !0
  store i64 %_7, ptr %right, align 8
  %_13 = load i64, ptr %left, align 8, !noundef !0
  %_12 = ashr i64 %_13, 63
  %_10 = lshr i64 %_12, 1
  %5 = load i64, ptr %left, align 8, !noundef !0
  %6 = xor i64 %5, %_10
  store i64 %6, ptr %left, align 8
  %_18 = load i64, ptr %right, align 8, !noundef !0
  %_17 = ashr i64 %_18, 63
  %_15 = lshr i64 %_17, 1
  %7 = load i64, ptr %right, align 8, !noundef !0
  %8 = xor i64 %7, %_15
  store i64 %8, ptr %right, align 8
  %_26 = load i64, ptr %left, align 8, !noundef !0
  %_27 = load i64, ptr %right, align 8, !noundef !0
  %_25 = icmp slt i64 %_26, %_27
  br i1 %_25, label %bb3, label %bb4

bb4:                                              ; preds = %start
  %_29 = load i64, ptr %left, align 8, !noundef !0
  %_30 = load i64, ptr %right, align 8, !noundef !0
  %_28 = icmp eq i64 %_29, %_30
  br i1 %_28, label %bb5, label %bb6

bb3:                                              ; preds = %start
  store i8 -1, ptr %2, align 1
  br label %bb8

bb8:                                              ; preds = %bb7, %bb3
  %9 = load i8, ptr %2, align 1, !range !1, !noundef !0
  ret i8 %9

bb6:                                              ; preds = %bb4
  store i8 1, ptr %2, align 1
  br label %bb7

bb5:                                              ; preds = %bb4
  store i8 0, ptr %2, align 1
  br label %bb7

bb7:                                              ; preds = %bb6, %bb5
  br label %bb8
}

; probe7::probe
; Function Attrs: nounwind
define dso_local void @_ZN6probe75probe17h7f42e069e82881ffE() unnamed_addr #1 {
start:
; call core::f64::<impl f64>::total_cmp
  %_1 = call i8 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$9total_cmp17h10c4982055e21de4E"(ptr align 8 @alloc_fb24ee83aa85dfb496f2abc1d22d2cb9, ptr align 8 @alloc_a2408d0ee32d75bc015427d6310f44b6) #2, !range !1
  ret void
}

attributes #0 = { inlinehint nounwind "target-cpu"="generic-rv32" "target-features"="+m" }
attributes #1 = { nounwind "target-cpu"="generic-rv32" "target-features"="+m" }
attributes #2 = { nounwind }

!0 = !{}
!1 = !{i8 -1, i8 2}
