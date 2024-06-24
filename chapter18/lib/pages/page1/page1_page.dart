import 'package:chapter18/models/app_textfield_style.dart';
import 'package:chapter18/utils/validator.dart';
import 'package:chapter18/widgets/chapter18_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  final String title;

  const Page1({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  autofocus: true,
                  controller: _usernameController,
                  validator: Validator.validateEmail,
                  decoration: const AppTextFieldStyle(
                      icon: Icon(Icons.person), labelText: 'Username'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: _passwordFocus,
                  controller: _passwordController,
                  validator: Validator.validatePassword,
                  decoration: const AppTextFieldStyle(
                      icon: Icon(Icons.key), labelText: 'Password'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
                    minimumSize: const MaterialStatePropertyAll(Size(300, 50)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {}
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(
                  height: 50,
                ),
                ListenableBuilder(
                    listenable: _passwordFocus,
                    builder: (context, __) {
                      if (_passwordFocus.hasFocus) {
                        return const Text('Password field DOES have focux');
                      }

                      return const Text('Password field DOES NOT have focus');
                    },
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                      minimumSize:
                          const MaterialStatePropertyAll(Size(300, 50)),
                    ),
                    onPressed: () {
                      _passwordFocus.requestFocus();
                    },
                    child: const Text('Move focus to password field'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Chapter18BottomNavigationBar(
          currentSelectedIndex: 1, context: context),
    );
  }
}
