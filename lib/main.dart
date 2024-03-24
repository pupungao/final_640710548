import 'package:flutter/material.dart';
import 'package:final_640710548/helpers/api_caller.dart';
import 'package:final_640710548/models/data_news_item.dart';
import 'package:final_640710548/helpers/my_list_tile.dart';
import 'package:final_640710548/helpers/my_text_field.dart';
import 'package:final_640710548/helpers/dialog_utils.dart';
import 'dart:convert';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String _enterUrl = '';
  String _enterTitle = '';
  List<DataNews> _datanews = [];

  void initState() {
    super.initState();
    _loadItems();
  }

  void readyOrYet(){
    if(_controller.text.isEmpty && _descriptionController.text.isEmpty){
      _Errortryagain();
    }
    else{
      setState(() {
      _enterUrl = _controller.text;
      _enterTitle = _descriptionController.text;
      _Pass();
    });
    }
  }
  Future<void> _loadItems() async {
    try {
      final data = await ApiCaller().get("https://cpsu-api-49b593d4e146.herokuapp.com/api/2_2566/final/web_types");
      List list = jsonDecode(data);
      setState(() {
        _datanews = list.map((e) => DataNews.fromJson(e)).toList();
      });
    } on Exception catch (e) {
      showOkDialog(context: context, title: "Error", message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Webby Fondue\nระบบรายงานเว็บเลวๆ'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('* ต้องกรอกข้อมูล'),
                MyTextField(
                  controller: _controller,
                  hintText: 'URL *',
                  keyboardType: TextInputType.text,
                ),
                MyTextField(
                  controller: _descriptionController,
                  hintText: 'รายละเอียด',
                  keyboardType: TextInputType.text,
                ),
                Text('ระบุประเภทเว็บเลว *'),
                // ListView.builder(
                //   itemCount: 5, // Example item count
                //   itemBuilder: (BuildContext context, int index) {
                //     DataNews data = _datanews![index];
                //     return MyListTile(
                //       title: data.title,
                //       subtitle: data.subtitle,
                //       imageUrl: data.imageUrl,
                //       selected: index == 2, 
                //       onTap: () {
                //       },
                //     );
                //   },
                // ),
                ElevatedButton(
                  onPressed: readyOrYet, 
                  child: Text('ส่งข้อมูล')),
              ],
            ),
          ),
        ));
  }
  Future<void> _Pass() async {
    try {
      final data = await ApiCaller().post(
        "https://cpsu-api-49b593d4e146.herokuapp.com/api/2_2566/final/report_web",
        params: {
        },
      );
      // API นี้จะส่งข้อมูลที่เรา post ไป กลับมาเป็น JSON object ดังนั้นต้องใช้ Map รับค่าจาก jsonDecode()
      Map map = jsonDecode(data);
      String text =
          'ขอบคุณสำหรับการแจ้งข้อมูล รหัสของคุณคือ ${map['id']} \n\nสถิติการรายงาน \n===== \n เว็บพนัน : ${map['count']}\n เว็บปลอมแปลง เลียนแบบ : ${map['count']}\n เว็บข่าวมั่ว : ${map['count']}\n เว็บแชร์ลูกโซ่ : ${map['count']}\nอื่นๆ : 14';
      showOkDialog(context: context, title: "Success", message: text);
    } on Exception catch (e) {
      showOkDialog(context: context, title: "Error", message: e.toString());
    }
  }
  Future<void> _Errortryagain() async {
    await showOkDialog(
      context: context,
      title: "Error",
      message: "ต้องกรอก URL",
    );
  }
}
