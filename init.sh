# first clone nvim files from my fork

if ! [ -d ./.config/nvim ]; then
   git clone https://github.com/Dj-Viking/nvim-files.git ./.config/nvim
fi

if [ -d ./.config/nvim ]; then
    pushd ./.config/nvim > /dev/null;
    git fetch;
    git pull origin master --ff;
    popd > /dev/null;
fi
