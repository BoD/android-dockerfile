FROM openjdk:8

RUN mkdir android-sdk

# Download and unzip the Android command line tools
# Latest version of this file available here: https://developer.android.com/studio/#command-tools
RUN curl --progress-bar --location https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip > cmdline-tools.zip
RUN unzip -qq cmdline-tools.zip -d cmdline-tools

# Install Android components
RUN echo y | cmdline-tools/tools/bin/sdkmanager --sdk_root=android-sdk 'platform-tools' > /dev/null
# Latest version of build-tools available here: https://developer.android.com/studio/releases/build-tools.html
RUN echo y | cmdline-tools/tools/bin/sdkmanager --sdk_root=android-sdk 'build-tools;29.0.3' > /dev/null
RUN echo y | cmdline-tools/tools/bin/sdkmanager --sdk_root=android-sdk 'platforms;android-29' > /dev/null

# Cleanup
RUN rm -rf cmdline-tools.zip cmdline-tools

# Setup Android and Java home environment variable
ENV ANDROID_HOME=/android-sdk
RUN echo 'export ANDROID_HOME=/android-sdk' >> ~/.bashrc
RUN echo 'export JAVA_HOME=/usr/local/openjdk-8' >> ~/.bashrc

# Install and setup ssh server (uncomment if for some reason you need this)
# To login without a password, run this command on the host:
#     ssh-copy-id -i ~/.ssh/id_rsa.pub -p 2222 root@localhost
# (the root password is 'root')
#RUN apt-get update && \
#    apt-get install -y openssh-server rsync && \
#    mkdir /var/run/sshd && \
#    echo 'root:root' | chpasswd && \
#    sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
#    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
#EXPOSE 22
#CMD ["/usr/sbin/sshd", "-D"]
