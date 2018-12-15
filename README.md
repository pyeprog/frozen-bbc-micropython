# Frozen your module into bbc-micropython
This is a shell script for frozen your own module into bbcmicropython in a easy way.
You can follow the steps below to create a short path.

## Steps
0. make sure you use python3.6.6, it will get you pass the dependency problem for installation of yotta
1. `git clone https://github.com/pyeprog/frozen-bbc-micropython.git --recursive`
2. make a bin directory in your home path and move this project there.
    1. mkdir ~/bin
    2. mv ./frozen-bbc-micropython ~/bin
3. add ~/bin into the PATH varaible
    1. If you have a .profile file in your home path, then add one more line at the bottom of it. `PATH="$PATH:~/bin"`
    2. If you don't have a .profile file there, then just create a .profile and put `PATH="$PATH:~/bin"` into it.
    3. If you find something like `export PATH="$HOME/bin:PATH"`, then don't bother to chang anything.
4. add a link to compile.sh for ease.
    1. `ln ~/bin/frozen-bbc-micropython/compile.sh ~/bin/compile`
5. follow those steps in [bbcmicropython](https://github.com/bbcmicrobit/micropython) to install all the compiling tools.

And now you are all set. 

## How to use it
1. Put your python file into a empty directory and name the directory with `your_dir_name`. The name of the file is important, which is exactly the module name when you use it in micropython.
2. `compile your_dir_name`
3. You can find a new directory named `compiled_hex_files` in your ~/Downloads path. All the compiled hex file are there and named with the time you compile it.
