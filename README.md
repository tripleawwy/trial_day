<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
* [Usage](#usage)
  * [Initiation](#initiation)
  * [Ansible](#ansible)
* [Test](#test)
* [Issues](#issues)



<!-- ABOUT THE PROJECT -->
## About The Project

This project represents the trial work day task for this user which is intended to test some basic skills with the linux shell,
ssh daemon, docker containers and ansible.

Here's the plan:
* Create a working environment to run a docker container with sshd service and some preconfigured users.
* Create a working ansible environment to provision new users and to be able to
modify ssh public keys for that docker environment.

<!-- GETTING STARTED -->
## Getting Started

The following instructions will guide you trough requirements needed for this application to run and the setup.

### Prerequisites

####tested with following setup:

* Docker version 19.03.13
* docker-compose version 1.27.3
* ansible 2.9.6
* python 3.8.2


<!-- USAGE -->
## Usage
* Clone this repository.

    * via https
    * ```sh
        git clone https://github.com/tripleawwy/trial_day.git
      ```

    
* Make sure private keys are in mode 0600
* Navigate to directory.
* ```sh
   cd trial_day/
  ```
* ```
  chmod 600 roles/ssh/files/public_keys/origin\
  && chmod 600 roles/ssh/files/public_keys/docker-user-key
  ```
* Navigate to docker and docker-compose files.
* ```sh
   cd docker/
  ```
  
  

### Initiation

* **Build** the modified alpine docker image specified in Dockerfile and **run** the container.
* ```sh
  docker-compose up -d --build
  ```

#### Test connectivity
The Container should be up and running you can test to connect to the container via ssh
* ```
  ssh docker-user@localhost -p 2222
  ```
You will be prompted to provide a password now which is **password01**  
  
### Ansible

* Navigate back to the parent directory of the docker directory
* ```sh
  cd ../
  ```

#### **Add** ssh keys and new user called ipoque
* ```sh
  sudo ansible-playbook site.yml --tags common --ask-pass --ask-become-pass
  ```
#### **Cleanup** ssh keys

* **Remove** ssh keys for docker-user
* ```sh
  sudo ansible-playbook site.yml --tags cleanup-ssh --ask-pass --ask-become-pass
  ```




  <!-- Test -->
## Test

* Run a simple bash script to see userspecific ssh connectivity
* ```sh
  tests/test.sh
  ```


Output should look like this when tag **common** is used:

```yaml
ipoque@localhost SSH_ENABLED
docker-user@localhost SSH_ENABLED
```

Output should look like this when tag **cleanup-ssh** is used:

```yaml
ipoque@localhost SSH_ENABLED
docker-user@localhost SSH_DISABLED
```
