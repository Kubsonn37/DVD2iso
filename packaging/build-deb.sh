#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="${VERSION:-0.5.0}"
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT
PKG="$STAGE/dvd2iso_${VERSION}_all"
OUT="$ROOT/dist/dvd2iso_${VERSION}_all.deb"

mkdir -p "$ROOT/dist" "$PKG/DEBIAN" "$PKG/usr/bin" \
 "$PKG/usr/share/applications" "$PKG/usr/share/metainfo" \
 "$PKG/usr/share/doc/dvd2iso"

install -m 0755 "$ROOT/src/DVD2iso" "$PKG/usr/bin/DVD2iso"
install -m 0644 "$ROOT/data/DVD2iso.desktop" "$PKG/usr/share/applications/DVD2iso.desktop"
install -m 0644 "$ROOT/data/io.github.Kubsonn37.DVD2iso.metainfo.xml" \
 "$PKG/usr/share/metainfo/io.github.Kubsonn37.DVD2iso.metainfo.xml"
install -m 0644 "$ROOT/LICENSE" "$PKG/usr/share/doc/dvd2iso/copyright"

for size in 64 128 256 512; do
  d="$PKG/usr/share/icons/hicolor/${size}x${size}/apps"
  mkdir -p "$d"
  install -m 0644 "$ROOT/data/icons/DVD2iso-${size}.png" "$d/DVD2iso.png"
done

sed "s/^Version:.*/Version: ${VERSION}/" "$ROOT/packaging/control" > "$PKG/DEBIAN/control"

cat > "$PKG/DEBIAN/postinst" <<'EOF'
#!/bin/sh
set -e
if command -v gtk-update-icon-cache >/dev/null 2>&1; then
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor || true
fi
exit 0
EOF
cp "$PKG/DEBIAN/postinst" "$PKG/DEBIAN/postrm"
chmod 0755 "$PKG/DEBIAN/postinst" "$PKG/DEBIAN/postrm"
chmod 0755 "$PKG/DEBIAN"

dpkg-deb --root-owner-group --build "$PKG" "$OUT"
echo "Built: $OUT"
