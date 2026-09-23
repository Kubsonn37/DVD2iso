# DVD2iso

DVD2iso is a GTK4 application for Linux that creates an ISO image from a DVD-Video disc.

It uses `dvdbackup` to copy the DVD-Video structure and `genisoimage` to create the final ISO. DVD detection is event-driven through GIO instead of continuously polling the optical drive.

## Development

DVD2iso is a fully vibe-coded project. The application was developed with the assistance of generative AI, including its Python/GTK code, packaging, and project documentation.

Releases are tested on real hardware before publication.

## Version

0.6.0

## Requirements

On Ubuntu/Debian:

```bash
sudo apt install python3 python3-gi gir1.2-gtk-4.0 dvdbackup lsdvd genisoimage eject util-linux
```

Available Linux optical drives (`/dev/srN`) are detected automatically and can be selected from the application window.

DVD2iso can optionally eject the medium and play a short notification sound when an ISO finishes successfully. A separate subtle error sound is played for failed operations when sound notifications are enabled. Audio playback is best-effort and never affects the ISO operation result.

## Run from source

```bash
./src/DVD2iso
```

## Build a Debian package

```bash
./packaging/build-deb.sh
```

The `.deb` is written to `dist/`.

## Releases

Push a version tag such as `v0.6.0`. GitHub Actions will build the `.deb`, create a GitHub Release and attach the package.

## Identity

- Application: **DVD2iso**
- App ID: `io.github.Kubsonn37.DVD2iso`
- Repository: `Kubsonn37/DVD2iso`

## License

MIT
