# Flutter project.
[documentation](https://flutter.io/)

## 1. 安裝設置環境變數
將下載好的[development](https://storage.googleapis.com/flutter_infra/releases/beta/macos/flutter_macos_v0.5.1-beta.zip) 解壓縮檔案設置環境變數
```
 # 設置環境變數 
 $ export PATH=/Users/tw00089923/development/flutter/bin:$PATH
 # 測試環境
 $ flutter doctor  
 # 新創資料
 $ flutter create myapp
 # 開啟模擬器
 $ open -a Simulator.app
 # Flutter run 
```


<img src="https://flutter.io/images/flutter-starter-app-android.png" width="500">
## 2.Flutter Architecture
![flutter architecture](https://cdn-images-1.medium.com/max/1600/0*NeeJq8PwkiTj8eMf.)
使用 animation, 請注意使用animation widget 不然就是編寫Animation builder [animation](https://flutter.io/tutorials/animation/)










## Note . 注意事項
有Row || Column 請使用crossAxisAlignment ,mainAxisAlignment 調整空間及佈局


繼承 
void change(state state) {
    state=state
}
