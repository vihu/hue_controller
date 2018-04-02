# HueController

- Set some predefined scenes for Philips hue lights
- My personal preferences
- Do not request any new scenes, clone and add your own please

# Pre-requisites

- Find your hue bridge ip address (look in your router's device list or nmap)
- Refer to [huex docs](https://github.com/xavier/huex) for finding how to get your hue bridge username (do once and forget)

# Installation

```
$ git clone [this repo]
$ cd hue_controller
$ export HUE_IP="ipofyourhuebridge"
$ export HUE_USERNAME="usernameofyourhuebridge"
$ mix deps.get; mix compile; mix escript.build
```
*Tested on Elixir 1.6.4+*

# Help

In the folder containing the `hue_controller` escript:

```
$ ./hue_controller --help
```

# Examples

In the folder containing the `hue_controller` escript:

```
$ ./hue_controller --night
$ ./hue_controller --relax
$ ./hue_controller --day
```

# References

- [Huex](https://github.com/xavier/huex)
