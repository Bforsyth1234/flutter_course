import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/product_admin.dart';
import './pages/products.dart';
import './pages/product.dart';
import './scoped-models/main.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final MainModel model = MainModel();
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.green, accentColor: Colors.blueAccent),
        // home: AuthPage(),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/products': (BuildContext context) => ProductsPage(model),
          '/admin': (BuildContext context) => ProductAdminPage()
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(index),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(model),
          );
        },
      ),
    );
  }
}
