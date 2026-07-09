#!/bin/bash
# 1. Pubspec Güncelleme
PUBSPEC="pubspec.yaml"
ASSETS_DIR="assets"

echo "Updating pubspec.yaml..."
# Önceki assets bloğunu temizle (assets satırından itibaren)
sed -i '' '/^  assets:/,$d' $PUBSPEC
echo "  assets:" >> $PUBSPEC
# Klasörleri bul ve ekle
find $ASSETS_DIR -type d -mindepth 1 | while read dir; do
    echo "    - $dir/" >> $PUBSPEC
done

# 2. AppAssets Sınıfını Güncelleme
ASSETS_FILE="lib/core/constants/app_assets.dart"

echo "Updating AppAssets class..."
echo "class AppAssets {
  AppAssets._();

  // Images
  
  // Icons
}" > $ASSETS_FILE

find $ASSETS_DIR -type f \( -name "*.png" -o -name "*.svg" -o -name "*.json" \) | while read line; do
    FILENAME=$(basename "$line" | cut -f 1 -d '.')
    
    # Prefix ve Kategori Mantığı
    if [[ "$line" == *"icons"* ]]; then
        VAR_NAME="icon${FILENAME^}"
        TARGET_TAG="// Icons"
    else
        VAR_NAME="${FILENAME}"
        TARGET_TAG="// Images"
    fi

    # Dosyaya ekle
    if ! grep -q "static const String $VAR_NAME =" "$ASSETS_FILE"; then
        sed -i '' "/$TARGET_TAG/a\\  static const String $VAR_NAME = '$line';" "$ASSETS_FILE"
    fi
done

echo "Assets synchronization complete!"