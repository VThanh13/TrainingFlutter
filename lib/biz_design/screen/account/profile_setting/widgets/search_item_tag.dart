import 'package:flutter/material.dart';

class SearchItemTag extends StatefulWidget {
  const SearchItemTag({required this.listItem, Key? key}) : super(key: key);
  final List listItem;

  @override
  State<SearchItemTag> createState() => _SearchItemTagState();
}

class _SearchItemTagState extends State<SearchItemTag> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 5,
          children: [
            ...widget.listItem.asMap().entries.map((entry) {
              int index = entry.key;
              String item = entry.value;
              final textPainter = TextPainter(
                text: TextSpan(
                  text: item,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                textDirection: TextDirection.ltr,
              )..layout();
              return Stack(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 54,
                        width: textPainter.width + 32,
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          height: 30,
                          width: textPainter.width + 20,
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: const Color(0xff333333),
                            width: 0.3,
                          )),
                          child: Center(
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: textPainter.width - 5,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.listItem.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            size: 30,
                            color: Color(0xff060606),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 0,
              color: Color(0xffDD4A30),
              indent: 0,
              thickness: 1,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.listItem.add(textController.text);
                      textController.text = '';
                    });
                  },
                  icon: const Icon(
                    Icons.add_circle_sharp,
                    size: 30,
                    color: Color(0xff212862),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: textController,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.titleSmall!.color),
                    decoration: const InputDecoration(
                        hintText: 'マッチングしたい職業を追加',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
