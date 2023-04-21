local CommandEnums = {
    CommandType = {
        COMMAND_GENERIC = 0,
        COMMAND_U = 1,
        ADDON = 2
    },

    Permissions = {
        UNKNOWN = -1, -- don't mind this :)
        NORMAL = 0, -- Normal, Utilitary and bland commands like /reset
        FUN = 1, -- Fun / Exclusive commands. Commands that are exclusive to VIPs like /particle, ...
        MODERATION = 2, -- Base Moderation. Examples are /kick or /mute
        A_MOD = 3, -- Advanced Moderation. Unlocks powerful commands like /ban that regard moderation of servers
        AA_MOD = 4 -- Server Handler / Owner
    },

    Errors = {
        [0x00] = "Unknown.", -- also don't mind this
        SUCCESS = "Successfully ran Operation.",
        INSUFFICIENT_PERMS = "Insufficient Permissions to run this Command!",
        QUERY_UNKNOWN = "Could not retrieve a Value from provided query!",
        PLAYER_NF = "Could not find a Player with given query!",
        CHAR_NF = "Could not find a Character with given query!",
        QID_NF = "Could not find valid Players that follow the QID given!",
        CMD_UNKNOWN_ERROR = "An unexpected error happened.",
        CMD_FEWARGS = "Expected a bigger number of Arguments!",
        CMD_TMARGS = "Too Many Arguments!",
        CMD_UE_ARGS = "Unexpected Error happened regarding Arguments!",
        THREAD_REQUIRESSTOP = "RoutineThread is set to require its users to stop the Running Thread before running a new thread!"
    }
}

return CommandEnums