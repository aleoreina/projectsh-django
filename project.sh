#!/bin/bash


function template_header {  
clear	
echo -e "--------------------------------------------------------"
echo -e "#  project.sh  for Django Project \e[5m        Easy for you! \e[25m"
echo -e "--------------------------------------------------------"
echo -e "######### \e[1m  Ver 1.0 Github: @projectsh-django \e[25m #########"
echo -e "      "
}

function template_main_menu {
 
    template_header
    echo -e "--------------------------------------------------------"
	echo -e " \e[101m Manage.py functions \e[49m "
    echo -e "--------------------------------------------------------"
    echo "1) Run Server :: 0.0.0.0:8080"
    echo "2) Do make migrations (structure) for all models.py to Database "
    echo "3) Do migrations for all models.py to Database "
    echo -e "--------------------------------------------------------"


    echo -e "--------------------------------------------------------"
	echo -e " \e[44m Requirements functions \e[49m "
    echo -e "--------------------------------------------------------"
    echo "R1) Install / Update Packages :: requirements.txt"
    echo "R2) Install / Update Packages :: packages.json (via yarn)"
    echo -e "--------------------------------------------------------"




    echo "X) Exit"
}

function install_requirements_txt {
    template_header
    echo "Installing req.txt"
    pip install -r requirements.txt
    sleep 2
}
function install_packages_json_via_yarn {
    template_header
    echo "Installing package.json"
    yarn
    sleep 2
}
function run_server_for_all_ips_port_8080 {
    template_header
    echo "Running Server for 0.0.0.0:8080 for Django.. "
    python ./manage.py runserver 0.0.0.0:8080
    echo "Redirecting to main menu in 2 seconds..."

    sleep 2
}
function run_make_migrations {
    template_header
    echo "Creating structured migrations  "
    python ./manage.py makemigrations
    echo "Redirecting to main menu in 2 seconds..."
    sleep 2
}
function run_migrate {
    template_header
    echo "Doing migrations to DB "
    python ./manage.py makemigrations
    echo "Redirecting to main menu in 2 seconds..."
    sleep 2
}
# Purpose - Get input via the keyboard and make a decision using case..esac 
function main_menu(){
    template_main_menu
	local c
	read -p "Enter the code > " c
	case $c in
    	1)	run_server_for_all_ips_port_8080 ;;
        2)	run_make_migrations ;;
        3)  run_migrate ;;
		R1)	install_requirements_txt ;;
        R2)	install_packages_json_via_yarn ;;
		X)	echo "Bye!"; exit 0 ;;
		*)	
			echo "Please select between 1 to 2 choice only."
			pause
	esac
}

# ignore CTRL+C, CTRL+Z and quit singles using the trap
#trap '' SIGINT SIGQUIT SIGTSTP

while true
do
	clear
 	main_menu
done