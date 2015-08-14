front = {}

function front.load()
    hud = love.graphics.newImage("/images/hud.png")
    hudnum = love.graphics.newImage("/images/hudnum.png")
    bar = love.graphics.newImage("/images/bar.png")

    -- Posición línea
    linebar_x = 0
end

function front.draw()
    -- Level
    if actual_level > 0 and actual_level < 11 then
        -- Left
        love.graphics.setLineWidth(8)
        love.graphics.setColor(192,57,43,255)
        love.graphics.rectangle("line", 78+4, 80+4, 228-8, 480-8)

        love.graphics.setLineWidth(4)
        love.graphics.setColor(236,240,241,255) -- Externo
        love.graphics.rectangle("line", 78-2, 80-2, 228+4, 480+4)
        love.graphics.setColor(236,240,241,100) -- Interno
        love.graphics.rectangle("line", 78+10, 80+10, 228-20, 480-20)

        -- Right
        love.graphics.setLineWidth(8)
        love.graphics.setColor(243,156,18,255)
        love.graphics.rectangle("line", 1280-228-78+4, 80+4, 228-8, 480-8)

        love.graphics.setLineWidth(4)
        love.graphics.setColor(236,240,241,255) -- Externo
        love.graphics.rectangle("line", 1280-228-78-2, 80-2, 228+4, 480+4)
        love.graphics.setColor(236,240,241,100) -- Interno
        love.graphics.rectangle("line", 1280-228-78+10, 80+10, 228-20, 480-20)

        -- Yes, no
        if show_yesno == true then
            love.graphics.setColor(255,255,255,255)
            if win_l == true or win_r == true then
                love.graphics.draw(yes_, 1280/2-(227/2), (720-80)/2-(106/2))
            else
                love.graphics.draw(no_, 1280/2-(169/2), (720-80)/2-(106/2))
            end
        end
    end

    -- HUD
    if actual_level > 0 and actual_level < 11 then
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(hud, 0, 0)

        love.graphics.setColor(255,255,255,60)
        love.graphics.draw(bar, linebar_x-1280, 720-60)

        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(hudnum, 0, 0)
    end
end

function front.math(dt)

end

function UPDATE_FRONT(dt)
    front.math(dt)
end

function DRAW_FRONT()
    front.draw()
end
