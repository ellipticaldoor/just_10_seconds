player = {}

function player.load()
	-- Player
	showplayer, moveplayer = false, false

	player.w, player.h = 50, 50
	player.x, player.y = 1280/2-(player.w/2), (720-80)/2-(player.h/2)
	player.xvel, player.yvel = 0, 0
	player.spd, player.fr = 10000, 4.5

	left, right = false, false
	player_lock = false

	ground = 548

	skin_player_l = love.graphics.newImage("/images/player_l.png")
	skin_player_r = love.graphics.newImage("/images/player_r.png")
	skin_player_lock = love.graphics.newImage("/images/player_lock.png")

	-- Lock
	lock = love.graphics.newImage("/images/lock.png")
	lock_x, lock_y = math.random(331,914), math.random(92,192)
end

function player.draw()

	if showplayer == true then
		love.graphics.setColor(255,255,255,255)
		if actual_side == 0 then love.graphics.draw(skin_player_l, player.x, player.y)
		else love.graphics.draw(skin_player_r, player.x, player.y) end

		if player_lock == true then
			love.graphics.draw(skin_player_lock, player.x, player.y)
		end
	end

	--lock
	if actual_level > 0 and actual_level < 11 and player_lock == false then
		love.graphics.setColor(255,255,255,255)
		love.graphics.draw(lock, lock_x, lock_y)
	end
end

function player.math(dt)
	-- Velocidad
	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	
	-- Fricción
	player.xvel = player.xvel * (1 - math.min(dt * player.fr, 1))
	player.yvel = player.yvel * (1 - math.min(dt * player.fr, 1))

	-- Lock
	if player.x > lock_x - player.w and player.x < lock_x + 35 then
		if player.y > lock_y and player.y < lock_y + 35 then
			player_lock = true
		end
	end
end

function player.move(dt)
	if moveplayer == true then
		if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
			player.xvel = player.xvel + player.spd * dt
		end
		if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
			player.xvel = player.xvel - player.spd * dt
		end
		
		if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
			player.yvel = player.yvel - player.spd*2 * dt
		end
		if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
			player.yvel = player.yvel + player.spd*2 * dt
		end
	end
end

function player.limit()
	if player.x < -player.w then player.x = 1280 - 5 end
	if player.x > 1280 then player.x = -player.w + 5 end
	if player.y < 92 then player.y = 92 end
	if player.y + player.h > ground then player.y = ground - player.h end

	-- Goals
	if player.x > 78 and player.x < 78+228 then left, show_yesno = true, true
	else left = false end

	if player.x > 974 and player.x < 974+228 then right, show_yesno = true, true
	else right = false end

	-- Win
	if left == true and actual_side == 0 then win_l = true
	else win_l = false end

	if right == true and actual_side == 1 then win_r = true
	else win_r = false end
end

function UPDATE_PLAYER(dt)
	player.limit()
	player.math(dt)
	player.move(dt)
end

function DRAW_PLAYER()
	player.draw()
end
