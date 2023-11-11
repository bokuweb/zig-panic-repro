var i: u32 = 0;

pub fn panic() void {}

pub export fn _start() void {
    // If the following line is removed, the build will succeed.
    i = i + 1;
}
