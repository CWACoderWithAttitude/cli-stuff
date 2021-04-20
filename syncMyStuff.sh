#!/bin/sh

target_user="admin"
target_host="diskstation.local"
target_folder="/volume1/NetBackup"

source_folders="
Desktop
"
source_folders="
Movies/fantomas
Dev/volker
Desktop
Downloads
Documents
OneDrive
Nextcloud
Pictures
"

for src in $source_folders;
do
#  echo \
  rsync --verbose --recursive  $HOME/$src $target_user@$target_host:$target_folder/$(hostname)
#  rsync --recursive $src $target_user@$target_host:$target_folder/$(hostname)
done
