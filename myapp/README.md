
# Flutter project.
[documentation](https://flutter.io/)

## 1. 安裝設置環境變數

將下載好的[development](https://storage.googleapis.com/flutter_infra/releases/beta/macos/flutter_macos_v0.5.1-beta.zip) 解壓縮檔案設置環境變數

```
 # 設置環境變數 
 $ export PATH=/Users/tw00089923/development/flutter/bin:$PATH
 # 測試環境
 $ flutter doctor  
 # 新創App
 $ flutter create myapp
 # 開啟模擬器
 $ open -a Simulator.app
 # Flutter run 
```



<img src="https://flutter.io/images/flutter-starter-app-android.png" width="500">
## 2.Flutter Architecture
![flutter architecture](https://cdn-images-1.medium.com/max/1600/0*NeeJq8PwkiTj8eMf)
使用 animation, 請注意使用animation widget 不然就是編寫Animation builder 
[animation](https://flutter.io/tutorials/animation/)

## 3. Plugin 

a. [Shared preferences plugin](https://github.com/flutter/plugins/tree/master/packages/shared_preferences)

b. [dbcrypt](https://pub.dartlang.org/packages/dbcrypt)
c.



## Deployment 

- fastlane

- [ios]()

- [android](https://flutter.io/android-release/)
--- process ---
A. Review the App Manifest [ 修改 Android Manifest  ]
B. Review the build configuration [修改 Configuration ]
C. Adding a Launcher icon
D. Signing the app
E. Enabling Proguard
F. Building a release APK
G. Installing a release APK on a device
H. Publishing an APK to the Google Play Store
---

A. Review the App Manifest
    open [路徑] /android/app/src/main/AndroidManifest.xml 修改
    1. application
    2. uses-permission
B. Review the build configuration 
    open Config [路徑]/android/app/build.gradle  修改 defaultConfig
        1. applicationId
        2. versionCode & versionName
        3. minSdkVersion & targetSdkVersion
C. Adding a Launcher icon
    1. Icon[Spec.]](https://developer.android.com/guide/practices/ui_guidelines/icon_design_launcher.html)

    2. [路徑]/android/app/src/main/res/mipmap- 會發現好幾種規格需要更改
    3. [路徑]/android/app/src/main/AndroidManifest.xml 找到<application android:icon="@mipmap/ic_launcher" 去更改的格式
    4. 以上更新完過 $ flutter run 

D. Signing the app
    ---process---
    產生RSA key -> 修改文檔加入RSA key -> 代碼混淆及極小化

    1. keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
    Note: Keep this file private; do not check it into public source control.
    2. 接著創建 [路徑]/android/key.properties   此檔案請保留
    ```
    storePassword=<password from previous step>
    keyPassword=<password from previous step>
    keyAlias=key
    storeFile=<location of the key store file, e.g. /Users/<user name>/key.jks>

    Note: Keep this file private; do not check it into public source control.
    ```
    3. [路徑]/android/app/build.gradle
    變更 android {
    ---
    修改
    def keystorePropertiesFile = rootProject.file("key.properties")
    def keystoreProperties = new Properties()
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
    android {
    ---
    變更 
    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig signingConfigs.debug
        }
    }
    ---
    修改
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile file(keystoreProperties['storeFile'])
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
D. Enabling Proguard 
  在flutter 內並不會使[代碼混淆obfuscate](https://zh.wikipedia.org/wiki/%E4%BB%A3%E7%A0%81%E6%B7%B7%E6%B7%86) 及 [極小化minify](https://zh.wikipedia.org/wiki/%E6%A5%B5%E7%B0%A1%E5%8C%96)
    1. Step 1 - Configure Proguard 
        Create /android/app/proguard-rules.pro file and add rules listed below.
        ```
        #Flutter Wrapper
        -keep class io.flutter.app.** { *; }
        -keep class io.flutter.plugin.**  { *; }
        -keep class io.flutter.util.**  { *; }
        -keep class io.flutter.view.**  { *; }
        -keep class io.flutter.**  { *; }
        -keep class io.flutter.plugins.**  { *; }
        ```
    2. Step 2 - Enable obfuscation and/or minification
        Open /android/app/build.gradle file and locate buildTypes definition. Inside release configuration set minifiyEnabled and useProguard flags to true. You have to also point ProGuard to the file you have created in step 1.
        ```
        android {
            buildTypes {
                release {
                    signingConfig signingConfigs.debug
                    minifyEnabled true
                    useProguard true
                    proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
                }
            }
        }

        ```

F. Building a release APK
    考慮版本的差異釋出 release APK
    cd app的路徑
    $ Run flutter build apk (flutter build defaults to --release).
    The release APK for your app is created at <app dir>/build/app/outputs/apk/app-release.apk.

G. Installing a release APK on a device
    1. 用usb連線 Android 手機
    2. 安裝release 版本的app 在android 手機上
    <注意 路徑為 app dir >
    $ Run flutter install .

H. Publishing an APK to the Google Play Store
    For detailed instructions on publishing the release version of an app to the Google Play Store, see the [Google Play publishing documentation](https://developer.android.com/distribute/googleplay/start.html)



## 小技巧 
1. 截圖：在terminal上  按下 S
2. [線上編輯網站](https://flutterstudio.app/)

## Note . 注意事項
有Row || Column 請使用crossAxisAlignment ,mainAxisAlignment 調整空間及佈局
## 問題 
1. RangeError: RangeError (index): Invalid value: Only valid value is 0: 1
=> flutter clean 刪除整個package 在重新安裝 
=> flutter packages get

繼承 
void change(state state) {
    state=state
}
