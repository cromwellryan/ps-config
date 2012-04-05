function Start-GitFetch() {
  pushd .
  cd ~/vim-config
  git fetch origin

  cd ~/git-config
  git fetch origin master

  cd ~/ps-config
  git fetch origin master

  popd
}

set-alias updaterepos Start-GitFetch
