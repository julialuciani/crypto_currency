import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_crypto/details/view/details_screen.dart';
import 'package:projeto_crypto/portfolio/view/portfolio_screen.dart';

import '../../helpers/setup/setup_when_widget_tester.dart';
import '../../shared/crypto_mock_data.dart';
import '../../unit_test/screen_methods_test/portifolio_methods_test.dart';

void main() {
  testWidgets(
      'WHEN PortifolioScreen is called THEN see if the API request works',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPageWhen(
          tester, const SetupWhenWidgetTester(child: PortfolioScreen()));
      await tester.pumpAndSettle();
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
            list: data,
          )));
      await tester.pumpAndSettle();
    });
  });
}
