#!/bin/bash

read -r -d '' DOCUMENTATION << EOF
Script for running Python database tests

Usage:
    $CMD test = set up a test database, populate it, test it out, and delete it
	 

Environment Variables:
    PASS
EOF

# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function test {
	echo -e "*** SETTING UP TEST DATABASE ***\n" 
	python test_database_setup.py 
	echo -e "*** POPULATING DATABASE ***\n"
	python test_database_populator.py
	echo -e "*** TESTING PROGRAMS ***\n"
	python test_app.py
	echo -e "*** DELETING DATABASE ***\n"
	rm test_database.db
	echo -e "\nTesting completed."
}

ACTION=$1
function main {
	case $ACTION in
		test) test;;
		*) echo "Invalid argument"
			exit 1
	esac
}

main
