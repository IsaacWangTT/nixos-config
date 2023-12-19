{
  fastfetch = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "source": "nixos_small"
      },
      "display": {
        "separator": " • "
      },
      "modules": [
        {
          "type": "os",
          "key": " ",
          "keyColor": "bright_white",
          "format": "{3}"
        },
        {
          "type": "kernel",
          "key": " ",
          "keyColor": "bright_yellow"
        },
        {
          "type": "packages",
          "key": " ",
          "keyColor": "bright_green"
        },
        {
          "type": "shell",
          "key": " ",
          "keyColor": "red",
          "format": "{3}"
        },
        {
          "type": "wm",
          "key": " ",
          "keyColor": "green"
        },
        {
          "type": "terminal",
          "key": " ",
          "keyColor": "bright_red",
          "format": "{3}"
        },
        {
          "type": "memory",
          "key": "󰍛 ",
          "keyColor": "yellow"
        }
      ]
    }
  '';
}
