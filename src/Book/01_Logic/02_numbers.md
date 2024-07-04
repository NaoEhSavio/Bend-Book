# Numbers in Bend

In Bend, you can work with various types of numbers, including unsigned integers, signed integers, and floating-point numbers, all 24 bits wide. Additionally, you can use binary and hexadecimal literals, as well as character literals that can be converted to `u24`.

## Number Types

### Unsigned Integers

24-bit unsigned integers can be used to represent positive integer values.
unsigned_number = 420  Unsigned integer (24 bits)

### Signed Integers

24-bit signed integers can be used to represent positive and negative integer values.
signed_number = +69  Signed integer (24 bits)

### Floating-Point Numbers

24-bit floating-point numbers can be used to represent numeric values with a fractional part.
floating_number = 1.4  Floating point (24 bits)

## Binary and Hexadecimal Literals

### Binary

You can use binary literals to represent numbers in base 2.
binary_number = 0b100_100  Binary

### Hexadecimal

You can use hexadecimal literals to represent numbers in base 16.
hexadecimal_number = 0x123_abc  Hexadecimal
signed_hexadecimal_number = -0xbeef  Signed hexadecimal

### Character Literals

Character literals are represented by a single character enclosed in single quotes.
They accept Unicode characters and Unicode escapes in the form '\u{hexadecimal value}'.
character = 'x'

### Conversion of Character Literals to `u24`

A character literal is desugared to a 24-bit unsigned integer (`u24`).
This means each character can be treated as an integer corresponding to its Unicode code point.

### Operations

There is also support for native operations. In "Imp" syntax they are infix operators and in "Fun" syntax they are written in reverse polish notation (like you'd call a normal function). Each operation takes two arguments and returns a new number.

### In Fun syntax

some_val = (+ (+ 7 4) (* 2 3))

These are the currently available operations:
| Operation | Description              | Accepted types | Return type       |
| --------- | ------------------------ | -------------- | ----------------- |
|  \+        | Addition                 | U24, I24, F24  | Same as arguments |
|  \-        | Subtraction              | U24, I24, F24  | Same as arguments |
|  \*        | Multiplication           | U24, I24, F24  | Same as arguments |
|  \/        | Division                 | U24, I24, F24  | Same as arguments |
|  \%        | Modulo                   | U24, I24, F24  | Same as arguments |
|  \=\=       | Equality                 | U24, I24, F24  | U24               |
|  \!\=       | Inequality               | U24, I24, F24  | U24               |
|  \<        | Less than                | U24, I24, F24  | U24               |
|  \<\=       | Less than or equal to    | U24, I24, F24  | U24               |
|  \>        | Greater than             | U24, I24, F24  | U24               |
|  \>\=       | Greater than or equal to | U24, I24, F24  | U24               |
|  \&        | Bitwise and              | U24, I24       | Same as arguments |
|  \|        | Bitwise or               | U24, I24       | Same as arguments |
|  \^        | Bitwise xor              | U24, I24       | Same as arguments |
|  \*\*       | Exponentiation           | F24            | F24               |

Functions
| Name           | Description                     | Accepted types | Return type |
| -------------- | ------------------------------- | -------------- | ----------- |
| log(x, base)   | Logarithm                       | F24            | F24         |
| atan2(x, y)    | 2 arguments arctangent (atan2f) | F24            | F24         |

Testing the conversion function

```py
def main():
  ex01 = 'A'        # Should return 65 (Unicode value of 'A')
  ex02 = '\u{123}'  # Should return 291 (Unicode value of '\u{123}')
  return ex02
```

Unicode Code Point Support
Bend supports Unicode code points up to 0xFFFFFF, allowing the representation of a wide range of international characters.

Summary:

- Unsigned integers: `420`
- Signed integers: `+69`
- Floating-point numbers: `1.4`
- Binary: `0b100_100`
- Hexadecimal: `0x123_abc`, `-0xbeef`
- Character literals: `'x'`, `'\u{123}'`
- Conversion of characters to `u24`: Each character is treated as a `u24` integer
corresponding to its Unicode code point.

Bend offers a range of numeric types and support for character literals, making it easy to work with numeric and text data efficiently and intuitively.
