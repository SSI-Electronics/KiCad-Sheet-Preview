# Licensing and corresponding source — SSI KiCad Sheet Preview

## Licensing decision

**KiCad 10.0.6 and SSI's modifications to KiCad:** GNU GPL version 3 or later (GPL-3.0-or-later), subject to upstream per-file notices and exceptions. SSI Electronics claims only its original changes, not upstream authorship.

**Standalone SSI Go patcher:** With the project owner's explicit approval on 15 October 2026, SSI Electronics' original Go patcher source is released under GPL-3.0-or-later. This grant covers only code for which SSI Electronics holds the relevant rights. This does not change the licenses of the Go standard library or any third-party components.

The authoritative license text is the unmodified GNU GPLv3 in the upstream KiCad 10.0.6 source archive (`LICENSE` and `LICENSE.GPLv3`). The upstream `LICENSE.README` lists components under MIT, Boost, BSD, Apache-2.0, ISC, zlib, GPLv2-or-later, Creative Commons and public-domain terms; preserve those individual notices.

## Modification notice

SSI Electronics modified the following KiCad 10.0.6 files for automatic hierarchical sheet previews and root-page sheet geometry interaction. The complete patch is in [source/patches/SSI_KiCad_10.0.6_CLEAN_15_FILES.patch](source/patches/SSI_KiCad_10.0.6_CLEAN_15_FILES.patch):

- `common/gal/cairo/cairo_gal.cpp`
- `common/gal/opengl/vertex_manager.cpp`
- `common/plotters/PDF_plotter.cpp`
- `common/plotters/SVG_plotter.cpp`
- `common/view/view.cpp`
- `eeschema/dialogs/dialog_sheet_properties.cpp`
- `eeschema/dialogs/dialog_sheet_properties.h`
- `eeschema/sch_painter.cpp`
- `eeschema/sch_painter.h`
- `eeschema/sch_sheet.cpp`
- `eeschema/sch_sheet.h`
- `eeschema/sch_view.cpp`
- `include/plotters/plotter.h`
- `include/plotters/plotters_pslike.h`
- `include/view/view.h`

The patch retains development CSV instrumentation targeting `C:/Downloads`. The original executable contains an obsolete embedded README; neither was silently altered.

## Object-code distribution and source

The patcher ZIP embeds 27 KiCad executables and libraries. Supplying only `main.go`, `go.mod`, and the 15-file patch is **not** enough to establish complete GPL Corresponding Source for those binaries. The full modified KiCad source tree, applicable dependency sources, build/install-control scripts and notices must be provided as required by GPLv3 sections 4–6. Section 6 permits several methods of providing source; source need not reproduce byte-for-byte identical object code, but must be the source from which the distributed object code was generated with the scripts required to control compilation and installation.

A full modified KiCad source-tree snapshot is retained, along with build logs, CMake configuration, and a 107-package vcpkg inventory. Availability of all externally fetched dependency sources and a validated reconstruction of the full payload build have **not** been established. Therefore **do not claim the release is GPL-complete** based solely on the files presently hosted in this repository.

## Warranty and attribution

No warranty to the extent permitted by applicable licenses. The KiCad project is independent of SSI Electronics and does not endorse this modification. Upstream copyrights and individual license notices remain with their respective owners.
