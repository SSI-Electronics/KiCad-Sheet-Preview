# Full source-tree comparison — KiCad 10.0.6

Status: source inventory verified; binary correspondence and release approval remain open.

Compared the complete file inventories and normalized contents of the supplied original `kicad-10.0.6.zip` and retained modified `SSI_KiCad_10.0.6_Release_1.0_SOURCE.zip`.

| Classification | Count |
| --- | ---: |
| Content-modified files | 15 |
| Newline-only differences | 26 |
| Original files missing in modified tree | 0 |
| Additional files in modified tree | 221 |

The 15 substantive changes match the previously identified core files. The 26 other differences are CRLF/LF-only. The 221 additional files comprise 57 development backup files and 164 vcpkg build/dependency metadata files, according to the path classification.

The audit output is `SSI_KiCad_Full_Tree_Audit_002.csv` (262 rows of differing or additional paths). This comparison does not independently authenticate the upstream ZIP's origin, prove source-to-binary correspondence, or complete GPL compliance.

No rebuild, installation, or change to the working patcher was performed. Binary release remains on HOLD.