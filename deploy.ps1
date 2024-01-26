function Symlink-File {
    $DestPath = $args[0]
    $SourcePath = $args[1]
    if (Test-Path $DestPath) {
        Write-Warning "$DestPath is already symlinked"
    } else {
        if ((Get-Item $SourcePath) -is [System.IO.DirectoryInfo]) {
            cmd /c mklink /D "$DestPath" "$SourcePath"
        } else {
            cmd /c mklink "$DestPath" "$SourcePath"
        }

        Write-Host "$DestPath has been symlinked"
    }
}

function Deploy-Manifest {
    $ManifestFile = $args[0]

    Write-Host "Deploying $ManifestFile..."

    $Manifest = Import-Csv -Header ("filename", "operation", "destination") -Delimiter ("|") -Path ".\$ManifestFile"

    foreach ($ManifestRow in $Manifest) {
        $SourcePath = "$PSScriptRoot\$($ManifestRow.filename)"
        $DestinationPath = "$env:USERPROFILE\$($ManifestRow.destination)\$($ManifestRow.filename)"
        switch ($ManifestRow.operation) {
            "symlink" {
                Symlink-File $DestinationPath $SourcePath
            }

            "copy" {
                Write-Warning "They 'copy' operation is not implemented yet. Skipping ..."
            }

            default {
                Write-Warning "Unknown operation $operation. Skipping..."
            }
        }
    }
}

Write-Host "--- Common configs ---"
Deploy-Manifest MANIFEST

Write-Host "--- Windows configs ---"
Deploy-Manifest MANIFEST.windows
