FROM openjdk:8

# Download and unzip the Android SDK tools
# Latest version available here: https://developer.android.com/studio/#command-tools
RUN curl --progress-bar --location https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip > android-sdk-tools.zip
RUN mkdir android-sdk
RUN unzip -qq android-sdk-tools.zip -d android-sdk
RUN rm android-sdk-tools.zip

# Install Android components
RUN echo y | android-sdk/tools/bin/sdkmanager 'tools' > /dev/null
RUN echo y | android-sdk/tools/bin/sdkmanager 'platform-tools' > /dev/null
RUN echo y | android-sdk/tools/bin/sdkmanager 'build-tools;27.0.3' > /dev/null
RUN echo y | android-sdk/tools/bin/sdkmanager 'platforms;android-27' > /dev/null

# Android home environment variable
ENV ANDROID_HOME=~/android-sdk
run echo 'export ANDROID_HOME=~/android-sdk' >> .bashrc

# Install and setup ssh server (uncomment if for some reason you need this)
# RUN apt-get update && \
#   apt-get install -y openssh-server rsync && \
#   mkdir /var/run/sshd && \
#   echo 'root:root' |chpasswd && \
#   sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
#   sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
# EXPOSE 22
# CMD ["/usr/sbin/sshd", "-D"]
