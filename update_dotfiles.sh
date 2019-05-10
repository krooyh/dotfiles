dir=~/dotfiles
old_dir=~/dotfiles_old
files=".aliases .dotfiles .exports .functions .plugins .tmux.conf .zshrc"


cd ${dir}

if [[ ! -d ${old_dir} ]]; then
echo "Creating old directory"
mkdir ${old_dir}
fi

for file in ${files}; do
    #move to old dir if existing
    if [[ -f ~/${file} ]]; then
    echo "Moving $file to old dir"
    mv ~/${file} ${old_dir}
    fi

    echo "Creating symlink to $file in home directory."
    ln -s ${dir}/${file} ~/${file}
done

source ~/.dotfiles
