--[[===========================================================================
                             AccurateWorldMap Data
===============================================================================

            Data and data-related functions that get used to 
            power zone/node/tile placement or other features.

---------------------------------------------------------------------------]]--



-------------------------------------------------------------------------------
-- Hacky table functions
-------------------------------------------------------------------------------

-- Hacky function to be able to define zoneData several times while still in one
-- flat data structure without overwriting the table each time.

-- Mainly done because it makes the data structure look visually nicer.

-------------------------------------------------------------------------------

local hackyTable = {}

local function hackyJoin(extra, newWorldspace)

  if (newWorldspace) then
    hackyTable = {}
  end

  table.insert(hackyTable, extra)
  return hackyTable
end

-------------------------------------------------------------------------------
-- World map wayshrine & zone data
-------------------------------------------------------------------------------

-- Data table of all the wayshrine nodes and zone blobs we want to modify or 
-- move, sorted by map (zone). We use the zone's name as a base to get the 
-- correct zone texture (and later texture dimensions) to draw on the map

-------------------------------------------------------------------------------

mapData = {

-- █████████████████████████████████████████████████████████████████████████████████████████████████████████████████
-- █   ████████   █████     ██████        █████   ████████      ███████████   ███████   ███████  ████████        ███
-- █   ████████   ███   ████   ███   ████   ███   ████████   ███   ████████      ███    ██████     ██████   ████   █
-- █   ███  ███   █   ████████   █   ████   ███   ████████   ████   ███████   █     █   █████  ██   █████   ████   █
-- █   ██   ███   █   ████████   █      ███████   ████████   ████   ███████   ██   ██   ████   ███   ████        ███
-- █   █      █   █   ████████   █   ██   █████   ████████   ████   ███████   ███  ██   ███           ███   ████████
-- █     ████     ███   ████    ██   ████   ███   ████████   ███   ████████   ███████   ██   ███████   ██   ████████
-- █   ████████   █████     ██████   ██████   █          █      ███████████   ███████   █   █████████   █   ████████
-- █████████████████████████████████████████████████████████████████████████████████████████████████████████████████
-- ctrl + f aid: world map
  
  [27] = { -- Tamriel World Map

    isExclusive = true,
        
    -- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    -- ██░▄▄▄░██░█▀▄██░███░██░▄▄▀█▄░▄██░▄▀▄░██
    -- ██▄▄▄▀▀██░▄▀███▄▀▀▀▄██░▀▀▄██░███░█░█░██
    -- ██░▀▀▀░██░██░████░████░██░█▀░▀██░███░██
    -- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    -- [x] = { xN = x, yN = y }, -- 
    -- ctrl + f aid: skyrim

    -- Bleakrock Isle --
    [172] = { xN = 0.617, yN = 0.232 }, -- Bleakrock Isle Wayshrine

    zoneData = hackyJoin({
      zoneName = "Bleakrock Isle",
      zoneDescription = "The hardy Nords who inhabit Bleakrock Isle are mostly farmers and fisherfolk,\n but they are no stranger to pirates and raiders.",
      zoneID = 74,
      xN = "0.6075",
      yN = "0.223",
      zonePolygonData = {
        { xN = 0.605, yN = 0.233 },
        { xN = 0.614, yN = 0.244 },
        { xN = 0.619, yN = 0.243 },
        { xN = 0.629, yN = 0.233 },
        { xN = 0.628, yN = 0.229 },
        { xN = 0.620, yN = 0.221 },
        { xN = 0.615, yN = 0.221 },
        { xN = 0.605, yN = 0.224 },
        { xN = 0.605, yN = 0.228 },
      }
    }),

    -- Eastmarch --
    [88] = { xN = 0.559, yN = 0.287 }, -- Fort Morvunskar Wayshrine
    [90] = { xN = 0.565, yN = 0.274 }, -- Voljar Meadery Wayshrine
    [89] = { xN = 0.575, yN = 0.283 }, -- Kynesgrove Wayshrine
    [93] = { xN = 0.569, yN = 0.308 }, -- Wittestadr Wayshrine
    [97] = { xN = 0.608, yN = 0.306 }, -- Skuldafn Wayshrine
    [96] = { xN = 0.592, yN = 0.308 }, -- Logging Camp Wayshrine
    [95] = { xN = 0.601, yN = 0.314 }, -- Jorunn's Stand Wayshrine
    [91] = { xN = 0.541, yN = 0.289 }, -- Cradlecrush Wayshrine
    [392] = { xN = 0.547, yN = 0.286 }, -- Frostvault Chasm House
    [389] = { xN = 0.548, yN = 0.284 }, -- Frostvault Dungeon
    [312] = { xN = 0.582, yN = 0.264 }, -- Grymhearth's Woe House
    [87] = { xN = 0.578, yN = 0.264 }, -- Windhelm Wayshrine
    [94] = { xN = 0.576, yN = 0.324 }, -- Mistwatch Wayshrine
    [195] = { xN = 0.610, yN = 0.328 }, -- Direfrost Keep Dungeon
    [92] = { xN = 0.539, yN = 0.310 }, -- Fort Amol Wayshrine

    zoneData = hackyJoin({
      zoneName = "Eastmarch",
      zoneID = 61,
      zoneDescription = "One of the 'Old Holds', Eastmarch was among the first regions of Skyrim settled by the\n Nords when they arrived from Atmora.",
      xN = "0.5275",
      yN = "0.249",
      zonePolygonData = {
        { xN = 0.617, yN = 0.331 },
        { xN = 0.618, yN = 0.324 },
        { xN = 0.612, yN = 0.314 },
        { xN = 0.614, yN = 0.309 },
        { xN = 0.610, yN = 0.304 },
        { xN = 0.606, yN = 0.303 },
        { xN = 0.603, yN = 0.296 },
        { xN = 0.600, yN = 0.291 },
        { xN = 0.599, yN = 0.279 },
        { xN = 0.599, yN = 0.274 },
        { xN = 0.601, yN = 0.273 },
        { xN = 0.605, yN = 0.258 },
        { xN = 0.602, yN = 0.255 },
        { xN = 0.598, yN = 0.256 },
        { xN = 0.593, yN = 0.257 },
        { xN = 0.586, yN = 0.256 },
        { xN = 0.577, yN = 0.255 },
        { xN = 0.568, yN = 0.256 },
        { xN = 0.561, yN = 0.257 },
        { xN = 0.554, yN = 0.262 },
        { xN = 0.549, yN = 0.268 },
        { xN = 0.546, yN = 0.271 },
        { xN = 0.548, yN = 0.276 },
        { xN = 0.547, yN = 0.280 },
        { xN = 0.545, yN = 0.282 },
        { xN = 0.541, yN = 0.285 },
        { xN = 0.533, yN = 0.287 },
        { xN = 0.529, yN = 0.295 },
        { xN = 0.526, yN = 0.306 },
        { xN = 0.526, yN = 0.316 },
        { xN = 0.529, yN = 0.324 },
        { xN = 0.539, yN = 0.326 },
        { xN = 0.547, yN = 0.329 },
        { xN = 0.555, yN = 0.331 },
        { xN = 0.560, yN = 0.332 },
        { xN = 0.567, yN = 0.334 },
        { xN = 0.572, yN = 0.333 },
        { xN = 0.581, yN = 0.331 },
        { xN = 0.589, yN = 0.329 },
        { xN = 0.605, yN = 0.334 },
        { xN = 0.611, yN = 0.332 },        
      }
    }),
    
    -- The Rift --
    [119] = { xN = 0.556, yN = 0.361 }, -- Ragged Hills Wayshrine
    [115] = { xN = 0.580, yN = 0.343 }, -- Northwind Mine Wayshrine 
    [301] = { xN = 0.552, yN = 0.346 }, -- Autumn's Gate House 
    [114] = { xN = 0.598, yN = 0.341 }, -- Fallowstone Hall Wayshrine 
    [372] = { xN = 0.611, yN = 0.356 }, -- Hunter's Glade House 
    [118] = { xN = 0.549, yN = 0.354 }, -- Nimalten Wayshrine
    [116] = { xN = 0.541, yN = 0.337 }, -- Geirmund's Hall Wayshrine 
    [117] = { xN = 0.538, yN = 0.353 }, -- Taarengrav Wayshrine
    [113] = { xN = 0.571, yN = 0.367 }, -- Honrich Tower Wayshrine
    [110] = { xN = 0.599, yN = 0.371 }, -- Skald's Retreat Wayshrine
    [322] = { xN = 0.610, yN = 0.372 }, -- Old Mistveil Manor House 
    [109] = { xN = 0.607, yN = 0.363 }, -- Riften Wayshrine
    [112] = { xN = 0.608, yN = 0.396 }, -- Trollhetta Summit Wayshrine 
    [111] = { xN = 0.616, yN = 0.385 }, -- Trollhetta Wayshrine
    [120] = { xN = 0.620, yN = 0.373 }, -- Fullhelm Fort Wayshrine
    [187] = { xN = 0.627, yN = 0.379 }, -- Blessed Crucible Dungeon

    zoneData = hackyJoin({
      zoneName = "The Rift",
      zoneDescription = "The southeastern hold of Skyrim, The Rift is a temperate region northwest of\n the intersection between the Velothi Mountains and the Jerall Mountains.",
      zoneID = 125,
      xN = "0.5275",
      yN = "0.3145",
      zonePolygonData = {
        { xN = 0.626, yN = 0.397 },
        { xN = 0.625, yN = 0.391 },
        { xN = 0.630, yN = 0.384 },
        { xN = 0.633, yN = 0.379 },
        { xN = 0.631, yN = 0.361 },
        { xN = 0.627, yN = 0.358 },
        { xN = 0.621, yN = 0.340 },
        { xN = 0.617, yN = 0.331 },
        { xN = 0.607, yN = 0.334 },
        { xN = 0.600, yN = 0.334 },
        { xN = 0.588, yN = 0.331 },
        { xN = 0.568, yN = 0.335 },
        { xN = 0.566, yN = 0.335 },
        { xN = 0.557, yN = 0.332 },
        { xN = 0.549, yN = 0.332 },
        { xN = 0.541, yN = 0.328 },
        { xN = 0.531, yN = 0.326 },
        { xN = 0.527, yN = 0.335 },
        { xN = 0.527, yN = 0.340 },
        { xN = 0.528, yN = 0.348 },
        { xN = 0.527, yN = 0.353 },
        { xN = 0.527, yN = 0.356 },
        { xN = 0.529, yN = 0.364 },
        { xN = 0.534, yN = 0.378 },
        { xN = 0.536, yN = 0.386 },
        { xN = 0.533, yN = 0.394 },
        { xN = 0.542, yN = 0.397 },
        { xN = 0.552, yN = 0.400 },
        { xN = 0.555, yN = 0.399 },
        { xN = 0.564, yN = 0.403 },
        { xN = 0.571, yN = 0.404 },
        { xN = 0.580, yN = 0.400 },
        { xN = 0.594, yN = 0.404 },
        { xN = 0.602, yN = 0.408 },
        { xN = 0.609, yN = 0.403 },
        { xN = 0.619, yN = 0.400 },
        { xN = 0.623, yN = 0.397 },        
      }
    }),

    -- Western Skyrim --
    [424] = { xN = 0.404, yN = 0.157 }, -- Icereach Dungeon
    [434] = { xN = 0.408, yN = 0.186 }, -- Kyne's Aegis Trial

    zoneData = hackyJoin({
      zoneName = "Western Skyrim",
      zoneDescription = "Western Skyrim is a cold and unforgiving land, which consists of\n the holds of Haafingar, Karthald, and Hjaalmarch.",
      zoneID = 1719,
      xN = "0.352",
      yN = "0.166",
      zonePolygonData = {
        { xN = 0.464, yN = 0.279 },
        { xN = 0.469, yN = 0.273 },
        { xN = 0.468, yN = 0.270 },
        { xN = 0.477, yN = 0.253 },
        { xN = 0.473, yN = 0.234 },
        { xN = 0.478, yN = 0.221 },
        { xN = 0.476, yN = 0.213 },
        { xN = 0.478, yN = 0.210 },
        { xN = 0.471, yN = 0.207 },
        { xN = 0.469, yN = 0.197 },
        { xN = 0.464, yN = 0.198 },
        { xN = 0.444, yN = 0.205 },
        { xN = 0.437, yN = 0.203 },
        { xN = 0.436, yN = 0.190 },
        { xN = 0.435, yN = 0.185 },
        { xN = 0.420, yN = 0.182 },
        { xN = 0.411, yN = 0.179 },
        { xN = 0.405, yN = 0.180 },
        { xN = 0.387, yN = 0.183 },
        { xN = 0.384, yN = 0.178 },
        { xN = 0.349, yN = 0.192 },
        { xN = 0.354, yN = 0.221 },
        { xN = 0.358, yN = 0.234 },
        { xN = 0.352, yN = 0.244 },
        { xN = 0.358, yN = 0.247 },
        { xN = 0.361, yN = 0.251 },
        { xN = 0.367, yN = 0.250 },
        { xN = 0.369, yN = 0.256 },
        { xN = 0.373, yN = 0.257 },
        { xN = 0.377, yN = 0.261 },
        { xN = 0.382, yN = 0.259 },
        { xN = 0.387, yN = 0.266 },
        { xN = 0.384, yN = 0.272 },
        { xN = 0.387, yN = 0.282 },
        { xN = 0.397, yN = 0.284 },
        { xN = 0.406, yN = 0.281 },
        { xN = 0.418, yN = 0.277 },
        { xN = 0.429, yN = 0.270 },
        { xN = 0.448, yN = 0.270 },
        { xN = 0.448, yN = 0.274 },
        { xN = 0.460, yN = 0.279 },
      }
    }),

    -- Grayhome --
    zoneData = hackyJoin({
      zoneName = "Grayhome",
      zoneDescription = "The frozen island of Grayhome is home to an ornate castle, formerly occupied by the Gray Host.",
      zoneID = 1864,
      xN = "0.242",
      yN = "0.125",
      zonePolygonData = {
        { xN = 0.247, yN = 0.144 },
        { xN = 0.254, yN = 0.144 },
        { xN = 0.261, yN = 0.136 },
        { xN = 0.258, yN = 0.126 },
        { xN = 0.248, yN = 0.122 },
        { xN = 0.241, yN = 0.126 },
        { xN = 0.239, yN = 0.134 },
        { xN = 0.243, yN = 0.140 },
      }
    }),

    -- Icereach --
    zoneData = hackyJoin({
      zoneName = "Icereach",
      zoneDescription = "These frigid isles serves as the seat of power for the cruel Icereach Coven.",
      zoneID = 1737,
      xN = "0.390",
      yN = "0.146",
      zonePolygonData = {
        { xN = 0.389, yN = 0.164 },
        { xN = 0.398, yN = 0.166 },
        { xN = 0.410, yN = 0.165 },
        { xN = 0.417, yN = 0.162 },
        { xN = 0.420, yN = 0.155},
        { xN = 0.414, yN = 0.150 },
        { xN = 0.397, yN = 0.151 },
        { xN = 0.386, yN = 0.152 },
        { xN = 0.386, yN = 0.159 },
      }
    }),

    -- The Reach --
    [445] = { xN = 0.377, yN = 0.270 }, -- Karthwasten Wayshrine
    [221] = { xN = 0.336, yN = 0.278, disabled = false }, -- The Earth Forge Wayshrine

    zoneData = hackyJoin({
      zoneName = "The Reach",
      zoneDescription = "The rocky highlands of the Reach contains savage predators, perilous Dwarven ruins, and\n hostile Reach clans.",
      zoneID = 1814,
      xN = "0.329",
      yN = "0.2435",
      zonePolygonData = {
        { xN = 0.352, yN = 0.245 },
        { xN = 0.359, yN = 0.251 },
        { xN = 0.366, yN = 0.253 },
        { xN = 0.368, yN = 0.258 },
        { xN = 0.373, yN = 0.259 },
        { xN = 0.378, yN = 0.262 },
        { xN = 0.383, yN = 0.262 },
        { xN = 0.386, yN = 0.266 },
        { xN = 0.383, yN = 0.270 },
        { xN = 0.382, yN = 0.277 },
        { xN = 0.386, yN = 0.282 },
        { xN = 0.390, yN = 0.286 },
        { xN = 0.396, yN = 0.292 },
        { xN = 0.405, yN = 0.294 },
        { xN = 0.410, yN = 0.296 },
        { xN = 0.409, yN = 0.304 },
        { xN = 0.413, yN = 0.311 },
        { xN = 0.408, yN = 0.320 },
        { xN = 0.390, yN = 0.325 },
        { xN = 0.378, yN = 0.322 },
        { xN = 0.373, yN = 0.320 },
        { xN = 0.359, yN = 0.322 },
        { xN = 0.349, yN = 0.322 },
        { xN = 0.337, yN = 0.317 },
        { xN = 0.336, yN = 0.314 },
        { xN = 0.335, yN = 0.303 },
        { xN = 0.330, yN = 0.300 },
        { xN = 0.333, yN = 0.295 },
        { xN = 0.330, yN = 0.292 },
        { xN = 0.333, yN = 0.286 },
        { xN = 0.329, yN = 0.278 },
        { xN = 0.334, yN = 0.272 },
        { xN = 0.337, yN = 0.259 },
        { xN = 0.348, yN = 0.254 },
        { xN = 0.350, yN = 0.249 },
        { xN = 0.351, yN = 0.245 },
      }
    }),

    -- Falkreath Hold --
    [332] = { xN = 0.451, yN = 0.356 }, -- Falkreath Hold Dungeon 


    -- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    -- ██░▄▄▀██░███░██░▄▄▀██░▄▄▄░██░▄▄▀█▄░▄█▄░▄██░█████
    -- ██░█████▄▀▀▀▄██░▀▀▄██░███░██░██░██░███░███░█████
    -- ██░▀▀▄████░████░██░██░▀▀▀░██░▀▀░█▀░▀█▀░▀██░▀▀░██
    -- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    -- [x] = { xN = x, yN = y }, -- 
    -- ctrl + f aid: cyrodiil
    
    -- Cyrodiil --
    [201] = { xN = 0.509, yN = 0.593, name = "Western Elsweyr Gate Wayshrine" }, -- Western Elsweyr Wayshrine
    [200] = { xN = 0.556, yN = 0.594, name = "Eastern Elsweyr Gate Wayshrine" }, -- Eastern Elsweyr Wayshrine
    [202] = { xN = 0.622, yN = 0.410, name = "Northern Morrowind Gate Wayshrine" }, -- Northern Morrowind Wayshrine
    [203] = { xN = 0.643, yN = 0.455, name = "Southern Morrowind Gate Wayshrine" }, -- Southern Morrowind Wayshrine
    [170] = { xN = 0.449, yN = 0.411, name = "Northern Hammerfell Gate Wayshrine" }, -- Northern Hammerfell Wayshrine
    [199] = { xN = 0.429, yN = 0.449, name = "Southern Hammerfell Gate Wayshrine" }, -- Southern Hammerfell Wayshrine
    [236] = { xN = 0.542, yN = 0.475 }, -- Imperial City Prison Dungeon
    [247] = { xN = 0.536, yN = 0.486 }, -- White Gold Tower Dungeon

    zoneData = hackyJoin({
      zoneName = "Cyrodiil",
      zoneDescription = "With the Empire's collapse, armies of the Dominion, Covenant, and Pact have all invaded\nthe Heartlands of Cyrodiil, vying for the Imperial throne.",
      zoneID = 16,
      xN = "0.420",
      yN = "0.384",
      zonePolygonData = {
        { xN = 0.445, yN = 0.397 },
        { xN = 0.464, yN = 0.400 },
        { xN = 0.479, yN = 0.404 },
        { xN = 0.488, yN = 0.395 },
        { xN = 0.496, yN = 0.394 },
        { xN = 0.506, yN = 0.396 },
        { xN = 0.509, yN = 0.400 },
        { xN = 0.518, yN = 0.399 },
        { xN = 0.523, yN = 0.395 },
        { xN = 0.531, yN = 0.394 },
        { xN = 0.541, yN = 0.398 },
        { xN = 0.548, yN = 0.401 },
        { xN = 0.557, yN = 0.402 },
        { xN = 0.566, yN = 0.404 },
        { xN = 0.570, yN = 0.406 },
        { xN = 0.579, yN = 0.403 },
        { xN = 0.589, yN = 0.405 },
        { xN = 0.595, yN = 0.405 },
        { xN = 0.604, yN = 0.409 },
        { xN = 0.616, yN = 0.403 },
        { xN = 0.625, yN = 0.399 },
        { xN = 0.627, yN = 0.399 },
        { xN = 0.630, yN = 0.405 },
        { xN = 0.633, yN = 0.406 },
        { xN = 0.640, yN = 0.422 },
        { xN = 0.637, yN = 0.431 },
        { xN = 0.642, yN = 0.436 },
        { xN = 0.646, yN = 0.443 },
        { xN = 0.651, yN = 0.447 },
        { xN = 0.652, yN = 0.459 },
        { xN = 0.644, yN = 0.471 },
        { xN = 0.636, yN = 0.478 },
        { xN = 0.632, yN = 0.482 },
        { xN = 0.627, yN = 0.498 },
        { xN = 0.619, yN = 0.504 },
        { xN = 0.616, yN = 0.515 },
        { xN = 0.614, yN = 0.523 },
        { xN = 0.597, yN = 0.552 },
        { xN = 0.582, yN = 0.560 },
        { xN = 0.579, yN = 0.575 },
        { xN = 0.574, yN = 0.579 },
        { xN = 0.566, yN = 0.579 },
        { xN = 0.564, yN = 0.588 },
        { xN = 0.562, yN = 0.603 },
        { xN = 0.552, yN = 0.602 },
        { xN = 0.542, yN = 0.606 },
        { xN = 0.537, yN = 0.604 },
        { xN = 0.516, yN = 0.601 },
        { xN = 0.507, yN = 0.603 },
        { xN = 0.504, yN = 0.602 },
        { xN = 0.497, yN = 0.588 },
        { xN = 0.491, yN = 0.586 },
        { xN = 0.488, yN = 0.578 },
        { xN = 0.491, yN = 0.574 },
        { xN = 0.492, yN = 0.569 },
        { xN = 0.488, yN = 0.563 },
        { xN = 0.480, yN = 0.558 },
        { xN = 0.473, yN = 0.548 },
        { xN = 0.464, yN = 0.536 },
        { xN = 0.460, yN = 0.527 },
        { xN = 0.461, yN = 0.522 },
        { xN = 0.456, yN = 0.503 },
        { xN = 0.451, yN = 0.501 },
        { xN = 0.445, yN = 0.484 },
        { xN = 0.436, yN = 0.481 },
        { xN = 0.418, yN = 0.449 },
        { xN = 0.420, yN = 0.436 },
        { xN = 0.432, yN = 0.418 },
        { xN = 0.438, yN = 0.413 },
        { xN = 0.441, yN = 0.408 },
        { xN = 0.443, yN = 0.400 },        
      }
    }),

    -- Gold Coast --
    [390] = { xN = 0.304, yN = 0.559 }, -- Depths of Malatar Dungeon 

    zoneData = hackyJoin({
      zoneName = "Gold Coast",
      zoneDescription = "The Gold Coast always served as Cyrodiil's gateway to the Abecean Sea, but with\n the Alliance War, the region has gone its own way.",
      zoneID = 1006,
      xN = "0.299",
      yN = "0.515",
      zonePolygonData = {
        { xN = 0.384, yN = 0.574 },
        { xN = 0.380, yN = 0.562 },
        { xN = 0.383, yN = 0.557 },
        { xN = 0.378, yN = 0.540 },
        { xN = 0.380, yN = 0.536 },
        { xN = 0.377, yN = 0.532 },
        { xN = 0.360, yN = 0.531 },
        { xN = 0.357, yN = 0.537 },
        { xN = 0.344, yN = 0.542 },
        { xN = 0.335, yN = 0.544 },
        { xN = 0.331, yN = 0.541 },
        { xN = 0.329, yN = 0.536 },
        { xN = 0.321, yN = 0.533 },
        { xN = 0.321, yN = 0.525 },
        { xN = 0.318, yN = 0.525 },
        { xN = 0.309, yN = 0.531 },
        { xN = 0.303, yN = 0.539 },
        { xN = 0.302, yN = 0.553 },
        { xN = 0.299, yN = 0.559 },
        { xN = 0.301, yN = 0.564 },
        { xN = 0.307, yN = 0.564 },
        { xN = 0.308, yN = 0.570 },
        { xN = 0.308, yN = 0.575 },
        { xN = 0.312, yN = 0.581 },
        { xN = 0.317, yN = 0.580 },
        { xN = 0.323, yN = 0.582 },
        { xN = 0.326, yN = 0.580 },
        { xN = 0.330, yN = 0.585 },
        { xN = 0.331, yN = 0.592 },
        { xN = 0.333, yN = 0.595 },
        { xN = 0.362, yN = 0.591 },
        { xN = 0.383, yN = 0.576 },      
      }
    }),

    -- Stirk --
    zoneData = hackyJoin({
      zoneName = "Stirk",
      zoneDescription = "The island of Stirk is a no-man's-land - if it belongs to anyone, it's the Pirates of the Abecean Sea.",
      zoneID = 415,
      xN = "0.269",
      yN = "0.5715",
      zonePolygonData = {
        { xN = 0.272, yN = 0.587 },
        { xN = 0.274, yN = 0.590 },
        { xN = 0.284, yN = 0.590 },
        { xN = 0.287, yN = 0.588 },
        { xN = 0.288, yN = 0.577 },
        { xN = 0.282, yN = 0.570 },
        { xN = 0.277, yN = 0.570 },
        { xN = 0.269, yN = 0.573 },
        { xN = 0.267, yN = 0.579 },
        { xN = 0.270, yN = 0.583 },
        { xN = 0.272, yN = 0.587 },
      }
    }),


    -- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    -- ██░██░█▄░▄██░▄▄░██░██░████░▄▄▀██░▄▄▄░██░▄▄▀██░█▀▄██
    -- ██░▄▄░██░███░█▀▀██░▄▄░████░▀▀▄██░███░██░█████░▄▀███
    -- ██░██░█▀░▀██░▀▀▄██░██░████░██░██░▀▀▀░██░▀▀▄██░██░██
    -- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    -- [x] = { xN = x, yN = y }, -- 
    -- ctrl + f aid: high rock

    -- Glenumbra --
    zoneData = hackyJoin({
      zoneName = "Glenumbra",
      zoneDescription = "Glenumbra is the westernmost peninsula of High Rock, separating the Iliac Bay from the Eltheric Ocean.",
      zoneID = 1,
      xN = "0.030",
      yN = "0.2775",
      zonePolygonData = {
        { xN = 0.155, yN = 0.312 },
        { xN = 0.156, yN = 0.308 },
        { xN = 0.157, yN = 0.302 },
        { xN = 0.154, yN = 0.299 },
        { xN = 0.153, yN = 0.289 },
        { xN = 0.156, yN = 0.281 },
        { xN = 0.145, yN = 0.278 },
        { xN = 0.137, yN = 0.278 },
        { xN = 0.131, yN = 0.282 },
        { xN = 0.124, yN = 0.284 },
        { xN = 0.116, yN = 0.284 },
        { xN = 0.110, yN = 0.277 },
        { xN = 0.105, yN = 0.284 },
        { xN = 0.100, yN = 0.289 },
        { xN = 0.095, yN = 0.303 },
        { xN = 0.084, yN = 0.308 },
        { xN = 0.070, yN = 0.316 },
        { xN = 0.055, yN = 0.326 },
        { xN = 0.045, yN = 0.332 },
        { xN = 0.045, yN = 0.341 },
        { xN = 0.048, yN = 0.351 },
        { xN = 0.048, yN = 0.360 },
        { xN = 0.050, yN = 0.369 },
        { xN = 0.049, yN = 0.373 },
        { xN = 0.046, yN = 0.380 },
        { xN = 0.039, yN = 0.385 },
        { xN = 0.039, yN = 0.399 },
        { xN = 0.039, yN = 0.405 },
        { xN = 0.047, yN = 0.409 },
        { xN = 0.052, yN = 0.415 },
        { xN = 0.057, yN = 0.420 },
        { xN = 0.078, yN = 0.416 },
        { xN = 0.082, yN = 0.414 },
        { xN = 0.087, yN = 0.398 },
        { xN = 0.095, yN = 0.390 },
        { xN = 0.104, yN = 0.383 },
        { xN = 0.108, yN = 0.366 },
        { xN = 0.111, yN = 0.359 },
        { xN = 0.125, yN = 0.351 },
        { xN = 0.129, yN = 0.337 },
        { xN = 0.139, yN = 0.331 },
        { xN = 0.148, yN = 0.317 },
        { xN = 0.155, yN = 0.314 },            
      }
    }),

    -- Isle of Balfiera --
    zoneData = hackyJoin({
      zoneName = "Isle of Balfiera",
      zoneDescription = "This little isle is home to the Direnni, however, it is most renowned as\n the site of the Adamantine Tower - the oldest known structure in Tamriel.",
      zoneID = 1997,
      xN = "0.141",
      yN = "0.3365",
      zonePolygonData = {
        { xN = 0.137, yN = 0.341 },
        { xN = 0.142, yN = 0.345 },
        { xN = 0.143, yN = 0.350 },
        { xN = 0.158, yN = 0.354 },
        { xN = 0.159, yN = 0.343 },
        { xN = 0.152, yN = 0.340 },
        { xN = 0.149, yN = 0.342 },
        { xN = 0.139, yN = 0.336 },
      }
    }),

    -- Stormhaven --
    zoneData = hackyJoin({
      zoneName = "Stormhaven",
      zoneDescription = "Stormhaven is the geographic center of High Rock, and also the home of the\n great trading city of Wayrest, capital of the Daggerfall Covenant.",
      zoneID = 12,
      xN = "0.154",
      yN = "0.248",
      zonePolygonData = {
        { xN = 0.157, yN = 0.312 },
        { xN = 0.162, yN = 0.312 },
        { xN = 0.166, yN = 0.318 },
        { xN = 0.161, yN = 0.326 },
        { xN = 0.166, yN = 0.344 },
        { xN = 0.174, yN = 0.340 },
        { xN = 0.178, yN = 0.337 },
        { xN = 0.180, yN = 0.344 },
        { xN = 0.192, yN = 0.348 },
        { xN = 0.208, yN = 0.346 },
        { xN = 0.230, yN = 0.346 },
        { xN = 0.236, yN = 0.340 },
        { xN = 0.255, yN = 0.331 },
        { xN = 0.267, yN = 0.323 },
        { xN = 0.270, yN = 0.315 },
        { xN = 0.273, yN = 0.313 },
        { xN = 0.274, yN = 0.307 },
        { xN = 0.276, yN = 0.305 },
        { xN = 0.265, yN = 0.298 },
        { xN = 0.262, yN = 0.298 },
        { xN = 0.255, yN = 0.300 },
        { xN = 0.245, yN = 0.299 },
        { xN = 0.238, yN = 0.298 },
        { xN = 0.228, yN = 0.295 },
        { xN = 0.215, yN = 0.298 },
        { xN = 0.205, yN = 0.299 },
        { xN = 0.199, yN = 0.293 },
        { xN = 0.197, yN = 0.289 },
        { xN = 0.190, yN = 0.286 },
        { xN = 0.185, yN = 0.279 },
        { xN = 0.181, yN = 0.275 },
        { xN = 0.174, yN = 0.271 },
        { xN = 0.168, yN = 0.272 },
        { xN = 0.162, yN = 0.277 },
        { xN = 0.157, yN = 0.281 },
        { xN = 0.155, yN = 0.286 },
        { xN = 0.155, yN = 0.293 },
        { xN = 0.155, yN = 0.297 },
        { xN = 0.157, yN = 0.300 },
        { xN = 0.156, yN = 0.308 },             
      }
    }),

    -- Rivenspire --
    [428] = { xN = 0.214, yN = 0.250 }, -- Forgemaster Falls House

    zoneData = hackyJoin({
      zoneName = "Rivenspire",
      zoneDescription = "This northwestern region of High Rock contains some of the province's most dramatic terrain,\n including towering, flinty crags, windswept moors, and narrow canyons.",
      zoneID = 10,
      xN = "0.109",
      yN = "0.181",
      zonePolygonData = {
        { xN = 0.219, yN = 0.195 },
        { xN = 0.226, yN = 0.204 },
        { xN = 0.224, yN = 0.221 },
        { xN = 0.222, yN = 0.238 },
        { xN = 0.218, yN = 0.250 },
        { xN = 0.216, yN = 0.251 },
        { xN = 0.212, yN = 0.259 },
        { xN = 0.209, yN = 0.262 },
        { xN = 0.208, yN = 0.270 },
        { xN = 0.199, yN = 0.268 },
        { xN = 0.190, yN = 0.272 },
        { xN = 0.185, yN = 0.277 },
        { xN = 0.176, yN = 0.271 },
        { xN = 0.169, yN = 0.270 },
        { xN = 0.165, yN = 0.273 },
        { xN = 0.156, yN = 0.280 },
        { xN = 0.145, yN = 0.277 },
        { xN = 0.138, yN = 0.277 },
        { xN = 0.129, yN = 0.282 },
        { xN = 0.118, yN = 0.284 },
        { xN = 0.114, yN = 0.281 },
        { xN = 0.109, yN = 0.276 },
        { xN = 0.114, yN = 0.257 },
        { xN = 0.121, yN = 0.253 },
        { xN = 0.125, yN = 0.243 },
        { xN = 0.134, yN = 0.235 },
        { xN = 0.138, yN = 0.220 },
        { xN = 0.159, yN = 0.211 },
        { xN = 0.170, yN = 0.211 },
        { xN = 0.175, yN = 0.208 },
        { xN = 0.189, yN = 0.193 },
        { xN = 0.204, yN = 0.192 },
        { xN = 0.220, yN = 0.195 },      
      }
    }),

    -- Wrothgar --
    [250] = { xN = 0.310, yN = 0.221 }, -- Maelstrom Arena Trial
    
    zoneData = hackyJoin({
      zoneName = "Wrothgar",
      zoneDescription = "The Wrothgar Mountains have been home to northern Tamriel's Orcs since the beginning of recorded history.",
      zoneID = 667,
      xN = "0.186",
      yN = "0.1755",
      zonePolygonData = {
        { xN = 0.304, yN = 0.268 },
        { xN = 0.310, yN = 0.252 },
        { xN = 0.317, yN = 0.246 },
        { xN = 0.315, yN = 0.236 },
        { xN = 0.317, yN = 0.231 },
        { xN = 0.314, yN = 0.229 },
        { xN = 0.321, yN = 0.222 },
        { xN = 0.319, yN = 0.216 },
        { xN = 0.306, yN = 0.203 },
        { xN = 0.300, yN = 0.198 },
        { xN = 0.296, yN = 0.197 },
        { xN = 0.292, yN = 0.188 },
        { xN = 0.284, yN = 0.185 },
        { xN = 0.279, yN = 0.185 },
        { xN = 0.278, yN = 0.190 },
        { xN = 0.275, yN = 0.193 },
        { xN = 0.266, yN = 0.199 },
        { xN = 0.261, yN = 0.204 },
        { xN = 0.258, yN = 0.212 },
        { xN = 0.258, yN = 0.217 },
        { xN = 0.261, yN = 0.223 },
        { xN = 0.256, yN = 0.226 },
        { xN = 0.249, yN = 0.231 },
        { xN = 0.242, yN = 0.237 },
        { xN = 0.235, yN = 0.247 },
        { xN = 0.231, yN = 0.253 },
        { xN = 0.216, yN = 0.252 },
        { xN = 0.212, yN = 0.260 },
        { xN = 0.210, yN = 0.269 },
        { xN = 0.202, yN = 0.272 },
        { xN = 0.198, yN = 0.269 },
        { xN = 0.189, yN = 0.274 },
        { xN = 0.189, yN = 0.276 },
        { xN = 0.185, yN = 0.277 },
        { xN = 0.186, yN = 0.283 },
        { xN = 0.191, yN = 0.286 },
        { xN = 0.198, yN = 0.289 },
        { xN = 0.200, yN = 0.292 },
        { xN = 0.205, yN = 0.299 },
        { xN = 0.228, yN = 0.295 },
        { xN = 0.247, yN = 0.299 },
        { xN = 0.262, yN = 0.298 },
        { xN = 0.262, yN = 0.294 },
        { xN = 0.261, yN = 0.285 },
        { xN = 0.272, yN = 0.281 },
        { xN = 0.277, yN = 0.283 },
        { xN = 0.288, yN = 0.274 },
        { xN = 0.294, yN = 0.271 },
        { xN = 0.303, yN = 0.268 },              
      }
    }),

    -- Betnikh --
    [182] = { xN = 0.074, yN = 0.435 }, -- Grimfield Wayshrine 
    [181] = { xN = 0.082, yN = 0.436 }, -- Stonetooth Wayshrine
    [183] = { xN = 0.082, yN = 0.444 }, -- Carved Hills Wayshrine

    zoneData = hackyJoin({
      zoneName = "Betnikh",
      zoneDescription = "Originally called Betony, this isle was conquered by the Seamount Orcs, who then renamed it to Betnikh.",
      zoneID = 227,
      xN = "0.072",
      yN = "0.425",
      zonePolygonData = {
        { xN = 0.070, yN = 0.446 },
        { xN = 0.079, yN = 0.449 },
        { xN = 0.087, yN = 0.450 },
        { xN = 0.094, yN = 0.443 },
        { xN = 0.094, yN = 0.424 },
        { xN = 0.088, yN = 0.421 },
        { xN = 0.077, yN = 0.426 },
        { xN = 0.071, yN = 0.431 },
        { xN = 0.069, yN = 0.440 },
        { xN = 0.070, yN = 0.444 },        
      }
    }),


    -- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    -- ██░██░█░▄▄▀██░▄▀▄░██░▄▀▄░██░▄▄▄██░▄▄▀██░▄▄▄██░▄▄▄██░█████░█████
    -- ██░▄▄░█░▀▀░██░█░█░██░█░█░██░▄▄▄██░▀▀▄██░▄▄███░▄▄▄██░█████░█████
    -- ██░██░█░██░██░███░██░███░██░▀▀▀██░██░██░█████░▀▀▀██░▀▀░██░▀▀░██
    -- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    -- [x] = { xN = x, yN = y }, -- 
    -- ctrl + f aid: hammerfell

    -- Craglorn --
    [217] = { xN = 0.379, yN = 0.374 }, -- Seeker's Archive Wayshrine
    [341] = { xN = 0.405, yN = 0.348 }, -- Fang Lair Dungeon
    [225] = { xN = 0.392, yN = 0.377 }, -- Spellscar Wayshrine 
    [220] = { xN = 0.387, yN = 0.387 }, -- Belkarth Wayshrine 
    [326] = { xN = 0.404, yN = 0.395 }, -- Bloodroot Forge Dungeon 
    [226] = { xN = 0.401, yN = 0.359 }, -- Mountain Overlook Wayshrine 
    [227] = { xN = 0.421, yN = 0.367 }, -- Inazzur's Hold Wayshrine
    [229] = { xN = 0.420, yN = 0.382 }, -- Elinhir Wayshrine 
    [231] = { xN = 0.428, yN = 0.377 }, -- Aetherian Archive Trial 
    [233] = { xN = 0.334, yN = 0.338 }, -- Dragonstar Wayshrine 
    [270] = { xN = 0.335, yN = 0.324 }, -- Dragonstar Arena Dungeon
    [219] = { xN = 0.354, yN = 0.373 }, -- Sandy Path Wayshrine
    [235] = { xN = 0.388, yN = 0.350 }, -- Valley of Scars Wayshrine 
    [218] = { xN = 0.344, yN = 0.353 }, -- Shada's Tear Wayshrine 
    [234] = { xN = 0.362, yN = 0.349 }, -- Skyreach Wayshrine 
    [230] = { xN = 0.344, yN = 0.380 }, -- Hel Ra Citadel Trial
    [232] = { xN = 0.366, yN = 0.330 }, -- Sanctum Ophidia Trial
    [327] = { xN = 0.328, yN = 0.351 }, -- Earthtear Caverns
    [395] = { xN = 0.410, yN = 0.394 }, -- Elinhir Private Arena House
    [310] = { xN = 0.432, yN = 0.381 }, -- Domus Phrasticus House

    zoneData = hackyJoin({
      zoneName = "Craglorn",
      zoneDescription = "Though crossed by caravans and Covenant troops going to and from Cyrodiil, this\n wild region of eastern Hammerfell is a virtual no-man's-land.",
      zoneID = 1126,
      xN = "0.3225",
      yN = "0.300",
      zonePolygonData = {
        { xN = 0.441, yN = 0.407 },
        { xN = 0.444, yN = 0.398 },
        { xN = 0.445, yN = 0.397 },
        { xN = 0.440, yN = 0.381 },
        { xN = 0.439, yN = 0.374 },
        { xN = 0.434, yN = 0.370 },
        { xN = 0.434, yN = 0.364 },
        { xN = 0.415, yN = 0.343 },
        { xN = 0.405, yN = 0.335 },
        { xN = 0.390, yN = 0.326 },
        { xN = 0.378, yN = 0.323 },
        { xN = 0.374, yN = 0.321 },
        { xN = 0.364, yN = 0.323 },
        { xN = 0.357, yN = 0.322 },
        { xN = 0.348, yN = 0.322 },
        { xN = 0.338, yN = 0.319 },
        { xN = 0.335, yN = 0.315 },
        { xN = 0.332, yN = 0.317 },
        { xN = 0.330, yN = 0.322 },
        { xN = 0.327, yN = 0.324 },
        { xN = 0.326, yN = 0.329 },
        { xN = 0.323, yN = 0.331 },
        { xN = 0.322, yN = 0.344 },
        { xN = 0.326, yN = 0.346 },
        { xN = 0.331, yN = 0.352 },
        { xN = 0.330, yN = 0.355 },
        { xN = 0.328, yN = 0.356 },
        { xN = 0.328, yN = 0.370 },
        { xN = 0.332, yN = 0.372 },
        { xN = 0.333, yN = 0.375 },
        { xN = 0.337, yN = 0.375 },
        { xN = 0.343, yN = 0.385 },
        { xN = 0.348, yN = 0.387 },
        { xN = 0.352, yN = 0.392 },
        { xN = 0.352, yN = 0.399 },
        { xN = 0.354, yN = 0.403 },
        { xN = 0.357, yN = 0.404 },
        { xN = 0.363, yN = 0.403 },
        { xN = 0.369, yN = 0.407 },
        { xN = 0.383, yN = 0.409 },
        { xN = 0.398, yN = 0.406 },
        { xN = 0.402, yN = 0.404 },
        { xN = 0.415, yN = 0.403 },
        { xN = 0.424, yN = 0.408 },
        { xN = 0.435, yN = 0.408 },
        { xN = 0.439, yN = 0.408 },              
      }
    }),

     -- Bangkorai --
    zoneData = hackyJoin({
      zoneName = "Bangkorai",
      zoneDescription = "This region takes its name from its most famous feature, the Bangkorai Pass, which has served as\n High Rock's defense against the wild raiders of Hammerfell for countless generations.",
      zoneID = 20,
      xN = "0.230",
      yN = "0.269",
      zonePolygonData = {
        { xN = 0.255, yN = 0.345 },
        { xN = 0.268, yN = 0.322 },
        { xN = 0.277, yN = 0.306 },
        { xN = 0.274, yN = 0.301 },
        { xN = 0.263, yN = 0.297 },
        { xN = 0.261, yN = 0.286 },
        { xN = 0.272, yN = 0.282 },
        { xN = 0.276, yN = 0.284 },
        { xN = 0.293, yN = 0.273 },
        { xN = 0.304, yN = 0.268 },
        { xN = 0.312, yN = 0.270 },
        { xN = 0.321, yN = 0.271 },
        { xN = 0.327, yN = 0.277 },
        { xN = 0.332, yN = 0.286 },
        { xN = 0.329, yN = 0.299 },
        { xN = 0.334, yN = 0.304 },
        { xN = 0.336, yN = 0.315 },
        { xN = 0.329, yN = 0.318 },
        { xN = 0.323, yN = 0.330 },
        { xN = 0.321, yN = 0.343 },
        { xN = 0.326, yN = 0.347 },
        { xN = 0.328, yN = 0.351 },
        { xN = 0.328, yN = 0.370 },
        { xN = 0.317, yN = 0.380 },
        { xN = 0.313, yN = 0.391 },
        { xN = 0.295, yN = 0.397 },
        { xN = 0.286, yN = 0.393 },
        { xN = 0.283, yN = 0.393 },
        { xN = 0.280, yN = 0.395 },
        { xN = 0.271, yN = 0.393 },
        { xN = 0.256, yN = 0.396 },
        { xN = 0.249, yN = 0.378 },
        { xN = 0.255, yN = 0.367 },
        { xN = 0.254, yN = 0.352 },
        { xN = 0.256, yN = 0.346 },                    
      }
    }),

    -- The Alik'r --
    zoneData = hackyJoin({
      zoneName = "The Alik'r",
      zoneDescription = "The Alik'r may be rich in mineral resources, but its fierce creatures and harsh terrain are too daunting for most.",
      zoneID = 30,
      xN = "0.1145",
      yN = "0.319",
      zonePolygonData = {
        { xN = 0.120, yN = 0.417 },
        { xN = 0.117, yN = 0.412 },
        { xN = 0.112, yN = 0.398 },
        { xN = 0.124, yN = 0.390 },
        { xN = 0.142, yN = 0.382 },
        { xN = 0.152, yN = 0.381 },
        { xN = 0.157, yN = 0.370 },
        { xN = 0.163, yN = 0.360 },
        { xN = 0.175, yN = 0.366 },
        { xN = 0.182, yN = 0.365 },
        { xN = 0.193, yN = 0.359 },
        { xN = 0.207, yN = 0.359 },
        { xN = 0.226, yN = 0.352 },
        { xN = 0.238, yN = 0.340 },
        { xN = 0.256, yN = 0.340 },
        { xN = 0.255, yN = 0.346 },
        { xN = 0.253, yN = 0.350 },
        { xN = 0.253, yN = 0.368 },
        { xN = 0.250, yN = 0.374 },
        { xN = 0.256, yN = 0.395 },
        { xN = 0.253, yN = 0.397 },
        { xN = 0.249, yN = 0.412 },
        { xN = 0.243, yN = 0.415 },
        { xN = 0.237, yN = 0.414 },
        { xN = 0.228, yN = 0.417 },
        { xN = 0.215, yN = 0.421 },
        { xN = 0.210, yN = 0.420 },
        { xN = 0.197, yN = 0.424 },
        { xN = 0.194, yN = 0.430 },
        { xN = 0.176, yN = 0.434 },
        { xN = 0.155, yN = 0.434 },
        { xN = 0.148, yN = 0.437 },
        { xN = 0.143, yN = 0.434 },
        { xN = 0.131, yN = 0.438 },
        { xN = 0.127, yN = 0.438 },
        { xN = 0.123, yN = 0.435 },
        { xN = 0.123, yN = 0.430 },        
      }
    }),

    -- Hew's Bane --
    [255] = { xN = 0.261, yN = 0.500 }, -- Abah's Landing Wayshrine
    [257] = { xN = 0.263, yN = 0.524 }, -- No Shira Citadel Wayshrine 
    [256] = { xN = 0.250, yN = 0.510 }, -- Zeht's Displeasure Wayshrine 

    zoneData = hackyJoin({
      zoneName = "Hew's Bane",
      zoneDescription = "Prince Hubalajad claimed this Hammerfell peninsula for his own, but when all of\n his ambitious endeavors ended in failure, the region acquired the nickname Hew's Bane.",
      zoneID = 994,
      xN = "0.220",
      yN = "0.4765",
      zonePolygonData = {
        { xN = 0.216, yN = 0.486 },
        { xN = 0.226, yN = 0.506 },
        { xN = 0.233, yN = 0.504 },
        { xN = 0.233, yN = 0.508 },
        { xN = 0.231, yN = 0.513 },
        { xN = 0.234, yN = 0.516 },
        { xN = 0.224, yN = 0.528 },
        { xN = 0.231, yN = 0.534 },
        { xN = 0.239, yN = 0.538 },
        { xN = 0.250, yN = 0.541 },
        { xN = 0.260, yN = 0.540 },
        { xN = 0.271, yN = 0.538 },
        { xN = 0.281, yN = 0.534 },
        { xN = 0.284, yN = 0.526 },
        { xN = 0.280, yN = 0.518 },
        { xN = 0.286, yN = 0.512 },
        { xN = 0.289, yN = 0.501 },
        { xN = 0.283, yN = 0.487 },
        { xN = 0.280, yN = 0.483 },
        { xN = 0.268, yN = 0.482 },
        { xN = 0.256, yN = 0.485 },
        { xN = 0.246, yN = 0.485 },
        { xN = 0.239, yN = 0.482 },
        { xN = 0.229, yN = 0.476 },
        { xN = 0.226, yN = 0.474 }, 
      }
    }),

    -- Stros M'Kai --
    [179] = { xN = 0.169, yN = 0.534 }, -- Sandy Grotto Wayshrine 
    [180] = { xN = 0.159, yN = 0.551 }, -- Saintsport Wayshrine 
    [324] = { xN = 0.167, yN = 0.547 }, -- Hunding's Palatial Hall House
    [138] = { xN = 0.159, yN = 0.542 }, -- Port Hunding Wayshrine 

    zoneData = hackyJoin({
      zoneName = "Stros M'Kai",
      zoneDescription = "The island of Stros M'Kai was one of the first regions settled by the Redguards when they sailed east\n from their lost homeland of Yokuda.",
      zoneID = 201,
      xN = "0.142",
      yN = "0.529",
      zonePolygonData = {
        { xN = 0.140, yN = 0.537 },
        { xN = 0.141, yN = 0.541 },
        { xN = 0.145, yN = 0.541 },
        { xN = 0.148, yN = 0.542 },
        { xN = 0.148, yN = 0.548 },
        { xN = 0.153, yN = 0.553 },
        { xN = 0.160, yN = 0.556 },
        { xN = 0.168, yN = 0.551 },
        { xN = 0.173, yN = 0.534 },
        { xN = 0.164, yN = 0.530 },
        { xN = 0.152, yN = 0.531 },
        { xN = 0.144, yN = 0.531 },
        { xN = 0.139, yN = 0.536 },
        { xN = 0.140, yN = 0.538 },        
      }
    }),


    -- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    -- ██░▄▀▄░██░▄▄▄░██░▄▄▀██░▄▄▀██░▄▄▄░██░███░█▄░▄██░▀██░██░▄▄▀██
    -- ██░█░█░██░███░██░▀▀▄██░▀▀▄██░███░██░█░█░██░███░█░█░██░██░██
    -- ██░███░██░▀▀▀░██░██░██░██░██░▀▀▀░██▄▀▄▀▄█▀░▀██░██▄░██░▀▀░██
    -- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    -- [x] = { xN = x, yN = y }, -- 
    -- ctrl + f aid: morrowind

    -- Vvardenfell --
    [330] = { xN = 0.685, yN = 0.266 }, -- Urskilaku Camp Wayshrine
    [282] = { xN = 0.757, yN = 0.265 }, -- Valley of the Wind Wayshrine
    [280] = { xN = 0.777, yN = 0.278 }, -- Tel Mora Wayshrine
    [273] = { xN = 0.671, yN = 0.290 }, -- Gnisis Wayshrine
    [329] = { xN = 0.691, yN = 0.308 }, -- West Gash Wayshrine
    [274] = { xN = 0.710, yN = 0.315 }, -- Ald'ruhn Wayshrine
    [281] = { xN = 0.812, yN = 0.324 }, -- Sadrith Mora Wayshrine 
    [331] = { xN = 0.798, yN = 0.336 }, -- Halls of Fabrication Trial
    [279] = { xN = 0.774, yN = 0.346 }, -- Nchuleftingth Wayshrine 
    [275] = { xN = 0.714, yN = 0.359 }, -- Balmora Wayshrine
    [276] = { xN = 0.750, yN = 0.369 }, -- Suran Wayshrine
    [277] = { xN = 0.796, yN = 0.377 }, -- Molag Mar Wayshrine 
    [278] = { xN = 0.796, yN = 0.407 }, -- Tel Branora Wayshrine
    [272] = { xN = 0.716, yN = 0.384 }, -- Seyda Neen Wayshrine 
    [284] = { xN = 0.733, yN = 0.398 }, -- Vivec City Wayshrine 
    [333] = { xN = 0.741, yN = 0.402 }, -- Saint Delyn Penthouse 
    [328] = { xN = 0.744, yN = 0.407 }, -- Vivec Temple Wayshrine
    [334] = { xN = 0.725, yN = 0.374 }, -- Amanya Lake Lodge House
    [335] = { xN = 0.673, yN = 0.269 }, -- Ald Velothi Harbour House
    [465] = { xN = 0.718, yN = 0.261 }, -- Kushalit Sanctuary House

    zoneData = hackyJoin({
      zoneName = "Vvardenfell",
      zoneDescription = "The sprawling volcanic island of Vvardenfell dominates northern Morrowind, with the\n ever-smoldering peak of Red Mountain at its centre.",
      zoneID = 1060,
      xN = "0.646",
      yN = "0.221",
      zonePolygonData = {
        { xN = 0.712, yN = 0.218 },
        { xN = 0.710, yN = 0.223 },
        { xN = 0.712, yN = 0.228 },
        { xN = 0.709, yN = 0.233 },
        { xN = 0.704, yN = 0.232 },
        { xN = 0.700, yN = 0.238 },
        { xN = 0.691, yN = 0.249 },
        { xN = 0.671, yN = 0.263 },
        { xN = 0.660, yN = 0.270 },
        { xN = 0.649, yN = 0.272 },
        { xN = 0.649, yN = 0.276 },
        { xN = 0.654, yN = 0.281 },
        { xN = 0.664, yN = 0.296 },
        { xN = 0.675, yN = 0.312 },
        { xN = 0.681, yN = 0.333 },
        { xN = 0.682, yN = 0.352 },
        { xN = 0.688, yN = 0.367 },
        { xN = 0.691, yN = 0.376 },
        { xN = 0.698, yN = 0.379 },
        { xN = 0.701, yN = 0.387 },
        { xN = 0.713, yN = 0.395 },
        { xN = 0.725, yN = 0.408 },
        { xN = 0.730, yN = 0.413 },
        { xN = 0.747, yN = 0.413 },
        { xN = 0.757, yN = 0.415 },
        { xN = 0.772, yN = 0.408 },
        { xN = 0.783, yN = 0.405 },
        { xN = 0.797, yN = 0.414 },
        { xN = 0.805, yN = 0.413 },
        { xN = 0.805, yN = 0.399 },
        { xN = 0.808, yN = 0.391 },
        { xN = 0.817, yN = 0.388 },
        { xN = 0.822, yN = 0.389 },
        { xN = 0.829, yN = 0.384 },
        { xN = 0.825, yN = 0.343 },
        { xN = 0.829, yN = 0.343 },
        { xN = 0.832, yN = 0.322 },
        { xN = 0.831, yN = 0.316 },
        { xN = 0.820, yN = 0.305 },
        { xN = 0.812, yN = 0.296 },
        { xN = 0.803, yN = 0.294 },
        { xN = 0.802, yN = 0.286 },
        { xN = 0.801, yN = 0.281 },
        { xN = 0.797, yN = 0.274 },
        { xN = 0.801, yN = 0.271 },
        { xN = 0.797, yN = 0.262 },
        { xN = 0.787, yN = 0.262 },
        { xN = 0.786, yN = 0.248 },
        { xN = 0.788, yN = 0.243 },
        { xN = 0.786, yN = 0.234 },
        { xN = 0.768, yN = 0.234 },
        { xN = 0.758, yN = 0.219 },
        { xN = 0.736, yN = 0.219 },
        { xN = 0.715, yN = 0.217 },
        { xN = 0.710, yN = 0.220 },
      }
    }),

    -- Firemoth Island --
    zoneData = hackyJoin({
      zoneName = "Firemoth Island",
      zoneDescription = "The Firemoth islets seem to float like forgotten derelicts on the surface of the Inner Sea,\n shrouded in mists that might hide all manner of crimes and corruption.",
      zoneID = 1248,
      xN = "0.674",
      yN = "0.3815",
      zonePolygonData = {
        { xN = 0.682, yN = 0.403 },
        { xN = 0.688, yN = 0.399 },
        { xN = 0.694, yN = 0.394 },
        { xN = 0.696, yN = 0.387 },
        { xN = 0.694, yN = 0.380 },
        { xN = 0.686, yN = 0.379 },
        { xN = 0.679, yN = 0.383 },
        { xN = 0.676, yN = 0.387 },
        { xN = 0.672, yN = 0.396 },
        { xN = 0.674, yN = 0.400 },
        { xN = 0.678, yN = 0.402 },
      }
    }),

    -- Stonefalls --
    zoneData = hackyJoin({
      zoneName = "Stonefalls",
      zoneDescription = "This ashy region of Morrowind known as Stonefalls was where the recent invading\n army from Akavir met its bloody end.",
      zoneID = 7,
      xN = "0.668",
      yN = "0.380",
      zonePolygonData = {
        { xN = 0.678, yN = 0.406 },
        { xN = 0.682, yN = 0.405 },
        { xN = 0.688, yN = 0.400 },
        { xN = 0.697, yN = 0.398 },
        { xN = 0.702, yN = 0.403 },
        { xN = 0.707, yN = 0.407 },
        { xN = 0.711, yN = 0.406 },
        { xN = 0.711, yN = 0.412 },
        { xN = 0.720, yN = 0.419 },
        { xN = 0.719, yN = 0.426 },
        { xN = 0.717, yN = 0.433 },
        { xN = 0.715, yN = 0.437 },
        { xN = 0.726, yN = 0.448 },
        { xN = 0.731, yN = 0.447 },
        { xN = 0.736, yN = 0.441 },
        { xN = 0.732, yN = 0.433 },
        { xN = 0.733, yN = 0.428 },
        { xN = 0.738, yN = 0.423 },
        { xN = 0.743, yN = 0.428 },
        { xN = 0.746, yN = 0.435 },
        { xN = 0.764, yN = 0.425 },
        { xN = 0.773, yN = 0.420 },
        { xN = 0.781, yN = 0.419 },
        { xN = 0.793, yN = 0.423 },
        { xN = 0.796, yN = 0.428 },
        { xN = 0.797, yN = 0.434 },
        { xN = 0.795, yN = 0.438 },
        { xN = 0.795, yN = 0.443 },
        { xN = 0.794, yN = 0.447 },
        { xN = 0.794, yN = 0.453 },
        { xN = 0.796, yN = 0.454 },
        { xN = 0.786, yN = 0.461 },
        { xN = 0.783, yN = 0.467 },
        { xN = 0.783, yN = 0.475 },
        { xN = 0.773, yN = 0.478 },
        { xN = 0.764, yN = 0.479 },
        { xN = 0.751, yN = 0.487 },
        { xN = 0.745, yN = 0.485 },
        { xN = 0.737, yN = 0.488 },
        { xN = 0.730, yN = 0.489 },
        { xN = 0.720, yN = 0.486 },
        { xN = 0.701, yN = 0.491 },
        { xN = 0.695, yN = 0.485 },
        { xN = 0.685, yN = 0.484 },
        { xN = 0.679, yN = 0.473 },
        { xN = 0.674, yN = 0.471 },
        { xN = 0.672, yN = 0.463 },
        { xN = 0.668, yN = 0.460 },
        { xN = 0.668, yN = 0.453 },
        { xN = 0.671, yN = 0.449 },
        { xN = 0.668, yN = 0.440 },
        { xN = 0.669, yN = 0.436 },
        { xN = 0.674, yN = 0.431 },
        { xN = 0.675, yN = 0.426 },
        { xN = 0.675, yN = 0.415 },
        { xN = 0.677, yN = 0.406 },        
      }
    }),

    -- Bal Foyen --
    zoneData = hackyJoin({
      zoneName = "Bal Foyen",
      zoneDescription = "This region is known as Bal Foyen, a wild expanse of marshland and volcanic landscapes,\n now being used to farm saltrice by the Dark Elves' former Argonian slaves.",
      zoneID = 75,
      xN = "0.795",
      yN = "0.428",
      zonePolygonData = {
        { xN = 0.796, yN = 0.454 },
        { xN = 0.802, yN = 0.459 },
        { xN = 0.810, yN = 0.461 },
        { xN = 0.818, yN = 0.456 },
        { xN = 0.821, yN = 0.448 },
        { xN = 0.827, yN = 0.442 },
        { xN = 0.821, yN = 0.438 },
        { xN = 0.818, yN = 0.432 },
        { xN = 0.814, yN = 0.430 },
        { xN = 0.807, yN = 0.433 },
        { xN = 0.798, yN = 0.429 },
        { xN = 0.797, yN = 0.435 },
        { xN = 0.795, yN = 0.440 },
        { xN = 0.797, yN = 0.444 },
        { xN = 0.795, yN = 0.450 },
        { xN = 0.795, yN = 0.452 },        
      }
    }),

    -- Deshaan --
    zoneData = hackyJoin({
      zoneName = "Deshaan",
      zoneDescription = "The fertile valleys of Deshaan are home to lush fungal forests, deep kwama mines,\n and broad pastures where netches and guar graze.",
      zoneID = 13,
      xN = "0.699",
      yN = "0.430",
      zonePolygonData = {
        { xN = 0.701, yN = 0.493 },
        { xN = 0.697, yN = 0.498 },
        { xN = 0.698, yN = 0.509 },
        { xN = 0.699, yN = 0.516 },
        { xN = 0.701, yN = 0.518 },
        { xN = 0.698, yN = 0.520 },
        { xN = 0.697, yN = 0.529 },
        { xN = 0.707, yN = 0.534 },
        { xN = 0.721, yN = 0.531 },
        { xN = 0.727, yN = 0.530 },
        { xN = 0.735, yN = 0.534 },
        { xN = 0.742, yN = 0.534 },
        { xN = 0.753, yN = 0.539 },
        { xN = 0.774, yN = 0.539 },
        { xN = 0.787, yN = 0.539 },
        { xN = 0.800, yN = 0.537 },
        { xN = 0.807, yN = 0.538 },
        { xN = 0.844, yN = 0.522 },
        { xN = 0.847, yN = 0.515 },
        { xN = 0.847, yN = 0.511 },
        { xN = 0.846, yN = 0.508 },
        { xN = 0.848, yN = 0.505 },
        { xN = 0.847, yN = 0.500 },
        { xN = 0.849, yN = 0.496 },
        { xN = 0.847, yN = 0.492 },
        { xN = 0.844, yN = 0.483 },
        { xN = 0.837, yN = 0.480 },
        { xN = 0.828, yN = 0.477 },
        { xN = 0.822, yN = 0.476 },
        { xN = 0.815, yN = 0.478 },
        { xN = 0.804, yN = 0.480 },
        { xN = 0.799, yN = 0.474 },
        { xN = 0.792, yN = 0.471 },
        { xN = 0.784, yN = 0.475 },
        { xN = 0.778, yN = 0.479 },
        { xN = 0.768, yN = 0.481 },
        { xN = 0.762, yN = 0.481 },
        { xN = 0.750, yN = 0.488 },
        { xN = 0.745, yN = 0.488 },
        { xN = 0.740, yN = 0.490 },
        { xN = 0.731, yN = 0.490 },
        { xN = 0.724, yN = 0.489 },
        { xN = 0.719, yN = 0.489 },
        { xN = 0.713, yN = 0.491 },
        { xN = 0.706, yN = 0.492 },
        { xN = 0.702, yN = 0.493 },
      }
    }),


    -- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    -- ██░▄▄▀██░████░▄▄▀██░▄▄▀██░█▀▄████░▄▀▄░█░▄▄▀██░▄▄▀██░▄▄▄░██░██░██
    -- ██░▄▄▀██░████░▀▀░██░█████░▄▀█████░█░█░█░▀▀░██░▀▀▄██▄▄▄▀▀██░▄▄░██
    -- ██░▀▀░██░▀▀░█░██░██░▀▀▄██░██░████░███░█░██░██░██░██░▀▀▀░██░██░██
    -- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    -- [x] = { xN = x, yN = y }, -- 
    -- ctrl + f aid: black marsh
    
    -- Shadowfen --
    [48] = { xN = 0.748, yN = 0.584 }, -- Stormhold Wayshrine
    [260] = { xN = 0.712, yN = 0.582 }, -- Ruins of Mazzatun Dungeon 
    [171] = { xN = 0.760, yN = 0.593 }, -- Bogmother Wayshrine
    [85] = { xN = 0.777, yN = 0.605 }, -- Forsaken Hamlet Wayshrine 
    [47] = { xN = 0.722, yN = 0.593 }, -- Stillrise Wayshrine
    [261] = { xN = 0.716, yN = 0.594 }, -- Cradle of Shadows Dungeon
    [78] = { xN = 0.721, yN = 0.611 }, -- Venomnous Fens Wayshrine 
    [49] = { xN = 0.754, yN = 0.627 }, -- Hatching Pools Wayshrine 
    [50] = { xN = 0.765, yN = 0.625 }, -- Alten Corimont Wayshrine 
    [51] = { xN = 0.771, yN = 0.647 }, -- Perlocating Mire Wayshrine
    [192] = { xN = 0.707, yN = 0.622 }, -- Arx Corinium Dungeon
    [52] = { xN = 0.739, yN = 0.639 }, -- Hissmir Wayshrine 
    [53] = { xN = 0.712, yN = 0.641 }, -- Loriasel Wayshrine 
    [305] = { xN = 0.734, yN = 0.583 }, -- The Ample Domicile House 
    [316] = { xN = 0.755, yN = 0.611 }, -- Stay-Moist Mansion House

    zoneData = hackyJoin({
      zoneName = "Shadowfen",
      zoneDescription = "The fetid mire of Shadowfen has had more contact with Tamrielic civilization than most of Black Marsh,\n primarily due to the activities of the Dunmeri slavers who once operated here.",
      zoneID = 26,
      xN = "0.691",
      yN = "0.5565",
      zonePolygonData = {
        { xN = 0.692, yN = 0.653 },
        { xN = 0.691, yN = 0.646 },
        { xN = 0.705, yN = 0.605 },
        { xN = 0.705, yN = 0.586 },
        { xN = 0.712, yN = 0.573 },
        { xN = 0.718, yN = 0.567 },
        { xN = 0.750, yN = 0.575 },
        { xN = 0.775, yN = 0.576 },
        { xN = 0.785, yN = 0.581 },
        { xN = 0.793, yN = 0.598 },
        { xN = 0.797, yN = 0.615 },
        { xN = 0.797, yN = 0.619 },
        { xN = 0.804, yN = 0.626 },
        { xN = 0.804, yN = 0.651 },
        { xN = 0.796, yN = 0.657 },
        { xN = 0.779, yN = 0.659 },
        { xN = 0.693, yN = 0.654 },
      }
    }),

    -- Murkmire --
    [376] = { xN = 0.703, yN = 0.754 }, -- Dead-Water Wayshrine 
    [378] = { xN = 0.712, yN = 0.769 }, -- Blackrose Prison Dungeon
    [379] = { xN = 0.725, yN = 0.780 }, -- Blackrose Prison Wayshrine 
    [375] = { xN = 0.755, yN = 0.782 }, -- Bright-Throat Wayshrine 
    [377] = { xN = 0.758, yN = 0.739 }, -- Root-Whisper Wayshrine
    [388] = { xN = 0.724, yN = 0.735 }, -- Lakemire Xanmeer Manor House 

    zoneData = hackyJoin({
      zoneName = "Murkmire",
      zoneDescription = "Legend holds that the region informally known as Murkmire once\n extended much further south before it sank beneath the waves.",
      zoneID = 1484,
      xN = "0.682",
      yN = "0.714",
      zonePolygonData = {
        { xN = 0.682, yN = 0.752 },
        { xN = 0.686, yN = 0.748 },
        { xN = 0.694, yN = 0.744 },
        { xN = 0.699, yN = 0.739 },
        { xN = 0.704, yN = 0.739 },
        { xN = 0.708, yN = 0.738 },
        { xN = 0.711, yN = 0.733 },
        { xN = 0.721, yN = 0.725 },
        { xN = 0.727, yN = 0.721 },
        { xN = 0.731, yN = 0.721 },
        { xN = 0.739, yN = 0.727 },
        { xN = 0.749, yN = 0.729 },
        { xN = 0.757, yN = 0.728 },
        { xN = 0.771, yN = 0.730 },
        { xN = 0.768, yN = 0.739 },
        { xN = 0.766, yN = 0.746 },
        { xN = 0.762, yN = 0.746 },
        { xN = 0.765, yN = 0.760 },
        { xN = 0.762, yN = 0.765 },
        { xN = 0.759, yN = 0.764 },
        { xN = 0.759, yN = 0.767 },
        { xN = 0.764, yN = 0.771 },
        { xN = 0.763, yN = 0.779 },
        { xN = 0.767, yN = 0.780 },
        { xN = 0.774, yN = 0.778 },
        { xN = 0.778, yN = 0.780 },
        { xN = 0.782, yN = 0.792 },
        { xN = 0.784, yN = 0.799 },
        { xN = 0.782, yN = 0.806 },
        { xN = 0.769, yN = 0.811 },
        { xN = 0.758, yN = 0.807 },
        { xN = 0.748, yN = 0.804 },
        { xN = 0.745, yN = 0.806 },
        { xN = 0.738, yN = 0.804 },
        { xN = 0.734, yN = 0.800 },
        { xN = 0.722, yN = 0.793 },
        { xN = 0.718, yN = 0.795 },
        { xN = 0.704, yN = 0.787 },
        { xN = 0.704, yN = 0.780 },
        { xN = 0.698, yN = 0.780 },
        { xN = 0.689, yN = 0.770 },
        { xN = 0.685, yN = 0.766 },
        { xN = 0.685, yN = 0.759 },
        { xN = 0.683, yN = 0.753 },        
      }
    }),

    -- Norg-Tzel --
    zoneData = hackyJoin({
      zoneName = "Norg-Tzel",
      zoneDescription = "Norg-Tzel, which means 'forbidden place' in the Argonian tongue, has much\n the same climate and terrain as the region of Black Marsh known as Murkmire.",
      zoneID = 1552,
      xN = "0.800",
      yN = "0.7925",
      zonePolygonData = {
        { xN = 0.798, yN = 0.799 },
        { xN = 0.803, yN = 0.807 },
        { xN = 0.815, yN = 0.804 },
        { xN = 0.814, yN = 0.799 },
        { xN = 0.807, yN = 0.796 },
        { xN = 0.804, yN = 0.790 },
        { xN = 0.798, yN = 0.794 },
        { xN = 0.797, yN = 0.796 },        
      }
    }),

    -- Blackwood --
    [462] = { xN = 0.671, yN = 0.631 }, -- Bloodrun Wayshrine 
    [483] = { xN = 0.673, yN = 0.657 }, -- Hutan-Tzel Wayshrine
    [459] = { xN = 0.654, yN = 0.680 }, -- Gideon Wayshrine 
    [464] = { xN = 0.662, yN = 0.721 }, -- Stonewastes Wayshrine
    [484] = { xN = 0.688, yN = 0.714 }, -- Vunalk Wayshrine
    [468] = { xN = 0.684, yN = 0.742 }, -- Rockgrove Trial
    [473] = { xN = 0.687, yN = 0.624 }, -- Pantherfang Chapel House 
    [458] = { xN = 0.597, yN = 0.685 }, -- Leyawiin Wayshrine 
    [467] = { xN = 0.601, yN = 0.677 }, -- Leyawin Outskirts Wayshrine
    [471] = { xN = 0.600, yN = 0.683 }, -- Pilgrim's Rest House 
    [469] = { xN = 0.664, yN = 0.610 }, -- The Dread Cellar Dungeon 
    [481] = { xN = 0.617, yN = 0.627 }, -- Doomvault Vulpinaz Wayshrine 
    [461] = { xN = 0.611, yN = 0.645 }, -- Fort Redmane Wayshrine 
    [482] = { xN = 0.630, yN = 0.680 }, -- Blackwood Crosslands Wayshrine
    [460] = { xN = 0.590, yN = 0.653 }, -- Borderwatch Wayshrine 
    [463] = { xN = 0.620, yN = 0.703 }, -- Blueblood Wayshrine
    [472] = { xN = 0.603, yN = 0.687 }, -- Water's Edge House

    zoneData = hackyJoin({
      zoneName = "Blackwood",
      zoneDescription = "Straddling the great Niben River and extending east into the bogs of the Argonian\n homeland, the Blackwood region serves as the maritime gate to Cyrodiil.",
      zoneID = 1887,
      xN = "0.570",
      yN = "0.5975",
      zonePolygonData = {
        { xN = 0.593, yN = 0.708 },
        { xN = 0.583, yN = 0.696 },
        { xN = 0.582, yN = 0.690 },
        { xN = 0.586, yN = 0.681 },
        { xN = 0.587, yN = 0.675 },
        { xN = 0.585, yN = 0.656 },
        { xN = 0.583, yN = 0.650 },
        { xN = 0.585, yN = 0.646 },
        { xN = 0.588, yN = 0.637 },
        { xN = 0.589, yN = 0.628 },
        { xN = 0.601, yN = 0.631 },
        { xN = 0.608, yN = 0.631 },
        { xN = 0.612, yN = 0.627 },
        { xN = 0.615, yN = 0.620 },
        { xN = 0.618, yN = 0.609 },
        { xN = 0.623, yN = 0.599 },
        { xN = 0.628, yN = 0.598 },
        { xN = 0.636, yN = 0.605 },
        { xN = 0.646, yN = 0.609 },
        { xN = 0.660, yN = 0.607 },
        { xN = 0.675, yN = 0.613 },
        { xN = 0.683, yN = 0.617 },
        { xN = 0.687, yN = 0.620 },
        { xN = 0.697, yN = 0.620 },
        { xN = 0.693, yN = 0.633 },
        { xN = 0.690, yN = 0.641 },
        { xN = 0.691, yN = 0.654 },
        { xN = 0.693, yN = 0.661 },
        { xN = 0.695, yN = 0.665 },
        { xN = 0.692, yN = 0.676 },
        { xN = 0.691, yN = 0.680 },
        { xN = 0.694, yN = 0.688 },
        { xN = 0.700, yN = 0.691 },
        { xN = 0.702, yN = 0.701 },
        { xN = 0.700, yN = 0.705 },
        { xN = 0.704, yN = 0.711 },
        { xN = 0.707, yN = 0.716 },
        { xN = 0.706, yN = 0.722 },
        { xN = 0.704, yN = 0.725 },
        { xN = 0.711, yN = 0.732 },
        { xN = 0.706, yN = 0.739 },
        { xN = 0.698, yN = 0.738 },
        { xN = 0.694, yN = 0.743 },
        { xN = 0.683, yN = 0.750 },
        { xN = 0.682, yN = 0.752 },
        { xN = 0.674, yN = 0.747 },
        { xN = 0.669, yN = 0.748 },
        { xN = 0.664, yN = 0.747 },
        { xN = 0.651, yN = 0.744 },
        { xN = 0.653, yN = 0.738 },
        { xN = 0.650, yN = 0.731 },
        { xN = 0.642, yN = 0.723 },
        { xN = 0.638, yN = 0.714 },
        { xN = 0.633, yN = 0.714 },
        { xN = 0.631, yN = 0.719 },
        { xN = 0.624, yN = 0.720 },
        { xN = 0.622, yN = 0.716 },
        { xN = 0.614, yN = 0.713 },
        { xN = 0.603, yN = 0.701 },
        { xN = 0.594, yN = 0.707 },        
      }
    }),


    -- Grand Topal Hideaway --
    [325] = { xN = 0.641, yN = 0.738 }, -- Grand Topal Hideaway House


    -- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    -- ██░▄▄▄██░█████░▄▄▄░██░███░██░▄▄▄██░███░██░▄▄▀██
    -- ██░▄▄▄██░█████▄▄▄▀▀██░█░█░██░▄▄▄██▄▀▀▀▄██░▀▀▄██
    -- ██░▀▀▀██░▀▀░██░▀▀▀░██▄▀▄▀▄██░▀▀▀████░████░██░██
    -- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    -- [x] = { xN = x, yN = y }, -- 
    -- ctrl + f aid: elsweyr

    -- Northern Elsweyr --
    zoneData = hackyJoin({
      zoneName = "Anequina",
      zoneDescription = "This region merged with the southern region of Pellitine centuries ago to form the province of Elsweyr.",
      zoneID = 1555,
      xN = "0.447",
      yN = "0.5805",
      zonePolygonData = {
        { xN = 0.584, yN = 0.654 },
        { xN = 0.582, yN = 0.651 },
        { xN = 0.585, yN = 0.645 },
        { xN = 0.586, yN = 0.635 },
        { xN = 0.590, yN = 0.628 },
        { xN = 0.589, yN = 0.622 },
        { xN = 0.581, yN = 0.619 },
        { xN = 0.580, yN = 0.608 },
        { xN = 0.562, yN = 0.604 },
        { xN = 0.553, yN = 0.603 },
        { xN = 0.542, yN = 0.608 },
        { xN = 0.529, yN = 0.604 },
        { xN = 0.516, yN = 0.603 },
        { xN = 0.509, yN = 0.603 },
        { xN = 0.504, yN = 0.602 },
        { xN = 0.501, yN = 0.608 },
        { xN = 0.498, yN = 0.614 },
        { xN = 0.496, yN = 0.614 },
        { xN = 0.487, yN = 0.627 },
        { xN = 0.482, yN = 0.632 },
        { xN = 0.477, yN = 0.634 },
        { xN = 0.474, yN = 0.639 },
        { xN = 0.472, yN = 0.643 },
        { xN = 0.471, yN = 0.648 },
        { xN = 0.466, yN = 0.651 },
        { xN = 0.463, yN = 0.661 },
        { xN = 0.457, yN = 0.661 },
        { xN = 0.455, yN = 0.665 },
        { xN = 0.446, yN = 0.671 },
        { xN = 0.450, yN = 0.675 },
        { xN = 0.452, yN = 0.685 },
        { xN = 0.453, yN = 0.692 },
        { xN = 0.456, yN = 0.694 },
        { xN = 0.462, yN = 0.695 },
        { xN = 0.466, yN = 0.699 },
        { xN = 0.473, yN = 0.700 },
        { xN = 0.484, yN = 0.700 },
        { xN = 0.487, yN = 0.702 },
        { xN = 0.495, yN = 0.704 },
        { xN = 0.508, yN = 0.698 },
        { xN = 0.514, yN = 0.699 },
        { xN = 0.522, yN = 0.691 },
        { xN = 0.528, yN = 0.687 },
        { xN = 0.532, yN = 0.689 },
        { xN = 0.540, yN = 0.689 },
        { xN = 0.549, yN = 0.686 },
        { xN = 0.553, yN = 0.681 },
        { xN = 0.553, yN = 0.676 },
        { xN = 0.555, yN = 0.672 },
        { xN = 0.561, yN = 0.670 },
        { xN = 0.572, yN = 0.657 },
        { xN = 0.584, yN = 0.655 },
        { xN = 0.583, yN = 0.650 },
        { xN = 0.585, yN = 0.643 },
        { xN = 0.587, yN = 0.634 },
      }
    }),

    -- Southern Elsweyr --
    [407] = { xN = 0.614, yN = 0.790 }, -- Dragonguard Sanctum Wayshrine

    zoneData = hackyJoin({
      zoneName = "Quin'rawl",
      zoneDescription = "Also known as Southern Elsweyr, this land's complex history stretches back into antiquity.",
      zoneID = 1654,
      xN = "0.500",
      yN = "0.6945",
      zonePolygonData = {
        { xN = 0.556, yN = 0.751 },
        { xN = 0.556, yN = 0.737 },
        { xN = 0.568, yN = 0.731 },
        { xN = 0.576, yN = 0.722 },
        { xN = 0.578, yN = 0.716 },
        { xN = 0.574, yN = 0.707 },
        { xN = 0.568, yN = 0.702 },
        { xN = 0.562, yN = 0.702 },
        { xN = 0.556, yN = 0.708 },
        { xN = 0.547, yN = 0.709 },
        { xN = 0.539, yN = 0.706 },
        { xN = 0.531, yN = 0.712 },
        { xN = 0.520, yN = 0.716 },
        { xN = 0.509, yN = 0.728 },
        { xN = 0.505, yN = 0.734 },
        { xN = 0.508, yN = 0.745 },
        { xN = 0.507, yN = 0.748 },
        { xN = 0.511, yN = 0.759 },
        { xN = 0.511, yN = 0.762 },
        { xN = 0.505, yN = 0.763 },
        { xN = 0.505, yN = 0.766 },
        { xN = 0.504, yN = 0.770 },
        { xN = 0.500, yN = 0.772 },
        { xN = 0.502, yN = 0.775 },
        { xN = 0.505, yN = 0.779 },
        { xN = 0.510, yN = 0.779 },
        { xN = 0.512, yN = 0.778 },
        { xN = 0.519, yN = 0.781 },
        { xN = 0.526, yN = 0.785 },
        { xN = 0.531, yN = 0.786 },
        { xN = 0.534, yN = 0.787 },
        { xN = 0.537, yN = 0.790 },
        { xN = 0.540, yN = 0.795 },
        { xN = 0.543, yN = 0.797 },
        { xN = 0.546, yN = 0.796 },
        { xN = 0.556, yN = 0.791 },
        { xN = 0.568, yN = 0.789 },
        { xN = 0.576, yN = 0.787 },
        { xN = 0.582, yN = 0.795 },
        { xN = 0.589, yN = 0.795 },
        { xN = 0.614, yN = 0.802 },
        { xN = 0.626, yN = 0.786 },
        { xN = 0.612, yN = 0.782 },
        { xN = 0.592, yN = 0.777 },
        { xN = 0.586, yN = 0.771 },
        { xN = 0.578, yN = 0.764 },
        { xN = 0.567, yN = 0.753 },
        { xN = 0.554, yN = 0.751 },        
      }
    }),

    zoneData = hackyJoin({
      zoneName = "Khenarthi's Roost",
      zoneDescription = "This island off the southern coast of Elsweyr is named after the Khajiiti goddess of weather\n and the sky, who is usually represented as a great hawk.",
      zoneID = 258,
      xN = "0.4905",
      yN = "0.783",
      zonePolygonData = {
        { xN = 0.504, yN = 0.782 },
        { xN = 0.511, yN = 0.782 },
        { xN = 0.513, yN = 0.785 },
        { xN = 0.512, yN = 0.788 },
        { xN = 0.517, yN = 0.801 },
        { xN = 0.509, yN = 0.811 },
        { xN = 0.499, yN = 0.810 },
        { xN = 0.491, yN = 0.799 },
        { xN = 0.496, yN = 0.791 },
        { xN = 0.500, yN = 0.790 },
        { xN = 0.502, yN = 0.785 },
        { xN = 0.503, yN = 0.782 },             
      }
    }),


    -- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    -- ██░███░█░▄▄▀██░█████░▄▄▄██░▀██░██░███░██░▄▄▄░██░▄▄▄░██░▄▄▀██
    -- ███░█░██░▀▀░██░█████░▄▄▄██░█░█░██░█░█░██░███░██░███░██░██░██
    -- ███▄▀▄██░██░██░▀▀░██░▀▀▀██░██▄░██▄▀▄▀▄██░▀▀▀░██░▀▀▀░██░▀▀░██
    -- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    -- [x] = { xN = x, yN = y }, -- 
    -- ctrl + f aid: valenwood
    
    -- Reapers March --
    [158] = { xN = 0.461, yN = 0.564 }, -- Arenthia Wayshrine
    [156] = { xN = 0.436, yN = 0.569 }, -- Fort Grimwatch Wayshrine
    [144] = { xN = 0.420, yN = 0.600 }, -- Vinedusk Wayshrine
    [157] = { xN = 0.481, yN = 0.569 }, -- Fort Sphinxmoth Wayshrine
    [371] = { xN = 0.450, yN = 0.560 }, -- Moon Hunter Keep Dungeon
    [321] = { xN = 0.483, yN = 0.579 }, -- Dawnshadow House
    [320] = { xN = 0.472, yN = 0.560 }, -- Strident Springs Demesne House

    zoneData = hackyJoin({
      zoneName = "Reaper's March",
      zoneDescription = "Once known simply as Northern Valenwood, this region that borders Cyrodiil and\n Elsweyr has seen much bloody warfare.",
      zoneID = 256,
      xN = "0.397",
      yN = "0.556",
      zonePolygonData = {
        { xN = 0.479, yN = 0.558 },
        { xN = 0.473, yN = 0.558 },
        { xN = 0.465, yN = 0.557 },
        { xN = 0.460, yN = 0.557 },
        { xN = 0.456, yN = 0.559 },
        { xN = 0.448, yN = 0.556 },
        { xN = 0.438, yN = 0.558 },
        { xN = 0.429, yN = 0.560 },
        { xN = 0.425, yN = 0.562 },
        { xN = 0.421, yN = 0.565 },
        { xN = 0.416, yN = 0.567 },
        { xN = 0.419, yN = 0.568 },
        { xN = 0.420, yN = 0.576 },
        { xN = 0.422, yN = 0.582 },
        { xN = 0.421, yN = 0.587 },
        { xN = 0.418, yN = 0.589 },
        { xN = 0.416, yN = 0.593 },
        { xN = 0.414, yN = 0.598 },
        { xN = 0.415, yN = 0.603 },
        { xN = 0.416, yN = 0.608 },
        { xN = 0.419, yN = 0.613 },
        { xN = 0.418, yN = 0.615 },
        { xN = 0.417, yN = 0.618 },
        { xN = 0.418, yN = 0.623 },
        { xN = 0.417, yN = 0.627 },
        { xN = 0.416, yN = 0.632 },
        { xN = 0.413, yN = 0.633 },
        { xN = 0.410, yN = 0.641 },
        { xN = 0.410, yN = 0.642 },
        { xN = 0.409, yN = 0.649 },
        { xN = 0.410, yN = 0.657 },
        { xN = 0.412, yN = 0.662 },
        { xN = 0.412, yN = 0.666 },
        { xN = 0.416, yN = 0.669 },
        { xN = 0.416, yN = 0.673 },
        { xN = 0.414, yN = 0.674 },
        { xN = 0.424, yN = 0.677 },
        { xN = 0.432, yN = 0.674 },
        { xN = 0.437, yN = 0.672 },
        { xN = 0.441, yN = 0.672 },
        { xN = 0.443, yN = 0.673 },
        { xN = 0.445, yN = 0.671 },
        { xN = 0.449, yN = 0.667 },
        { xN = 0.455, yN = 0.665 },
        { xN = 0.456, yN = 0.661 },
        { xN = 0.461, yN = 0.660 },
        { xN = 0.465, yN = 0.651 },
        { xN = 0.469, yN = 0.648 },
        { xN = 0.472, yN = 0.641 },
        { xN = 0.476, yN = 0.635 },
        { xN = 0.485, yN = 0.627 },
        { xN = 0.491, yN = 0.617 },
        { xN = 0.494, yN = 0.613 },
        { xN = 0.498, yN = 0.612 },
        { xN = 0.500, yN = 0.608 },
        { xN = 0.500, yN = 0.604 },
        { xN = 0.503, yN = 0.602 },
        { xN = 0.500, yN = 0.597 },
        { xN = 0.498, yN = 0.593 },
        { xN = 0.495, yN = 0.588 },
        { xN = 0.490, yN = 0.586 },
        { xN = 0.487, yN = 0.577 },
        { xN = 0.489, yN = 0.572 },
        { xN = 0.491, yN = 0.570 },
        { xN = 0.488, yN = 0.565 },
        { xN = 0.483, yN = 0.561 },
        { xN = 0.480, yN = 0.559 },        
      }
    }),

    -- Grahtwood --
    [398] = { xN = 0.463, yN = 0.717 }, -- Lair of Maarselok Dungeon 

    zoneData = hackyJoin({
      zoneName = "Grahtwood",
      zoneDescription = "This region is the southern heart of the Wood Elves' great forest, and home to more\n of the gigantic graht-oaks than any other part of Valenwood.",
      zoneID = 9,
      xN = "0.363",
      yN = "0.671",
      zonePolygonData = {
        { xN = 0.446, yN = 0.671 },
        { xN = 0.443, yN = 0.673 },
        { xN = 0.438, yN = 0.673 },
        { xN = 0.427, yN = 0.677 },
        { xN = 0.414, yN = 0.675 },
        { xN = 0.406, yN = 0.675 },
        { xN = 0.402, yN = 0.674 },
        { xN = 0.396, yN = 0.671 },
        { xN = 0.392, yN = 0.671 },
        { xN = 0.390, yN = 0.674 },
        { xN = 0.389, yN = 0.678 },
        { xN = 0.375, yN = 0.673 },
        { xN = 0.368, yN = 0.672 },
        { xN = 0.376, yN = 0.688 },
        { xN = 0.374, yN = 0.692 },
        { xN = 0.373, yN = 0.702 },
        { xN = 0.373, yN = 0.706 },
        { xN = 0.375, yN = 0.710 },
        { xN = 0.374, yN = 0.720 },
        { xN = 0.373, yN = 0.724 },
        { xN = 0.376, yN = 0.727 },
        { xN = 0.375, yN = 0.734 },
        { xN = 0.376, yN = 0.737 },
        { xN = 0.375, yN = 0.740 },
        { xN = 0.382, yN = 0.740 },
        { xN = 0.387, yN = 0.742 },
        { xN = 0.394, yN = 0.745 },
        { xN = 0.401, yN = 0.749 },
        { xN = 0.404, yN = 0.754 },
        { xN = 0.407, yN = 0.759 },
        { xN = 0.402, yN = 0.762 },
        { xN = 0.398, yN = 0.765 },
        { xN = 0.400, yN = 0.771 },
        { xN = 0.406, yN = 0.772 },
        { xN = 0.411, yN = 0.771 },
        { xN = 0.418, yN = 0.777 },
        { xN = 0.423, yN = 0.776 },
        { xN = 0.429, yN = 0.774 },
        { xN = 0.431, yN = 0.780 },
        { xN = 0.432, yN = 0.786 },
        { xN = 0.436, yN = 0.790 },
        { xN = 0.442, yN = 0.790 },
        { xN = 0.447, yN = 0.787 },
        { xN = 0.451, yN = 0.781 },
        { xN = 0.452, yN = 0.776 },
        { xN = 0.451, yN = 0.772 },
        { xN = 0.464, yN = 0.769 },
        { xN = 0.473, yN = 0.770 },
        { xN = 0.476, yN = 0.767 },
        { xN = 0.473, yN = 0.761 },
        { xN = 0.475, yN = 0.758 },
        { xN = 0.481, yN = 0.760 },
        { xN = 0.484, yN = 0.758 },
        { xN = 0.481, yN = 0.755 },
        { xN = 0.481, yN = 0.746 },
        { xN = 0.481, yN = 0.739 },
        { xN = 0.472, yN = 0.720 },
        { xN = 0.467, yN = 0.710 },
        { xN = 0.465, yN = 0.707 },
        { xN = 0.465, yN = 0.701 },
        { xN = 0.462, yN = 0.696 },
        { xN = 0.456, yN = 0.695 },
        { xN = 0.453, yN = 0.695 },
        { xN = 0.451, yN = 0.687 },
        { xN = 0.450, yN = 0.683 },
        { xN = 0.450, yN = 0.678 },
        { xN = 0.447, yN = 0.673 },        
      }
    }),

    -- Malabal Tor -- 
    [106] = { name = "Baandari Trading Post Wayshrine" }, -- Baandari Trading Post Wayshrine

    zoneData = hackyJoin({
      zoneName = "Malabal Tor",
      zoneDescription = "Malabal Tor is the northwest region of Valenwood, on the coast of the Abecean Sea and the Strid River estuary.",
      zoneID = 22,
      xN = "0.301",
      yN = "0.562",
      zonePolygonData = {
        { xN = 0.418, yN = 0.568 },
        { xN = 0.411, yN = 0.570 },
        { xN = 0.407, yN = 0.567 },
        { xN = 0.388, yN = 0.572 },
        { xN = 0.383, yN = 0.578 },
        { xN = 0.383, yN = 0.583 },
        { xN = 0.379, yN = 0.586 },
        { xN = 0.376, yN = 0.590 },
        { xN = 0.374, yN = 0.593 },
        { xN = 0.369, yN = 0.596 },
        { xN = 0.363, yN = 0.596 },
        { xN = 0.360, yN = 0.594 },
        { xN = 0.355, yN = 0.598 },
        { xN = 0.352, yN = 0.603 },
        { xN = 0.350, yN = 0.606 },
        { xN = 0.346, yN = 0.606 },
        { xN = 0.336, yN = 0.609 },
        { xN = 0.334, yN = 0.609 },
        { xN = 0.331, yN = 0.607 },
        { xN = 0.327, yN = 0.610 },
        { xN = 0.308, yN = 0.610 },
        { xN = 0.303, yN = 0.612 },
        { xN = 0.304, yN = 0.616 },
        { xN = 0.301, yN = 0.619 },
        { xN = 0.301, yN = 0.625 },
        { xN = 0.304, yN = 0.641 },
        { xN = 0.309, yN = 0.639 },
        { xN = 0.313, yN = 0.643 },
        { xN = 0.321, yN = 0.645 },
        { xN = 0.326, yN = 0.646 },
        { xN = 0.329, yN = 0.645 },
        { xN = 0.338, yN = 0.648 },
        { xN = 0.351, yN = 0.653 },
        { xN = 0.356, yN = 0.655 },
        { xN = 0.361, yN = 0.663 },
        { xN = 0.365, yN = 0.671 },
        { xN = 0.369, yN = 0.671 },
        { xN = 0.383, yN = 0.675 },
        { xN = 0.389, yN = 0.677 },
        { xN = 0.391, yN = 0.671 },
        { xN = 0.397, yN = 0.671 },
        { xN = 0.405, yN = 0.674 },
        { xN = 0.414, yN = 0.673 },
        { xN = 0.415, yN = 0.670 },
        { xN = 0.412, yN = 0.665 },
        { xN = 0.408, yN = 0.655 },
        { xN = 0.409, yN = 0.644 },
        { xN = 0.408, yN = 0.640 },
        { xN = 0.411, yN = 0.633 },
        { xN = 0.415, yN = 0.631 },
        { xN = 0.417, yN = 0.625 },
        { xN = 0.416, yN = 0.618 },
        { xN = 0.418, yN = 0.614 },
        { xN = 0.415, yN = 0.605 },
        { xN = 0.414, yN = 0.596 },
        { xN = 0.418, yN = 0.589 },
        { xN = 0.421, yN = 0.584 },
        { xN = 0.419, yN = 0.573 },
        { xN = 0.419, yN = 0.569 },       
      }
    }),

    -- Tempest Island --
    [188] = { xN = 0.283, yN = 0.604 }, -- Tempest Island Dungeon

    zoneData = hackyJoin({
      zoneName = "Tempest Island",
      zoneDescription = "This island in the Strid estuary has long been a haven for pirates, raiders,\n and fugitives from law enforcement.",
      zoneID = 292,
      xN = "0.275",
      yN = "0.596",
      zonePolygonData = {
        { xN = 0.274, yN = 0.609 },
        { xN = 0.288, yN = 0.610 },
        { xN = 0.291, yN = 0.597 },
        { xN = 0.286, yN = 0.594 },
        { xN = 0.278, yN = 0.596 },
        { xN = 0.274, yN = 0.600 },
        { xN = 0.273, yN = 0.606 },        
      }
    }),

    -- Greenshade --
    [197] = { xN = 0.356, yN = 0.674 }, -- City of Ash I Dungeon
    [268] = { xN = 0.356, yN = 0.674 }, -- City of Ash II Dungeon 

    zoneData = hackyJoin({
      zoneName = "Greenshade",
      zoneDescription = "Greenshade is a land of flowing rivers and fertile plains that occupies the southwest portion of Valenwood.",
      zoneID = 300,
      xN = "0.273",
      yN = "0.6405",
      zonePolygonData = {
        { xN = 0.375, yN = 0.740 },
        { xN = 0.368, yN = 0.747 },
        { xN = 0.358, yN = 0.753 },
        { xN = 0.346, yN = 0.753 },
        { xN = 0.339, yN = 0.751 },
        { xN = 0.339, yN = 0.747 },
        { xN = 0.328, yN = 0.743 },
        { xN = 0.321, yN = 0.745 },
        { xN = 0.314, yN = 0.742 },
        { xN = 0.309, yN = 0.736 },
        { xN = 0.304, yN = 0.737 },
        { xN = 0.297, yN = 0.735 },
        { xN = 0.296, yN = 0.729 },
        { xN = 0.292, yN = 0.726 },
        { xN = 0.287, yN = 0.721 },
        { xN = 0.284, yN = 0.714 },
        { xN = 0.283, yN = 0.706 },
        { xN = 0.280, yN = 0.689 },
        { xN = 0.281, yN = 0.682 },
        { xN = 0.282, yN = 0.676 },
        { xN = 0.287, yN = 0.671 },
        { xN = 0.290, yN = 0.671 },
        { xN = 0.292, yN = 0.664 },
        { xN = 0.291, yN = 0.662 },
        { xN = 0.286, yN = 0.659 },
        { xN = 0.285, yN = 0.653 },
        { xN = 0.291, yN = 0.651 },
        { xN = 0.297, yN = 0.647 },
        { xN = 0.305, yN = 0.641 },
        { xN = 0.310, yN = 0.640 },
        { xN = 0.312, yN = 0.643 },
        { xN = 0.318, yN = 0.646 },
        { xN = 0.324, yN = 0.647 },
        { xN = 0.330, yN = 0.647 },
        { xN = 0.340, yN = 0.650 },
        { xN = 0.351, yN = 0.654 },
        { xN = 0.355, yN = 0.656 },
        { xN = 0.359, yN = 0.660 },
        { xN = 0.362, yN = 0.667 },
        { xN = 0.364, yN = 0.671 },
        { xN = 0.368, yN = 0.672 },
        { xN = 0.371, yN = 0.680 },
        { xN = 0.374, yN = 0.686 },
        { xN = 0.373, yN = 0.691 },
        { xN = 0.372, yN = 0.706 },
        { xN = 0.374, yN = 0.711 },
        { xN = 0.374, yN = 0.716 },
        { xN = 0.373, yN = 0.721 },
        { xN = 0.372, yN = 0.725 },
        { xN = 0.375, yN = 0.729 },
        { xN = 0.374, yN = 0.735 },
        { xN = 0.375, yN = 0.737 },
        { xN = 0.375, yN = 0.739 },           
      }
    }),
    

    -- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    -- ██░▄▄▄░██░██░██░▄▀▄░██░▄▀▄░██░▄▄▄██░▄▄▀██░▄▄▄░██░▄▄▄█▄▄░▄▄███▄░▄██░▄▄▄░██░█████░▄▄▄██░▄▄▄░██
    -- ██▄▄▄▀▀██░██░██░█░█░██░█░█░██░▄▄▄██░▀▀▄██▄▄▄▀▀██░▄▄▄███░██████░███▄▄▄▀▀██░█████░▄▄▄██▄▄▄▀▀██
    -- ██░▀▀▀░██▄▀▀▄██░███░██░███░██░▀▀▀██░██░██░▀▀▀░██░▀▀▀███░█████▀░▀██░▀▀▀░██░▀▀░██░▀▀▀██░▀▀▀░██
    -- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    -- [x] = { xN = x, yN = y }, -- 
    -- ctrl + f aid: summerset isles

    -- Summerset Isle --
    [369] = { xN = 0.131, yN = 0.627 }, -- Veyond Wyte Wayshrine 
    [349] = { xN = 0.157, yN = 0.660 }, -- King's Haven Pass Wayshrine 
    [359] = { xN = 0.164, yN = 0.688 }, -- Eldbur Ruins Wayshrine
    [350] = { xN = 0.166, yN = 0.715 }, -- Shimmerene Wayshrine 
    [351] = { xN = 0.195, yN = 0.748 }, -- Sil-Var-Woad Wayshrine 
    [357] = { xN = 0.182, yN = 0.768 }, -- Eastern Pass Wayshrine
    [365] = { xN = 0.143, yN = 0.782 }, -- Sunhold Wayshrine
    [352] = { xN = 0.132, yN = 0.714 }, -- Russafield Heights Wayshrine
    [364] = { xN = 0.134, yN = 0.679 }, -- Cloudrest Trial
    [358] = { xN = 0.090, yN = 0.656 }, -- Crystal Tower Wayshrine
    [354] = { xN = 0.104, yN = 0.687 }, -- Ebon Stadmont Wayshrine
    [356] = { xN = 0.058, yN = 0.703 }, -- Lilandril Wayshrine
    [353] = { xN = 0.093, yN = 0.729 }, -- Cey-Tarn Keep Wayshrine
    [366] = { xN = 0.090, yN = 0.747 }, -- Golden Gryphon Garret House
    [355] = { xN = 0.094, yN = 0.757 }, -- Alinor Wayshrine
    [367] = { xN = 0.089, yN = 0.760 }, -- Alinor Crest Townhouse 
    [368] = { xN = 0.177, yN = 0.797 }, -- Colossal Aldmeri Grotto

    zoneData = hackyJoin({
      zoneName = "Summerset Isle",
      zoneDescription = "The land called Summerset is the birthplace of civilization and magic as we know it in Tamriel.",
      zoneID = 1349,
      xN = "0.021",
      yN = "0.6095",
      zonePolygonData = {
        { xN = 0.113, yN = 0.780 },
        { xN = 0.112, yN = 0.784 },
        { xN = 0.089, yN = 0.800 },
        { xN = 0.068, yN = 0.795 },
        { xN = 0.054, yN = 0.776 },
        { xN = 0.052, yN = 0.768 },
        { xN = 0.050, yN = 0.757 },
        { xN = 0.045, yN = 0.750 },
        { xN = 0.033, yN = 0.745 },
        { xN = 0.027, yN = 0.736 },
        { xN = 0.026, yN = 0.726 },
        { xN = 0.031, yN = 0.721 },
        { xN = 0.039, yN = 0.714 },
        { xN = 0.036, yN = 0.708 },
        { xN = 0.029, yN = 0.701 },
        { xN = 0.029, yN = 0.688 },
        { xN = 0.048, yN = 0.689 },
        { xN = 0.055, yN = 0.669 },
        { xN = 0.064, yN = 0.656 },
        { xN = 0.072, yN = 0.659 },
        { xN = 0.099, yN = 0.623 },
        { xN = 0.106, yN = 0.622 },
        { xN = 0.108, yN = 0.627 },
        { xN = 0.118, yN = 0.626 },
        { xN = 0.128, yN = 0.612 },
        { xN = 0.139, yN = 0.616 },
        { xN = 0.150, yN = 0.623 },
        { xN = 0.155, yN = 0.630 },
        { xN = 0.162, yN = 0.632 },
        { xN = 0.165, yN = 0.638 },
        { xN = 0.175, yN = 0.649 },
        { xN = 0.189, yN = 0.655 },
        { xN = 0.193, yN = 0.671 },
        { xN = 0.188, yN = 0.686 },
        { xN = 0.182, yN = 0.693 },
        { xN = 0.184, yN = 0.702 },
        { xN = 0.188, yN = 0.712 },
        { xN = 0.177, yN = 0.720 },
        { xN = 0.208, yN = 0.744 },
        { xN = 0.207, yN = 0.765 },
        { xN = 0.218, yN = 0.778 },
        { xN = 0.216, yN = 0.786 },
        { xN = 0.208, yN = 0.799 },
        { xN = 0.196, yN = 0.807 },
        { xN = 0.177, yN = 0.811 },
        { xN = 0.154, yN = 0.802 },
        { xN = 0.134, yN = 0.788 },
        { xN = 0.125, yN = 0.795 },
        { xN = 0.119, yN = 0.789 },
        { xN = 0.120, yN = 0.784 },
        { xN = 0.116, yN = 0.781 },           
      }
    }),

    -- Auridon --
    [194] = { xN = 0.185, yN = 0.594 }, -- Banished Cells I Dungeon 
    [262] = { xN = 0.185, yN = 0.594 }, -- Banished Cells II Dungeon 
    [175] = { xN = 0.192, yN = 0.619 }, -- Firsthold Wayshrine 
    [124] = { xN = 0.177, yN = 0.626 }, -- Greenwater Wayshrine 
    [123] = { xN = 0.218, yN = 0.631 }, -- College Wayshrine 
    [122] = { xN = 0.231, yN = 0.648 }, -- Quendeluun Wayshrine
    [121] = { xN = 0.237, yN = 0.662 }, -- Skywatch Wayshrine 
    [176] = { xN = 0.219, yN = 0.674 }, -- Mathiisen Wayshrine 
    [174] = { xN = 0.221, yN = 0.698 }, -- Tanzelwil Wayshrine
    [178] = { xN = 0.232, yN = 0.706 }, -- Phaer Wayshrine 
    [127] = { xN = 0.222, yN = 0.715 }, -- Windy Glade Wayshrine
    [288] = { xN = 0.236, yN = 0.725 }, -- Mara's Kiss Public House 
    [211] = { xN = 0.247, yN = 0.730 }, -- The Harborage 
    [177] = { xN = 0.237, yN = 0.728 }, -- Vulkhel Guard Wayshrine
    [315] = { xN = 0.231, yN = 0.688 }, -- Mathiisen Manor House
    [285] = { xN = 0.245, yN = 0.668 }, -- Barbed Hook Private Room House

    zoneData = hackyJoin({
      zoneName = "Auridon",
      zoneDescription = "The second largest of the Summerset Isles, Auridon has always served the High Elves as a\n buffer between their serene archipelago and the turmoil of Tamriel.",
      zoneID = 143,
      xN = "0.1395",
      yN = "0.5855",
      zonePolygonData = {
        { xN = 0.220, yN = 0.737 },
        { xN = 0.241, yN = 0.744 },
        { xN = 0.249, yN = 0.737 },
        { xN = 0.255, yN = 0.727 },
        { xN = 0.255, yN = 0.713 },
        { xN = 0.253, yN = 0.701 },
        { xN = 0.248, yN = 0.690 },
        { xN = 0.253, yN = 0.684 },
        { xN = 0.253, yN = 0.673 },
        { xN = 0.259, yN = 0.667 },
        { xN = 0.261, yN = 0.670 },
        { xN = 0.267, yN = 0.674 },
        { xN = 0.275, yN = 0.671 },
        { xN = 0.278, yN = 0.664 },
        { xN = 0.276, yN = 0.656 },
        { xN = 0.269, yN = 0.655 },
        { xN = 0.257, yN = 0.655 },
        { xN = 0.247, yN = 0.650 },
        { xN = 0.245, yN = 0.631 },
        { xN = 0.244, yN = 0.625 },
        { xN = 0.231, yN = 0.610 },
        { xN = 0.218, yN = 0.599 },
        { xN = 0.199, yN = 0.595 },
        { xN = 0.197, yN = 0.591 },
        { xN = 0.183, yN = 0.584 },
        { xN = 0.177, yN = 0.585 },
        { xN = 0.173, yN = 0.592 },
        { xN = 0.176, yN = 0.598 },
        { xN = 0.169, yN = 0.595 },
        { xN = 0.159, yN = 0.598 },
        { xN = 0.158, yN = 0.608 },
        { xN = 0.160, yN = 0.616 },
        { xN = 0.165, yN = 0.626 },
        { xN = 0.169, yN = 0.632 },
        { xN = 0.171, yN = 0.641 },
        { xN = 0.175, yN = 0.644 },
        { xN = 0.180, yN = 0.640 },
        { xN = 0.184, yN = 0.645 },
        { xN = 0.188, yN = 0.649 },
        { xN = 0.200, yN = 0.645 },
        { xN = 0.205, yN = 0.664 },
        { xN = 0.200, yN = 0.674 },
        { xN = 0.197, yN = 0.687 },
        { xN = 0.192, yN = 0.688 },
        { xN = 0.192, yN = 0.693 },
        { xN = 0.199, yN = 0.707 },
        { xN = 0.207, yN = 0.715 },
        { xN = 0.210, yN = 0.723 },
        { xN = 0.216, yN = 0.733 },
        { xN = 0.229, yN = 0.741 },
        { xN = 0.244, yN = 0.739 },                
      }
    }),
    
    -- Eyevea --
    [215] = { xN = 0.070, yN = 0.600, disabled = false }, -- Eyevea Wayshrine

    zoneData = hackyJoin({
      zoneName = "Eyevea",
      zoneDescription = "Originally an island belonging to the Summerset Isles, Eyevea now serves as the home of the Mages Guild.",
      zoneID = 108,
      xN = "0.061",
      yN = "0.590",
      zonePolygonData = {
        { xN = 0.061, yN = 0.607 },
        { xN = 0.059, yN = 0.604 },
        { xN = 0.059, yN = 0.596 },
        { xN = 0.062, yN = 0.590 },
        { xN = 0.068, yN = 0.589 },
        { xN = 0.077, yN = 0.590 },
        { xN = 0.080, yN = 0.596 },
        { xN = 0.082, yN = 0.603 },
        { xN = 0.079, yN = 0.608 },
        { xN = 0.065, yN = 0.609 },           
      }
    }),

  },

-- ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████
-- ███████  ████████   █████   █        █████     █████   ███      █████████   ███████   ███████  ████████        ███
-- ██████     ██████   █████   █   ████   ███  ██   ███   █   ████   ███████      ██     ██████     ██████   ████   █
-- █████  ██   █████   █████   █   ████   ███  ███   ██   ██   █████████████   █     █   █████  ██   █████   ████   █
-- ████   ███   ████   █████   █       ██████       ███   ████    ██████████   ██   ██   ████   ███   ████        ███
-- ███           ███   █████   █   ██   █████  ████   █   ███████   ████████   ███  ██   ███           ███   ████████
-- ██   ███████   ██   █████   █   ████   ███  █████  █   █   ████   ███████   ███████   ██   ███████   ██   ████████
-- █   █████████   ███       ███   ██████   █        ██   ███      █████████   ███████   █   █████████   █   ████████
-- ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████
-- ctrl + f aid: aurbis map

  [439] = { -- Aurbis Map 

    isExclusive = true,

    -- Tamriel --
    zoneData = hackyJoin({
      zoneName = "Tamriel",
      zoneDescription = "In the ancient tongues, the land called 'Tamriel' means 'Dawn's Beauty'.",
      zoneID = 27,
      xN = "0.196",
      yN = "0.2045",
      zonePolygonData = {
        { xN = 0.238, yN = 0.678 },
        { xN = 0.220, yN = 0.630 },
        { xN = 0.236, yN = 0.569 },
        { xN = 0.244, yN = 0.536 },
        { xN = 0.229, yN = 0.513 },
        { xN = 0.232, yN = 0.452 },
        { xN = 0.240, yN = 0.407 },
        { xN = 0.258, yN = 0.392 },
        { xN = 0.276, yN = 0.361 },
        { xN = 0.304, yN = 0.333 },
        { xN = 0.340, yN = 0.309 },
        { xN = 0.378, yN = 0.311 },
        { xN = 0.424, yN = 0.302 },
        { xN = 0.472, yN = 0.297 },
        { xN = 0.494, yN = 0.307 },
        { xN = 0.523, yN = 0.312 },
        { xN = 0.558, yN = 0.311 },
        { xN = 0.595, yN = 0.312 },
        { xN = 0.626, yN = 0.321 },
        { xN = 0.643, yN = 0.326 },
        { xN = 0.658, yN = 0.335 },
        { xN = 0.683, yN = 0.351 },
        { xN = 0.711, yN = 0.341 },
        { xN = 0.741, yN = 0.330 },
        { xN = 0.765, yN = 0.344 },
        { xN = 0.765, yN = 0.365 },
        { xN = 0.765, yN = 0.387 },
        { xN = 0.742, yN = 0.394 },
        { xN = 0.754, yN = 0.426 },
        { xN = 0.755, yN = 0.455 },
        { xN = 0.746, yN = 0.479 },
        { xN = 0.732, yN = 0.515 },
        { xN = 0.733, yN = 0.555 },
        { xN = 0.718, yN = 0.568 },
        { xN = 0.719, yN = 0.585 },
        { xN = 0.727, yN = 0.621 },
        { xN = 0.712, yN = 0.648 },
        { xN = 0.701, yN = 0.680 },
        { xN = 0.666, yN = 0.702 },
        { xN = 0.585, yN = 0.699 },
        { xN = 0.508, yN = 0.693 },
        { xN = 0.435, yN = 0.691 },
        { xN = 0.373, yN = 0.688 },
        { xN = 0.304, yN = 0.697 },
        { xN = 0.247, yN = 0.686 },                 
      }
    }, true),

    -- Blackreach --
    zoneData = hackyJoin({
      zoneName = "Blackreach",
      zoneDescription = "Blackreach, a legendary and long-forgotten realm that extends beneath Skyrim - and perhaps beyond.",
      blobTexture = "AccurateWorldMap/blobs/blob-realm.dds",
      zoneID = 1782,
      xN = "0.355",
      yN = "0.099",
      zonePolygonData = {
        { xN = 0.387, yN = 0.236 },
        { xN = 0.468, yN = 0.235 },
        { xN = 0.491, yN = 0.201 },
        { xN = 0.495, yN = 0.144 },
        { xN = 0.470, yN = 0.108 },
        { xN = 0.427, yN = 0.091 },
        { xN = 0.390, yN = 0.095 },
        { xN = 0.357, yN = 0.132 },
        { xN = 0.347, yN = 0.163 },
        { xN = 0.355, yN = 0.200 },
        { xN = 0.375, yN = 0.230 },             
      }
    }),

    -- Clockwork City --
    zoneData = hackyJoin({
      zoneName = "Clockwork City",
      zoneDescription = "The Clockwork City is said to be a great and intricate mechanism that replicates Nirn as a metallic miniature.",
      blobTexture = "AccurateWorldMap/blobs/blob-realm.dds",
      zoneID = 1313,
      xN = "0.625",
      yN = "0.140",
      zonePolygonData = {
        { xN = 0.713, yN = 0.142 },
        { xN = 0.740, yN = 0.158 },
        { xN = 0.755, yN = 0.178 },
        { xN = 0.762, yN = 0.199 },
        { xN = 0.759, yN = 0.229 },
        { xN = 0.749, yN = 0.253 },
        { xN = 0.729, yN = 0.270 },
        { xN = 0.699, yN = 0.281 },
        { xN = 0.666, yN = 0.274 },
        { xN = 0.638, yN = 0.253 },
        { xN = 0.627, yN = 0.230 },
        { xN = 0.622, yN = 0.208 },
        { xN = 0.626, yN = 0.182 },
        { xN = 0.644, yN = 0.160 },
        { xN = 0.668, yN = 0.143 },
        { xN = 0.696, yN = 0.139 },
        { xN = 0.704, yN = 0.138 },                    
      }
    }),

    -- The Deadlands --
    zoneData = hackyJoin({
      zoneName = "The Deadlands",
      zoneDescription = "The Deadlands is Mehrunes Dagon's realm of unending destruction, fire and storm and disaster personified.",
      blobTexture = "AccurateWorldMap/blobs/blob-realm.dds",
      zoneID = 2021,
      xN = "0.768",
      yN = "0.583",
      zonePolygonData = {
        { xN = 0.834, yN = 0.719 },
        { xN = 0.871, yN = 0.713 },
        { xN = 0.897, yN = 0.689 },
        { xN = 0.906, yN = 0.648 },
        { xN = 0.889, yN = 0.606 },
        { xN = 0.856, yN = 0.583 },
        { xN = 0.823, yN = 0.583 },
        { xN = 0.780, yN = 0.604 },
        { xN = 0.769, yN = 0.629 },
        { xN = 0.767, yN = 0.662 },
        { xN = 0.775, yN = 0.686 },
        { xN = 0.787, yN = 0.702 },
        { xN = 0.814, yN = 0.716 },                     
      }
    }),

    -- Fargrave --
    zoneData = hackyJoin({
      zoneName = "Fargrave",
      zoneDescription = "The princeless realm of Fargrave is known as 'The Celestial Palanquin' - a place where mortal\n and Daedra alike are free to do whatever they please.",
      blobTexture = "AccurateWorldMap/blobs/blob-realm.dds",
      zoneID = 2119,
      xN = "0.653",
      yN = "0.720",
      zonePolygonData = {
        { xN = 0.722, yN = 0.859 },
        { xN = 0.753, yN = 0.854 },
        { xN = 0.781, yN = 0.829 },
        { xN = 0.792, yN = 0.784 },
        { xN = 0.780, yN = 0.749 },
        { xN = 0.751, yN = 0.726 },
        { xN = 0.709, yN = 0.719 },
        { xN = 0.674, yN = 0.734 },
        { xN = 0.649, yN = 0.767 },
        { xN = 0.652, yN = 0.805 },
        { xN = 0.664, yN = 0.835 },
        { xN = 0.700, yN = 0.855 },               
      }
    }),

    -- Artaeum --
    zoneData = hackyJoin({
      zoneName = "Artaeum",
      zoneDescription = "Home to the Psijic Order, this island was formerly part of the Summerset Isles, but disappeared\noff Nirn 350 years ago under mysterious circumstances.",
      blobTexture = "AccurateWorldMap/blobs/blob-realm.dds",
      zoneID = 1429,
      xN = "0.300",
      yN = "0.757",
      zonePolygonData = {
        { xN = 0.344, yN = 0.896 },
        { xN = 0.379, yN = 0.896 },
        { xN = 0.407, yN = 0.882 },
        { xN = 0.430, yN = 0.859 },
        { xN = 0.438, yN = 0.835 },
        { xN = 0.431, yN = 0.793 },
        { xN = 0.414, yN = 0.772 },
        { xN = 0.387, yN = 0.759 },
        { xN = 0.359, yN = 0.754 },
        { xN = 0.324, yN = 0.768 },
        { xN = 0.302, yN = 0.792 },
        { xN = 0.294, yN = 0.819 },
        { xN = 0.300, yN = 0.858 },
        { xN = 0.311, yN = 0.874 },
        { xN = 0.333, yN = 0.888 },                
      }
    }),

    -- Coldharbour --
    zoneData = hackyJoin({
      zoneName = "Coldharbour",
      zoneDescription = "The dreadful Oblivion plane of Coldharbour is Molag Bal's realm of death, despair, and infinite cruelty.",
      blobTexture = "AccurateWorldMap/blobs/blob-realm.dds",
      zoneID = 255,
      xN = "0.097",
      yN = "0.289",
      zonePolygonData = {
        { xN = 0.172, yN = 0.289 },
        { xN = 0.190, yN = 0.292 },
        { xN = 0.210, yN = 0.305 },
        { xN = 0.227, yN = 0.328 },
        { xN = 0.233, yN = 0.362 },
        { xN = 0.218, yN = 0.404 },
        { xN = 0.196, yN = 0.420 },
        { xN = 0.160, yN = 0.429 },
        { xN = 0.129, yN = 0.422 },
        { xN = 0.107, yN = 0.397 },
        { xN = 0.097, yN = 0.373 },
        { xN = 0.096, yN = 0.334 },
        { xN = 0.108, yN = 0.313 },
        { xN = 0.130, yN = 0.300 },
        { xN = 0.152, yN = 0.290 },
        { xN = 0.172, yN = 0.288 },                        
      }
    }),

  }, 
  

-- ███████████████████████████████████████████████████████████████████████████████████████████████████
-- █   ███████   █   ███      ███████   ██████████   ███████   ███████  ████████        █████      ███
-- █      ██     █   █   ████   ██    █    ███████      ██     ██████     ██████   ████   █   ████   █
-- █   █     █   █   ██   ███████   ██████████████   █     █   █████  ██   █████   ████   ██   ███████
-- █   ██   ██   █   ████   █████   ██████████████   ██   ██   ████   ███   ████        ██████   █████
-- █   ███  ██   █   ███████   ██   ██████████████   ███  ██   ███           ███   █████████████    ██
-- █   ███████   █   █   ████   ██   ███   ███████   ███████   ██   ███████   ██   ████████   ████   █
-- █   ███████   █   ███      ██████     █████████   ███████   █   █████████   █   ██████████      ███
-- ███████████████████████████████████████████████████████████████████████████████████████████████████
-- ctrl + f aid: misc maps

  [16] = {  -- Cyrodiil PVP Map --
    [202] = { name = "Northern Morrowind Gate Wayshrine" }, -- Northern Morrowind Wayshrine
    [203] = { name = "Southern Morrowind Gate Wayshrine" }, -- Southern Morrowind Wayshrine
    [170] = { name = "Northern Hammerfell Gate Wayshrine" }, -- Northern Hammerfell Wayshrine
    [199] = { name = "Southern Hammerfell Gate Wayshrine" }, -- Southern Hammerfell Wayshrine
    [200] = { name = "Eastern Elsweyr Gate Wayshrine" }, -- Eastern Elsweyr Wayshrine
    [201] = { name = "Western Elsweyr Gate Wayshrine" }, -- Western Elsweyr Wayshrine
    [236] = { xN = 0.523, yN = 0.382 }, -- Imperial City Prison Dungeon
    [247] = { xN = 0.497, yN = 0.428 }, -- White Gold Tower Dungeon
  },

  [22] = { -- Malabal Tor Map
    [106] = { name = "Baandari Trading Post Wayshrine" }, -- Baandari Trading Post Wayshrine
  },

  [282] = { -- Baandari Trading Post Map
    [106] = { name = "Baandari Trading Post Wayshrine" }, -- Baandari Trading Post Wayshrine
  },

  [1429] = { -- Artaeum Map Map 
    [373] = { xN = 0.299, yN = 0.857 }, -- Grand Psijic Villa House
  },

  [1719] = { -- Western Skyrim Map 
    [434] = { xN = 0.442, yN = 0.193 }, -- Kyne's Aegis
  },

  [1814] = { -- The Reach Map 
    [221] = { xN = 0.084, yN = 0.460, disabled = false }, -- The Earth Forge Wayshrine
  },
}

