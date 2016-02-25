# .bashrc

# _____________________________________________________________________________
# log in message ______________________________________________________________

if [[ $- =~ "i" ]]; then
# Announce on login that 'rm', 'cp', and 'mv' aren't aliased for safety
echo ""
echo "       -------------------------------NOTICE-----------------------------"
echo "          This platform does not alias 'rm', 'cp', and 'mv' with the '-i'"
echo "       option for safety.  Instead the commands 'rmi', 'cpi', and 'mvi'"
echo "       add the '-i' option."
echo "          Additionally, it is recommended to avoid 'rm' and 'rmi', as"
echo "       they permanently delete files.  Instead use the 'trash' command,"
echo "       which moves files to the trash instead of permanently deleting."
echo "       ------------------------------------------------------------------"
echo ""
echo '                   ------------------KERBEROS----------------'
echo '                   To create Kerberos ticket, use "kinit -f".'
echo '                           View tickets with "klist".'
echo '                   ------------------------------------------'
fi

# _____________________________________________________________________________
# my system aliases ___________________________________________________________

# Modify 'ls' to include color
# NOTE: On some platforms the command is 'ls -G' while on others the command is
#       'ls --color'.  Using the wrong alias can cause strange behavior (such
#       as ls complaining about unknown command-line arguments).
# NOTE: Some platforms alternately allow you to do "export CLICOLOR=1" to turn
#       on colored output from ls.
alias ls='ls -G'

# Add 'cls' : clear, pwd, ls
alias cls='tput clear; echo "$(tput sgr 0 1)$(tput bold)$(pwd)$(tput sgr0)"; ls'

# 'Add 'lsdir', which lists subdirectories in the current directory
alias lsdir='ls -d */'

# Add safety command 'rmi' for 'rm -i' and 'trash' for non-permanent deleting
alias rmi='rm -i'
alias trash='gmv --target-directory=$HOME/.Trash'

# Add safety command 'cpi' for 'cp -i'
alias cpi='cp -i'

# Add safety command 'mvi' for 'mv -i'
alias mvi='mv -i'

# I don't know that I want to switch to all GNU coreutils, because I don't know
# what that might change.  For now, I will keep the default: GNU coreutils are
# prefaced by g (e.g. mv --> gmv, sort --> gsort).  If I decide to completely
# switch to GNU, the MacPorts installation command gave a notice:
#       If you want to use the GNU tools by default, add this directory to the
#       front of your PATH environment variable:  /opt/local/libexec/gnubin/
# But for now, I'll explicitly alias things I want.
#alias sort='gsort'
#alias make='gmake'

# _____________________________________________________________________________
# proxies _____________________________________________________________________

#export http_proxy=http://proxyout1.lanl.gov:8080
#export HTTP_PROXY=http://proxyout1.lanl.gov:8080
#export https_proxy=http://proxyout1.lanl.gov:8080
#export HTTPS_PROXY=http://proxyout1.lanl.gov:8080
#export rsync_proxy=proxyout1.lanl.gov:8080
#export RSYNC_PROXY=proxyout1.lanl.gov:8080

# _____________________________________________________________________________
# Anaconda ____________________________________________________________________

# added by Anaconda2 2.4.1 installer (I moved it here from bash_profile)
export PATH="/home/bkkrueger/anaconda/bin:$PATH"

alias ipython3="/home/bkkrueger/anaconda/envs/py3k/bin/ipython"
alias python3="/home/bkkrueger/anaconda/envs/py3k/bin/python"

# _____________________________________________________________________________
# MATCH _______________________________________________________________________

PATH=$PATH:/Users/bkkrueger/research/hydro_studies/hydro_FV_vs_FE

alias match='python3 /Users/bkkrueger/research/hydro_studies/hydro_FV_vs_FE/python_source/match'

# For playing with MATCH
export PYTHONPATH=$PYTHONPATH:/Users/bkkrueger/research/hydro_studies/hydro_FV_vs_FE/python_source

# _____________________________________________________________________________
# Vim _________________________________________________________________________

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

# _____________________________________________________________________________
# additional sourcing _________________________________________________________

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
# NOTE: Do not source .bash_profile, as .bash_profile sources this file.

# _____________________________________________________________________________
# custom prompt _______________________________________________________________

# This comes after sourcing /etc/bashrc because that defines a standard PS1.

# Prompt
export PS1="\[\e[1;31m\]\u@\h~>\[\e[m\] "
# explanation:
# - The "\u" is the username and the "\h" is the hostname up to the first "."
#   - Assuming the username is "user" and the hostname is
#     "hostname.something.com" then the basic text is "user@hostname~> "
# - The "\e[" does color/text changes
#   - The "\e[1;31m" sets the color/text to bold (1) red (31) text
#   - The "\e[m" resets the color/text back to normal
# - The "\[" and "\]" set off non-printing characters to allow correct word
#   wrapping.  Since the color commands don't print, they need to be bracketed
#   or the line wrapping will be messed up.

