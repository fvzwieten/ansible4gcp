# Enable WinRM using Ansible provided powershell script
Invoke-Expression -Command ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))

# Enable CredSSP
Enable-WSManCredSSP -Role Server -Force

# Add ansible user for automation
$newpwd = ConvertTo-SecureString -String "r3dh4t1!" -AsPlainText -Force 
New-LocalUser -Name "ansible" -Password $newpwd -PasswordNeverExpires -Description "Account for Ansible Automation" 
Add-LocalGroupMember -Group "Administrators" -Member "ansible"
