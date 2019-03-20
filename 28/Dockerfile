FROM kotarella1110/android-sdk

RUN set -x && \
    : "Install Android SDK packages" && \
    sdkmanager \
    "platform-tools" \
    "platforms;android-28" \
    "build-tools;28.0.3" \
    "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2" \
    "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2" \
    "extras;google;m2repository" \
    "extras;android;m2repository" \
    "extras;google;google_play_services"
