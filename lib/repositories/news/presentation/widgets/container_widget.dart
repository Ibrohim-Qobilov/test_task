import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/utils/test_style.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Article> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 300,
      width: 358,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(data[0].imageUrl),
            fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          bottom: 15,
          right: 30,
        ),
        child: Text(
          data[0].title,
          style: AppTextStyles.body2,
        ),
      ),
    );
  }
}
