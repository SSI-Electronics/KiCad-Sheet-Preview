# Technical notes

The modification extends KiCad Eeschema's hierarchical sheet rendering to draw a scaled representation of the linked child schematic within its parent-sheet rectangle. The preview is display-only; editing still takes place in the linked schematic.

The Windows patcher is a separate executable carrying a version-specific binary payload. It validates target files and their hashes before modification, backs up original files, and uses a journal/restore workflow to avoid leaving partially replaced installations. It provides a validation-only operation and status-aware install/restore controls.

**Compatibility boundary:** KiCad 10.0.6, Windows x64. Do not treat this patch as compatible with arbitrary future KiCad releases.

**Source and licensing:** upstream KiCad code remains subject to upstream licensing. The complete corresponding modification sources and build instructions must be reviewed and published before claiming a complete reproducible open-source release.
