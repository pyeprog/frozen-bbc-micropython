#! /bin/bash

bbcmicropython_path=$HOME/bin/microbit-hex-compile/bbcmicropython
if [ ! -d $bbcmicropython_path ]; then
	echo "No bbc micropython files are found"
	echo "Please Download bbc-micropython project and put it in /home/{your_account}/Documents/bbcmicropython folder"
	exit 1
fi

if [ $# -ne 1 ]; then
	cat << __EOF__
Put your python files into a folder, name the folder and compile it into micropython's hex
Then 'import your_folder_name' to use it in micropython

Usage:
compile {your_python_file_dir_path}

compile your python files into microbit and get the hex out
you can use 'import your_python_dir_name' in micropython to use your module
__EOF__
exit 0
fi

module_path=$1
module_name=$(basename $module_path)
if [ ! -d $module_path ]; then
	echo "Your module path is invalid, make sure it is a folder not a file"
	exit 1
fi

python3 $HOME/bin/microbit-hex-compile/make-frozen.py $1 > "$bbcmicropython_path/source/py/$module_name.c"
if [ $? -eq 0 ]; then
	echo "Compile python file into c file, done"
else
	echo "Your module is failed at compiling"
	exit 1
fi

cd $bbcmicropython_path
rm -rf build
make all
if [ $? -eq 0 ]; then
	echo "Compile micropython, done"
else
	echo "Micropython Compile failed"
	exit 1
fi

save_path=$HOME/Downloads/compiled_hex_files
hex_saved_path=$save_path/$(date +%Y-%m-%d-%H-%M-%S).hex
mkdir -p $save_path
cp "$bbcmicropython_path/build/bbc-microbit-classic-gcc-nosd/source/microbit-micropython.hex" $hex_saved_path
echo "Compiling complete, check your hex file at $hex_saved_path"

rm "$bbcmicropython_path/source/py/$module_name.c"
echo "Cleaning done"
