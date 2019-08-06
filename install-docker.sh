#!/bin/sh
# Created by Abraao Silva
# Date 08-12-2018
#!/bin/sh

confirm () {
	read -r -p "${1:-Are you sure? [y/N]} " response
	case $response in
		[yY][eE][sS]|[yY]) 
			# true
			echo 1;
			;;
		*)
			#false
			echo 0;
			;;
	esac
}

echo "It is ok to have 'docker command appears to already exist on this system'"
echo "warning if 'docker' has been installed with this script and deleted afterwards."
echo

CONFIRM="$(confirm 'Install docker and docker-compose? [y/N]')"

if [ $CONFIRM -eq 1 ]
then
	sudo apt-get update
	sudo apt-get -y install curl
	curl -sSL https://get.docker.com/ | sh

	sudp apt-get -y install python-pip
	pip install docker-compose

	sudo apt-get -y autoremove

	echo
	echo "Don't forget to add your user to the 'docker' group with"
	echo "  sudo usermod -aG docker abraao" 
	echo "or"
	echo "  sudo usermod -aG docker \$(whoami)"
fi
