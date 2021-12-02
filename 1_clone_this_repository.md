
Go to the home directory (= `/home/osboxes` = `~/`) and clone this repository there.

```
cd ~

git clone https://github.com/kihyunee/genomics_tutorial_repo.git

cd genomics_tutorial_repo/scripts

chmod 755 *.sh

echo "export PATH=\$PATH:$(pwd)" >> ~/.bashrc

source ~/.bashrc

```
