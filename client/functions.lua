local function _drawWall(p1, p2)
    local bottomLeft  = vector3(p1[1], p1[2], p1[3] - 1.5)
    local topLeft     = vector3(p1[1], p1[2],  p1[3] + Config.BorderHight)
    local bottomRight = vector3(p2[1], p2[2], p2[3] - 1.5)
    local topRight    = vector3(p2[1], p2[2], p2[3] + Config.BorderHight)
    DrawPoly(bottomLeft,topLeft,bottomRight,0,255,0,10)
    DrawPoly(topLeft,topRight,bottomRight,0,255,0,10)
    DrawPoly(bottomRight,topRight,topLeft,0,255,0,10)
    DrawPoly(bottomRight,topLeft,bottomLeft,0,255,0,10)
end

function DisplayHelpText(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringKeyboardDisplay(text)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

function drawPoly(isEntityZone)
    local iPed = GetPlayerPed(-1)
    for i = 1, #Config.Zones do
        local Zone = Config.Zones[i]
        local j = #Zone
        for i = 1, #Zone do
            local zone = Zone[i]
            if i < #Zone then
                local p2 = Zone[i+1]
                _drawWall(zone, p2)
            end
        end
        if #Zone > 2 then
            local firstPoint = Zone[1]
            local lastPoint = Zone[#Zone]
            _drawWall(firstPoint, lastPoint)
        end
    end
end

