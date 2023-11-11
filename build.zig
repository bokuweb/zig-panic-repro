const std = @import("std");
const Builder = @import("std").build.Builder;
const Step = @import("std").build.Step;
const CompileStep = @import("std").build.CompileStep;
const Target = @import("std").Target;

pub fn build(b: *Builder) void {
    const Feature = @import("std").Target.Cpu.Feature;
    const features = Target.riscv.Feature;
    var disabled_features = Feature.Set.empty;
    var enabled_features = Feature.Set.empty;

    disabled_features.addFeature(@intFromEnum(features.a));
    disabled_features.addFeature(@intFromEnum(features.d));
    disabled_features.addFeature(@intFromEnum(features.e));
    disabled_features.addFeature(@intFromEnum(features.f));
    disabled_features.addFeature(@intFromEnum(features.c));
    enabled_features.addFeature(@intFromEnum(features.m));

    const target = std.zig.CrossTarget{ .os_tag = .freestanding, .cpu_arch = .riscv32, .abi = Target.Abi.none, .ofmt = .elf, .cpu_features_sub = disabled_features, .cpu_features_add = enabled_features };
    const exe = b.addExecutable(std.Build.ExecutableOptions{ .name = "kernel", .root_source_file = std.build.LazyPath.relative("./src/main.zig") });

    exe.target = target;
    exe.addIncludePath(std.build.LazyPath.relative("./src"));
    b.installArtifact(exe);
}

pub fn main() void {
    @import("std").build.run(build, @import("std").builtin.Builder);
}
