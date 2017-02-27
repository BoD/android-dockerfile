FROM openjdk:8

RUN curl https://dl.google.com/android/repository/tools_r25.2.5-linux.zip > android-sdk-tools.zip
RUN mkdir android-sdk
RUN unzip android-sdk-tools.zip -d android-sdk
RUN rm android-sdk-tools.zip

RUN echo y | android-sdk/tools/android update sdk --no-ui --all --filter platform-tools
RUN echo y | android-sdk/tools/android update sdk --no-ui --all --filter build-tools-25.0.2
RUN echo y | android-sdk/tools/android update sdk --no-ui --all --filter android-25
RUN echo y | android-sdk/tools/android update sdk --no-ui --all --filter extra-android-m2repository
RUN echo y | android-sdk/tools/android update sdk --no-ui --all --filter extra-google-google_play_services
RUN echo y | android-sdk/tools/android update sdk --no-ui --all --filter extra-google-m2repository

ENV ANDROID_HOME=/android-sdk
