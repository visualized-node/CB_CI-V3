local Settings = {
    -- Command-Related

    Prefix = "/", -- Prefix of a Command. (Example: /help)
    ARG_SEP = " ", -- Argument Separator / Spacer. Defines the character in between different Command Arguments
    
    -- Nerdy Settings

    Force_RoutineThread_Stop = true -- Forces the user to stop the RunningThread thread before running another thread (internals/Thread.lua)
}

return Settings