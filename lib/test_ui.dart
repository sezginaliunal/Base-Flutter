import 'package:flutter/material.dart';
import 'package:test_project/core/extensions/context_extension.dart';
import 'package:test_project/core/extensions/widget_extension.dart';
import 'package:test_project/main.dart';

class WidgetDemoApp extends StatelessWidget {
  const WidgetDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Extensions Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WidgetDemoPage(),
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: navigatorKey,
    );
  }
}

class WidgetDemoPage extends StatelessWidget {
  const WidgetDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final demoItems = [
      DemoItem(title: 'Klavye açıkmı', widget: TextField()),
      DemoItem(
        title: 'Slide Animation',
        widget: const Icon(Icons.arrow_upward)
            .sized(
              context.isSmallPhone
                  ? 50
                  : context.isPhone
                  ? 100
                  : 200,
              context.isSmallPhone
                  ? 50
                  : context.isPhone
                  ? 100
                  : 200,
            )
            .animatedSize(),
      ),

      DemoItem(
        title: 'Scale Animation',
        widget: const Icon(Icons.zoom_in).scale(),
      ),
      DemoItem(
        title: 'Padding All',
        widget: const Text(
          'Padding All',
        ).paddingHigh().backgroundColor(Colors.blue.shade100),
      ),
      DemoItem(
        title: 'Corner Radius',
        widget: const Text(
          'Corner Radius',
        ).paddingHigh().backgroundColor(Colors.red.shade100).cornerRadius(1),
      ),
      DemoItem(
        title: 'Shadow',
        widget: const CircularProgressIndicator().overlayWidget(
          Text('data').paddingLow().shadow(),
        ),
      ),
      DemoItem(
        title: 'Visible True',
        widget: const Text('Visible').visible(isVisible: true),
      ),
      DemoItem(
        title: 'Disabled',
        widget: ElevatedButton(
          onPressed: () {},
          child: const Text('Button'),
        ).disabled(),
      ),
      DemoItem(
        title: 'Align Center',
        widget: const Text('Center').align(Alignment.center),
      ),
      DemoItem(
        title: 'Wrap in Card',
        widget: const Text('Card').paddingLow().wrapInCard(),
      ),
      DemoItem(
        title: 'Tooltip',
        widget: const Icon(Icons.info).tooltip('Info Icon'),
      ),
      DemoItem(
        title: 'Fade Animation',
        widget: const Text(
          'Fade',
        ).fade(opacity: 0.5, duration: const Duration(seconds: 1)),
      ),

      DemoItem(
        title: 'Rotate Animation',
        widget: const Icon(Icons.refresh).rotate(turns: 0.25),
      ),

      DemoItem(
        title: 'Tap Animate Scale',
        widget: const Icon(Icons.touch_app).tapAnimateScale(),
      ),
      DemoItem(
        title: 'Press Animate Rotation',
        widget: const Icon(Icons.rotate_right).pressAnimateRotation(),
      ),
      DemoItem(
        title: 'Hover Animate Opacity',
        widget: const Icon(Icons.opacity).hoverAnimateOpacity(),
      ),
      DemoItem(
        title: 'Overlay Widget',
        widget: const Text('Overlay').overlayWidget(
          Container(width: 50, height: 50, color: Colors.red.withOpacity(0.5)),
        ),
      ),
      DemoItem(
        title: 'With Badge',
        widget: Icon(
          Icons.email,
          size: 40,
        ).withBadge(width: 20, height: 20), // icon boyutunun %20'si
      ),
      DemoItem(
        title: 'Debug Border',
        widget: const Text('Debug').debugBorder(),
      ),
      DemoItem(
        title: 'Clip Circle',
        widget: Container(
          color: Colors.purple,
          width: 60,
          height: 60,
        ).clipCircle(),
      ),
      DemoItem(
        title: 'Circle Avatar',
        widget: Icon(Icons.person, color: Colors.white).circleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            'https://cdn.pixabay.com/photo/2025/10/02/10/07/duck-9868154_1280.jpg',
          ),
        ),
      ),

      DemoItem(
        title: 'Clip Oval',
        widget: Container(color: Colors.teal, width: 80, height: 60).clipOval(),
      ),
      DemoItem(
        title: 'With Border',
        widget: Container(
          width: 80,
          height: 50,
          color: Colors.yellow,
        ).withBorder(color: Colors.black, width: 2),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Widget Extensions Demo')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: demoItems.length,
        itemBuilder: (context, index) {
          final item = demoItems[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              item.widget,
            ],
          );
        },
      ),
    );
  }
}

class DemoItem {
  final String title;
  final Widget widget;

  DemoItem({required this.title, required this.widget});
}
