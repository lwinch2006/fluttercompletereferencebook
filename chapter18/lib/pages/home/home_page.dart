import 'package:chapter18/models/app_textfield_style.dart';
import 'package:chapter18/models/constants.dart';
import 'package:chapter18/widgets/chapter18_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _usernameTextFieldStyle = const AppTextFieldStyle(
    icon: Icon(Icons.send),
    labelText: 'Username',
    helperText: 'Enter your username',
  );

  final _passwordTextEditingController = TextEditingController();
  final _passwordTextFieldStyle = const AppTextFieldStyle(
    icon: Icon(Icons.send),
    labelText: 'Password',
    helperText: 'Enter your password',
  );

  final _firstNameTextEditingController = TextEditingController();
  final _firstnameTextFieldStyle = const AppTextFieldStyle(
    icon: Icon(Icons.send),
    labelText: 'Firstname',
    helperText: 'Enter your firstname',
  );

  String _username = '';
  int _radioButtonSelectedOption = 1;
  bool _isSwitchOn = false;
  double _sliderPosition = 0;

  final _driverLicenseState = ValueNotifier<bool>(false);

  final _anyPetState = ValueNotifier<bool>(false);

  // @override
  // void initState() {
  //   _firstNameController.addListener(() {
  //     final start = _firstNameController.selection.start;
  //     final end = _firstNameController.selection.end;
  //     debugPrint('Start: $start');
  //     debugPrint('End: $end');
  //     debugPrint('Selected of firstname: ${_firstNameController.text.substring(start, end)}');
  //   });
  //
  //   super.initState();
  // }

  @override
  void dispose() {
    _firstNameTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _driverLicenseState.dispose();
    _anyPetState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('REBUILDING');
    final logicalPixelWidth = MediaQuery.of(context).size.width;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final devicePixelWidth = logicalPixelWidth * devicePixelRatio;
    debugPrint('Logical pixel width ${logicalPixelWidth.toString()}');
    debugPrint('Device pixel ratio ${devicePixelRatio.toString()}');
    debugPrint('Device pixel width ${devicePixelWidth.toString()}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 200),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        restorationId: 'home-page-username-textfield-id',
                        decoration: _usernameTextFieldStyle,
                        style: textFieldTextStyle,
                        maxLength: 20,
                        onChanged: (value) {
                          setState(() {
                            _username = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 11),
                      child: Text('Username: $_username',
                          style: textFieldTextStyle),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        restorationId: 'home-page-password-textfield-id',
                        decoration: _passwordTextFieldStyle,
                        maxLength: 20,
                        obscureText: true,
                        obscuringCharacter: '*',
                        controller: _passwordTextEditingController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 11),
                      child: ListenableBuilder(
                        listenable: _passwordTextEditingController,
                        builder: (context, child) {
                          return Text(
                              'Password: ${_passwordTextEditingController.text}');
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        restorationId: 'home-page-firstname-textfield-id',
                        decoration: _firstnameTextFieldStyle,
                        maxLength: 20,
                        controller: _firstNameTextEditingController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 11),
                      child: ListenableBuilder(
                        listenable: _firstNameTextEditingController,
                        builder: (_, __) {
                          final start =
                              _firstNameTextEditingController.selection.start;
                          final end =
                              _firstNameTextEditingController.selection.end;

                          if (start > -1 && end > -1) {
                            debugPrint('Start: $start');
                            debugPrint('End: $end');
                            debugPrint(
                                'Selected of firstname: ${_firstNameTextEditingController.text.substring(start, end)}');

                            debugPrint(
                                'driver license selected: ${_driverLicenseState.value}');
                          }

                          return Text(
                              'Firstname: ${_firstNameTextEditingController.text}');
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Driver license?'),
                    ValueListenableBuilder(
                      valueListenable: _driverLicenseState,
                      builder: (_, value, ___) {
                        return Checkbox(
                          value: value,
                          onChanged: (value) {
                            _driverLicenseState.value = value!;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ValueListenableBuilder(
                      valueListenable: _driverLicenseState,
                      builder: (_, value, ___) {
                        return Text('Driver license?: ${value ? 'yes' : 'no'}');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: ValueListenableBuilder(
                        valueListenable: _anyPetState,
                        builder: (context, value, child) => CheckboxListTile(
                          value: value,
                          title: const Text('Any pets?'),
                          subtitle: const Text('Cat or dog'),
                          secondary: const Icon(Icons.cached),
                          onChanged: (value) => _anyPetState.value = value!,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ValueListenableBuilder(
                      valueListenable: _anyPetState,
                      builder: (_, value, ___) {
                        return Text('Any pets?: ${value ? 'yes' : 'no'}');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: _radioButtonSelectedOption,
                      onChanged: (value) => setState(() {
                        _radioButtonSelectedOption = value!;
                      }),
                    ),
                    const Text('Option 1'),
                    const SizedBox(
                      width: 40,
                    ),
                    Radio<int>(
                      value: 2,
                      groupValue: _radioButtonSelectedOption,
                      onChanged: (value) => setState(() {
                        _radioButtonSelectedOption = value!;
                      }),
                    ),
                    const Text('Option 2'),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: RadioListTile<int>(
                        value: 1,
                        title: const Text('Option 1'),
                        groupValue: _radioButtonSelectedOption,
                        onChanged: (value) => setState(() {
                          _radioButtonSelectedOption = value!;
                        }),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: 200,
                      child: RadioListTile<int>(
                        value: 2,
                        title: const Text('Option 2'),
                        groupValue: _radioButtonSelectedOption,
                        onChanged: (value) => setState(() {
                          _radioButtonSelectedOption = value!;
                        }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Separate feature 1'),
                    const SizedBox(
                      width: 20,
                    ),
                    Switch(
                      value: _isSwitchOn,
                      onChanged: (value) => setState(() {
                        _isSwitchOn = value;
                      }),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SwitchListTile(
                          title: const Text('Feature 1'),
                          subtitle: const Text('Enabled feature 1'),
                          value: _isSwitchOn,
                          onChanged: (value) => setState(() {
                            _isSwitchOn = value;
                          }),
                        ),
                        SwitchListTile(
                          title: const Text('Feature 2'),
                          subtitle: const Text('Enabled feature 2'),
                          value: _isSwitchOn,
                          onChanged: (value) => setState(() {
                            _isSwitchOn = value;
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Slider(
                      min: 0,
                      max: 1,
                      value: _sliderPosition,
                      label: _sliderPosition.toString(),
                      onChanged: (value) => setState(() {
                      _sliderPosition = value;
                    }),
                    ),
                    const SizedBox(width: 10,),
                    const Text('Continuous slider')
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Slider(
                      min: 0,
                      max: 1,
                      divisions: 5,
                      value: _sliderPosition,
                      label: _sliderPosition.toString(),
                      onChanged: (value) => setState(() {
                      _sliderPosition = value;
                    }),
                    ),
                    const SizedBox(width: 10,),
                    const Text('Discrete slider')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Chapter18BottomNavigationBar(
          currentSelectedIndex: 0, context: context),
    );
  }
}
