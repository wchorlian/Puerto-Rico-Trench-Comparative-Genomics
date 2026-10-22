# connect to server
ssh wchorlian@fram.ucsd.edu

# directory commands
pwd ## print working directory
cd ## change directory
cd .. ## previous directory
ls ## list directory items
mkdir <directory_name> ## make new directory
mkdir -p <directory_name> ## make new directory (if it doesn't already exist)
rm ## remove item(s)
rm -r <directory_name> ## removes directory and all items in directory
cp ## copy item(s)
^C ## keyboard interupt

# file info commands
ls -lh ## lists files in long format
ls -lh *.<extension> ## lists all files of a given extension in long format
file ## provides file type info
head -n 10 <file_name> ## lists first n lines of a single file

# print first line of each file in current directory
for f in *; do
    echo "===== $f ====="
    head -n 1 "$f"
done

# checks first line of each file in directory for fasta header format
for f in *; do
>     first=$(head -n 1 "$f")
>     if [[ "$first" == ">"* ]]; then
>         echo "FASTA header found: $f"
>     else
>         echo "CHECK THIS FILE: $f"
>     fi
> done

# move items
 mv * <directory_name>/ ## move all items in current directory to new directory
 mv <file_name> <directory_name>/ ## move a single file to new directory

# count files in given directory
find <directory_name> -maxdepth 1 -type f | wc -l

# screen commands
screen -S <screen_name> ## creates new screen
screen -ls ## lists current screens running
screen -r <screen_name> ## return to previously dettached screen
exit ## when in a screen, permanently closes it
### control + A followed by D dettaches from a screen
