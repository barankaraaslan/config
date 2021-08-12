# config

This script is a wrapper aroung git for ["dotfile management with bare git repo"](https://www.atlassian.com/git/tutorials/dotfiles). 
It is also inspired by [stow](https://www.gnu.org/software/stow/) and uses the **package** terminology of stow.

Each package is seperate git repo that tracks configuration files for a software.
This script helps managing those **package**s.

This script is not intented to be used to track dotfiles only. Its default values are configured to support tracking system-wide configuration files 
such as `/etc/ssh/sshd_config`
