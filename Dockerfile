FROM ubuntu:xenial

LABEL MAINTAINER="Kotaro Sugawara <kotarella1110@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive \
    TERM=xterm

# Java 8
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN set -x && \
    : "Install OpenJDK 8" && \
    apt-get -qq update -y && \
    apt-get -qq install -y openjdk-8-jdk

# Android
ARG ANDROID_SDK_TOOLS_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip"

ENV ANDROID_HOME="/opt/android-sdk-linux"
ENV PATH="${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin"

RUN set -x && \
    : "Install dependencies to execute Android builds" && \
    dpkg --add-architecture i386 && \
    apt-get -qq update -y && \
    apt-get -qq install -y wget unzip libc6:i386 libstdc++6:i386 libgcc1:i386 libncurses5:i386 libz1:i386 && \

    : "Install Android SDK" && \
    mkdir -p ${ANDROID_HOME} && \
    cd ${ANDROID_HOME} && \
    wget -q ${ANDROID_SDK_TOOLS_URL} -O android-sdk-tools.zip && \
    unzip android-sdk-tools.zip && \
    rm -rf android-sdk-tools.zip && \

    : "Accept Android SDK licenses" && \
    yes | sdkmanager --licenses

RUN set -x && \
    : "Clean up" && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get autoremove -y && \
    apt-get clean
