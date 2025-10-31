import 'package:flutter/material.dart';
import 'package:test_project/core/config/constants/routes/navigation_routes.dart';

import 'package:test_project/core/utils/app_navigation.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AppNav Örnek Sayfası")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // ========== PUSH ==========
            ElevatedButton(
              onPressed: () => AppNav.push(const DetailPage()),
              child: const Text("Push → Widget (DetailPage)"),
            ),
            ElevatedButton(
              onPressed: () => AppNav.pushNamed(RoutesName.settings),
              child: const Text("PushNamed → Settings"),
            ),

            // ========== REPLACE ==========
            ElevatedButton(
              onPressed: () => AppNav.replace(const ReplacePage()),
              child: const Text("Replace → Widget (ReplacePage)"),
            ),

            // ========== OFF ALL ==========
            ElevatedButton(
              onPressed: () => AppNav.offAll(const ResetRootPage()),
              child: const Text("OffAll → Widget (Root Reset)"),
            ),
            ElevatedButton(
              onPressed: () => AppNav.offAllNamed(RoutesName.home),
              child: const Text("OffAllNamed → Home"),
            ),

            // ========== POP ==========
            ElevatedButton(
              onPressed: () => AppNav.pop(),
              child: const Text("Pop"),
            ),

            // ========== BACK TO ==========
            ElevatedButton(
              onPressed: () => AppNav.backTo(RoutesName.home),
              child: const Text("Back To Home"),
            ),

            // ========== MAYBE POP ==========
            ElevatedButton(
              onPressed: () async {
                bool popped = await AppNav.maybePop();
                debugPrint("MaybePop sonucu: $popped");
              },
              child: const Text("Maybe Pop"),
            ),

            // ========== BACK OR ==========
            ElevatedButton(
              onPressed: () => AppNav.backOr(RoutesName.home),
              child: const Text("Back Or Home"),
            ),

            // ========== TO HOME ==========
            ElevatedButton(
              onPressed: () => AppNav.toHome(),
              child: const Text("To Home (Clear Stack)"),
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            // ========== ROUTE CHECK ==========
            Builder(
              builder: (ctx) {
                final isHome = AppNav.isCurrent(RoutesName.home);
                return Text("Şu an Home mu? → $isHome");
              },
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================
// DUMMY SAYFALAR (örnek olarak basit sayfalar)
// =============================================
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => AppNav.pop(),
          child: const Text("Geri dön"),
        ),
      ),
    );
  }
}

class ReplacePage extends StatelessWidget {
  const ReplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Replace Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => AppNav.toHome(),
          child: const Text("Anasayfaya dön"),
        ),
      ),
    );
  }
}

class ResetRootPage extends StatelessWidget {
  const ResetRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Root Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => AppNav.offAllNamed(RoutesName.home),
          child: const Text("Tamamen sıfırla → Home"),
        ),
      ),
    );
  }
}
