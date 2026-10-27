if status is-interactive

# ls commands
abbr -a l ls -lFh
abbr -a la ls -lAFh
abbr -a lr ls -tRFh
abbr -a lt ls -ltFh
abbr -a ll ls -l
abbr -a ldot ls -ld .*
abbr -a lS ls -1FSsh
abbr -a lart ls -1Fcart
abbr -a lrt ls -lARFh
abbr -a lsr ls -lARFh
abbr -a lsn ls -1
abbr -a dud du -d 1 -h

# find and grep
abbr -a ff find . -type f -name

# cat
abbr -a meow pygmentize

# git

## core
abbr -a g git
abbr -a ga git add
abbr -a gaa git add --all
abbr -a gc git commit
abbr -a gcm git commit -m
abbr -a gca git commit --amend

## status & diffs
abbr -a gs git status
abbr -a gss git status --short
abbr -a gd git diff
abbr -a gds git diff --staged
abbr -a gdc git diff --cached

## log
abbr -a gl git log --oneline --decorate
abbr -a glo git log --oneline --decorate --graph
abbr -a glog git log --all --oneline --decorate --graph

## branches
abbr -a gb git branch
abbr -a gba git branch --all
abbr -a gsw git switch
abbr -a gsc git switch -c
abbr -a gm git merge

## remote
abbr -a gf git fetch
abbr -a gp git push
abbr -a gpl git pull

## undo / recovery
abbr -a grh git reset --hard
abbr -a grs git restore --staged
abbr -a gr git restore
abbr -a gcp git cherry-pick

end
