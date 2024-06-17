import 'package:chapter18/widgets/chapter18_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firstNameTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  String _username = '';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                restorationId: 'home-page-username-textfield-id',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    icon: Icon(Icons.send),
                    helperText: 'Enter your username',
                    hintText: 'Username...'),
                maxLength: 20,
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                restorationId: 'home-page-password-textfield-id',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    icon: Icon(Icons.send),
                    helperText: 'Enter your password',
                    hintText: 'Password...'),
                maxLength: 20,
                obscureText: true,
                obscuringCharacter: '*',
                controller: _passwordTextEditingController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                restorationId: 'home-page-firstname-textfield-id',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    icon: Icon(Icons.send),
                    helperText: 'Enter your firstname',
                    hintText: 'Firstname...'),
                maxLength: 20,
                controller: _firstNameTextEditingController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
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
              height: 30,
            ),
            Text('Username: $_username'),
            const SizedBox(
              height: 10,
            ),
            ListenableBuilder(
              listenable: _passwordTextEditingController,
              builder: (context, child) {
                return Text('Password: ${_passwordTextEditingController.text}');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListenableBuilder(
              listenable: _firstNameTextEditingController,
              builder: (_, __) {
                final start = _firstNameTextEditingController.selection.start;
                final end = _firstNameTextEditingController.selection.end;

                if (start > -1 && end > -1) {
                  debugPrint('Start: $start');
                  debugPrint('End: $end');
                  debugPrint(
                      'Selected of firstname: ${_firstNameTextEditingController.text.substring(start, end)}');

                  debugPrint('driver license selected: ${_driverLicenseState.value}');
                }

                return Text(
                    'Firstname: ${_firstNameTextEditingController.text}');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ValueListenableBuilder(
              valueListenable: _driverLicenseState,
              builder: (_, value, ___) {
                return Text('Driver license?: ${value ? 'yes' : 'no'}');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ValueListenableBuilder(
              valueListenable: _anyPetState,
              builder: (_, value, ___) {
                return Text('Any pets?: ${value ? 'yes' : 'no'}');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Chapter18BottomNavigationBar(
          currentSelectedIndex: 0, context: context),
    );
  }
}
