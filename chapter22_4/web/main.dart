import 'dart:async';
import 'dart:html';
import 'dart:js_interop';
import 'dart:js' as js;
import 'package:web/web.dart' as web;
import 'package:chapter22_4/math_library.dart' deferred as math_library;
import 'package:http/http.dart' as http;

void main() {
  final now = DateTime.now();
  final element = web.document.querySelector('#output') as web.HTMLDivElement;
  element.text = 'The time is ${now.hour}:${now.minute} '
      'and your Dart web app is running!';

  // timer element
  Timer.periodic(const Duration(seconds: 1), (_) {
    final currentDate = DateTime.now();
    final dateAsString = '${currentDate.day}.${currentDate.month}.${currentDate.year}';
    final timeAsString = '${currentDate.hour}:${currentDate.minute}:${currentDate.second}';
    web.document.querySelector('#time')?.text = '$dateAsString $timeAsString';
  },);

  // list element
  var list = web.document.querySelector('#list')! as UListElement;
  var newLi = LIElement()..text = 'New element';
  newLi.classes.add('red-color');
  list.children.add(newLi);

  // Input element
  var inputField = web.document.querySelector('#inputField')! as InputElement;

  inputField.onClick.listen((event) {
    web.console.log('Input field clicked!' as JSAny);
    js.context.callMethod('alert', ['Input field clicked!']);
  },);

  inputField.onChange.listen((event) => web.document.querySelector('#inputFieldText')!.text = inputField.value!,);

  final mathLibraryContainer = web.document.querySelector('#mathLibraryContainer')! as DivElement;
  mathLibraryContainer.onClick.listen((event) async {
    await math_library.loadLibrary();
    mathLibraryContainer.text = math_library.add(10, 5).toString();
  },);





}
