# Reconstructed Go patcher build recipe

This folder contains a **reconstructed, untested** PowerShell packaging recipe, not the historical build script and not a complete KiCad source build.

The final v1.0.2 executable reports Go **1.23.2**, Windows/amd64, `CGO_ENABLED=0`, `-trimpath=true`. The retained original `payload.zip` has SHA-256 `b559fffe2db1c8e5f1367aa64d06ef42a7434f251757ddaf1735c402afb39b93`. The recipe verifies those inputs, compiles the Go source and appends the original ZIP bytes to a **new** EXE.

To use, place the script alongside `main.go`, `go.mod`, and the original `payload.zip`, then run it in PowerShell. It refuses to overwrite its output. No installation or runtime testing is performed.

The script deliberately does not publish or embed the 47.5 MB payload, which contains GPL-covered KiCad binaries. The full KiCad corresponding-source and licensing gate must be closed before public binary distribution. This recipe does not prove a bit-identical reproduction of v1.0.2, nor does it rebuild the 27 KiCad files.

Do not treat this as a release-ready or validated installer.
