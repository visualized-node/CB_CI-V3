local Thread = {}

Thread.__index = Thread

local CB_CI = script.Parent.Parent
local Types, Settings, Logger, CEnum = require(CB_CI.Types), require(CB_CI.Settings), require(CB_CI.internals.Logger),  require(CB_CI.interfaces.CommandEnums)

function Thread.RegisterBasicThread(Callback: Types.AnyCallback)
    local ThisThread = {}

    setmetatable(ThisThread, Thread)

    ThisThread.Type = 0
    ThisThread.Callback = Callback

    return ThisThread
end

function Thread.RegisterRoutineThread(Callback: Types.AnyCallback)
    local ThisThread = {}

    setmetatable(ThisThread, Thread)

    ThisThread.Type = 1
    ThisThread.Callback = Callback
    ThisThread.RunningThread = nil

    return ThisThread
end

function Thread.Try(Callback: Types.AnyCallback, CatchesException: Types.IBoolean)
    local R, Error = pcall(Callback)

    if Error and CatchesException then
        return Error
    end
end

function Thread:Run()
    if self.Type == 0 then
        spawn(Thread.Try(self.Callback, false))
    elseif self.Type == 1 then
        -- could make this better but idrc xd

        if self.RunningThread and Settings.Force_RoutineThread_Stop then
            Logger.ExcW(script.Parent.Name, CEnum.Errors.THREAD_REQUIRESSTOP)

            return
        end

        if self.RunningThread then
            coroutine.close(self.RunningThread)
            self.RunningThread = nil
        end

        self.RunningThread = coroutine.create(Thread.Try(self.Callback, true))

        coroutine.resume(self.RunningThread)
    end
end

return Thread