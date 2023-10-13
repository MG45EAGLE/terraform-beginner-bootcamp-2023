# Terraform Beginner Bootcamp 2023

<<<<<<< HEAD
## Semantic versioning :mage:
This project is going to utiliaze semantic versioning for its tagging.
=======
## Semantic versioning
This project is going to utiliize semantic versioning for its tagging.
>>>>>>> origin/1_semantic_versioning
[semver.org ](https://semver.org/)

The general format:
**MAJOR.MINOR.PATCH**, eg. `1.0.1`

Given a version number **MAJOR.MINOR.PATCH**, increment the:

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

### Considerations with the Terrafrom CLI changes
The Terraform CLI installation instrucitons have changes due to gpg keyring changes. So  we needed to refer to the original gitpod.yml bash instructioms via Teraform documentation and change the scripting for install.

[Install Terraform CLI](https://devloper.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) 

### Considerations for Linux Distribution
This project is built against Ubunto 
Please check your Linux Distibutions and change according to your needs.

[How to Check OS Version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)
Example of checking OS version:
```
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

#### Refactoring into bash scripts

While fixing the Terraform CLI gpg deprecation issues we noticed that bash script steps were a considerable amount more code.
So we decided to create a bash script to install the terraform CLI.
This bash script is located herer: [./bin/install_terraform_cli](./bin/install_terraform_cli)

- This will keep the Gitpod task file ([.gitpod.yml](.gitpod.yml)) tidy.
- This allows for easier debugging during manual execution of the Terraform CLI Install.
- This will allow better portability for other projects that need to install Terraform CLI.

#### Shebang Considerations
A Shebang (pronounced Sha-bang) tells the bash script what program will interpret the script. eg. `#!/bin/bash`

ChatGPT receommeded this format for bash: `#!/usr/bin/env bash`
- for portability for different OS distributions
- will search the user's PATH for the bash executable

https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Execution Considerations

When executing the bash script we cna use the `./` shorthand notation to execute the bash script.
eg. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml we need to point the script to an interpreter program.
eg. `source ./bin/install_terraform_cli`

#### Linux Permissions Considerations
In order to make our bash scripts executable we need to change linux permission for the fix to be executable at the user mode.
```sh
chmod u+x ./bin/install_terraform_cli
```
Alternatively:
```
chmod 744 ./bin/install_terraform_cli
```
https://en.wikipedia.org/wiki/Chmod

https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

### Github Lifecycle (Before, Init, Command)
We need to be careful using the Init as it will not rerun if we restart and existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks

### Working Env Vars
#### env Commnand
We can list out all environment variables ( Env Vars) using the `env` cmd
We can filter specific Env Vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars
In the terminal we can set using:  `export HELLO='world`
In the terminal we can uset using: `unset HELLO`

We can set env var temporarily when just running a command: 

```sh
HELLO='world' ./bin/print_message
```
Within a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```
#### Printing Var
We can print an env var using echo e.g. `echo $HELLO`

#### Scoping of Env vars 
When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.
If you want Env Vars to persist across all future bash terminals that are open uo need to set env vars in your bash profiles 
eg.`.bash_profile`

#### Persisting Env Vars in Gitpod
We can persist Env Vars into gitpod by storing them in Gitpod Secrets Storage.

```sh
gp env HELLO='world'
```
All future workspaces launched wull set the env vars for all bash terminal open in those workspaces.

You can also set env vars in the `.gitpod.yml` but this can only contain non-sensitve env variables.




