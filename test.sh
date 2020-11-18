echo "Begin reinstall"
./install.sh --uninstall
./install.sh
echo "Finish reinstall"
echo ""

# Argument parsing code copied from:
# https://medium.com/@Drew_Stokes/bash-argument-parsing-54f3b81a6a8f

PARAMS=""

while (( "$#" )); do
    case "$1" in
        --webhook)
            if [ -n "$2" ] && [ ${2:0:1} != "-" ]; then
                webhook=$2
                shift 2
            else
                echo "Error: Argument for $1 is missing" >&2
                exit 1
            fi
            ;;
        -*|--*=) # unsupported flags
            echo "Error: Unsupported flag $1" >&2
            exit 1
            ;;
        *) # preserve positional arguments
            PARAMS="$PARAMS $1"
            shift
            ;;
    esac
done

# Set positional arguments in their proper place
eval set -- "$PARAMS"


for x in {0..3}
do
    m0nitor --host 8.8.8.8 --server-name Google --debug --webhook $webhook
    echo ""
done

for x in {0..3}
do
    m0nitor --host 10.254.254.254 --server-name ShouldFail --debug --webhook $webhook --max-ping-fails 3
    echo ""
done