dir=~/dotfiles
old_dir=~/dotfiles_old
files=".aliases .dotfiles .exports .functions .plugins .tmux.conf .zshrc"

cd ${dir}

if [[ ! -d ${old_dir} ]]; then
    echo "Creating old directory"
    mkdir ${old_dir}
fi

#todo: check if it's not directory
#todo: handle case if it's link but not to file that I want
for file in ${files}; do
    if [[ ! -L ~/${file} ]]; then #if file is not link
        if [[ -f ~/${file} ]]; then #move to old dir if it's file
            echo "Move $file to old dir"
            mv ~/${file} ${old_dir}
        fi

       echo "Creating symlink to $file in home directory."
       ln -s ${dir}/${file} ~/${file}
    fi
done

echo "Reading ~/.dotfiles"
source ~/.dotfiles
