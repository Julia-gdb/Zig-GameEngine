package main

import "core:c"
import "core:fmt"

foreign import math "zig-out/lib/libz.a"
@(default_calling_convention="c")
foreign math {
  add :: proc(a: i32, b: i32) -> c.int ---
}

main :: proc() {

  result := add(6, 7);
  fmt.print("result from Zig library: ", result);

}
