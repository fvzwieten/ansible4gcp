# Enable WinRM using Ansible provided powershell script
Invoke-Expression -Command ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))

# Enable CredSSP
Enable-WSManCredSSP -Role Server -Force
