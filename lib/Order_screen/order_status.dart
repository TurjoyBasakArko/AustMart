import '../consts/consts.dart';

Widget orderStatus({icon,color,title,showDone}){
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ).box.border(color: color).roundedSM.padding(const EdgeInsets.all(4)).make(),
    trailing:Row(
      children: [
        "$title".text.color(darkFontGrey).make(),
        showDone?
            const Icon(
              Icons.done,
              color: redColor,
            )
            :Container(),
      ],
    ),
  );
}