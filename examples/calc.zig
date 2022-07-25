const std = @import("std");

const cn = @import("cn");


pub fn main() anyerror!void {
    const a = cn.ComplexNumber{.re = 0, .im = 1};
    const b = cn.ComplexNumber{.re = 1, .im = 1};

    const add = a.add(b);
    const sub = a.sub(b);
    const mul = a.mul(b);
    const div = a.div(b);
    const conj = b.conj();

    std.log.info("add: {s}", .{add});
    std.log.info("sub: {s}", .{sub});
    std.log.info("mul: {s}", .{mul});
    std.log.info("div: {s}", .{div});
    std.log.info("conj: {s}", .{conj});
}
