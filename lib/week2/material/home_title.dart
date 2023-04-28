import 'package:flutter/cupertino.dart';

class HomeTitle extends StatefulWidget{
  const HomeTitle({Key? key, required this.textValue, required this.conWidth})
  : super(key: key);

  final String textValue;
  final double conWidth;

  @override
  State<HomeTitle> createState() => _HomeTitle();
}

class _HomeTitle extends State<HomeTitle>{
  late String textValue;
  late double conWidth;
  @override
  void initState(){
    super.initState();
    textValue = widget.textValue;
    conWidth = widget.conWidth;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 22,
      width: conWidth,
      margin: const EdgeInsets.only(top: 24),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          textValue,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontFamily: 'Poppins',
            color: Color(0xff000000),
          ),
        ),
      ),
    );
  }

}