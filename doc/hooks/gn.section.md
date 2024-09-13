# gn {#gn}

[GN](https://gn.googlesource.com/gn) is an open source meta build system meant to genrate build files for [Ninja](#ninja).

In Nixpkgs, gn comes with a setup hook that overrides the configure phases.


## Variables controlling GN {#gn-variables-controlling}

### GN Exclusive Variables {#gn-exclusive-variables}

#### `gnFlags` {#gnFlags}

Controls the args passed to `gn gen` during configure phase.

#### `dontUseGnConfigure` {#dontUseGnConfigure}

When set to true, don't use the predefined `gnConfigurePhase`.
