import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiCaller {
  static const host = 'https://cpsu-api-49b593d4e146.herokuapp.com';
  static const baseUrl = '$host/api/2_2566/final';
  static final _dio = Dio(BaseOptions(responseType: ResponseType.plain));

  Future<String> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response =
          await _dio.get('$baseUrl/$endpoint', queryParameters: params);
      debugPrint('Status code: ${response.statusCode}');
      debugPrint(response.data.toString());
      return response.data.toString();
    } on DioException catch (e) {
      var msg = e.response?.data.toString();
      debugPrint(msg);
      throw Exception(msg);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<String> post(String endpoint,
      {required Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.post('$baseUrl/$endpoint', data: params);
      debugPrint('Status code: ${response.statusCode}');
      debugPrint(response.data.toString());
      return response.data.toString();
    } on DioException catch (e) {
      var msg = e.response?.data.toString();
      debugPrint(msg);
      throw Exception(msg);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
/*
โค้ดที่คุณให้มาเป็นคลาส ApiCaller ที่ใช้ Dio เพื่อทำ HTTP requests ไปยัง API ที่กำหนดไว้ 
ดังนั้นเมื่อเรียกใช้เมทอด get หรือ post จะเรียก HTTP GET หรือ POST request ตามลำดับไปยัง URL 
ที่กำหนดใน baseUrl ร่วมกับ endpoint ที่ระบุในการเรียกเมทอด get หรือ post นั้น ๆ โดยส่งพารามิเตอร์ต่าง ๆ 
ที่อาจจำเป็นได้ด้วยเช่นกัน และดังนั้นในกรณีของ post เมื่อมีการส่งข้อมูลแบบ POST ผ่านพารามิเตอร์ params ด้วย
โดยระบบจะรอคำตอบจากเซิร์ฟเวอร์ และจะคืนข้อมูลที่ได้จากการเรียก response.data ในรูปของ String ออกไป 
ซึ่งในที่นี้จะถูกใช้ debugPrint เพื่อแสดงผลลัพธ์ลงใน console เพื่อเช็คสถานะการเรียกและข้อมูลที่ได้รับจากเซิร์ฟเวอร์
นอกจากนี้ การจัดการกับข้อผิดพลาดของการเชื่อมต่อจะทำผ่านการจัดการข้อผิดพลาดแบบ try-catch ในทั้ง get และ post 
เพื่อให้โปรแกรมไม่ติดตามหรือหยุดทำงานในกรณีที่มีข้อผิดพลาดเกิดขึ้น สรุปแล้ว โค้ดนี้ใช้ Dio ในการทำ HTTP requests 
เพื่อร้องขอข้อมูลจากเซิร์ฟเวอร์และส่งข้อมูลไปยังเซิร์ฟเวอร์ และจัดการกับข้อผิดพลาดที่อาจเกิดขึ้นในขณะที่ทำการเรียก API 
โดยใช้การจัดการข้อผิดพลาดแบบ try-catch ในรูปแบบเจาะจงที่จะให้ผู้ใช้รู้ว่าเกิดข้อผิดพลาดอะไรขึ้นและทำอย่างไรในการ
แก้ไขดังนั้นโค้ดนี้ใช้ได้สำหรับการเรียกใช้งาน API ใน Flutter อย่างมีประสิทธิภาพและปลอดภัย 
*/