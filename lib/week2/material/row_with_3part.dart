import 'package:flutter/material.dart';

class RowWith3Part extends StatefulWidget{
  const RowWith3Part({Key? key,  required this.textValue, required this.conWidth, required this.iconValue})
      : super(key: key);

  final String textValue;
  final double conWidth;
  final IconData iconValue;

  @override
  State<RowWith3Part> createState() => _RowWith3PartState();
}

class _RowWith3PartState extends State<RowWith3Part>{
  late String textValue;
  late double conWidth;
  late IconData iconValue;
  @override
  void initState(){
    super.initState();
    textValue = widget.textValue;
    conWidth = widget.conWidth;
    iconValue = widget.iconValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 13),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 17.14,
                        width: 20,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Icon(iconValue,
                            color: const Color(0xff757575),
                          ),
                        ),
                      ),
                      Container(
                        height: 22,
                        width: conWidth,
                        margin: const EdgeInsets.only(left: 20),
                        child:  FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            textValue,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Plus_Jakarta_Sans',
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 6,
                  height: 10,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Icon(Icons.arrow_forward_ios,
                      color: Color(0xffB4B4B4),
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