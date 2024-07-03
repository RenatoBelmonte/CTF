IP=10.60.4.1
EMAIL="renatobelmonte.rb@gmail.com"
echo "the target IP is: $IP"
ssh-keygen -R $IP

# Set the SSH key file path
SSH_KEY="$HOME/.ssh/id_ed25519"

# Check if the SSH key exists
if [ -f "$SSH_KEY" ]; then
    echo "SSH key already exists at $SSH_KEY, adding to the server"
    scp root@$IP:/root/.ssh/authorized_keys .
    cat ~/.ssh/id_ed25519.pub >> authorized_keys
    scp authorized_keys root@$IP:/root/.ssh/ 

else
    echo "SSH key does not exist. Creating a new SSH key..."
    
    # Generate a new SSH key
    ssh-keygen -t ed25519 -C $EMAIL -f "$SSH_KEY" -N ""
    
    # Check if the key was successfully created
    if [ -f "$SSH_KEY" ]; then
        echo "New SSH key created successfully at $SSH_KEY, adding to the server"
        scp root@$IP:/root/.ssh/authorized_keys .
        cat ~/.ssh/id_ed25519.pub >> authorized_keys
        scp authorized_keys root@$IP:/root/.ssh/ 
    else
        echo "Failed to create a new SSH key."
    fi
fi

echo "Cloning server directories"
mkdir bck
cd bck
rsync -avhP root@$IP:/root/ .