-------------------------------------------------------------------------------
-- Custom map tiles
-------------------------------------------------------------------------------

-- Data tables of custom map tiles that are used in the addon

-------------------------------------------------------------------------------

tamriel_tiles = { -- tamriel world map map tiles
  "Art/maps/tamriel/Tamriel_0.dds",
  "Art/maps/tamriel/Tamriel_1.dds",
  "Art/maps/tamriel/Tamriel_2.dds",
  "Art/maps/tamriel/Tamriel_3.dds",
  "Art/maps/tamriel/Tamriel_4.dds",
  "Art/maps/tamriel/Tamriel_5.dds",
  "Art/maps/tamriel/Tamriel_6.dds",
  "Art/maps/tamriel/Tamriel_7.dds",
  "Art/maps/tamriel/Tamriel_8.dds",
  "Art/maps/tamriel/Tamriel_9.dds",
  "Art/maps/tamriel/Tamriel_10.dds",
  "Art/maps/tamriel/Tamriel_11.dds",
  "Art/maps/tamriel/Tamriel_12.dds",
  "Art/maps/tamriel/Tamriel_13.dds",
  "Art/maps/tamriel/Tamriel_14.dds",
  "Art/maps/tamriel/Tamriel_15.dds",
}

aurbis_tiles = { -- the "cosmic", or aurbis, custom map tiles
  "Art/maps/tamriel/mundus_base_0.dds",
  "Art/maps/tamriel/mundus_base_1.dds",
  "Art/maps/tamriel/mundus_base_2.dds",
  "Art/maps/tamriel/mundus_base_3.dds",
}