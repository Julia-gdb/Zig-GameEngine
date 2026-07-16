package log 

import rl "vendor:raylib"
import "core:fmt"

key_press :: proc() {
  for key := i32(32); key <= 348; key += 1 {
    rl_key := rl.KeyboardKey(key)

    if rl.IsKeyPressed(rl_key) {
      rl.TraceLog(.INFO, "[keypress] %d\n", rl_key);
    }
  }
}
