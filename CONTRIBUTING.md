# Contributing

Issues and pull requests are welcome.

Before submitting a change:

```bash
python3 -m py_compile src/DVD2iso
./packaging/build-deb.sh
```

Keep DVD detection event-driven. Do not add timer-based polling of `lsdvd`.
