import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final BoxFit fit;
  const ImageWidget({Key key, @required this.url, this.fit = BoxFit.cover})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(url);
  }
}
