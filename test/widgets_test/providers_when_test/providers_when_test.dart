import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_crypto/details/view/details_screen.dart';
import 'package:projeto_crypto/details/widgets/body_details_screen.dart';
import 'package:projeto_crypto/portfolio/view/portfolio_screen.dart';
import 'package:projeto_crypto/portfolio/widgets/body_portifolio_screen.dart';

import '../../helpers/setup/setup_when_widget_tester.dart';
import '../../shared/crypto_mock_data.dart';

void main() {
  testWidgets(
      'WHEN PortifolioScreen is called THEN see if the API request works',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPageWhen(
          tester, const SetupWhenWidgetTester(child: PortfolioScreen()));
      await tester.pumpAndSettle();
      expect(find.byType(BodyPortifolioScreen), findsWidgets);
    });
  });

  testWidgets('WHEN DetailsScreen is called THEN see if the API request works',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPageWhen(
          tester,
          SetupWhenWidgetTester(
              child: DetailsScreen(
            crypto: crypto,
            singleBalance: cryptoBalance,
            list: [crypto, cryptoSecond],
          )));
      await tester.pumpAndSettle();
      expect(find.byType(BodyDetailsScreen), findsWidgets);
    });
  });
}
