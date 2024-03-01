; ModuleID = 'probe2.4b5da501-cgu.0'
source_filename = "probe2.4b5da501-cgu.0"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32"

; probe2::probe
; Function Attrs: nounwind
define dso_local void @_ZN6probe25probe17h670cd1b4ae11f604E() unnamed_addr #0 {
start:
  %0 = alloca i32, align 4
  store i32 -2147483648, ptr %0, align 4
  %1 = load i32, ptr %0, align 4, !noundef !0
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bitreverse.i32(i32) #1

attributes #0 = { nounwind "target-cpu"="generic-rv32" "target-features"="+m" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{}
