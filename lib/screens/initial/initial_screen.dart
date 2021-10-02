import 'package:flutter/material.dart';

import '../../app/app.dart';
import 'widgets/my_persistent_header.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({ Key key }) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  ScrollController _scrollController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(_pageController.page == 0)
          return true;

        _changeToPage(0);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: MyPersistentHeader(
                  eightyFivePercentOfScreen: MediaQuery.of(context).size.height * 0.85,
                ),
              ),
              SliverToBoxAdapter(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 150
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: const Divider(
                            thickness: 2.0,
                            height: 100,
                          ),
                        ),
                        Expanded(
                          child: PageView(
                            controller: _pageController,
                            physics: BouncingScrollPhysics(),
                            children: [
                              // Initial Options
                              Column(
                                children: [
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: IntrinsicWidth(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            'NÃO POSSUI UMA CONTA?',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30.0,
                                          ),
                                          ElevatedButton(
                                            child: Text('CADASTRAR'),
                                            onPressed: () {},
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          _buildOrDivider(),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          ElevatedButton(
                                            child: Text('ACESSAR CONTA'),
                                            onPressed: () {
                                              _changeToPage(1);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),

                              // Login
                              Login(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: _buildTextDivider()),
        SizedBox(
          width: 8.0,
        ),
        RichText(
          textDirection: TextDirection.ltr,
          text: TextSpan(
            style: TextStyle(
              color: AppColors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold
            ),
            text: 'OU'
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(child: _buildTextDivider()),
      ],
    );
  }

  SizedBox _buildTextDivider() {
    return SizedBox(
      child: Divider(
        color: AppColors.black,
        thickness: 0.5,
      ),
    );
  }

  void _changeToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(
        milliseconds: 500,
      ),
      curve: Curves.linear,
    );

    return;
  }
}

class Login extends StatelessWidget {
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
              keyboardType: TextInputType.emailAddress,
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
              onPressed: () {},
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