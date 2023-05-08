import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/home_screen/ui/banner_image.dart';
import 'package:football_tracker/misc/custom_colors.dart';

void main() {

  testWidgets('Check UI of BannerImage', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BannerImage(),
      ),
    );

    expect(find.byType(Stack), findsOneWidget);

    final Container container = tester.firstWidget(find.byType(Container).first);
    expect(container.constraints?.minHeight, 200);
    expect(container.color, CustomColors.premierLeaguePurple);

    final Image image = tester.firstWidget(find.byType(Image).first);
    expect(image.height, 200);
    expect(image.image, const TypeMatcher<AssetImage>());
  });
}