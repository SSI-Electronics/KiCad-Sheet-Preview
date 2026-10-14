# SSI KiCad Sheet Preview

Automatic, scaled previews of child schematics inside hierarchical sheet rectangles in **KiCad 10.0.6 for Windows x64**.

> **Independent community modification.** Not an official KiCad release or an endorsement by the KiCad project.

## What it does

- Displays a non-editable preview of each linked child schematic inside its hierarchical sheet rectangle.
- Keeps the sheet clickable for normal hierarchical navigation.
- Scales and clips the preview to the sheet area.
- Supports schematic plotting to PDF and SVG.
- Updates previews after edits to child sheets.

## Installation

This project distributes a **separate patcher**, not a complete KiCad installer.

1. Install the official **KiCad 10.0.6 Windows x64** release first.
2. Download `SSI_KiCad_Sheet_Preview_Patcher_v1.0.2_Win64.zip` from [Releases](../../releases).
3. Check the ZIP's SHA-256 against the checksum published with the release.
4. Extract the ZIP and run the patcher.
5. Close all KiCad applications, select the installation directory and click **Validate Installation**.
6. Review the results before selecting **Install Patch**.

The patcher checks the target installation, preserves original files for restoration, and provides **Restore Original KiCad** when a valid patcher-managed backup is present. It does not replace your schematic project files.

**Do not attempt to patch other KiCad versions or an installation that fails validation.**

## Download warnings

The patcher is currently **unsigned**. Browsers, Microsoft Defender SmartScreen and other antivirus products may warn about it. A ZIP does not guarantee the executable will be trusted. Verify the download source and checksum. Do not disable antivirus or add permanent exclusions; submit suspected false positives for review.

## Remembered folder

The last selected KiCad installation directory is saved locally in:

`%LOCALAPPDATA%\SSI Electronics\KiCad Sheet Preview Patcher\settings.ini`

No browser cookie or cloud account is involved. Installation validation is performed again each time. To reset the path, close the patcher and delete the settings file.

## Documentation

- [Installation and security](docs/INSTALLATION.md)
- [Features and limitations](docs/FEATURES.md)
- [Technical notes](docs/TECHNICAL.md)
- [Changelog](CHANGELOG.md)

## Licensing

The upstream KiCad project has its own licenses. The patcher and modification sources require a reviewed license and corresponding-source publication before this repository is considered a complete source distribution. No license grant is implied for third-party code by this README.
