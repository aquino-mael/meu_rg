import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app/app.dart';
import '../scheduling/scheduling.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MEU PRIMEIRO RG',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 50,
            ),
            child: Placeholder(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 60.0,
              ),
              Transform.translate(
                offset: Offset(16.0, 0.0),
                child: Material(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20.0)
                  ),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'DOCUMENTOS NECESSÁRIOS:',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        _buildListItem(text: 'Certidão de nascimento (Cópia e original);'),
                        _buildListItem(text: 'Comprovante de residência;'),
                        _buildListItem(text: 'Cópia dos documentos de identidade dos pais ou representantes legais;'),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) {
                        return SchedulingScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  'AGENDAMENTO',
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('FILÔMETRO'),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem({
    @required String text,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 0.0
      ),
      leading: Icon(
        Icons.done,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}