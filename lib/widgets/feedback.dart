import 'package:flutter/material.dart';

enum ImageType {
  error,
  network,
  empty,
  loading,
}

const List<String> imageList = [
  'imgs/error.png',
  'imgs/network.png',
  'imgs/empty.png',
  'imgs/loading.png',
];

// 反馈组件
class FeedBack extends StatelessWidget {
  final ImageType imageType;
  final String? description;
  final bool showButton;
  final String? buttonText;
  final VoidCallback? onTap;

  const FeedBack({
    Key? key,
    this.imageType = ImageType.loading,
    this.description,
    this.showButton = false,
    this.buttonText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageList[imageType.index],
            width: 216,
            fit: BoxFit.fitWidth,
          ),
          Offstage(
            offstage: description == null || description!.isEmpty,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('$description'),
            ),
          ),
          Offstage(
            offstage: !showButton || buttonText == null || buttonText!.isEmpty,
            child: Column(
              children: [
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: onTap,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  child: Text('$buttonText'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}