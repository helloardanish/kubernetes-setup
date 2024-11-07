# !/bin/bash

# Check if the JDK is already installed
if [ ! -d "/opt/jdk" ]; then
    echo "JDK not found, extracting..."

    # If you copied a .tar.gz file, extract it
    if [ -f "/tmp/openjdk-8u422-b05-linux-x64.tar.gz" ]; then
        mkdir -p /opt/jdk
        tar -xzf /tmp/openjdk-8u422-b05-linux-x64.tar.gz -C /opt/jdk --strip-components=1
    elif [ -d "/tmp/jdk-folder" ]; then
        # If you copied a folder, move it
        mkdir -p /opt/jdk
        cp -r /tmp/jdk-folder/* /opt/jdk/
    else
        echo "No JDK files found. Exiting."
        exit 1
    fi
else
    echo "JDK already installed at /opt/jdk, skipping extraction."
fi

# Set JAVA_HOME and PATH environment variables
export JAVA_HOME=/opt/jdk
export PATH=$JAVA_HOME/bin:$PATH

# Verify Java installation
java -version

# Keep the container running
tail -f /dev/null


# kubectl cp install-java.sh centos-staging-pod:/tmp/install-java.sh

# kubectl exec -it centos-staging-pod -- /bin/bash /tmp/install-java.sh

# kubectl cp /home/a-r-danish/Documents/Docker-Project/staging-setup/java-builds/testing-build/testing-0.0.1-SNAPSHOT.jar centos-staging-pod:/home/java-builds/testing.jar

# /home/java-build/testing.jar



