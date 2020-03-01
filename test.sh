#!/bin/bash

function init()
{

echo "Checking Docker and Docker-compose version "
docker -v > /dev/null
if [ $? -eq 0 ];
then
	result=$(docker --version | awk '{print $3}' | cut -d '.' -f 1-3)
	if [[ $result > 19.03.1 ]];
	then
		echo ""
	else
		echo "Docker installed is not latest. Please update Docker tool!"
	fi
	docker-compose -v > /dev/null
	echo "Docker-Compose is installed."
	echo ""
else
	echo "Docker not installed..."
	echo ""
fi

echo "##### Create custom project for application ####"

read -p "Enter the project name: " project_name
sudo mkdir -p ~/cicerotool/$project_name/repos
sudo chown -R 1050:1050 ~/cicerotool/

echo "Move all application related files inside repos directory : ~/cicerotool/$project_name/repos"
}

function start_app() 
{
read -p "Enter the absolute directory path of docker-compose file:" location
echo "start the container using docker-compose file ..."
echo ""
cd $location
read -p "Enter the project name: " project_name
echo ""
if [[ $project_name == '' ]];
then
	exit 1
else
	docker-compose run -d -e projectname=$project_name cicero
	sleep 5s
	echo "Container is up and running.."
fi
}

function stop_app() 
{

read -p "Enter the absolute directory path of docker-compose file:" location
echo "Stopping the conatiner..."

cd $location
docker-compose down
sleep 5s
echo "Container stopped "
}

function logs(){

echo "Checking the logs..."
docker logs --timestamps cicero | tee logs.txt
echo "Extracted logs to file -> logs.txt..."
}

case $1 in 
	init)	
		echo "Initializing Project:"
		init
		;;	
	start)
		echo "Starting Docker compose up"
		start_app
		;;
  	stop)
		echo "Stopping Docker compose up"
		stop_app
		;;
	logs)
		echo "Generate logs of container"
		logs
		;;
	*)
		echo "Invalid selection"
		break
		;;
esac

