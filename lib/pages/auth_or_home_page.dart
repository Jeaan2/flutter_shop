import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_shop/models/auth.dart';
import 'package:flutter_shop/pages/auth_page.dart';
import 'package:flutter_shop/pages/products_overview_page.dart';
import 'package:provider/provider.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? ProductOverviewPage() : AuthPage();
  }
}
