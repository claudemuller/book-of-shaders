package main

import rl "vendor:raylib"

shader: rl.Shader

main :: proc() {
	rl.InitWindow(640, 360, "Book of Shaders")
	defer rl.CloseWindow()

	rl.SetTargetFPS(60)

	shader = rl.LoadShader(nil, "res/shaders/shader.frag")

	for !rl.WindowShouldClose() {
		update()
		render()
	}

	rl.UnloadShader(shader)
}

update :: proc() {
	dt := rl.GetFrameTime()
	rl.SetShaderValue(shader, rl.GetShaderLocation(shader, "u_time"), &dt, .FLOAT)

	mouse := rl.GetMousePosition()
	rl.SetShaderValue(
		shader,
		rl.GetShaderLocation(shader, "u_resolution"),
		&rl.Vector2{f32(rl.GetScreenWidth()), f32(rl.GetScreenHeight())},
		.VEC2,
	)

	rl.SetShaderValue(shader, rl.GetShaderLocation(shader, "u_mouse"), &mouse, .VEC2)
}

render :: proc() {
	rl.BeginDrawing()
	rl.ClearBackground(rl.BLACK)

	rl.BeginShaderMode(shader)
	rl.DrawRectangle(0, 0, rl.GetScreenWidth(), rl.GetScreenHeight(), rl.WHITE)
	rl.EndShaderMode()

	rl.EndDrawing()
}
