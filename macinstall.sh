echo "isums LOVE istallation"
echo "Type \"m\" to continue."

read -rsn1 input
if [ "$input" = "m" ]; then
    echo "Installation will assume Homebrew is not installed. Press any key to continue."
    read -rsn1 input
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install love
    echo "LOVE has been successfully installed. Now run 'love .'."
fi