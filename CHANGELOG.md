# Changelog

## 0.6.0

- Renamed the main "Płyta" section to "Nośnik" and updated related Polish UI messages.
- Placed the "Plik docelowy" controls in a framed section matching the media section.
- Added an optional "Wysuń nośnik po zakończeniu" checkbox.
- The automatic-eject option remains editable while an ISO operation is running and is evaluated only after a successful completion.
- Automatic eject is never performed after cancellation or failure.
- Kept manual eject available when no operation is running.
- Added an optional completion-sound checkbox, enabled by default and editable while the ISO operation is running.
- Added bundled subtle completion and error sounds.
- Notification audio is best-effort only and never changes the success or failure state of the ISO operation.

## 0.5.1

- Fixed an eject race where GIO events could trigger DVD detection while the tray was opening, causing some drives to pull the tray back in.
- DVD detection is temporarily suppressed during an explicit eject and resumes after the drive reports that the disc is no longer ready.
- Pending detection callbacks are cancelled before ejecting.

## 0.5.0

- Automatic discovery and selection of multiple optical drives.
- All DVD operations use the drive selected in the interface.
- Added confirmation before cancelling an active operation.
- Moved the version number to a discreet footer.
- Improved Polish section-heading capitalization.
- Starting the application no longer closes an open optical-drive tray.
- Simplified disc information and ready-status text.

## 0.4.1

- GTK4 interface.
- Event-driven DVD detection using Gio.VolumeMonitor.
- DVD-Video backup using dvdbackup.
- ISO creation using genisoimage.
- Safe `.part` output and atomic final rename.
- Free-space checks and cancellation support.
- Debian package, desktop launcher and DVD2iso icon.
