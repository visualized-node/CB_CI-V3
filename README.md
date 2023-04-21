# CB_CI-V3

# !! A REWRITE IS ON-GOING, PLEASE REFRAIN FROM INSTALLING ANY OUTDATED RELEASES !! (ESTIMATED DEADLINE 18/05/2023, REMEMBER THAT THIS IS A DEADLINE AND NOT A RELEASE DATE)

CB_CI V3 is the third rewrite of my Command Module: "CB_CI"
It improves every aspect of its predecessors, adding more features and improving the quality of the module by a lot.

## Information, Usage, More...

All the information, usage, installation tutorials are found in the [Wiki](https://github.com/visualized-node/CB_CI-V3/wiki) of the project!

## Features

(✔️ Done, 🟠 Rolling-Out / To Finish / WIP, ⚪ TODO, ❌ May release in near future)

- 🟠 Commands, Command Parsing:
  CB_CI parses commands in a fast way by subdividing the string into multiple parts, it allows for usage of a different Prefix, Argument Separator.
  Commands are easier to implement and maintain since the Commands module provides a CommandBuilder where you can input everything you need in your command (current arguments of CommandBuilder.new: Name, Permission, Callback. Settings are oncoming)
- ✔️ Permissions and Permission Groups:
  With CB_CI you can create your own permissions and permission groups by using the **builders/PermissionGroupBuilder** or **Permission** Modules!
- 🟠 Settings:
  With the settings you can customize more than just basic aspects of the Module, you can manipulate more than just a few values. It allows for full pledged customization of aspects of the module without having to know how to script!
- ⚪ Commands Addons:
  CB_CI implements an Addon API for you to use in your commands; create your own Addon and use it in your commands by calling AddonApi.GetAddon(AddonName) or get a list of addons using AddonApi.GetAddons()!
- ❌ UI:
  CB_CI has the ability to give out UI to certain permissiongroups when joining (requires calling a function on join!)
- 🟠 Different Types of Commands:
  CB_CI offers a variety of different commands by default, varying from Fun commands all the way to utilitary commands and moderation commands. (ex. /walkeffect: Fun, /kick: Moderation, /reset: Utilitary)
