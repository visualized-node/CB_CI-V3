local Thread = {}

Thread.__index = Thread

local CB_CI = script.Parent.Parent
local Types, Settings, Logger, CEnum = require(CB_CI.Types), require(CB_CI.Settings), require(CB_CI.internals.Logger),  require(CB_CI.interfaces.CommandEnums)

function Thread.RegisterBasicThread(Callback: Types.AnyCallback, ...)
    local ThisThread = {}

    setmetatable(ThisThread, Thread)

    ThisThread.Type = 0
    ThisThread.Callback = Callback
    ThisThread.Args = ...

    return ThisThread
end

function Thread.RegisterRoutineThread(Callback: Types.AnyCallback, ...)
    local ThisThread = {}

    setmetatable(ThisThread, Thread)

    ThisThread.Type = 1
    ThisThread.Callback = Callback
    ThisThread.RunningThread = nil
    ThisThread.Args = ...

    return ThisThread
end

function Thread.Try(Callback: Types.AnyCallback, Args: any, CatchesException: Types.IBoolean)
    local R, Error = pcall(function()
        Callback(Args)
    end)

    if Error and CatchesException then
        return Error
    end

    return
end

function Thread:Run()
    if self.Type == 0 then
        spawn(Thread.Try(self.Callback, self.Args, false))

        return
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

        self.RunningThread = coroutine.create(Thread.Try(self.Callback, self.Args, true))

        coroutine.resume(self.RunningThread)

        return self.RunningThread
    end

    return nil
end

return Thread