#!/bin/bash

set -eufo pipefail

defaults write -g AppleEnableSwipeNavigateWithScrolls -bool "false"
defaults write -g AppleMiniaturizeOnDoubleClick -bool "false"
defaults write -g ApplePressAndHoldEnabled -bool "true" # show accents on long press
defaults write -g AppleShowAllExtensions -bool "true"
defaults write -g AppleShowAllFiles -bool "true"
defaults write -g CGDisableCursorLocationMagnification -bool "false"
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
defaults write -g NSAutomaticCapitalizationEnabled -bool "false"
defaults write -g NSAutomaticDashSubstitutionEnabled -bool "false"
defaults write -g NSAutomaticInlinePredictionEnabled -bool "false"
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool "false"
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool "false"
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool "false"
defaults write -g NSAutomaticTextCorrectionEnabled -bool "false"
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool "false"
defaults write -g NSUserDictionaryReplacementItems '()'
defaults write -g WebAutomaticSpellingCorrectionEnabled -bool "false"

defaults write -g com.apple.keyboard.fnState -bool "false"
defaults write -g com.apple.swipescrolldirection -bool "false"
defaults write -g com.apple.trackpad.forceClick -bool "false"

defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int "1"
defaults write com.apple.AppleMultitouchTrackpad DragLock -int "0"
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int "1"

defaults write com.apple.dock autohide -bool "true"
defaults write com.apple.dock orientation -string bottom
defaults write com.apple.dock show-recents -bool "true"
defaults write com.apple.dock showDesktopGestureEnabled -bool "true"
defaults write com.apple.dock showLaunchpadGestureEnabled -bool "true"
defaults write com.apple.dock showMissionControlGestureEnabled -bool "true"

defaults write com.apple.finder _FXShowPosixPathInTitle -bool "true"
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv
defaults write com.apple.finder _FXSortFoldersFirst -bool "true"
defaults write com.apple.finder FXRemoveOldTrashItems -bool "true"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool "false"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf" # search current folder
# killall Finder

defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm:ss"

defaults write com.apple.HIToolbox AppleFnUsageType -int "0" # default - do nothing 
defaults write com.apple.HIToolbox AppleDictationAutoEnable -int "0"
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -int "0"
