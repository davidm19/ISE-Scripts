# read -r -d '' DOCUMENTATION << EOF
# Script for running Python database tests

# Usage:
	 

# Environment Variables:
# EOF

# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function test {
	python test_database_setup.py
	python test_database_populator.py
	python test_app.py
	rm test_database.db
}

function run {
	ACTION=$1
	case $ACTION in
		test)
			test ;;
		*)
			echo "Invalid argument"
			exit 1
	esac
}

