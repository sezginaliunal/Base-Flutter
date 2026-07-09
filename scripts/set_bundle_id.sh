#!/bin/bash
# Kullanım: ./scripts/set_bundle_id.sh com.yeni.bundleid

NEW_ID=$1

if [ -z "$NEW_ID" ]; then
  echo "HATA: Lütfen yeni bir Bundle ID girin."
  exit 1
fi

echo "Bundle ID güncelleniyor: $NEW_ID ..."

# 1. Android: build.gradle (applicationId)
find android/app/build.gradle.kts -type f -exec sed -i '' "s/applicationId \"[^\"]*\"/applicationId \"$NEW_ID\"/g" {} +

# 2. Android: AndroidManifest.xml (package name - nadiren gerekebilir ama garanti olsun)
find android/app/src/main/AndroidManifest.xml -type f -exec sed -i '' "s/package=\"[^\"]*\"/package=\"$NEW_ID\"/g" {} +

# 3. iOS: project.pbxproj (PRODUCT_BUNDLE_IDENTIFIER)
find ios/Runner.xcodeproj/project.pbxproj -type f -exec sed -i '' "s/PRODUCT_BUNDLE_IDENTIFIER = [^;]*/PRODUCT_BUNDLE_IDENTIFIER = $NEW_ID/g" {} +

echo "--------------------------------------------------"
echo "Bundle ID başarıyla $NEW_ID olarak değiştirildi."
echo "Not: Eğer Firebase kullanıyorsan google-services.json ve GoogleService-Info.plist dosyalarını manuel güncellemelisin."