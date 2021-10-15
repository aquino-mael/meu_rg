import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../app/app.dart';
import '../../utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _dateInputController;

  DateTime _selectedDate = DateTime.now();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    _dateInputController = TextEditingController(
      text: DateFormat("dd/MM/yyyy").format(_selectedDate),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(App.appName.toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'CADASTRO',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black
                  )
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Dados de Registro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .5
                  ),
                ),
                Divider(
                  height: 50,
                  color: Colors.black,
                  thickness: 2,
                  indent: 24.0,
                  endIndent: 24.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    labelText: 'Nome',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    labelText: 'Nome da mãe',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  readOnly: true,
                  controller: _dateInputController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    labelText: 'Data de nascimento',
                  ),
                  onTap: () async {
                    final date = await selectDateOnDatePicker(context, _selectedDate, DateTime.now());
                    if(date == null) return;
                    if(date == _selectedDate) return;

                    _selectedDate = date;
                    setState(() {});
                  },
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
                    labelText: 'E-mail do responsável',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => setState(() {
                        _obscurePassword = !_obscurePassword;
                      }),
                      icon: Icon(
                        _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off
                      ),
                    ),
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
                  onPressed: () {},
                  child: Text('CADASTRAR'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}