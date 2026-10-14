# Licensing and source distribution

## Upstream KiCad

KiCad is an independent open-source EDA project. SSI Electronics is not affiliated with or endorsed by the KiCad project.

The majority of KiCad's source is licensed under the **GNU General Public License, version 3 or later (GPL-3.0-or-later)**. Some components have different compatible licenses. The exact applicable notices are in the upstream KiCad 10.0.6 source distribution, particularly `LICENSE.README`, `LICENSE.GPLv3` and individual third-party license files.

Official upstream licensing: https://www.kicad.org/about/licenses/

## SSI Eeschema modifications

SSI's changes to GPL-covered KiCad files are distributed under **GPL-3.0-or-later**, preserving upstream copyright and license notices. Modification notices and dates should accompany the changed files. The upstream copyright remains with its respective holders; SSI claims authorship only of its original contributions.

## Binary distribution and corresponding source

A Windows patcher that carries modified KiCad executable binaries is a distribution of GPL-covered object code. To publish those binaries, the exact corresponding source must be available on equivalent terms, including the KiCad 10.0.6 base, SSI changes, applicable third-party components, and build/control scripts needed to generate the binaries.

**Status:** Corresponding-source completeness and reproducibility have not yet been verified. Do not treat the available patcher-only Go source ZIP as complete corresponding source for the modified KiCad binaries. The binary release should not be made public until this check is complete.

## Standalone patcher

The patcher itself is written in Go and is distributed separately as source. Its precise license treatment and third-party dependencies must be checked before a definitive top-level LICENSE is added. No proprietary restriction is asserted here over GPL-covered KiCad components.

## No warranty

Software is provided without warranty to the extent permitted by the applicable licenses. Back up your KiCad installation and project data before applying modifications.
