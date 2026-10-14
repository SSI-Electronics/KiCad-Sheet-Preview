# Reconstructed packaging procedure for SSI KiCad Sheet Preview Patcher v1.0.2.
# NOT the authenticated historical build command. Creates a NEW, untested candidate.
# Run only in a clean directory containing main.go, go.mod, and payload.zip.
# Does not install KiCad, modify the original EXE, or run the new candidate.
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Source = Join-Path $Root 'main.go'
$Module = Join-Path $Root 'go.mod'
$Payload = Join-Path $Root 'payload.zip'
$Output = Join-Path $Root 'SSI_KiCad_Patcher_RECONSTRUCTED_UNTESTED.exe'
$ExpectedPayloadHash = 'B559FFFE2DB1C8E5F1367AA64D06EF42A7434F251757DDAF1735C402AFB39B93'

foreach ($Path in @($Source, $Module, $Payload)) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "Required file missing: $Path"
    }
}
if (Test-Path -LiteralPath $Output) {
    throw "Refusing to overwrite: $Output"
}
$ActualHash = (Get-FileHash -LiteralPath $Payload -Algorithm SHA256).Hash
if ($ActualHash -ne $ExpectedPayloadHash) {
    throw "Unexpected payload.zip SHA-256: $ActualHash"
}
$GoVersion = (& go version 2>&1 | Out-String).Trim()
if ($LASTEXITCODE -ne 0) { throw "Go not available: $GoVersion" }
if ($GoVersion -notmatch 'go1\.23\.2') {
    throw "Expected Go 1.23.2; found $GoVersion"
}

Push-Location $Root
try {
    $env:GOOS = 'windows'
    $env:GOARCH = 'amd64'
    $env:GOAMD64 = 'v1'
    $env:CGO_ENABLED = '0'
    & go build -trimpath -o $Output .
    if ($LASTEXITCODE -ne 0) { throw "Go build failed" }

    $Target = [System.IO.File]::Open($Output, [System.IO.FileMode]::Append)
    try {
        $InputStream = [System.IO.File]::OpenRead($Payload)
        try { $InputStream.CopyTo($Target) }
        finally { $InputStream.Dispose() }
    }
    finally { $Target.Dispose() }

    Write-Host "UNTESTED reconstructed candidate: $Output"
    Write-Host "SHA-256: $((Get-FileHash -LiteralPath $Output -Algorithm SHA256).Hash)"
    Write-Host "IMPORTANT: Not the original tested v1.0.2 executable."
}
finally {
    Pop-Location
}
