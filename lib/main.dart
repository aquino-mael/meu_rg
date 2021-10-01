import 'package:flutter/material.dart';

import 'app/app.dart';
import 'screens/screens.dart';

void main() {
  runApp(MeuRg());
}

class MeuRg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu RG',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.secondaryColor,
        backgroundColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme(
          primary: AppColors.secondaryColor,
          primaryVariant: AppColors.secondaryColor,
          secondary: AppColors.primaryColor,
          secondaryVariant: AppColors.primaryColor,
          surface: AppColors.white,
          background: AppColors.white,
          error: Colors.red,
          onPrimary: Colors.black,
          onSecondary: AppColors.black,
          onSurface: AppColors.black,
          onBackground: AppColors.black,
          onError: AppColors.black,
          brightness: Brightness.light,
        ),
        
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          )
        )
      ),
      home: InitialPage(),
    );
  }
}
