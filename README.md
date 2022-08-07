# .dotfiles

My personal dot env files managed with `stow`.

## How to install stow

```bash
brew install stow
```

## How to add a new configuration file

In order to add a new config file you have to create a new folder inside this repository, and
mimic the project structure of your home directory. So for example:

```bash
git/.config
└── git
    └── ignore
```

Then you can run `stow` command to link the files.

```bash
# -n flag is useful to check if we're linking the right files.
stow --adopt -nvt ~/.config .config
```

**Note**: watch this awesome [tutorial](https://www.youtube.com/watch?v=CFzEuBGPPPg) to learn more.

## How to install depot_tools

[depot_tools](https://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools_tutorial.html)
