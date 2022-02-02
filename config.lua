Config                 = {}
Config.CheckForUpdates = true   -- update checker
Config.TopLeftInfoBox  = true   -- top left message
Config.ShowBorder      = true   -- if you want to see a border
Config.BorderHight     = 5      -- boder Hight

-- for police
Config.WeaponBypass = {
    GetHashKey("WEAPON_PISTOL"),
}

-- walk where you want to place a square block, to make a safe/speed limit zone. 
-- Take from each corner the vector3 as location and use in de congif.lua.
Config.Zones = {
    { -- legion square center
        {259.76, -873.53, 29.21}, -- point 1
        {184.6, -846.16, 31.07},  -- point 2
        {133.42, -986.64, 29.36}, -- point 3
        {208.66, -1013.98, 29.31} -- point 4
    },
    { -- legion square parking lot
        {240.16, -821.06, 29.97}, -- point 1
        {252.92, -784.79, 30.51}, -- point 2
        {258.39, -786.82, 30.43}, -- point 3
        {272.68, -748.07, 30.79}, -- point 4
        {226.11, -732.83, 30.79}, -- point 5
        {199.62, -805.96, 30.79}  -- point 6
    }
}

Config.MaxVehicleSpeed = 10.00  -- set to false to disable.
Config.MaxSpeedBypass = {       -- Vehicles classes added in this bypass will still be able to go faster than the max speed set above.
    --0, -- Compacts  
    --1, -- Sedans  
    --2, -- SUVs  
    --3, -- Coupes  
    --4, -- Muscle  
    --5, -- Sports Classics  
    --6, -- Sports  
    --7, -- Super  
    --8, -- Motorcycles  
    --9, -- Off-road  
    --10, -- Industrial  
    --11, -- Utility  
    --12, -- Vans  
    --13, -- Cycles  
    --14, -- Boats  
    15, -- Helicopters  
    16, -- Planes  
    --17, -- Service  
    --18, -- Emergency  
    --19, -- Military  
    --20, -- Commercial  
    --21, -- Trains
}