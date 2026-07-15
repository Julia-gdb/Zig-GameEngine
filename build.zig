const std = @import("std");


pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .aarch64, 
        .os_tag = .macos,
        .os_version_min = .{ .semver = .{ .major = 26, .minor = 0, .patch = 0 } }, 
    });
    const optimize = b.standardOptimizeOption(.{});

    const libz = b.addLibrary(.{
        .name = "z",
        .linkage = .static,
        .root_module = b.createModule(.{
            .root_source_file = b.path("./libz/math.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    
    b.installArtifact(libz);
}


