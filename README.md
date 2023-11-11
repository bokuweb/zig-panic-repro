```
zig build
zig build-exe kernel Debug native: error: the following command failed with 1 compilation errors:
/opt/homebrew/Cellar/zig/0.11.0/bin/zig build-exe -ofmt=elf /github.com/bokuweb/zig-panic-repro/src/main.zig --cache-dir /github.com/bokuweb/zig-panic-repro/zig-cache --global-cache-dir /Users/bokuweb/.cache/zig --name kernel -target riscv32-freestanding-none -mcpu baseline_rv32-a-c-d-f -I /github.com/bokuweb/zig-panic-repro/src --listen=- 
Build Summary: 0/3 steps succeeded; 1 failed (disable with --summary none)
install transitive failure
└─ install kernel transitive failure
   └─ zig build-exe kernel Debug native 1 errors
/opt/homebrew/Cellar/zig/0.11.0/lib/zig/std/builtin.zig:725:9: error: expected type 'fn([]const u8, ?*builtin.StackTrace, ?usize) noreturn', found 'fn() void'
    root.panic
    ~~~~^~~~~~
/opt/homebrew/Cellar/zig/0.11.0/lib/zig/std/builtin.zig:725:9: note: return type 'void' cannot cast into return type 'noreturn'
```