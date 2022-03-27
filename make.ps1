Write-Host "building libuiohook"
Write-Host ""

Write-Host "deleting build folder..."

Get-ChildItem -Path .\build -Recurse | Remove-Item -force -recurse
Remove-Item .\build -force

Write-Host "deleted build folder"
Write-Host ""

Write-Host "deleting dist folder..."

Get-ChildItem -Path .\dist -Recurse | Remove-Item -force -recurse
Remove-Item .\dist -force

Write-Host "deleted dist folder"
Write-Host ""

New-Item -ItemType directory -Path .\build | Out-Null
New-Item -ItemType directory -Path .\dist | Out-Null

Write-Host "created emtpy build folder"
Write-Host "created empty dist folder"
Write-Host ""


Write-Host "cmake - preparing build"
cd .\build
cmake -S .. -D BUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=../dist
Write-Host ""

cd ..\dist
Write-Host "cmake - building"
cmake --build . --parallel 2 --target install
cd ..
Write-Host ""



