#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#export GOPATH=~/scripts/go
export PATH=$PATH:$GOPATH/bin

shopt -s histappend
HISTCONTROL=ignoredups:erasedups

PS1='[\u@\h \W]\$ '
neofetch
export HISTCONTROL=ignoredups

PATH="/home/guts/perl5/bin${PATH:+:${PATH}}"; 
PATH=$PATH:/home/guts/.local/bin;
export PATH;
PERL5LIB="/home/guts/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/guts/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/guts/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/guts/perl5"; export PERL_MM_OPT;
source ~/.bash_aliases
