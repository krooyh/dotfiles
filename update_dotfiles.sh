dir=~/dotfiles
old_dir=~/dotfiles_old
files=".aliases .dotfiles .exports .functions .plugins .tmux.conf .zshrc"

cd ${dir}

if [[ ! -d ${old_dir} ]]; then
echo "Creating old directory"
mkdir ${old_dir}
fi

for file in ${files}; do
    if [[ ! -L ~/${file} ]]; then #if file is not link
        #move to old dir if is file
        if [[ -f ~/${file} ]]; then
        echo "Move $file to old dir"
        mv ~/${file} ${old_dir}
        fi

       echo "Creating symlink to $file in home directory."
        ln -s ${dir}/${file} ~/${file}
    fi
done

source ~/.dotfiles
