; ModuleID = 'probe9.6a0b37ed-cgu.0'
source_filename = "probe9.6a0b37ed-cgu.0"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32"

; core::f64::<impl f64>::to_ne_bytes
; Function Attrs: inlinehint nounwind
define internal void @"_ZN4core3f6421_$LT$impl$u20$f64$GT$11to_ne_bytes17h083928ab894d2d35E"(ptr sret([8 x i8]) %0, double %self) unnamed_addr #0 {
start:
  %1 = alloca i64, align 8
  %_3 = alloca double, align 8
  store double %self, ptr %_3, align 8
  %rt = load double, ptr %_3, align 8, !noundef !0
  %2 = bitcast double %rt to i64
  store i64 %2, ptr %1, align 8
  %self1 = load i64, ptr %1, align 8, !noundef !0
  store i64 %self1, ptr %0, align 1
  ret void
}

; probe9::probe
; Function Attrs: nounwind
define dso_local void @_ZN6probe95probe17hfbce922c6931290aE() unnamed_addr #1 {
start:
  %_1 = alloca [8 x i8], align 1
; call core::f64::<impl f64>::to_ne_bytes
  call void @"_ZN4core3f6421_$LT$impl$u20$f64$GT$11to_ne_bytes17h083928ab894d2d35E"(ptr sret([8 x i8]) %_1, double 3.140000e+00) #2
  ret void
}

attributes #0 = { inlinehint nounwind "target-cpu"="generic-rv32" "target-features"="+m" }
attributes #1 = { nounwind "target-cpu"="generic-rv32" "target-features"="+m" }
attributes #2 = { nounwind }

!0 = !{}
