const std = @import("std");

const math = std.math;
const expect = std.testing.expect;


pub const ComplexNumber = struct {
    re: f64,
    im: f64,

    pub fn add(self: ComplexNumber, other: ComplexNumber) ComplexNumber {
        return ComplexNumber{
            .re = self.re + other.re, .im = self.im + other.im
        };
    }

    pub fn sub(self: ComplexNumber, other: ComplexNumber) ComplexNumber {
        return ComplexNumber{
            .re = self.re - other.re, .im = self.im - other.im
        };
    }

    pub fn mul(self: ComplexNumber, other: ComplexNumber) ComplexNumber {
        return ComplexNumber{
            .re = self.re * other.re - self.im * other.im,
            .im = self.re * other.im + self.im * other.re,
        };
    }

    pub fn div(self: ComplexNumber, other: ComplexNumber) ComplexNumber {
        return self.mul(other.conj());
    }

    pub fn conj(self: ComplexNumber) ComplexNumber {
        const r = math.pow(f64, self.re, 2) + math.pow(f64, self.im, 2);

        return ComplexNumber{
            .re = self.re / r,
            .im = -self.im / r,
        };
    }
};


test "test for add" {
    const a = ComplexNumber{.re = 0, .im = 1};
    const b = ComplexNumber{.re = 1, .im = 1};

    const result = a.add(b);

    try expect(result.re == 1);
    try expect(result.im == 2);
}

test "test for sub" {
    const a = ComplexNumber{.re = 0, .im = 1};
    const b = ComplexNumber{.re = 1, .im = 1};

    const result = a.sub(b);

    try expect(result.re == -1);
    try expect(result.im == 0);
}

test "test for mul" {
    const a = ComplexNumber{.re = 0, .im = 1};
    const b = ComplexNumber{.re = 1, .im = 1};

    const result = a.mul(b);

    try expect(result.re == -1);
    try expect(result.im == 1);
}

test "test for div" {
    const a = ComplexNumber{.re = 0, .im = 1};
    const b = ComplexNumber{.re = 1, .im = 1};

    const result = a.div(b);

    try expect(result.re == 0.5);
    try expect(result.im == 0.5);
}

test "test for conj" {
    const a = ComplexNumber{.re = 1, .im = 1};

    const result = a.conj();

    try expect(result.re == 0.5);
    try expect(result.im == -0.5);
}
