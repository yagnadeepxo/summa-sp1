; ModuleID = 'probe4.13159880-cgu.0'
source_filename = "probe4.13159880-cgu.0"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32"

@alloc_5c37cca100e3304e087b8338db484d59 = private unnamed_addr constant <{ [56 x i8] }> <{ [56 x i8] c"/Users/umaroy/Documents/rust/library/core/src/num/mod.rs" }>, align 1
@alloc_c0d5e3f5378b9b9ae7835dc662ee4e51 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_5c37cca100e3304e087b8338db484d59, [12 x i8] c"8\00\00\00/\04\00\00\05\00\00\00" }>, align 4
@str.0 = internal constant [25 x i8] c"attempt to divide by zero"

; probe4::probe
; Function Attrs: nounwind
define dso_local void @_ZN6probe45probe17h1517a02af39cd455E() unnamed_addr #0 {
start:
  %0 = call i1 @llvm.expect.i1(i1 false, i1 false)
  br i1 %0, label %panic.i, label %"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17h55a0756ee872fea5E.exit"

panic.i:                                          ; preds = %start
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17hc7404cbf9a72e9d2E(ptr align 1 @str.0, i32 25, ptr align 4 @alloc_c0d5e3f5378b9b9ae7835dc662ee4e51) #3
  unreachable

"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17h55a0756ee872fea5E.exit": ; preds = %start
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i1 @llvm.expect.i1(i1, i1) #1

; core::panicking::panic
; Function Attrs: cold noinline noreturn nounwind
declare dso_local void @_ZN4core9panicking5panic17hc7404cbf9a72e9d2E(ptr align 1, i32, ptr align 4) unnamed_addr #2

attributes #0 = { nounwind "target-cpu"="generic-rv32" "target-features"="+m" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #2 = { cold noinline noreturn nounwind "target-cpu"="generic-rv32" "target-features"="+m" }
attributes #3 = { noreturn nounwind }
