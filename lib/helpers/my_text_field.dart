import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;

  const MyTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.keyboardType = TextInputType.multiline,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        contentPadding: const EdgeInsets.only(
          left: 16.0,
          bottom: 12.0,
          top: 12.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primary.withOpacity(0.5),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
      keyboardType: keyboardType,
      maxLines: keyboardType == TextInputType.multiline ? null : 1,
    );
  }
}
/*
โค้ดที่ให้มาเป็นส่วนของแอปพลิเคชัน Flutter ซึ่งรวมถึงคลาส MyTextField ที่สร้าง TextField 
ที่กำหนดและกำหนดรูปแบบต่าง ๆ ของ input fields ได้ โดยมีลักษณะดังนี้:

คุณสมบัติและพารามิเตอร์:

controller: คือ TextEditingController ที่จะเชื่อมต่อกับ TextField เพื่อจัดการข้อมูลที่ผู้ใช้ป้อนเข้ามา
hintText: ข้อความที่จะแสดงใน TextField เมื่อไม่มีข้อความได้ป้อนเข้ามา (เป็นทางเลือก)
keyboardType: ประเภทของแป้นพิมพ์ที่จะแสดงเมื่อผู้ใช้เรียกใช้ TextField (มีค่าเริ่มต้นเป็น TextInputType.multiline)
การสร้าง Widget:

build method สร้างและคืนค่า TextField Widget
ใน TextField Widget มีการกำหนดรูปแบบต่าง ๆ ของ input fields โดยใช้ InputDecoration
กำหนดสีพื้นหลังของ TextField เป็นสีขาว
กำหนดรูปแบบของกรอบเมื่อมีการเลือก (focused) หรือไม่เลือก (border)
กำหนดรูปแบบของเส้นกรอบ
กำหนดคุณสมบัติเพิ่มเติม เช่น การเติมให้เต็มพื้นที่ของ TextField และการกำหนดประเภทของแป้นพิมพ์
การใช้งาน:

คุณสามารถนำ MyTextField ไปใช้งานในโค้ดของคุณได้โดยการสร้าง instance ของ MyTextField และส่งค่าพารามิเตอร์ที่จำเป็นเข้าไป
โค้ด MyTextField นี้มีประโยชน์ในการสร้าง TextField ที่กำหนดและกำหนดรูปแบบต่าง ๆ ของ input fields 
ได้ตามความต้องการของโปรเจคและการออกแบบของ UI ของคุณ และคุณสามารถนำไปใช้งานในโปรเจค Flutter ของคุณได้โดยง่าย
*/