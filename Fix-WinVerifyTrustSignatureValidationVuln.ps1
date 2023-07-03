﻿$Name = "EnableCertPaddingCheck"
$Value = "1"

$RegistryPath = "HKLM:\Software\Microsoft\Cryptography\Wintrust\Config"
if(!(Test-Path $RegistryPath)){
    New-Item -Path "HKLM:\Software\Microsoft\Cryptography\Wintrust"
    New-Item -Path $RegistryPath
    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value
}
elseif((Get-ItemProperty -Path $RegistryPath).$Name -eq "0"){
    Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value
}
elseif((Get-ItemProperty -Path $RegistryPath).$Name -eq "1"){
    Get-Item -Path $RegistryPath
}
else{New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value}


$RegistryPath = "HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust\Config"
if(!(Test-Path $RegistryPath)){
    New-Item -Path "HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust"
    New-Item -Path $RegistryPath
    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value
}
elseif((Get-ItemProperty -Path $RegistryPath).$Name -eq "0"){
    Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value
}
elseif((Get-ItemProperty -Path $RegistryPath).$Name -eq "1"){
    Get-Item -Path $RegistryPath
}
else{New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value}