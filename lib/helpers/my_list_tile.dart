import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final bool selected;
  final VoidCallback? onTap;

  const MyListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: selected
                ? colorScheme.primary.withOpacity(0.8)
                : Colors.transparent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Container(
                    width: 100.0,
                    height: 80.0,
                    child: Image.network(imageUrl),
                  ),
                ),
                SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: textTheme.bodyLarge),
                    SizedBox(height: 4.0),
                    Text(subtitle),
                  ],
                ),
              ],
            ),
            if (selected)
              Positioned(
                top: 8.0,
                right: 8.0,
                child: Container(
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primary,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 16.0),
                ),
              )
          ],
        ),
      ),
    );
  }
}
/*
โค้ดที่ให้มาคือคลาส MyListTile ที่สร้าง Widget แสดงข้อมูลในรูปแบบของ ListTile แต่มีการปรับแต่ง UI 

ให้สอดคล้องกับการเลือกแบบอินไลน์ โดยมีคุณสมบัติดังนี้:
title: ข้อความหลักใน ListTile.
subtitle: ข้อความรองใน ListTile.
imageUrl: URL ของรูปภาพที่จะแสดงใน ListTile.
selected: ค่าบอลีนที่ระบุว่า ListTile นี้ถูกเลือกหรือไม่ (เริ่มต้นเป็น false).
onTap: Callback ที่จะเรียกเมื่อ ListTile ถูกแตะ.
โดยคลาส MyListTile นั้นสร้าง GestureDetector เพื่อสามารถตรวจจับการแตะได้ และมี Container 
ที่ใช้ในการแสดงข้อมูลและตกแต่งรูปแบบ โดยมีลักษณะดังนี้:

การตกแต่ง Container ด้วย BoxDecoration เพื่อให้มีกรอบและสีพื้นหลังเป็นสีขาว และหาก ListTile 
นี้ถูกเลือกจะมีการเพิ่มเส้นขอบสี primary และมีการปรับเปลี่ยนสีพื้นหลังของ Container เป็นสี primary อีกด้วย
Row ที่ประกอบด้วยรูปภาพที่ถูก Clip ด้วย BorderRadius และข้อความหลักและรอง
ถ้า ListTile ถูกเลือก จะมีการเพิ่ม Icon ตรวจสอบที่มีขนาดเล็กไว้ด้านบนขวาของ ListTile
โดยรวมแล้ว MyListTile เป็น Widget ที่มีการแสดงแบบ Customizable ListTile โดยมีการปรับแต่ง UI 
ให้สอดคล้องกับการเลือกแบบอินไลน์ และมีคุณสมบัติที่สามารถปรับเปลี่ยนได้ตามความต้องการของแอปพลิเคชันของคุณ
*/