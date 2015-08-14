require "/lua/background"
require "/lua/front"
require "/lua/player"

math.randomseed( os.time() )

function love.load()
    -- Cambiar resolución
    love.window.setMode(1280, 720)

    -- Variables
    actual_level = 0
    timer, timer2 = 0, 0

    piano = love.audio.newSource("sound/piano.mp3")
    piano:setVolume(0.8)
    
    --Loading classes
    love.mouse.setVisible(false)

    background.load()
    player.load()
    front.load()
end

function love.update(dt)
    timer = timer + dt
    timer2 = timer2 + dt

    UPDATE_BG(dt)
    UPDATE_PLAYER(dt)
    UPDATE_FRONT(dt)

    local fps=love.timer.getFPS
    love.window.setTitle("10 seconds - Ludum Dare 27 - "..fps().." FPS")
end

function love.draw()
    DRAW_BG()
    DRAW_PLAYER()
    DRAW_FRONT()
end

function love.keypressed(key)
    if key == 'escape' then love.event.quit() end

    if actual_level == 0 then
        if key == "return" or key == " " then
            timer, timer2 = 0, 0
            linebar_x = 0

            actual_level = actual_level + 1
            love.audio.play(piano)

            show_yesno, player_lock = false, false
            showplayer, moveplayer = true, true

            player.xvel, player.yvel = 0, 0
            player.x, player.y = 1280/2-(player.w/2), (720-80)/2-(player.h/2)

            actual_side = math.random(0,1)
            if actual_side == 0 then
                lock_x, lock_y = math.random(331,914), math.random(92,192)
            else
                lock_x, lock_y = math.random(331,914), math.random(413,513)
            end
        end
    end

    if actual_level == 11 then
        if key == "return" or key == " " then
            love.audio.stop(piano)
            actual_level = 0
        end
    end
end
