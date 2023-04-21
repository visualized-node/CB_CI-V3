export type GenericPermission = number
export type IBoolean = boolean?
export type TPlayers = {Player}
export type TStrings = {string}
export type TNumber = {number}
export type CommandInterface = {
    CommandName: string,
    MinPermission: number,
    Callback: (Player, {string}) -> any
}
export type CommandCallback = (Player, {string}) -> any
export type AnyCallback = (any) -> any

return nil