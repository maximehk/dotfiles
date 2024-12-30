#!/bin/bash

set -eufo pipefail

trap 'killall Dock' EXIT

declare -a remove_labels=(
	"App Store"
	Calendar
	Contacts
	FaceTime
	Firefox
	Freeform
	Keynote
	Launchpad
	Mail
	Maps
	Messages
	Music
	Notes
	Numbers
	Pages
	Photos
	Reminders
	Safari
	TV
)

for label in "${remove_labels[@]}"; do
	dockutil --no-restart --remove "${label}" || true
done
