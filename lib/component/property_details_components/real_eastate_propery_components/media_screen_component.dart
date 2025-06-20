import 'package:flutter/material.dart';

class MediaContainerWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onFullScreen;

  const MediaContainerWidget({
    Key? key,
    required this.child,
    required this.onFullScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            child,
            Positioned(
              right: 8,
              top: 8,
              child: IconButton(
                icon: const Icon(Icons.fullscreen, color: Colors.white),
                onPressed: onFullScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}