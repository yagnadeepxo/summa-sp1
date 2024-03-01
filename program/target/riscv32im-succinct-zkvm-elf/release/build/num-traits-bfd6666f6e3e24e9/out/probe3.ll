; ModuleID = 'probe3.e92fd5c2-cgu.0'
source_filename = "probe3.e92fd5c2-cgu.0"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32"

; probe3::probe
; Function Attrs: nounwind
define dso_local void @_ZN6probe35probe17h59d5736153eae14eE() unnamed_addr #0 {
start:
  %0 = alloca i32, align 4
  store i32 1, ptr %0, align 4
  %1 = load i32, ptr %0, align 4, !noundef !0
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.cttz.i32(i32, i1 immarg) #1

attributes #0 = { nounwind "target-cpu"="generic-rv32" "target-features"="+m" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{}
