import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../app/app.dart';

class SchedulingScreen extends StatefulWidget {
  const SchedulingScreen({ Key? key }) : super(key: key);

  @override
  _SchedulingScreenState createState() => _SchedulingScreenState();
}

class _SchedulingScreenState extends State<SchedulingScreen> {
  late TextEditingController _dateInputController;

  final List<String> _options = [
    'Selecione',
    'Imperatriz',
    'São Luís',
  ];

  final List<String> _schedules = [
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '',
  ];

  int? _selectedLocal = 0;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _dateInputController = TextEditingController(
      text: DateFormat("dd/MM/yyyy").format(_selectedDate),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          App.appName.toUpperCase(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'AGENDAMENTO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              Divider(
                color: Colors.black,
                thickness: 2.0,
                indent: 32,
                endIndent: 32,
              ),
              SizedBox(
                height: 32.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Selecione o local de registro',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Theme(
                      data: ThemeData(
                        textTheme: TextTheme(
                          subtitle1: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: DropdownButton<int>(
                        dropdownColor: AppColors.primaryColor,
                        iconEnabledColor: AppColors.white,
                        isExpanded: true,
                        isDense: true,
                        items: _options.map(_optionToDropdownMenuItem).toList(),
                        value: _selectedLocal,
                        onChanged: _onChangeLocal,
                        selectedItemBuilder: (context) {
                          return _options.map(_optionToWidget).toList();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Selecione o local de registro',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Theme(
                      data: ThemeData(
                        textTheme: TextTheme(
                          subtitle1: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: TextField(
                        readOnly: true,
                        controller: _dateInputController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        onTap: _selectADateOnDatePicker,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Selecione o local de registro',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Table(
                    children: [
                      TableRow(
                        children: _schedules.getRange(0, 3).map(_buildScheduleItem).toList(),
                      ),
                      TableRow(
                        children: _schedules.getRange(3, 6).map(_buildScheduleItem).toList(),
                      ),
                      TableRow(
                        children: _schedules.getRange(6, 9).map(_buildScheduleItem).toList(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('AGENDAR'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _optionToWidget(String option) {
    return Text(
      option,
    );
  }

  DropdownMenuItem<int> _optionToDropdownMenuItem(String option) {
    return DropdownMenuItem<int>(
      child: Text(
        option,
      ),
      value: _options.indexOf(option),
    );
  }

  Widget _buildScheduleItem(String schedule) {
    return Chip(
      backgroundColor: AppColors.primaryColor,
      elevation: 2.0,
      labelPadding: const EdgeInsets.symmetric(horizontal: 32.0),
      label: Text(
        schedule,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  void _onChangeLocal(int? newIndexLocal) {
    setState(() {
      _selectedLocal = newIndexLocal;
    });
  }

  Future<void> _selectADateOnDatePicker() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year, DateTime.now().month + 1, 15),
    );
    if(date == null) return;
    if(date == _selectedDate) return;

    setState(() {
      _selectedDate = date;
    });
  }
}