################################################################################
#-->❱❯ SETUP ❯❱>
################################################################################

set -x LS_COLORS 'no=00;38;5;244:rs=0:di=00;38;5;33:ln=01;38;5;33:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:ex=01;38;5;64:*.tar=00;38;5;61:*.tgz=01;38;5;61:*.arj=01;38;5;61:*.taz=01;38;5;61:*.lzh=01;38;5;61:*.lzma=01;38;5;61:*.tlz=01;38;5;61:*.txz=01;38;5;61:*.zip=01;38;5;61:*.z=01;38;5;61:*.Z=01;38;5;61:*.dz=01;38;5;61:*.gz=01;38;5;61:*.lz=01;38;5;61:*.xz=01;38;5;61:*.bz2=01;38;5;61:*.bz=01;38;5;61:*.tbz=01;38;5;61:*.tbz2=01;38;5;61:*.tz=01;38;5;61:*.deb=01;38;5;61:*.rpm=01;38;5;61:*.jar=01;38;5;61:*.rar=01;38;5;61:*.ace=01;38;5;61:*.zoo=01;38;5;61:*.cpio=01;38;5;61:*.7z=01;38;5;61:*.rz=01;38;5;61:*.apk=01;38;5;61:*.jpg=00;38;5;136:*.JPG=00;38;5;136:*.jpeg=00;38;5;136:*.gif=00;38;5;136:*.bmp=00;38;5;136:*.pbm=00;38;5;136:*.pgm=00;38;5;136:*.ppm=00;38;5;136:*.tga=00;38;5;136:*.xbm=00;38;5;136:*.xpm=00;38;5;136:*.tif=00;38;5;136:*.tiff=00;38;5;136:*.png=00;38;5;136:*.svg=00;38;5;136:*.svgz=00;38;5;136:*.mng=00;38;5;136:*.pcx=00;38;5;136:*.dl=00;38;5;136:*.xcf=00;38;5;136:*.xwd=00;38;5;136:*.yuv=00;38;5;136:*.cgm=00;38;5;136:*.emf=00;38;5;136:*.eps=00;38;5;136:*.pdf=01;38;5;245:*.tex=01;38;5;245:*.rdf=01;38;5;245:*.owl=01;38;5;245:*.n3=01;38;5;245:*.tt=01;38;5;245:*.nt=01;38;5;245:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*.aac=00;38;5;166:*.au=00;38;5;166:*.flac=00;38;5;166:*.mid=00;38;5;166:*.midi=00;38;5;166:*.mka=00;38;5;166:*.mp3=00;38;5;166:*.mpc=00;38;5;166:*.ogg=00;38;5;166:*.ra=00;38;5;166:*.wav=00;38;5;166:*.axa=00;38;5;166:*.oga=00;38;5;166:*.spx=00;38;5;166:*.xspf=00;38;5;166:*.mov=01;38;5;166:*.mpg=01;38;5;166:*.mpeg=01;38;5;166:*.m2v=01;38;5;166:*.mkv=01;38;5;166:*.ogm=01;38;5;166:*.mp4=01;38;5;166:*.m4v=01;38;5;166:*.mp4v=01;38;5;166:*.vob=01;38;5;166:*.qt=01;38;5;166:*.nuv=01;38;5;166:*.wmv=01;38;5;166:*.asf=01;38;5;166:*.rm=01;38;5;166:*.rmvb=01;38;5;166:*.flc=01;38;5;166:*.avi=01;38;5;166:*.fli=01;38;5;166:*.flv=01;38;5;166:*.gl=01;38;5;166:*.axv=01;38;5;166:*.anx=01;38;5;166:*.ogv=01;38;5;166:*.ogx=01;38;5;166:'
set -e LSCOLORS

set fish_color_command green --bold
set fish_color_error red --bold

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showupstream 'informative'
set __fish_git_prompt_describe_style 'default'

set __fish_git_prompt_color_branch cyan --bold
set __fish_git_prompt_color_dirtystate green --bold
set __fish_git_prompt_color_stagedstate cyan
set __fish_git_prompt_color_cleanstate white --bold

set __fish_git_prompt_color_invalidstate red --bold
set __fish_git_prompt_color_untrackedfiles blue
set __fish_git_prompt_color_branch_done green --bold

set __fish_git_prompt_char_upstream_prefix ''
set __fish_git_prompt_char_upstream_ahead (set_color green --bold)'︽'(set_color normal)
set __fish_git_prompt_char_upstream_behind (set_color magenta --bold)'︾'(set_color normal)
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_dirtystate '+'
set __fish_git_prompt_char_invalidstate '✘'
set __fish_git_prompt_char_stagedstate '●'
set __fish_git_prompt_char_untrackedfiles '…'
set __fish_git_prompt_char_cleanstate '✔'


################################################################################
#-->❱❯ HELPERS ❯❱>
################################################################################

function __is_git_repository -d 'Detect if working dir is a git repo'
  command git rev-parse --is-inside-work-tree >/dev/null 2>&1
end

function __git_branch_name -d 'Return branch name of current repo'
  command git branch ^/dev/null | grep \* | sed 's/* //'
end

function __git_repository_name -d 'Return name of current git repo'
  command basename (git rev-parse --show-toplevel ^/dev/null)
end

function __git_repository_path -d 'Return path of current git repo'
  command git rev-parse --show-toplevel ^/dev/null
end

function __git_repository_location -d 'Return git repo location path'
  set -l git_repository_name (__git_repository_name)
  __git_repository_path | sed "s:$git_repository_name::"
