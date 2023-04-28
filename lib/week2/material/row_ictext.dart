import 'package:flutter/material.dart';

class RowIcText extends StatefulWidget{
  const RowIcText({Key? key, required this.textValue,
  required this.iconValue, required this.iconColor, required this.conWidth})
  :super(key: key);

  final String textValue;
  final IconData iconValue;
  final Color iconColor;
  final double conWidth;

  @override
  State<RowIcText> createState() => _RowIcText();
}

class _RowIcText extends State<RowIcText>{
  late String textValue;
  late IconData iconValue;
  late Color iconColor;
  late double conWidth;

  @override
  void initState(){
    super.initState();
    textValue = widget.textValue;
    iconValue = widget.iconValue;
    iconColor = widget.iconColor;
    conWidth = widget.conWidth;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Container(
        margin: const EdgeInsets.only(left: 3, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                  height: 20,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Icon(iconValue,
                      color: iconColor,
                    ),
                  ),
                ),
                Container(
                  width: conWidth,
                  height: 22,
                  margin: const EdgeInsets.only(left: 18.99),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      textValue,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Plus_Jakarta_Sans',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              height: 0,
              color: Color(0xffAAAAAA),
              indent: 0,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}