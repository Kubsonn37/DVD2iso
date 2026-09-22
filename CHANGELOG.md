# Changelog

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
