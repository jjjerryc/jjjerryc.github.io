# Public installer entry

Short endpoint: https://jjjerryc.github.io/i

```bash
curl -fsSL https://jjjerryc.github.io/i | bash
# Without curl, when wget is available:
wget -qO- https://jjjerryc.github.io/i | bash
```

The entry downloads the current installer from [linux-dev-bootstrap](https://github.com/jjjerryc/linux-dev-bootstrap). All options are forwarded; default installation includes sudo system packages. This repository contains no credentials.
