# Customizing the Prompt
# =====================

#function fish_prompt
#  set_color yellow
#  echo (pwd) '♡'
#  set_color normal
#end

# Environment Variables
# =====================
  # Library Paths
  # These variables tell your shell where they can find certain
  # required libraries so other programs can reliably call the variable name
  # instead of a hardcoded path.

    # NODE_PATH
    # Node Path from Homebrew I believe
    set NODE_PATH "/usr/local/lib/node_modules:$NODE_PATH"

    # Those NODE & Python Paths won't break anything even if you
    # don't have NODE or Python installed. Eventually you will and
    # then you don't have to update your bash_profile

  # Configurations

    # GIT_MERGE_AUTO_EDIT
    # This variable configures git to not require a message when you merge.
    set GIT_MERGE_AUTOEDIT 'no'

    # Editors
    # Tells your shell that when a program requires various editors, use sublime.
    # The -w flag tells your shell to wait until sublime exits
    set VISUAL "subl -w"
    set SVN_EDITOR "subl -w"
    set GIT_EDITOR "subl -w"
    set EDITOR "subl -w"

  # Paths

    # The USR_PATHS variable will just store all relevant /usr paths for easier usage
    # Each path is seperate via a : and we always use absolute paths.

    # A bit about the /usr directory
    # The /usr directory is a convention from linux that creates a common place to put
    # files and executables that the entire system needs access too. It tries to be user
    # independent, so whichever user is logged in should have permissions to the /usr directory.
    # We call that /usr/local. Within /usr/local, there is a bin directory for actually
    # storing the binaries (programs) that our system would want.
    # Also, Homebrew adopts this convetion so things installed via Homebrew
    # get symlinked into /usr/local
    set USR_PATHS "/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"

    # Hint: You can interpolate a variable into a string by using the $VARIABLE notation as below.

    # We build our final PATH by combining the variables defined above
    # along with any previous values in the PATH variable.

    # Our PATH variable is special and very important. Whenever we type a command into our shell,
    # it will try to find that command within a directory that is defined in our PATH.
    # Read http://blog.seldomatt.com/blog/2012/10/08/bash-and-the-one-true-path/ for more on that.
    set PATH "$USR_PATHS:$PATH:~/bin"

    # If you go into your shell and type: $PATH you will see the output of your current path.


# Helpful Functions
# =====================

# A function to CD into the desktop from anywhere
# so you just type desktop.
# HINT: It uses the built in USER variable to know your OS X username

# USE: desktop
#      desktop subfolder
function desktop
  cd /Users/$USER/Desktop/$argv
end

# A function to easily grep for a matching process
# USE: psg postgres
function psg
  set FIRST (echo $argv | sed -e 's/^\(.\).*/\1/')
  set REST (echo $argv | sed -e 's/^.\(.*\)/\1/')
  ps aux | grep "[$FIRST]$REST"
end


# Aliases
# =====================
  # LS
  alias l 'ls -lah'

  # Git
  alias gst "git status"
  alias gl "git pull"
  alias gp "git push"
  alias gd "git diff | mate"
  alias gc "git commit -v"
  alias gca "git commit -v -a"
  alias gb "git branch"
  alias gba "git branch -a"


# Final Configurations and Plugins
# =====================

  # RVM
  # Mandatory loading of RVM into the shell
  # This must be the last line of your bash_profile always
  # curl --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
  rvm > /dev/null
