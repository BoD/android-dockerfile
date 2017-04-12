FROM openjdk:8

RUN curl https://dl.google.com/android/repository/tools_r25.2.5-linux.zip > android-sdk-tools.zip
RUN mkdir android-sdk
RUN unzip android-sdk-tools.zip -d android-sdk
RUN rm android-sdk-tools.zip

RUN echo y | android-sdk/tools/bin/sdkmanager 'tools'
RUN echo y | android-sdk/tools/bin/sdkmanager 'platform-tools'
RUN echo y | android-sdk/tools/bin/sdkmanager 'build-tools;25.0.2'
RUN echo y | android-sdk/tools/bin/sdkmanager 'platforms;android-25'
RUN echo y | android-sdk/tools/bin/sdkmanager 'extras;android;m2repository'
RUN echo y | android-sdk/tools/bin/sdkmanager 'extras;google;google_play_services'
RUN echo y | android-sdk/tools/bin/sdkmanager 'extras;google;m2repository'
RUN echo y | android-sdk/tools/bin/sdkmanager 'extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2'
RUN echo y | android-sdk/tools/bin/sdkmanager 'extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2'


ENV ANDROID_HOME=/android-sdk
