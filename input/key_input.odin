package input

import rl "vendor:raylib"

import "../entity"

move_horizontal:: proc (rect: ^entity.Rect) {
  if rl.IsKeyDown(.LEFT) { rect.x -= rect.speed }
  if rl.IsKeyDown(.RIGHT) { rect.x += rect.speed }

}
