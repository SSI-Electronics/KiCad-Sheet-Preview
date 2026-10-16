# SSI KiCad Sheet Preview

Automatic, scaled previews of child schematics inside hierarchical sheet rectangles in **KiCad 10.0.6 for Windows x64**.

> **Independent community modification.** Not an official KiCad release or an endorsement by the KiCad project.

## What it does

- Displays a non-editable preview of each linked child schematic inside its hierarchical sheet rectangle.
- Keeps the sheet clickable for normal hierarchical navigation.
- Scales and clips the preview to the sheet area.
- Supports schematic plotting to PDF and SVG.
- Updates previews after edits to child sheets.
- Displays **and lets you adjust** hierarchical sheet geometry directly on the root schematic page.

## Source code and rendering architecture

The repository's [15-file source patch](source/patches/SSI_KiCad_10.0.6_CLEAN_15_FILES.patch) is a **unified C++ source diff** against upstream KiCad 10.0.6, not a binary patch. The complete modified KiCad source-tree snapshot is documented separately in [source package verification](docs/SOURCE_PACKAGE_VERIFICATION.md); it is not unpacked into this repository.

Two distinct rendering paths are involved:

- **Interactive Eeschema preview:** `eeschema/sch_painter.cpp` draws linked child-sheet content within the sheet rectangle; GAL/OpenGL code adjusts scaled shader-generated geometry such as line widths and circle radii.
- **PDF/SVG output:** `eeschema/sch_sheet.cpp` and the PDF/SVG plotters temporarily map and clip the child page into the parent sheet rectangle. This is separate from the interactive GAL rendering path.

**Development diagnostics in v1.0.2:** the published source patch still contains temporary Cairo/view/preview tracing, including hardcoded `C:/Downloads` CSV log paths. These paths are diagnostic outputs, not a required installation directory. The published v1.0.2 patch and binaries have **not** yet been rebuilt or replaced with a diagnostics-cleaned version. A cleanup should be reviewed and validated before it is released.

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

SSI Electronics releases its original Go patcher code and its KiCad modifications under **GPL-3.0-or-later** with the project owner's approval. Upstream KiCad and third-party components retain their own applicable copyright and license notices. See [LICENSING.md](LICENSING.md). The available source package and build provenance are documented in [source verification](docs/SOURCE_PACKAGE_VERIFICATION.md) and [Windows build notes](docs/BUILD_FROM_SOURCE_WINDOWS.md).