end


################################################################################
#-->❱❯ ENVIRONMENT ❯❱>
################################################################################

function __git_hash_info -d 'Return latest commit hash info'
  if __is_git_repository
    # echo -n -s ' '
    # echo -n -s (set_color --bold black)(__git_branch_name)(set_color normal)
    if [ (command git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") = 0 ]
      set -l git_branch_hash (command git rev-parse --short --verify HEAD)
      # echo -n -s ' '
      # echo -n -s (set_color --bold purple)'±'(set_color normal)
      echo -n -s (set_color --bold purple)'#'(set_color normal)
      # echo -n -s (set_color --bold white)'git'(set_color normal)
      # echo -n -s ' '
      echo -n -s (set_color --bold white)$git_branch_hash(set_color normal)
    end
  end
end

function __ruby_info -d 'Return ruby version if dir contains gemfile'
  if __is_git_repository
    set -l git_repository_gemfile_path (__git_repository_path)"/Gemfile"

    if test -e $git_repository_gemfile_path
      echo -n -s ' '
      echo -n -s (set_color --bold red)'◃▸'(set_color normal)
      echo -n -s (set_color --bold white)'ruby '(set_color normal)
      echo -n -s (set_color --bold black)(command ruby -v | awk '{print $2}' | cut -d'p' -f1)(set_color normal)
    end
  end
end

function __node_info -d 'Build NVM prompt info'
  if __is_git_repository
    set -l git_repository_package_path (__git_repository_path)"/package.json"
    if test -e $git_repository_package_path
      echo -n -s ' '
      echo -n -s (set_color --bold green)'⬡'(set_color normal)(set_color --bold black)'`'(set_color normal)#⬢⬡◊
      # echo -n -s (set_color --bold white)'node '(set_color normal)
      echo -n -s (set_color --bold white)(command node -v | awk '{print substr($1,2); }')(set_color normal)
    end

    #set -l git_repository_sailsrc_path (__git_repository_path)"/.sailsrc"

    # if test -e $git_repository_sailsrc_path
    #   echo -n -s ' '
    #   echo -n -s (set_color --bold cyan)'⏅ '(set_color normal)
    #   echo -n -s (set_color --bold white)'sails'(set_color normal)
    #   echo -n -s ' '
    #   echo -n -s (set_color --bold black)(command sails -v)(set_color normal)
    # end
  end
end


################################################################################
#-->❱❯ PROMPT ❯❱>
################################################################################

function __prompt_character -d 'Return specific character for prompt'
  if [ (jobs -l | wc -l) -gt 0 ]
    # JOBS COUNT (jobs -c | wc -l | awk '{ print $1; }')
    echo -n -s (set_color --bold black)'⚙ '(set_color normal)
  else
    if __is_git_repository
      echo -n -s (set_color --bold black)"➥ "(set_color normal)
    # else
    #   echo -n -s (set_color --bold black)"in "(set_color normal)
    #   # echo -n -s (set_color --bold black)"➜ "(set_color normal)
    end
  end
end

function __prompt_user_host_path -d 'Return user, host and path if needed'
  if [ 'Darwin' = (uname) ]
    echo -n -s (set_color --bold white)' '(set_color normal)
  end

  if test -n "$SSH_CONNECTION"
    # echo -n -s (set_color white)'@'(set_color normal)
    echo -n -s (set_color --bold white)(hostname -f)' '(set_color normal)

    # echo -n -s (set_color blue)(hostname -s)(set_color normal)
    # echo -n -s (set_color --bold black)':'(set_color normal)
  end

  echo -n -s (set_color --bold cyan)(whoami | sed -e "s/\b\(.\)/\u\1/g")(set_color normal)

  echo -n -s ' '

  if __is_git_repository
    echo -n -s (set_color white)(__git_repository_location | sed "s:^$HOME:~:" | awk '{print substr($0, 0, length($0)-1)}')(set_color normal)
  end
end

function __prompt_path -d 'Return prompt path or git repository path'
  if __is_git_repository
    set -l git_repository_location (__git_repository_location)

    if test -n "$SSH_CONNECTION"
      echo -n -s (set_color --bold white)(hostname -f)(set_color normal)
      echo -n -s (set_color --bold black)":"(set_color normal)
    end

    echo -n -s (set_color --bold yellow)(pwd | sed "s:$git_repository_location::")(set_color normal)
    # remove last segment (dirname (pwd | sed "s:^$HOME:~:") | sed 's,^\(.*/\)\?\([^/]*\),\2,')
    # end
    echo -n -s (__fish_git_prompt) | tr -d '()'
  else
    echo -n -s (set_color white)(pwd | sed "s:^$HOME:~:")(set_color white)
  end
end


################################################################################
#-->❱❯ BUILD ❯❱>
################################################################################

function fish_prompt -d 'Define base shell prompt'
  if __is_git_repository
    printf '%s' (__prompt_character)
    printf '%s' (__prompt_path)
  else
    printf '%s' (__prompt_user_host_path)
    printf '%s' (__prompt_path)
  end

  echo -n -s (set_color --bold black)' ❯ '(set_color normal)

  if [ 'root' = (whoami) ]
    echo -n -s (set_color --bold red)'sudo '(set_color normal)
  end
end

function fish_right_prompt -d 'Define additional info in right prompt'
  printf '%s' (__git_hash_info)
  printf '%s' (__ruby_info)
  printf '%s' (__node_info)
end
