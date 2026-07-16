package main

//import "core:c"
//import "core:fmt"
import rl "vendor:raylib"
import "log"
import "input"
import "graphic"
import "entity"

/* foreign import math "zig-out/lib/libz.a"
@(default_calling_convention="c")
foreign math {
  add :: proc(a: i32, b: i32) -> c.int ---
}
*/

my_player := entity.Rect{x = 300, y = 300, speed = 5};

main :: proc() {
  
  rl.InitWindow(800, 450, "Zig GameEngine");
  rl.SetTargetFPS(60);

  for !rl.WindowShouldClose() {

    log.key_press();
    
    input.move_horizontal(&my_player);
     
    rl.BeginDrawing();
    rl.ClearBackground(rl.GRAY);
    
    graphic.draw(my_player.x, my_player.y, 50, 50);
  
    rl.EndDrawing();
  }

}
