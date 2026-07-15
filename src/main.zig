const std = @import("std"); 

const c = @cImport({
    @cInclude("SDL2/SDL.h");
});

pub fn main() !void {

    if (c.SDL_Init(c.SDL_INIT_VIDEO) < 0) {
         std.log.err("SDL could not initialize! SDL_Error: {s}\n", .{c.SDL_GetError()});
        return error.SDLInitializationFailed; 
    }
    defer c.SDL_Quit();
     
    const window = c.SDL_CreateWindow(
        "Space Invader Clone", 
        c.SDL_WINDOWPOS_UNDEFINED,
        c.SDL_WINDOWPOS_UNDEFINED,
        800, 
        600, 
        c.SDL_WINDOW_SHOWN
    ); 

    if (window == null) {
        std.log.err("Window could not be created! SDL_Error: {s}\n", .{c.SDL_GetError()});
        return error.SDLWindowCreationFailed;
    }
    defer c.SDL_DestroyWindow(window);
    
    const renderer = c.SDL_CreateRenderer(
        window, 
        -1, 
        c.SDL_RENDERER_ACCELERATED | c.SDL_RENDERER_PRESENTVSYNC
    );

    if (renderer == null) {
        std.log.err("Renderer could not be created! SDL_Error: {s}\n", .{c.SDL_GetError()});
        return error.SDLRendererCreationFailed;
    }
    defer c.SDL_DestroyRenderer(renderer);
        
    const rect = c.SDL_Rect{
        .x = 250, 
        .y = 150, 
        .w = 300, 
        .h = 200,
    };



    var quit = false; 
    var event: c.SDL_Event = undefined;
    while (!quit){
        while (c.SDL_PollEvent(&event) != 0) {
            if (event.type == c.SDL_QUIT) {
                quit = true; 
                std.debug.print("exit successful", .{});
            }
        }


        _ = c.SDL_SetRenderDrawColor(renderer, 0,0, 0, 255);
        _ = c.SDL_RenderClear(renderer);


        _ = c.SDL_SetRenderDrawColor(renderer, 20, 40, 80, 255);
        _ = c.SDL_RenderFillRect(renderer, &rect);
        

        c.SDL_RenderPresent(renderer);

    }
    
}





