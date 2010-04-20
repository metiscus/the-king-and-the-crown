--
--    The King And The Crown
--    Copyright (C) 2010  Damien Carol damien.carol@gmail.com
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>.
--


require("unit.lua")
require("castle.lua")
require("room.lua")
require("cell.lua")
require("style.lua")

systems = {}
current = 1

units = {}

--- Call back function of the 'love' engine
-- Load all sprites
-- @author Damien Carol <damien.carol@gmail.com>
function love.load()

    -- load sprites defined in table
    graphics = {castle = love.graphics.newImage("castle.png"),
                grass = love.graphics.newImage("grass.png"),
                unknow001 = love.graphics.newImage("unknow001.png"),
                archer001 = love.graphics.newImage("archer001.png"),
                knight001 = love.graphics.newImage("knight001.png"),
                
                
                roomBLOCK = love.graphics.newImage("block.png"),
                roomFREE = love.graphics.newImage("free.png"),
                
                dungeon = {},
                
                }
    
    graphics.theme = {}
    graphics.theme["dungeon"] = Style.create("dungeon256x256.png", 16)
    
    --[[graphics.dungeon[0] = love.graphics.newImage("room000.png")
    graphics.dungeon[9] = love.graphics.newImage("room009.png")
    graphics.dungeon[11] = graphics.dungeon[9]
    graphics.dungeon[13] = graphics.dungeon[9]
    graphics.dungeon[15] = graphics.dungeon[9]
    graphics.dungeon[18] = love.graphics.newImage("room018.png")
    graphics.dungeon[19] = graphics.dungeon[18]
    graphics.dungeon[22] = graphics.dungeon[18]
    graphics.dungeon[23] = graphics.dungeon[18]
    graphics.dungeon[27] = love.graphics.newImage("room027.png")
    graphics.dungeon[31] = graphics.dungeon[27]
    graphics.dungeon[45] = graphics.dungeon[9]
    graphics.dungeon[47] = graphics.dungeon[9]
    graphics.dungeon[50] = love.graphics.newImage("room050.png")
    graphics.dungeon[54] = love.graphics.newImage("room054.png")
    graphics.dungeon[55] = graphics.dungeon[54]
    graphics.dungeon[63] = graphics.dungeon[50]
    graphics.dungeon[72] = love.graphics.newImage("room072.png")
    graphics.dungeon[73] = love.graphics.newImage("room073.png")
    graphics.dungeon[75] = graphics.dungeon[73]
    graphics.dungeon[77] = graphics.dungeon[73]
    graphics.dungeon[79] = graphics.dungeon[73]
    graphics.dungeon[83] = graphics.dungeon[18]
    graphics.dungeon[91] = love.graphics.newImage("room091.png")
    graphics.dungeon[95] = graphics.dungeon[91]
    graphics.dungeon[109] = graphics.dungeon[73]
    graphics.dungeon[111] = graphics.dungeon[73]
    graphics.dungeon[127] = love.graphics.newImage("room127.png")
    graphics.dungeon[126] = graphics.dungeon[127] -- hack for corner join
    graphics.dungeon[144] = love.graphics.newImage("room144.png")
    graphics.dungeon[146] = love.graphics.newImage("room146.png")
    graphics.dungeon[147] = graphics.dungeon[146]
    graphics.dungeon[150] = graphics.dungeon[146]
    graphics.dungeon[151] = graphics.dungeon[146]
    graphics.dungeon[153] = graphics.dungeon[144]
    graphics.dungeon[155] = graphics.dungeon[146]
    graphics.dungeon[180] = graphics.dungeon[144]
    graphics.dungeon[182] = graphics.dungeon[146]
    graphics.dungeon[183] = graphics.dungeon[146]
    graphics.dungeon[191] = graphics.dungeon[146]
    graphics.dungeon[216] = love.graphics.newImage("room216.png")
    graphics.dungeon[217] = graphics.dungeon[216]
    graphics.dungeon[218] = love.graphics.newImage("room218.png")
    graphics.dungeon[219] = love.graphics.newImage("room219.png")
    graphics.dungeon[220] = graphics.dungeon[216]
    graphics.dungeon[222] = graphics.dungeon[218]
    graphics.dungeon[223] = graphics.dungeon[219]
    graphics.dungeon[252] = graphics.dungeon[216]
    graphics.dungeon[254] = graphics.dungeon[218]
    graphics.dungeon[255] = graphics.dungeon[219]
    graphics.dungeon[265] = graphics.dungeon[9]
    graphics.dungeon[274] = graphics.dungeon[18]
    graphics.dungeon[297] = graphics.dungeon[9]
    graphics.dungeon[301] = graphics.dungeon[9]
    graphics.dungeon[303] = graphics.dungeon[9]
    graphics.dungeon[306] = graphics.dungeon[18]
    graphics.dungeon[310] = graphics.dungeon[54]
    graphics.dungeon[311] = graphics.dungeon[54]
    graphics.dungeon[315] = graphics.dungeon[27]
    graphics.dungeon[319] = graphics.dungeon[50]
    graphics.dungeon[328] = graphics.dungeon[72]
    graphics.dungeon[329] = graphics.dungeon[73]
    graphics.dungeon[331] = graphics.dungeon[73]
    graphics.dungeon[333] = graphics.dungeon[73]
    graphics.dungeon[335] = graphics.dungeon[73]
    graphics.dungeon[351] = graphics.dungeon[91]
    graphics.dungeon[360] = graphics.dungeon[72]
    graphics.dungeon[361] = graphics.dungeon[73]
    graphics.dungeon[364] = graphics.dungeon[72]
    graphics.dungeon[365] = graphics.dungeon[73]
    graphics.dungeon[366] = graphics.dungeon[72]
    graphics.dungeon[367] = graphics.dungeon[73]
    graphics.dungeon[375] = graphics.dungeon[54]
    graphics.dungeon[383] = graphics.dungeon[127]
    graphics.dungeon[432] = love.graphics.newImage("room432.png")
    graphics.dungeon[434] = love.graphics.newImage("room434.png")
    graphics.dungeon[436] = graphics.dungeon[432]
    graphics.dungeon[438] = love.graphics.newImage("room438.png")
    graphics.dungeon[439] = graphics.dungeon[438]
    graphics.dungeon[441] = graphics.dungeon[432]
    graphics.dungeon[443] = graphics.dungeon[434]
    graphics.dungeon[447] = graphics.dungeon[438]
    graphics.dungeon[504] = love.graphics.newImage("room504.png")
    graphics.dungeon[505] = graphics.dungeon[504]
    graphics.dungeon[506] = love.graphics.newImage("room506.png")
    graphics.dungeon[507] = love.graphics.newImage("room507.png")
    graphics.dungeon[508] = graphics.dungeon[504]
    graphics.dungeon[509] = graphics.dungeon[504]
    graphics.dungeon[510] = love.graphics.newImage("room510.png")
    graphics.dungeon[511] = love.graphics.newImage("room511.png")
    graphics.dungeon[659] = graphics.dungeon[146]
    graphics.dungeon[665] = graphics.dungeon[144]
    graphics.dungeon[667] = graphics.dungeon[146]
    graphics.dungeon[728] = graphics.dungeon[216]
    graphics.dungeon[729] = graphics.dungeon[216]
    graphics.dungeon[730] = graphics.dungeon[218]
    graphics.dungeon[731] = graphics.dungeon[219]
    graphics.dungeon[735] = graphics.dungeon[219]
    graphics.dungeon[767] = graphics.dungeon[219]
    graphics.dungeon[1008] = graphics.dungeon[432]
    graphics.dungeon[1014] = graphics.dungeon[438]
    graphics.dungeon[1015] = graphics.dungeon[438]
    graphics.dungeon[1016] = graphics.dungeon[504]
    graphics.dungeon[1017] = graphics.dungeon[504]
    graphics.dungeon[1018] = graphics.dungeon[506]
    graphics.dungeon[1019] = graphics.dungeon[507]
    graphics.dungeon[1020] = graphics.dungeon[504]
    graphics.dungeon[1021] = graphics.dungeon[504]
    graphics.dungeon[1022] = graphics.dungeon[510]
    graphics.dungeon[1023] = graphics.dungeon[511]
    graphics.dungeon[1168] = love.graphics.newImage("room1168.png")
    graphics.dungeon[1170] = love.graphics.newImage("room1170.png")
    graphics.dungeon[1171] = graphics.dungeon[1170]
    graphics.dungeon[1174] = graphics.dungeon[1170]
    graphics.dungeon[1175] = graphics.dungeon[1170]
    graphics.dungeon[1179] = graphics.dungeon[1170]
    graphics.dungeon[1183] = graphics.dungeon[1170]
    graphics.dungeon[1206] = graphics.dungeon[1170]
    graphics.dungeon[1207] = graphics.dungeon[1170]
    graphics.dungeon[1215] = graphics.dungeon[1170]
    graphics.dungeon[1225] = graphics.dungeon[73]
    graphics.dungeon[1240] = love.graphics.newImage("room1240.png")
    graphics.dungeon[1241] = graphics.dungeon[1240]
    graphics.dungeon[1242] = love.graphics.newImage("room1242.png")
    graphics.dungeon[1243] = love.graphics.newImage("room1243.png")
    graphics.dungeon[1247] = graphics.dungeon[1243]
    graphics.dungeon[1279] = graphics.dungeon[1243]
    graphics.dungeon[1456] = love.graphics.newImage("room1456.png")
    graphics.dungeon[1458] = love.graphics.newImage("room1458.png")
    graphics.dungeon[1460] = graphics.dungeon[1456]
    graphics.dungeon[1462] = love.graphics.newImage("room1462.png")
    graphics.dungeon[1463] = graphics.dungeon[1462]
    graphics.dungeon[1467] = graphics.dungeon[1458]
    graphics.dungeon[1471] = graphics.dungeon[1462]
    graphics.dungeon[1528] = love.graphics.newImage("room1528.png")
    graphics.dungeon[1529] = graphics.dungeon[1528]
    graphics.dungeon[1530] = love.graphics.newImage("room1530.png")
    graphics.dungeon[1531] = love.graphics.newImage("room1531.png")
    graphics.dungeon[1532] = graphics.dungeon[1528]
    graphics.dungeon[1533] = graphics.dungeon[1528]
    graphics.dungeon[1534] = love.graphics.newImage("room1534.png")
    graphics.dungeon[1535] = love.graphics.newImage("room1535.png")
    graphics.dungeon[1680] = graphics.dungeon[1168]
    graphics.dungeon[1682] = graphics.dungeon[1170]
    graphics.dungeon[1683] = graphics.dungeon[1170]
    graphics.dungeon[1686] = graphics.dungeon[1170]
    graphics.dungeon[1689] = graphics.dungeon[1168]
    graphics.dungeon[1691] = graphics.dungeon[1170]
    graphics.dungeon[1718] = graphics.dungeon[1170]
    graphics.dungeon[1727] = graphics.dungeon[1170]
    graphics.dungeon[1736] = graphics.dungeon[72]
    graphics.dungeon[1737] = graphics.dungeon[73]
    graphics.dungeon[1744] = graphics.dungeon[1168]
    graphics.dungeon[1746] = graphics.dungeon[1170]
    graphics.dungeon[1747] = graphics.dungeon[1170]
    graphics.dungeon[1750] = graphics.dungeon[1170]
    graphics.dungeon[1751] = graphics.dungeon[1170]
    graphics.dungeon[1752] = love.graphics.newImage("room1752.png")
    graphics.dungeon[1753] = graphics.dungeon[1752]
    graphics.dungeon[1754] = love.graphics.newImage("room1754.png")
    graphics.dungeon[1755] = love.graphics.newImage("room1755.png")
    graphics.dungeon[1757] = graphics.dungeon[1752]
    graphics.dungeon[1758] = graphics.dungeon[1754]
    graphics.dungeon[1759] = graphics.dungeon[1755]
    graphics.dungeon[1782] = graphics.dungeon[1170]
    graphics.dungeon[1788] = graphics.dungeon[1752]
    graphics.dungeon[1790] = graphics.dungeon[1754]
    graphics.dungeon[1791] = graphics.dungeon[1755]
    graphics.dungeon[1968] = graphics.dungeon[1456]
    graphics.dungeon[1970] = graphics.dungeon[1458]
    graphics.dungeon[1975] = graphics.dungeon[1462]
    graphics.dungeon[1983] = graphics.dungeon[1462]
    graphics.dungeon[2032] = graphics.dungeon[1456]
    graphics.dungeon[2040] = love.graphics.newImage("room2040.png")
    graphics.dungeon[2041] = graphics.dungeon[2040]
    graphics.dungeon[2042] = love.graphics.newImage("room2042.png")
    graphics.dungeon[2043] = love.graphics.newImage("room2043.png")
    graphics.dungeon[2044] = love.graphics.newImage("room2044.png")
    graphics.dungeon[2046] = love.graphics.newImage("room2046.png")
    graphics.dungeon[2047] = love.graphics.newImage("room2047.png")
    graphics.dungeon[2192] = graphics.dungeon[144]
    graphics.dungeon[2448] = graphics.dungeon[144]
    graphics.dungeon[2450] = graphics.dungeon[146]
    graphics.dungeon[2480] = graphics.dungeon[432]
    graphics.dungeon[2482] = graphics.dungeon[434]
    graphics.dungeon[2484] = graphics.dungeon[432]
    graphics.dungeon[2486] = love.graphics.newImage("room438.png")
    graphics.dungeon[2487] = graphics.dungeon[2486]
    graphics.dungeon[2495] = graphics.dungeon[447]
    graphics.dungeon[2520] = graphics.dungeon[216]
    graphics.dungeon[2523] = graphics.dungeon[223]
    graphics.dungeon[2552] = graphics.dungeon[504]
    graphics.dungeon[2553] = graphics.dungeon[504]
    graphics.dungeon[2554] = graphics.dungeon[506]
    graphics.dungeon[2556] = graphics.dungeon[504]
    graphics.dungeon[2557] = graphics.dungeon[504]
    graphics.dungeon[2558] = graphics.dungeon[510]
    graphics.dungeon[2559] = graphics.dungeon[511]
    graphics.dungeon[2815] = graphics.dungeon[219]
    graphics.dungeon[3007] = graphics.dungeon[439]
    graphics.dungeon[3064] = graphics.dungeon[504]
    graphics.dungeon[3065] = graphics.dungeon[504]
    graphics.dungeon[3068] = graphics.dungeon[504]
    graphics.dungeon[3069] = graphics.dungeon[504]
    graphics.dungeon[3070] = graphics.dungeon[510]
    graphics.dungeon[3071] = graphics.dungeon[511]
    graphics.dungeon[3216] = graphics.dungeon[1168]
    graphics.dungeon[3218] = graphics.dungeon[1170]
    graphics.dungeon[3219] = graphics.dungeon[1170]
    graphics.dungeon[3222] = graphics.dungeon[1170]
    graphics.dungeon[3223] = graphics.dungeon[1170]
    graphics.dungeon[3254] = graphics.dungeon[1170]
    graphics.dungeon[3263] = graphics.dungeon[1170]
    graphics.dungeon[3291] = graphics.dungeon[1243]
    graphics.dungeon[3327] = graphics.dungeon[1243]
    graphics.dungeon[3472] = graphics.dungeon[1168]
    graphics.dungeon[3474] = graphics.dungeon[1170]
    graphics.dungeon[3478] = graphics.dungeon[1170]
    graphics.dungeon[3479] = graphics.dungeon[1170]
    graphics.dungeon[3483] = graphics.dungeon[1170]
    graphics.dungeon[3487] = graphics.dungeon[1170]
    graphics.dungeon[3504] = love.graphics.newImage("room3504.png")
    graphics.dungeon[3506] = love.graphics.newImage("room3506.png")
    graphics.dungeon[3507] = graphics.dungeon[3506]
    graphics.dungeon[3508] = graphics.dungeon[3504]
    graphics.dungeon[3510] = love.graphics.newImage("room3510.png")
    graphics.dungeon[3511] = graphics.dungeon[3510]
    graphics.dungeon[3513] = graphics.dungeon[3504]
    graphics.dungeon[3519] = graphics.dungeon[3510]
    graphics.dungeon[3528] = graphics.dungeon[72]
    graphics.dungeon[3529] = graphics.dungeon[73]
    graphics.dungeon[3544] = graphics.dungeon[1240]
    graphics.dungeon[3576] = love.graphics.newImage("room3576.png")
    graphics.dungeon[3577] = graphics.dungeon[3576]
    graphics.dungeon[3578] = love.graphics.newImage("room3578.png")
    graphics.dungeon[3579] = love.graphics.newImage("room3579.png")
    graphics.dungeon[3580] = graphics.dungeon[3576]
    graphics.dungeon[3582] = love.graphics.newImage("room3582.png")
    graphics.dungeon[3583] = love.graphics.newImage("room3583.png")
    graphics.dungeon[3730] = graphics.dungeon[1170]
    graphics.dungeon[3735] = graphics.dungeon[1170]
    graphics.dungeon[3734] = graphics.dungeon[1170]
    graphics.dungeon[3739] = graphics.dungeon[1170]
    graphics.dungeon[3766] = graphics.dungeon[1170]
    graphics.dungeon[3767] = graphics.dungeon[1170]
    graphics.dungeon[3775] = graphics.dungeon[1170]
    graphics.dungeon[3784] = graphics.dungeon[72]
    graphics.dungeon[3785] = graphics.dungeon[73]
    graphics.dungeon[3787] = graphics.dungeon[73]
    graphics.dungeon[3789] = graphics.dungeon[73]
    graphics.dungeon[3794] = graphics.dungeon[1170]
    graphics.dungeon[3800] = graphics.dungeon[1752]
    graphics.dungeon[3801] = graphics.dungeon[1753]
    graphics.dungeon[3802] = graphics.dungeon[1754]
    graphics.dungeon[3803] = graphics.dungeon[1755]
    graphics.dungeon[3806] = graphics.dungeon[1754]
    graphics.dungeon[3807] = graphics.dungeon[1755]
    graphics.dungeon[3823] = graphics.dungeon[73]
    graphics.dungeon[3831] = graphics.dungeon[1170]
    graphics.dungeon[3839] = graphics.dungeon[1755]
    graphics.dungeon[3986] = graphics.dungeon[1170]
    graphics.dungeon[4015] = graphics.dungeon[9]
    graphics.dungeon[4016] = graphics.dungeon[3504]
    graphics.dungeon[4020] = graphics.dungeon[3504]
    graphics.dungeon[4022] = graphics.dungeon[3510]
    graphics.dungeon[4023] = graphics.dungeon[3510]
    graphics.dungeon[4025] = graphics.dungeon[3504]
    graphics.dungeon[4031] = graphics.dungeon[3510]
    graphics.dungeon[4040] = graphics.dungeon[72]
    graphics.dungeon[4041] = graphics.dungeon[73]
    graphics.dungeon[4043] = graphics.dungeon[73]
    graphics.dungeon[4044] = graphics.dungeon[72]
    graphics.dungeon[4045] = graphics.dungeon[73]
    graphics.dungeon[4047] = graphics.dungeon[73]
    graphics.dungeon[4048] = graphics.dungeon[1168]
    graphics.dungeon[4050] = graphics.dungeon[1170]
    graphics.dungeon[4051] = graphics.dungeon[1170]
    graphics.dungeon[4054] = graphics.dungeon[1170]
    graphics.dungeon[4055] = graphics.dungeon[1170]
    graphics.dungeon[4056] = graphics.dungeon[1752]
    graphics.dungeon[4057] = graphics.dungeon[1752]
    graphics.dungeon[4058] = graphics.dungeon[1754]
    graphics.dungeon[4059] = graphics.dungeon[1755]
    graphics.dungeon[4061] = graphics.dungeon[1752]
    graphics.dungeon[4062] = graphics.dungeon[1754]
    graphics.dungeon[4063] = graphics.dungeon[1755]
    graphics.dungeon[4072] = graphics.dungeon[72]
    graphics.dungeon[4073] = graphics.dungeon[73]
    graphics.dungeon[4075] = graphics.dungeon[73]
    graphics.dungeon[4076] = graphics.dungeon[72]
    graphics.dungeon[4077] = graphics.dungeon[73]
    graphics.dungeon[4078] = graphics.dungeon[72]
    graphics.dungeon[4079] = graphics.dungeon[73]
    graphics.dungeon[4080] = graphics.dungeon[3504]
    graphics.dungeon[4082] = graphics.dungeon[3507]
    graphics.dungeon[4084] = graphics.dungeon[3504]
    graphics.dungeon[4085] = graphics.dungeon[3504]
    graphics.dungeon[4086] = graphics.dungeon[3510]
    graphics.dungeon[4087] = graphics.dungeon[3510]
    graphics.dungeon[4088] = graphics.dungeon[2044]
    graphics.dungeon[4089] = graphics.dungeon[2044]
    graphics.dungeon[4090] = love.graphics.newImage("room4090.png")
    graphics.dungeon[4091] = love.graphics.newImage("room4091.png")
    graphics.dungeon[4092] = graphics.dungeon[2044]
    graphics.dungeon[4093] = graphics.dungeon[2044]
    graphics.dungeon[4094] = love.graphics.newImage("room4094.png")
    graphics.dungeon[4095] = love.graphics.newImage("room4095.png")
    ]]--
    -- load 'CASTLE' sprite
    castle_sprite = love.graphics.newImage("castle.png");
    
    -- create one castle entity
    castle = Castle:create()
    castle.x = 15
    castle.y = 16
    
    room = Room.create()
    room:setStyle(Style.create("dungeon256x256.png", 16))
    
    -- load 'GRASS' sprite
    grass_sprite = love.graphics.newImage("grass.png");
    
    part1 = love.graphics.newImage("part1.png");
    cloud = love.graphics.newImage("cloud.png");
    square = love.graphics.newImage("square.png")
    font = love.graphics.newFont(love._vera_ttf, 10)

    love.graphics.setFont(font)
    love.graphics.setColor(200, 200, 200);

    local p = love.graphics.newParticleSystem(part1, 1000)
    p:setEmissionRate(100)
    p:setSpeed(300, 400)
    p:setGravity(0)
    p:setSize(2, 1)
    p:setColor(255, 255, 255, 255, 58, 128, 255, 0)
    p:setPosition(400, 300)
    p:setLifetime(1)
    p:setParticleLife(1)
    p:setDirection(0)
    p:setSpread(360)
    p:setRadialAcceleration(-2000)
    p:setTangentialAcceleration(1000)
    p:stop()
    table.insert(systems, p)

    p = love.graphics.newParticleSystem(cloud, 1000)
    p:setEmissionRate(100)
    p:setSpeed(200, 250)
    p:setGravity(100, 200)
    p:setSize(1, 1)
    p:setColor(16, 81, 229, 255, 176, 16, 229, 0)
    p:setPosition(400, 300)
    p:setLifetime(1)
    p:setParticleLife(1)
    p:setDirection(180)
    p:setSpread(20)
    --p:setRadialAcceleration(-200, -300)
    p:stop()
    table.insert(systems, p)

    p = love.graphics.newParticleSystem(square, 1000)
    p:setEmissionRate(60)
    p:setSpeed(200, 250)
    p:setGravity(100, 200)
    p:setSize(1, 2)
    p:setColor(240, 3, 176, 255, 204, 240, 3, 0)
    p:setPosition(400, 300)
    p:setLifetime(1)
    p:setParticleLife(2)
    p:setDirection(90)
    p:setSpread(0)
    p:setSpin(300, 800)
    p:stop()
    table.insert(systems, p)

    p = love.graphics.newParticleSystem(part1, 1000)
    p:setEmissionRate(1000)
    p:setSpeed(300, 400)
    p:setSize(2, 1)
    p:setColor(220, 105, 20, 255, 194, 30, 18, 0)
    p:setPosition(400, 300)
    p:setLifetime(0.1)
    p:setParticleLife(0.2)
    p:setDirection(0)
    p:setSpread(360)
    p:setTangentialAcceleration(1000)
    p:setRadialAcceleration(-2000)
    p:stop()
    table.insert(systems, p)

    p = love.graphics.newParticleSystem(part1, 1000)
    p:setEmissionRate(200)
    p:setSpeed(300, 400)
    p:setSize(1, 2)
    p:setColor(255, 255, 255, 255, 255, 128, 128, 0)
    p:setPosition(400, 300)
    p:setLifetime(1)
    p:setParticleLife(2)
    p:setDirection(0)
    p:setSpread(360)
    p:setTangentialAcceleration(2000)
    p:setRadialAcceleration(-8000)
    p:stop()
    table.insert(systems, p)

