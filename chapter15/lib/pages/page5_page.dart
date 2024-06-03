import 'dart:convert';
import 'dart:io';

import 'package:chapter15/widgets/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page5 extends StatefulWidget {
  final String title;

  const Page5({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  final String _imageAsBase64 =
      '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';

  static const String _imageUrl =
      'https://docs.microsoft.com/en-us/dotnet/architecture/modern-web-apps-azure/media/index/web-application-guide-cover-image.png';

  final _cachedImage = Image(
    image: const NetworkImage(_imageUrl), width: 50, height: 50,
    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
      if (frame == null) {
        return const Text('Loading...');
      }

      return child;
    },
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Called here because context is not available in initState
    precacheImage(_cachedImage.image, context);
  }


  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery
        .of(context)
        .devicePixelRatio
        .toString());
    debugPrint(Directory.current.toString());
    debugPrint(Platform.environment['FileImageUrl']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello, Dmitry',
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Matrix'),
              ),
              const Image(
                image: AssetImage('assets/images/044.png'),
                width: 50,
                height: 50,
              ),
              Image.asset(
                'assets/images/044.png',
                width: 50,
                height: 50,
              ),
              // OBS, can not be const
              const SizedBox(
                height: 10,
              ),
              Image(
                image: FileImage(File(Platform.environment['FileImageUrl']!)),
                width: 50,
                height: 50,
              ),
              // OBS, does not work on web, Needs this 'com.apple.security.app-sandbox' should be false
              const SizedBox(
                height: 10,
              ),
              Image(
                image: MemoryImage(base64Decode(_imageAsBase64)),
                width: 50,
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              const Image(
                image: NetworkImage(_imageUrl),
                width: 50,
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Image.network(
                _imageUrl,
                width: 50,
                height: 50,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    final current = loadingProgress.cumulativeBytesLoaded;
                    final total = loadingProgress.expectedTotalBytes;

                    return total != null
                        ? Text('${current / total * 100}%')
                        : const Text('Loading...');
                  }

                  return child;
                },
                errorBuilder: (context, error, stackTrace) {
                  return Text('Could not fetch the image $error');
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Image.network(
                _imageUrl,
                width: 50,
                height: 50,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (frame == null) {
                    return const Text('Loading...');
                  }

                  return child;
                },
                errorBuilder: (context, error, stackTrace) {
                  return Text('Could not fetch the image $error');
                },
              ),
              const SizedBox(
                height: 10,
              ),
              _cachedImage,
              const SizedBox(
                height: 10,
              ),
              SvgPicture.asset('assets/images/002.svg', width: 50, height: 50, placeholderBuilder: (context) {
                return const Text('Loading...');
              },)
            ],
          )),
      bottomNavigationBar: Chapter15BottomNavigationBar(
          currentSelectedIndex: 5, context: context),
    );
  }
}
