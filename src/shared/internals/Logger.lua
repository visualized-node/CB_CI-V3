local Logger = {}

local CB_CI = script.Parent.Parent
local Types = require(CB_CI.Types)

function Logger.Log(...)
    print(table.concat({...}, " "))
end

function Logger.LogE(sep: string, ...)
    print(table.concat({...}, sep))
end

function Logger.LogW(filename: string, ...)
    print(filename, " (W) ", table.concat({...}, " "))
end

function Logger.LogWE(filename: string, sep: string, ...)
    print(filename, " (W) ", table.concat({...}, sep))
end

function Logger.Att(...)
    warn(table.concat({...}, " "))
end

function Logger.AttE(sep: string, ...)
    warn(table.concat({...}, sep))
end

function Logger.AttW(filename: string, ...)
    warn(filename, " (W) ", table.concat({...}, " "))
end

function Logger.AttWE(filename: string, sep: string, ...)
    warn(filename, " (W) ", table.concat({...}, sep))
end

function Logger.Exc(...)
    error(table.concat({...}, " "))
end

function Logger.ExcE(sep: string, ...)
    error(table.concat({...}, sep))
end

function Logger.ExcW(filename: string, ...)
    local o = filename ..  " (W) " .. table.concat({...}, " ")

    error(o)
end

function Logger.ExcWE(filename: string, sep: string, ...)
    local o = filename .. " (W) " .. table.concat({...}, sep)
    
    error(o)
end

return Logger