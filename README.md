# zsh-dotfiles
Personal zsh configuration for macOS. Auto-configures based on what's available locally.

## Installation

Run the following in a terminal:

```sh
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/micah-yeager/zsh-dotfiles/main/install.zsh)"
```

## Features

### Supported auto-configurations

- [eza](https://eza.rocks/)
- [Homebrew](https://brew.sh/)
- [Neon](https://neon.tech/docs/reference/neon-cli)
- [nvm](https://github.com/nvm-sh/nvm)
- [Oh My Zsh](https://ohmyz.sh/)
- [Spaceship](https://spaceship-prompt.sh/)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

### Aliases

#### `freeport`

> Aliases: `fp`

Finds and kills the process using the provided port.

Usage:

```sh
freeport 80
```

#### `kubectlgetall`

> Aliases: `kga`

Finds all resources across all namespaces using `kubectl`.

Usage:

```sh
kubectlgetall
```

## Troubleshooting

Add the following variable to `~/.zshenv`:

```sh
export DOT_FILES_DEBUG=true
```

On the next `.zshrc` execution, any skipped items will be called out.
