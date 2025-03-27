import 'package:flutter/material.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Bu sayfa bulunamadı'),
      ),
    );
  }
}