end

direction = 0
X_ROUND = 0
Y_ROUND = 0
LEVEL = 0

function love.update(dt)

    if love.keyboard.isDown("up") then
        NUMBER_TO_DEBUG = NUMBER_TO_DEBUG + 1
    end
    if love.keyboard.isDown("down") then
        NUMBER_TO_DEBUG = NUMBER_TO_DEBUG - 1
    end

    -- if love.mouse.isDown("l") then
        -- systems[current]:setPosition(love.mouse.getX(), love.mouse.getY())
        -- systems[current]:start()
    -- end

    -- if love.keyboard.isDown("d") then
        -- systems[current]:setDirection(direction)
        -- direction = math.mod(direction + 90 * dt, 360)
    -- end

    --systems[current]:update(dt)
    
    local decode = NUMBER_TO_DEBUG
    
    if (decode >= 2048) then
        room.cells[4][5].wall = true
        decode = decode - 2048
    else
        room.cells[4][5].wall = false
    end
    
    if (decode >= 1024) then
        room.cells[3][5].wall = true
        decode = decode - 1024
    else
        room.cells[3][5].wall = false
    end
    
    if (decode >= 512) then
        room.cells[2][5].wall = true
        decode = decode - 512
    else
        room.cells[2][5].wall = false
    end
    
    if (decode >= 256) then
        room.cells[4][4].wall = true
        decode = decode - 256
    else
        room.cells[4][4].wall = false
    end
    
    if (decode >= 128) then
        room.cells[3][4].wall = true
        decode = decode - 128
    else
        room.cells[3][4].wall = false
    end
    
    if (decode >= 64) then
        room.cells[2][4].wall = true
        decode = decode - 64
    else
        room.cells[2][4].wall = false
    end

    if (decode >= 32) then
        room.cells[4][3].wall = true
        decode = decode - 32
    else
        room.cells[4][3].wall = false
    end

    if (decode >= 16) then
        room.cells[3][3].wall = true
        decode = decode - 16
    else
        room.cells[3][3].wall = false
    end

    if (decode >= 8) then
        room.cells[2][3].wall = true
        decode = decode - 8
    else
        room.cells[2][3].wall = false
    end

    if (decode >= 4) then
        room.cells[4][2].wall = true
        decode = decode - 4
    else
        room.cells[4][2].wall = false
    end

    if (decode >= 2) then
        room.cells[3][2].wall = true
        decode = decode - 2
    else
        room.cells[3][2].wall = false
    end

    if (decode >= 1) then
        room.cells[2][2].wall = true
        decode = decode - 1
    else
        room.cells[2][2].wall = false
    end

