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

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      SizedBox(
                        width: 100,
                        child: Divider(
                          thickness: 2.0,
                          height: 100,
                        ),
                      ),
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
                              _buildButtonOption('CADASTRAR'),
                              SizedBox(
                                height: 20.0,
                              ),
                              _buildOrDivider(),
                              SizedBox(
                                height: 20.0,
                              ),
                              _buildButtonOption('ACESSAR CONTA')
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildButtonOption(String title) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16.0)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        )),
      ),
      child: Text(title),
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
}
