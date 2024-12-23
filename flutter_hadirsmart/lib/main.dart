import 'package:hyper_ui/state_util.dart';
import 'package:flutter/foundation.dart';
import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.init();
  await Diointerceptors.init();
  if (kDebugMode) {
    // await DBService.clear("token");
  }
  runMainApp();
}

runMainApp() async {
  return runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget mainView = LoginView();
    if (isLoggedIn) {
      if (isEmployee) {
        mainView = EmployeeMainNavigationView();
      } else if (isHRD) {
        mainView = HrdMainNavigationView();
      }
    }
    // setupHUIConfig();
    return MaterialApp(
      title: 'Hadirsmart',
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),
      home: mainView,
      onGenerateRoute: (routeSettings) {
        return null;
      },
      builder: (context, child) {
        return child!;
      },
    );
  }
}
