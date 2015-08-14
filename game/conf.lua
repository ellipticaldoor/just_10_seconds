function love.conf(t)
	--Basic setup stuff
	t.title				= "10 seconds - Ludum Dare 27"
	t.author			= "Miguel Dorta"
	
	--App identity and LOVE2D version
	t.identity			= "10 seconds - Ludum Dare 27"
	t.console			= false
	t.release			= true -- Set to true for release mode
	t.version			= "0.8.0"
	
	--Screen dimensions and settings
	--t.fullscreen		= true
	t.screen.width		= 1280
	t.screen.height		= t.screen.width / 16*9
	
	t.screen.vsync		= true
	t.screen.fsaa		= 0
	
	--Enable/Disable modules as needed, disabled slightly reduces startup
	t.modules.joystick	= false
	t.modules.audio		= true
	t.modules.keyboard	= true
	t.modules.event		= true
	t.modules.image		= true
	t.modules.graphics	= true
	t.modules.timer		= true
	t.modules.mouse		= true
	t.modules.sound		= true
	t.modules.physics	= false
end
