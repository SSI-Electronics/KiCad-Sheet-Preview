# Features and limitations

## Features

- Automatically renders scaled previews of linked child schematics inside hierarchical sheet rectangles.
- Previews remain non-editable on the parent sheet; navigate into the linked sheet to edit.
- Preview geometry follows the hierarchical sheet frame and clips to its boundaries.
- Preview graphics are included in tested PDF and SVG schematic plots.
- Changes to child sheets refresh the parent previews.
- Hierarchical sheet geometry can be displayed and adjusted directly on the root schematic page.

## Limitations

- Supported target: **KiCad 10.0.6 Windows x64 only**.
- The project is a patch for an existing official KiCad installation, not a KiCad distribution.
- Compatibility with other KiCad builds, versions and operating systems is not established.
- An installation with unexpected binary hashes must not be patched.
- Keep a verified backup until restoration succeeds.

The functionality above was tested on the project's Windows test installation; third-party environments may differ.
