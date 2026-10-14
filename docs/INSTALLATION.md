# Installation, restore and security

## Requirements

- Official **KiCad 10.0.6 for Windows x64**, installed separately.
- Administrator permission to modify that installation.
- All KiCad programs closed during installation or restoration.

## Install

1. Obtain the Windows ZIP from this repository's official [Releases](../../releases) page.
2. Verify the ZIP's SHA-256 against the published release checksum.
3. Extract the archive and, optionally, verify the executable against the enclosed checksum.
4. Start `SSI_KiCad_Sheet_Preview_Patcher_v1.0.2.exe`.
5. Choose the target KiCad folder and click **Validate Installation**.
6. Proceed with **Install Patch** only when validation confirms a supported original installation.
7. Read the completion result before closing with **Finish**.

The patcher requires original-file backups for restoration. Keep its backup files until restoration has completed.

## Restore

Start the same patcher, select the patched installation, validate it and use **Restore Original KiCad** when the patcher recognizes a valid managed backup. After successful verification, the patcher removes its completed backup/journal folder.

## Antivirus and SmartScreen

The executable is unsigned, so security products may show warnings. Verify the source and SHA-256 before considering any operating-system option to proceed. **Do not disable security protection or create permanent exclusions.** If a product quarantines the file, investigate the detection and report a suspected false positive to the vendor.

## Scope and privacy

This patcher is version-specific; it does **not** install KiCad, patch other versions, or modify schematic project files. It stores only the selected installation folder in a local `settings.ini` file under `%LOCALAPPDATA%\SSI Electronics\KiCad Sheet Preview Patcher`. It does not use cookies.
