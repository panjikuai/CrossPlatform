# CrossPlatform

This script is used to build a cross development for ESP32 SDK, 
I use Vagrant and VirtualBox to build the virtual development  and use visual stuio code to be the code edit and compiler and development environment

1. Install visual studio code:
2. Install vagrant :https://www.vagrantup.com/downloads.html
3. Install visualbox:
2. git clone https://github.com/panjikuai/CrossPlatform.git
3. vagrant init (to build the vagrant environment)
4. vagrant up (start download ubuntu environment and ESP32 SDK)
5. vagrant ssh (enter ubuntu environment to build the target project)
6. enter the project and register the environment variables: . set_env
7. make all the buld the project