end

DRAW_BLOCK = 1

function love.draw()

        -- for x=0,32 do
            -- for y=0,32 do
                -- love.graphics.draw(graphics["grass"], x*32, y*32)
            -- end
        -- end
        
        if DRAW_BLOCK == 0 then
            room:draw()
        else
            room:draw_block()
        end

        --love.graphics.setColorMode("modulate")
        --love.graphics.setBlendMode("additive")


love.graphics.print("DEBUG: number of units = " .. #units .. ".", 30, 400);
love.graphics.print("DEBUG: x = " .. X_ROUND .. " y = " .. Y_ROUND .. " level = " .. LEVEL .. ".", 30, 450);

        local nb_dungeon = graphics.dungeon[NUMBER_TO_DEBUG]
        if nb_dungeon == nil then
            nb_dungeon = -1
        end
love.graphics.print("DEBUG: NUMBER_TO_DEBUG = " .. NUMBER_TO_DEBUG .. " DG= " .. nb_dungeon .. ".", 30, 500);

        love.graphics.draw(castle_sprite, castle["x"]*32, castle["y"]*32)
        
        
        -- draw the selected tile
        graphics.theme["dungeon"]:draw(NUMBER_OF_QUAD, 30, 550);
        love.graphics.print("NUMBER_OF_QUAD [" .. NUMBER_OF_QUAD .. "].", 30, 580);
        
        
        
        for x=1,#units do
            local unit = units[x]
            unit:draw()
        end
end

unit_type = Unit.UNKNOW

function love.mousepressed(x, y, button)
    if button == "wu" then
        NUMBER_TO_DEBUG = NUMBER_TO_DEBUG + 1
        return
    end

    if button == "wd" then
        NUMBER_TO_DEBUG = NUMBER_TO_DEBUG - 1
        return
    end
    
    --[[  if button == "l" then
        
        -- test if there are unit in that range
        local unit_selected = nil
        local unit = nil
        for x=1,#units do
            unit = units[x]
            io.write(" value = " .. math.abs(unit.x-x) .. ".")
            --debug.traceback(message = " value = " .. math.abs(unit.x-x) .. ".")
            if math.abs(unit.x-x) <= 32 and math.abs(unit.y-y) <= 32 then
                unit_selected = unit
            end
        end
        
        -- test if no unit was in range
        -- then create new one at mouse coordinate
        if unit_selected == nil then
            local unit = Unit.create()
            unit.x = love.mouse.getX()
            unit.y = love.mouse.getY()
            unit.type = unit_type
            table.insert(units, unit)
        else
            unit_selected.selected = 1
            -- unselect other units
            for x=1,#units do
                local unit = units[x]
                unit.selected = 0
            end
        end
    end   ]]--

    if button == "l" then
        X_ROUND = math.floor(x/16)
        Y_ROUND = math.floor(y/16)
        
        local cell = room.cells[X_ROUND][Y_ROUND]
        if cell.wall == true then
            cell.wall = false
        else
            cell.wall = true
        end
        
        
        local cellup = room.cells[X_ROUND][Y_ROUND+1]
        if cellup ~= nil then
            if cellup.wall == true then
                cellup.wall = false
            else
                cellup.wall = true
            end
        end
            
    else
    
    
        local X_ROUND_level = math.floor(x/16)
        local Y_ROUND_level = math.floor(y/16)
        
        --local cell = room.cells[X_ROUND+(Y_ROUND*14)]
        local cell = room.cells[X_ROUND_level][Y_ROUND_level]
        LEVEL = room:getWallNumber(X_ROUND_level, Y_ROUND_level)
    end
end

NUMBER_TO_DEBUG = 0

NUMBER_OF_QUAD = 0

function love.keypressed(key, unicode)

    local delta = 1
    
    if key == "up" then
        castle["y"] = math.max(castle["y"] - delta, 0)
    end
    if key == "down" then
        castle["y"] = math.min(castle["y"] + delta, 600)
    end
    if key == "left" then
        castle["x"] = math.max(castle["x"] - delta, 0)
    end
    if key == "right" then
        castle["x"] = math.min(castle["x"] + delta, 600)
    end
    
    
    if key == "p" then
        graphics.dungeon[NUMBER_TO_DEBUG] = NUMBER_OF_QUAD
    end
    
    if key == "left" then
        NUMBER_OF_QUAD = NUMBER_OF_QUAD - 1
        NUMBER_OF_QUAD = math.max(0, NUMBER_OF_QUAD)
    end
    if key == "right" then
        NUMBER_OF_QUAD = NUMBER_OF_QUAD + 1
    end
    

    if key == "b" then
        if DRAW_BLOCK == 0 then
            DRAW_BLOCK = 1
        else
            DRAW_BLOCK = 0
        end
    end
    
    if key == "y" then
        room:make_room(5, 5, 6, 6, 0)
    end
    if key == "f1" then
        room:save("level1.txt")
    end
    
    if key == "f4" then
        savedata()
    end
    if key == "f5" then
        loaddata()
    end


    if key == "escape" then
        love.event.push("q")
    end

    if key == "r" then
        love.filesystem.load("main.lua")()
        love.load()
    end
end

function savedata()
    
    local file = love.filesystem.newFile("dungeonparse.txt")
    file:open("w")
    
    for x=0,#graphics.dungeon do
        local num = graphics.dungeon[x]
        if num ~= nil then
            file:write(string.format("%d=%d", x, num))
            file:write("\r\n")
        end
    end
    
    file:close()
end
    
function loaddata()
    
    local file = love.filesystem.newFile("dungeonparse.txt")
    file:open("r")
    
    for line in file:lines() do
        gu, gp = string.gmatch(line, "(%w+)=(%w+)")
        graphics.dungeon[gu] = gp
    end
    
    file:close()
end
