#!/bin/bash

set -eufo pipefail

# ==========================
# Keyboard & Text Input
# ==========================

# Fast key repeat: short initial delay, fast repeat rate
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Long-press shows accent picker instead of key repeat
defaults write -g ApplePressAndHoldEnabled -bool "true"

# Fn key does nothing (not emoji/dictation)
defaults write -g com.apple.keyboard.fnState -bool "false"
defaults write com.apple.HIToolbox AppleFnUsageType -int "0"
defaults write com.apple.HIToolbox AppleDictationAutoEnable -int "0"

# Disable all auto-correct and auto-substitution
defaults write -g NSAutomaticCapitalizationEnabled -bool "false"
defaults write -g NSAutomaticDashSubstitutionEnabled -bool "false"
defaults write -g NSAutomaticInlinePredictionEnabled -bool "false"
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool "false"
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool "false"
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool "false"
defaults write -g NSAutomaticTextCorrectionEnabled -bool "false"
defaults write -g WebAutomaticSpellingCorrectionEnabled -bool "false"
defaults write -g NSUserDictionaryReplacementItems '()'

# ==========================
# Trackpad
# ==========================

# Disable natural (inverted) scrolling
defaults write -g com.apple.swipescrolldirection -bool "false"

# Disable swipe-to-navigate and force click
defaults write -g AppleEnableSwipeNavigateWithScrolls -bool "false"
defaults write -g com.apple.trackpad.forceClick -bool "false"

# Light click threshold, three-finger drag, no drag lock
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int "1"
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int "1"
defaults write com.apple.AppleMultitouchTrackpad DragLock -int "0"

# ==========================
# Dock
# ==========================

defaults write com.apple.dock autohide -bool "true"
defaults write com.apple.dock orientation -string bottom
defaults write com.apple.dock show-recents -bool "true"
defaults write com.apple.dock showDesktopGestureEnabled -bool "true"
defaults write com.apple.dock showLaunchpadGestureEnabled -bool "true"
defaults write com.apple.dock showMissionControlGestureEnabled -bool "true"

# ==========================
# Finder
# ==========================

# Show full POSIX path in title bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool "true"

# List view by default, folders first
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv
defaults write com.apple.finder _FXSortFoldersFirst -bool "true"

# Search scoped to current folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show hidden files and all extensions
defaults write -g AppleShowAllExtensions -bool "true"
defaults write -g AppleShowAllFiles -bool "true"

# No warning when changing file extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool "false"

# Auto-delete old trash items
defaults write com.apple.finder FXRemoveOldTrashItems -bool "true"

# ==========================
# Misc
# ==========================

# Save to disk by default, not iCloud
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool "false"

# Don't confirm unsaved changes on close
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -int "0"

# Double-click title bar doesn't minimize
defaults write -g AppleMiniaturizeOnDoubleClick -bool "false"

# Cursor magnification on shake stays enabled
defaults write -g CGDisableCursorLocationMagnification -bool "false"

# Menu bar clock: "Mon 2 Apr 14:30:00"
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm:ss"

# ==========================
# Security
# ==========================

# Enable Touch ID for sudo (survives macOS updates)
if [ ! -f /etc/pam.d/sudo_local ]; then
    sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
elif ! grep -q pam_tid /etc/pam.d/sudo_local; then
    sudo sed -i '' '2a\
auth       sufficient     pam_tid.so
' /etc/pam.d/sudo_local
fi
