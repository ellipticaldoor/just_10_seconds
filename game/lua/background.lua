background = {}

function background.load()
    --bg
    actual_side = math.random(0,1)
    yes_ = love.graphics.newImage("/images/yes_.png")
    no_ = love.graphics.newImage("/images/no_.png")
    show_yesno = false

    --bg0
    intro = love.graphics.newImage("/images/intro.png")

    --bg4
    bg4 = love.graphics.newImage("/images/bg4.png")

    --bg8
    bg8 = love.graphics.newImage("/images/bg8.png")

    --bg10
    bg10 = love.graphics.newImage("/images/bg10.png")
    bg10_x, bg10_spd = 0, 30

    color = {
        a = 255,
        b = 255,
        c = 255,
    }

    --bg11
    yes = love.graphics.newImage("/images/yes.png")
    no = love.graphics.newImage("/images/no.png")

    win_l, win_r = false, false
end

function background.draw()
    if actual_level == 0 then
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(intro, 0, 0)
    end

    if actual_level > 0 then
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg10, bg10_x, 0)
        love.graphics.draw(bg10, bg10_x-1134, 0)
        love.graphics.draw(bg10, bg10_x+1134, 0)
        
        if actual_level < 10 then
            love.graphics.setColor(color.a, color.b, color.c, 255)
            love.graphics.rectangle("fill", 0, 0, 1280, 720-80)
        end
    end

    if actual_level == 4 then
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg4, 0, 0)
    end

    if actual_level == 8 then
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg8, 0, 0)
    end

    -- Level
    if actual_level > 0 and actual_level < 11 then
        love.graphics.setColor(192,57,43,200)
        love.graphics.rectangle("fill", 78, 80, 228, 480)
        love.graphics.setColor(243,156,18,200)
        love.graphics.rectangle("fill", 1280-228-78, 80, 228, 480)

        -- Yes, no bg
        love.graphics.setColor(236,240,241,200)
        love.graphics.rectangle("fill", 310, (720-80)/2-(146/2), 660, 146)
        love.graphics.rectangle("fill", 310, (720-80)/2-(146/2), 660, 4)
        love.graphics.rectangle("fill", 310, (720-80)/2-(146/2)+142, 660, 4)
    end

    if actual_level == 11 then
        love.graphics.setColor(255,255,255,255)
        if win_l == true or win_r == true then
            love.graphics.draw(yes, 0, 0)
        else
            love.graphics.draw(no, 0, 0)
        end
    end
end

function background.math(dt)
    if timer > 1 and actual_level > 0 and actual_level < 11 then
        timer = 0
        actual_level, linebar_x = actual_level + 1, linebar_x + 128
        love.audio.stop(piano)
        love.audio.play(piano)
        
        if actual_level < 10 and player_lock == false then
            actual_side = math.random(0,1)

            if actual_side == 0 then
                lock_x, lock_y = math.random(331,914), math.random(92,192)
            else
                lock_x, lock_y = math.random(331,914), math.random(413,513)
            end
        end 
    end

    if timer2 > 0.5 and actual_level > 0 and actual_level < 11 then
        timer2 = 0
        
        if actual_level < 10 and player_lock == false then
            if actual_side == 0 then
                lock_x, lock_y = math.random(331,914), math.random(92,192)
            else
                lock_x, lock_y = math.random(331,914), math.random(413,513)
            end
        end 
    end

    if actual_level == 1 then color.a = 26 color.b = 188 color.c = 156 end
    if actual_level == 2 then color.a = 52 color.b = 152 color.c = 219 end
    if actual_level == 3 then color.a = 155 color.b = 89 color.c = 182 end
    if actual_level == 4 then color.a = 52 color.b = 73 color.c = 94 end
    if actual_level == 5 then color.a = 241 color.b = 196 color.c = 15 end
    if actual_level == 6 then color.a = 230 color.b = 126 color.c = 34 end
    if actual_level == 7 then color.a = 231 color.b = 76 color.c = 60 end
    if actual_level == 8 then color.a = 236 color.b = 240 color.c = 241 end
    if actual_level == 9 then color.a = 149 color.b = 165 color.c = 166 end
    
    --bg10
    if bg10_x > 1134 then bg10_x = 0 end
    bg10_x = bg10_x + bg10_spd * dt

    if actual_level == 10 then color.a = 192 color.b = 57 color.c = 43 end

    if actual_level == 11 then showplayer, moveplayer = false, false end
end


function UPDATE_BG(dt)
    background.math(dt)
end

function DRAW_BG()
    background.draw()
end
