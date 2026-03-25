android {
    namespace = "com.example.bus_desktop"
    compileSdk = flutter.compileSdkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        // Para resolver o erro de 'jvmTarget' deprecado
        freeCompilerArgs += "-Xjvm-default=all"
    }

    defaultConfig {
        applicationId = "com.example.bus_desktop"
        minSdk = 21
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}