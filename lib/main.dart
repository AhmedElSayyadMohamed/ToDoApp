import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_1/presentationLayer/layout/layout_screen.dart';
import 'package:to_do_1/presentationLayer/shared/AppTheme/app_theme.dart';
import 'package:to_do_1/presentationLayer/shared/constant/constant.dart';
import 'data_layer/bloc/blocObserver/bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'data_layer/bloc/cubit/cubit.dart';
import 'data_layer/bloc/cubit/states.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // await CachHelper.init();
  // isDark = CachHelper.getData(key: "isDark");
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? darkMode : lightMode,
      home: LayoutScreen(),
    );
  }
}
