$location = Get-Location
$exercises = "0-create-new-app", "1-create-component", "2-dynamic-data", "3-classes-and-styles", "4-events", "5-forms", "6-use-api", "7-component-tree", "8-component-communication", "9-global-store", "10-slots"

for ($i=0; $i -lt $exercises.length; $i++){
    $path = $location.ToString() + "\exercises\" + $labs[$i]
    $solution = $path + "\solution\"
    $template = $path + "\template\"
    Write-Host $solution
    Push-Location $solution
    npm install
    Push-Location $template
    npm install
}

Set-Location -Path $location


