import 'package:flutter/material.dart';

class FormatText extends StatelessWidget {
  const FormatText({required this.textValue, Key? key}) : super(key: key);
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).textTheme.titleSmall!.color,
        overflow: TextOverflow.visible,
      ),
      maxLines: 5,
    );
  }
}

class ShowItemsListToRow extends StatelessWidget {
  const ShowItemsListToRow({required this.list, super.key});
  final List list;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(list.length, (index) {
          final textPainter = TextPainter(
            text: TextSpan(
              text: list[index],
              style: TextStyle(
                color: Theme.of(context).textTheme.titleSmall!.color,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          return Container(
            height: 19,
            width: textPainter.width + 15,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.3,
                color: const Color(0xffDD4A30),
              ),
            ),
            child: Center(
              child: Text(
                list[index],
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleSmall!.color,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}

class ShowItemsListToColumn extends StatelessWidget {
  const ShowItemsListToColumn({required this.list, super.key});
  final List list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(list.length, (index) {
          return Text(
            list[index],
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).textTheme.titleSmall!.color,
              overflow: TextOverflow.visible,
            ),
          );
        })
      ],
    );
  }
}
