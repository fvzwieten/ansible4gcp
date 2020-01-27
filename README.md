# ansible4gcp
Ansible playbooks for Google Cloud Platform (GCP)

For Windows the difficulty is having an "ansible" account for automation inside the Windows VM. There is a way to retrieve the password of the GCP use from the VM, but the API version for this is quit a lot of work and, afaik, there is no ansible module for it (yet).

The current method is to use a powershell script for a sysprep metadata entry in gcp_create_instance. In this powershell script a user "ansible" is created and made member of the Administrators group. This powershell script also calls the Ansible WinRM enablement powershell script. After sysprep the VM is rebooted and we need to wait for it before continuing. Then, we run a play against this machine to set the password for the ansible account to a vaulted password.
