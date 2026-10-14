# Original payload archive correspondence

The retained development workspace contains `ssi_patch_build/payload.zip` (47,523,540 bytes). The final `SSI_KiCad_Sheet_Preview_Patcher_v1.0.2.exe` is 50,042,580 bytes.

Direct byte comparison located the first 47,521,476 bytes of the original payload ZIP at offset **2,519,040** in the EXE. Both ZIP portions are 47,523,540 bytes. The remaining differences lie in the ZIP central-directory offsets, which must be adjusted when a ZIP is appended to an executable.

The original payload archive SHA-256 is `b559fffe2db1c8e5f1367aa64d06ef42a7434f251757ddaf1735c402afb39b93`.

This is stronger evidence of the packaging workflow, but is **not** a verified reconstruction of the exact historical command or a source-to-KiCad-binary build attestation. The original ZIP and shipped EXE were not changed. Binary release remains on HOLD pending corresponding-source and licensing verification.