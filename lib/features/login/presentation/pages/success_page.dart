import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key, required this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network('https://media.giphy.com/media/11sBLVxNs7v6WA/giphy.gif?cid=790b7611ugyw6ac1310p96pld1skoc2sbpufy3a08f5njc5h&ep=v1_gifs_search&rid=giphy.gif&ct=g'),
            const Text('Success!'),
          ],
        ),
      ),
    );
  }
}
