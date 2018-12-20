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
	echo "*** SETTING UP TEST DATABASE ***" 
	python test_database_setup.py 
	echo
	echo "*** POPULATING DATABASE ***"
	python test_database_populator.py
	echo
	echo "*** TESTING PROGRAMS ***"
	python test_app.py
	echo
	echo "*** DELETING DATABASE ***"
	rm test_database.db
	echo
	echo
	echo "Testing completed."
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
