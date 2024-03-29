import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextStyle _textStyle = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 3,
  );

  late Widget _textWidget = Text(
    'Title: ${widget.title}',
    textAlign: TextAlign.center,
    style: _textStyle,
  );

  @override
  void initState() {
    super.initState();

    // When necessary to add callback after build() function
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      debugPrint('Message after widget building executed');
    });
  }

  // Manual caching of widget
  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.title == oldWidget.title) {
      return;
    }

    _textWidget = Text(
      'Title: ${widget.title}',
      textAlign: TextAlign.center,
      style: _textStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white, // This cannot be used when BoxDecoration is used
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.red,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: _textWidget,
                  ),
                  const Flexible(
                    child: Text(
                      'Text with color 0xFFEE99CC',
                      style: TextStyle(
                        color: Color(0xFFEE99CC),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  const Flexible(
                    child: Text.rich(
                      TextSpan(
                        text: 'We love ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          letterSpacing: 3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Dart',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                              letterSpacing: 3,
                            ),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                              letterSpacing: 3,
                            ),
                          ),
                          TextSpan(
                              text: 'Flutter',
                              style: TextStyle(
                                color: Color(0xFFEE99CC),
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                                letterSpacing: 3,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
                child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Aligned text',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    letterSpacing: 3,
                  ),
                ),
              ),
            )),
            Flexible(
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey,
                    ),
                    const Positioned(
                        top: 10,
                        left: 10,
                        child: Text(
                          'Overlapped text',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                            letterSpacing: 3,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
