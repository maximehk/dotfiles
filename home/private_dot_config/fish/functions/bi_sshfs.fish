function bi_sshfs
  # Install macFUSE cask
  brew install --cask macfuse

  # Then install sshfs via this tap (macOS build)
  brew install gromgit/fuse/sshfs-mac
end
