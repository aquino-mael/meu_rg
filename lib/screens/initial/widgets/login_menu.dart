import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../home/home.dart';

class LoginMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Text(
              'ACESSAR CONTA',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                labelText: 'E-mail do responsável',
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                labelText: 'Senha de acesso',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              child: Text('ENTRAR'),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              child: Text('ESQUECI A SENHA'),
              onPressed: () {},
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              'AINDA NÃO POSSUI UMA CONTA?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xFF323234),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            RichText(
              textAlign: TextAlign.center,
              textScaleFactor: 1,
              text: TextSpan(
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 15.0,
                ),
                children: [
                  TextSpan(
                    style: TextStyle(
                      decoration: TextDecoration.underline
                    ),
                    text: 'CLIQUE AQUI',
                  ),
                  TextSpan(
                    text: ' PARA FAZER UMA',
                  ),
                ]
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}