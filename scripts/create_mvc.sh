#!/bin/bash
# ========================================
# Flutter GetX MVC module creator + Route injector
# Usage: sh scripts/create_mvc.sh feature_name
# ========================================

# Argüman kontrolü
if [ -z "$1" ]; then
  echo "❌ Lütfen bir feature adı girin. Örnek: sh scripts/create_mvc.sh deneme"
  exit 1
fi

NAME=$1
CAPITALIZED_NAME="$(tr '[:lower:]' '[:upper:]' <<< ${NAME:0:1})${NAME:1}"
FEATURE_PATH="lib/app/features/$NAME"
ROUTES_FILE="lib/core/config/constants/routes/navigation_routes.dart"
APP_ROUTER_FILE="lib/core/config/constants/routes/navigation_route_pages.dart"

# Proje adını pubspec.yaml'dan çek
PROJECT_NAME=$(grep '^name:' pubspec.yaml | awk '{print $2}')
if [ -z "$PROJECT_NAME" ]; then
  PROJECT_NAME="app"
fi

# =============================
# 1️⃣ MVC klasör ve dosyalarını oluştur
# =============================
mkdir -p "$FEATURE_PATH/models"

# Controller
cat > "$FEATURE_PATH/${NAME}_controller.dart" <<EOL
import 'package:get/get.dart';

class ${CAPITALIZED_NAME}Controller extends GetxController {}
EOL

# Page
cat > "$FEATURE_PATH/${NAME}_page.dart" <<EOL
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:$PROJECT_NAME/app/features/$NAME/${NAME}_controller.dart';

class ${CAPITALIZED_NAME}Page extends GetView<${CAPITALIZED_NAME}Controller> {
  const ${CAPITALIZED_NAME}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$CAPITALIZED_NAME')),
      body: const Center(child: Text('Hello $CAPITALIZED_NAME')),
    );
  }
}
EOL

# Service
cat > "$FEATURE_PATH/${NAME}_service.dart" <<EOL
class ${CAPITALIZED_NAME}Service {}
EOL

# Binding
cat > "$FEATURE_PATH/${NAME}_binding.dart" <<EOL
import 'package:get/get.dart';
import 'package:$PROJECT_NAME/app/features/$NAME/${NAME}_controller.dart';

class ${CAPITALIZED_NAME}Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${CAPITALIZED_NAME}Controller>(${CAPITALIZED_NAME}Controller.new);
  }
}
EOL

echo "✅ MVC yapısı oluşturuldu: $FEATURE_PATH"

# =============================
# 2️⃣ navigation_routes.dart'a static const ekle
# =============================
if [ -f "$ROUTES_FILE" ]; then
  if grep -q "class RoutesName" "$ROUTES_FILE"; then
    # duplicate kontrolü
    if ! grep -q "static const $NAME" "$ROUTES_FILE"; then
      sed -i '' "/static const unknown = '\/unknown';/i\\
  static const $NAME = '/$NAME';" "$ROUTES_FILE"
      echo "🔗 Route eklendi: RoutesName.$NAME"
    else
      echo "⚠️  RoutesName.$NAME zaten var!"
    fi
  else
    echo "⚠️  $ROUTES_FILE içinde 'class RoutesName' bulunamadı!"
  fi
else
  echo "❌ $ROUTES_FILE bulunamadı!"
fi

# =============================
# 3️⃣ app_router.dart'a GetPage ekle
# =============================
if [ -f "$APP_ROUTER_FILE" ]; then
  IMPORT_BINDING="import 'package:$PROJECT_NAME/app/features/$NAME/${NAME}_binding.dart';"
  IMPORT_PAGE="import 'package:$PROJECT_NAME/app/features/$NAME/${NAME}_page.dart';"
  GETPAGE_LINE="      GetPage(name: RoutesName.$NAME, page: ${CAPITALIZED_NAME}Page.new, binding: ${CAPITALIZED_NAME}Binding()),"

  # Importları ekle
  if ! grep -q "$IMPORT_BINDING" "$APP_ROUTER_FILE"; then
    sed -i '' "/import 'package:$PROJECT_NAME\/core\/components\/unknown_view.dart';/a\\
$IMPORT_BINDING\\
$IMPORT_PAGE" "$APP_ROUTER_FILE"
    echo "📦 Import eklendi: $NAME"
  fi

  # GetPage ekle
  if grep -q "GetPage(name: RoutesName.unknown" "$APP_ROUTER_FILE"; then
    sed -i '' "/GetPage(name: RoutesName.unknown/i\\
$GETPAGE_LINE" "$APP_ROUTER_FILE"
    echo "🧭 AppRouter'a sayfa eklendi: $NAME"
  else
    echo "⚠️  $APP_ROUTER_FILE içinde 'GetPage(name: RoutesName.unknown' bulunamadı!"
  fi
else
  echo "❌ $APP_ROUTER_FILE bulunamadı!"
fi

echo "🎉 $CAPITALIZED_NAME modülü ve route tanımı başarıyla oluşturuldu!"
