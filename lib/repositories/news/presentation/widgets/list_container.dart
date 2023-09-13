import 'package:flutter/material.dart';

class ListCOntainer extends StatelessWidget {
  final String? image;
  final String? title;
  final String? date;
  final Color? color;
  final VoidCallback? onTap;
  const ListCOntainer({
    this.onTap,
    this.image,
    this.title,
    this.date,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 103,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 2.0,
                spreadRadius: 2.0,
                offset: const Offset(
                  2.0,
                  2.0,
                ),
              )
            ],
            color: color,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image!),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 190,
                      child: Text(title!),
                    ),
                    const SizedBox(height: 20),
                    Text(date.toString().substring(0, 11)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
