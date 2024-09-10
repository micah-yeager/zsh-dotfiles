# zsh-dotfiles
Personal zsh configuration for macOS. Auto-configures based on what's available locally.

## Installation

Run the following in a terminal:

```console
$ curl "https://raw.githubusercontent.com/micah-yeager/zsh-dotfiles/main/install.zsh" | zsh 
```

## Troubleshooting

Add the following variable to `~/.zshenv`:

```sh
export DOT_FILES_DEBUG=true
```

On the next `.zshrc` execution, any skipped items will be called out.
