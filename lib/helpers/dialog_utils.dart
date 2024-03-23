import 'package:flutter/material.dart';

Future showOkDialog({
  required BuildContext context,
  required String title,
  required String message,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    },
  );
}
/*
โค้ดที่ให้มาคือฟังก์ชัน showOkDialog ที่ใช้ในการแสดงกล่องโต้ตอบแบบ AlertDialog ในแอปพลิเคชัน Flutter โดยมีคุณสมบัติดังนี้:

รับพารามิเตอร์ที่จำเป็นเพื่อแสดงกล่องโต้ตอบ:

BuildContext context: เป็น context ของ Widget ที่เรียกใช้งานฟังก์ชันนี้ เป็นสิ่งที่จำเป็นในการแสดง AlertDialog
String title: ข้อความที่จะใช้เป็นหัวเรื่องของ AlertDialog
String message: ข้อความที่จะแสดงในเนื้อหาของ AlertDialog
ใช้ showDialog เพื่อแสดง AlertDialog โดยระบุ context และ builder:

ใน builder จะสร้าง AlertDialog ที่มีหัวเรื่องและเนื้อหาตามที่รับเข้ามา
AlertDialog ประกอบด้วย:

หัวเรื่อง (title): ใช้ Widget Text เพื่อแสดงหัวเรื่องที่รับเข้ามา
เนื้อหา (content): ใช้ Widget Text เพื่อแสดงข้อความที่รับเข้ามา
ปุ่ม (actions): ปุ่มเดียวที่ใช้เพื่อปิดกล่องโต้ตอบ โดยมีชื่อว่า "OK" และเมื่อกดจะปิดกล่องโต้ตอบ
โดยฟังก์ชันนี้เป็นเครื่องมือที่สะดวกในการแสดงข้อความแจ้งเตือนหรือข้อความที่เกี่ยวข้องในแอปพลิเคชันของคุณ 
เช่น เมื่อผู้ใช้ทำการเปิดแอปพลิเคชันครั้งแรก หรือเมื่อเกิดข้อผิดพลาดในการทำงานแอปพลิเคชัน เป็นต้น คุณสามารถเรียกใช้ showOkDialog 
เพื่อแสดงข้อความแจ้งเตือนต่าง ๆ ที่คุณต้องการให้ผู้ใช้เห็นได้ และเมื่อผู้ใช้กดปุ่ม "OK" กล่องโต้ตอบจะถูกปิดลง 
และความคิดเห็นเกี่ยวกับแอปพลิเคชันของคุณจะดีขึ้นเพิ่มขึ้นไปอีก!
*/
