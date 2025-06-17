# My own Dotfiles

    The old dotfiles still exists inside `./old` but it needs to be updated and I should choose what tool I will use to manage those files like stow.

    Nix is great and all but it is also immutable like in functional languages. But that is a problem for me. My workspace is not pure, nor functional, it is messy and ever changing. I change the way I do things, I change my colorscheme, I change everything everytime. It's like a living organism, and I like it that way. While using nix I percieved that my favorite tools will break, like Emacs and Neovim, it is all of sudden, not extensible anymore. I see this as a good thing and a bad thing. I have a problem that I am always changing things in my workspace instead of getting work done. And using nix to manage those files that I change a lot, make changing them more difficult, and it's easier to focus in my work. The bad thing is that it's harder to get that living and adapting environment, that with time changes with my needs, because with nix it is frozen.

    So I stopped using Nix to manage my dotfiles, now I'm using chezmoi to manage my dotfiles, and I am using Nix to manage my packages.

## How to use

    To use this dotfiles, you can just run the following command:

```bash
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

    So, it will install and run chezmoi, it is awesome.
    I'm learning new things everyday.


ah and yes.

### Nix is awesome!
