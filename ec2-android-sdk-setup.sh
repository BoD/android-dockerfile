# Print executed commands
set -x

# Install Correto JDK 8
# See https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/amazon-linux-install.html
sudo amazon-linux-extras enable corretto8
sudo yum install java-1.8.0-amazon-corretto-devel
java -version

# Download and unzip the Android command line tools
# Latest version of this file available here: https://developer.android.com/studio/#command-tools
curl --progress-bar --location https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip > cmdline-tools.zip
unzip -qq cmdline-tools.zip -d cmdline-tools

# Install Android components
echo y | cmdline-tools/tools/bin/sdkmanager --sdk_root=android-sdk 'platform-tools' > /dev/null
# Latest version of build-tools available here: https://developer.android.com/studio/releases/build-tools.html
echo y | cmdline-tools/tools/bin/sdkmanager --sdk_root=android-sdk 'build-tools;29.0.3' > /dev/null
echo y | cmdline-tools/tools/bin/sdkmanager --sdk_root=android-sdk 'platforms;android-30' > /dev/null

# Cleanup
rm -rf cmdline-tools.zip cmdline-tools

# Setup Android home environment variable
export ANDROID_HOME=~/android-sdk
echo 'export ANDROID_HOME=~/android-sdk' >> ~/.bashrc
