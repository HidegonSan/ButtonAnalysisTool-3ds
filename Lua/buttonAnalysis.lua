-- Function to reverse an array
-- Code by : https://gist.github.com/balaam/3122129
function reverseTable(t)
    local reversedTable = {}
    local itemCount = #t
    for k, v in ipairs(t) do
      reversedTable[itemCount + 1 - k] = v
    end
    return reversedTable
end
-- End code (copy) thanks!


-- Function to convert button code
-- (C) 2021 Hidegon
function buttonAnalysis(code)

    -- fix the format
    local code = code:sub(1, 3) .. "0" .. code:sub(5, 8)

    if tonumber(code:sub(5, 5), 16) < 4 then
     code = code:sub(1, 4) .. "0" .. code:sub(6, 8)
    end

    local baseCode = tonumber(code, 16)
    local ret = {}
    local codes = {}
    local buttons = {}

    codes = {
      0x80000000,  -- CD
      0x40000000,  -- CU
      0x20000000,  -- CL
      0x10000000,  -- CR
      0x8000000,  -- SD
      0x4000000,  -- SU
      0x2000000,  -- SL
      0x1000000,  -- SR
      0x100000,  -- Touch
      0x8000,  -- ZR
      0x4000,  -- ZL
      0x800,  -- Y
      0x400,  -- X
      0x200,  -- L
      0x100,  -- R
      0x80,  -- ↓
      0x40,  -- ↑
      0x20,  -- ←
      0x10,  -- →
      0x8,  -- Start
      0x4,  -- Select
      0x2,  -- B
      0x1,  -- A
    }

    buttons = {
      "CD",
      "CU",
      "CL",
      "CR",
      "SD",
      "SU",
      "SL",
      "SR",
      "Touch",
      "ZR",
      "ZL",
      "Y",
      "X",
      "L",
      "R",
      "↓",
      "↑",
      "←",
      "→",
      "Start",
      "Select",
      "B",
      "A",
    }

    for i = 1, 23 do
      if baseCode >= codes[i] then
        baseCode = baseCode - codes[i]
        table.insert(ret, buttons[i])
      end
    end

    return table.concat(reverseTable(ret), " + ")
end
