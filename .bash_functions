#make dir and cd into it
auto_uppies() {
    local flag_file
    flag_file=.uppies_$(date +%Y%m%d)

    if [ -f $flag_file ]; then
        return 0
    fi
    touch $flag_file
    uppies
}
mkcd ()
{
    mkdir -pv -- "$1" && cd -P -- "$1"
}

cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -al --color=always --group-directories-first
}


hg() {
    history | grep "$1";
}

header() {
    file_extract -f $1
    head -n1 $1.* | tr '~' \\n | sed s/^\"//g | sed s/\"$//g | nl
}

journal() {
    time=$(date -u +"%Y%m%d%H")
    db_jrn_track ~/journal/"$time".db_jrn "$1"
}

findprocs() {
    ## just use pgrep? 
    ps -wef f | grep "$1" 
    ## TODO 
    #add fn to pass to netstat / give name of proc and show netstat and pgrep
}

topswap() {
    for file in /proc/*/status ; do awk '/VmSwap|Name/{printf $2 " " $3}END{ print ""}' $file; done | sort -k 2 -n -r | head -n 10
}

info() {
    df -P -h -t 9p -t ext4 |  grep -v none
    hostname -I | grep -vE '^192\.|^172\.'
}
