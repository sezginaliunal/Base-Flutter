#!/bin/bash
# Kullanım: ./scripts/set_app_name.sh "Uygulama Adı"

APP_NAME=$1

if [ -z "$APP_NAME" ]; then
  echo "HATA: Lütfen yeni bir uygulama adı girin (Örn: \"Monotone\")"
  exit 1
fi

echo "Uygulama ismi güncelleniyor: $APP_NAME ..."

# 1. Android: AndroidManifest.xml (android:label)
# Android'de genellikle string.xml içindeki app_name referans alınır. 
# Bu yüzden hem AndroidManifest'i hem de string.xml dosyasını hedefliyoruz.

# AndroidManifest.xml içindeki doğrudan label değişimi
find android/app/src/main/AndroidManifest.xml -type f -exec sed -i '' "s/android:label=\"[^\"]*\"/android:label=\"$APP_NAME\"/g" {} +

# Android strings.xml (app_name değeri)
find android/app/src/main/res/values/strings.xml -type f -exec sed -i '' "s/<string name=\"app_name\">[^<]*<\/string>/<string name=\"app_name\">$APP_NAME<\/string>/g" {} +

# 2. iOS: Info.plist (CFBundleDisplayName)
find ios/Runner/Info.plist -type f -exec sed -i '' "s/<key>CFBundleDisplayName<\/key>[[:space:]]*<string>[^<]*<\/string>/<key>CFBundleDisplayName<\/key><string>$APP_NAME<\/string>/g" {} +

echo "--------------------------------------------------"
echo "Uygulama ismi başarıyla '$APP_NAME' olarak güncellendi."