package graphic

import rl "vendor:raylib"

draw :: proc(x: i32, y: i32, w: i32, h: i32) {
  rl.DrawRectangle(x, y, w, h, rl.RED);
}
