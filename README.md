# ansible-kitchen


#### Troubleshoot:

1. Ensure you have `ruby-dev` or `ruby-devel` packages installed.

2. If such an error occurs while using bundler for installing `kitchen` gems, perform the following:
    ```bash
    gcc -I. -I/usr/include -I/usr/include/ruby/backward -I/usr/include -I.   -fPIC -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions
    -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -mtune=generic -fasynchronous-unwind-tables
    -fstack-clash-protection -fcf-protection -fPIC -m64 -o bcrypt_pbkdf.o -c bcrypt_pbkdf.c
    gcc: fatal error: cannot read spec file ‘/usr/lib/rpm/redhat/redhat-hardened-cc1’: No such file or directory
    compilation terminated.
    ```
    **Solution** : `sudo dnf install redhat-rpm-config`

3. A certain issue with the Vagrantfile that is being generated fails the creation of the VM. The error is listed as follows:
    ```bash
    >>>>>> ------Exception-------
    >>>>>> Class: Kitchen::ActionFailed
    >>>>>> Message: 1 actions failed.
    >>>>>>     Failed to complete #create action: [Expected process to exit with [0], but received '1'
    ---- Begin output of vagrant up --no-provision --provider virtualbox ----
    STDOUT: Bringing machine 'default' up with 'virtualbox' provider...
    ==> default: Importing base box 'ubuntu/xenial64'...
    ==> default: Matching MAC address for NAT networking...
    ==> default: Checking if box 'ubuntu/xenial64' version '20191021.0.0' is up to date...
    ==> default: A newer version of the box 'ubuntu/xenial64' for provider 'virtualbox' is
    ==> default: available! You currently have version '20191021.0.0'. The latest is version
    ==> default: '20191211.0.0'. Run `vagrant box update` to update.
    ==> default: Setting the name of the VM: kitchen-ansible-kitchen-default-ubuntu_default_1576329233477_45947
    ==> default: Fixed port collision for 22 => 2222. Now on port 2200.
    ==> default: Clearing any previously set network interfaces...
    ==> default: Preparing network interfaces based on configuration...
        default: Adapter 1: nat
    ==> default: Forwarding ports...
        default: 22 (guest) => 2200 (host) (adapter 1)
    ==> default: Running 'pre-boot' VM customizations...
    ==> default: Booting VM...
    STDERR: There was an error while executing `VBoxManage`, a CLI used by Vagrant
    for controlling VirtualBox. The command and stderr is shown below.

    Command: ["startvm", "a3a0e804-d53e-4b51-8de5-ed41c9fca2c7", "--type", "headless"]

    Stderr: VBoxManage: error: The specified string / bytes buffer was to small. Specify a larger one and retry. (VERR_CFGM_NOT_ENOUGH_SPACE)
    VBoxManage: error: Details: code NS_ERROR_FAILURE (0x80004005), component ConsoleWrap, interface IConsole
    ---- End output of vagrant up --no-provision --provider virtualbox ----
    Ran vagrant up --no-provision --provider virtualbox returned 1] on default-ubuntu
    >>>>>> ----------------------
    >>>>>> Please see .kitchen/logs/kitchen.log for more details
    >>>>>> Also try running `kitchen diagnose --all` for configuration
    ```

    **Solution**: 
    ```yaml
    driver:
        name: vagrant
        customize:
            audio: none
    ```