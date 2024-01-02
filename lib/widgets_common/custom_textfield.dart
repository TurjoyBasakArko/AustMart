import 'package:austmart/consts/consts.dart';


<<<<<<< HEAD
Widget customTextField({String?title,String?hint,controller,isPass}) {
=======
Widget customTextField(String?title,String?hint) {
>>>>>>> ce882405e26fda9312b11f799089aeb01d9d694f
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
<<<<<<< HEAD
        obscureText: isPass,
        controller: controller,
=======
        //controller: controller,
>>>>>>> ce882405e26fda9312b11f799089aeb01d9d694f
        decoration: InputDecoration(

          hintStyle: TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText:hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: redColor),
          ),
        ),
      ),
      5.heightBox,
    ],
  );
}
