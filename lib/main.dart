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
  List<DataNews> _datanews = [];

  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    try {
      final data = await ApiCaller().get("datanews");
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
          body: Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('* ต้องกรอกข้อมูล'),
                  MyTextField(
                    controller: _controller,
                    hintText: 'URL *',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MyTextField(
                    controller: _controller,
                    hintText: 'รายละเอียด',
                    keyboardType: TextInputType.text,
                  ),
                  Text('ระบุประเภทเว็บเลว *'),
                  ListView.builder(
                itemCount: _datanews.length,
                itemBuilder: (context, index) {
                  final item = _datanews[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.title),
                      subtitle: Text(item.subtitle),
                      trailing: Icon(item.selected ? Icons.check : null),
                    ),
                  );
                },
              ),
                ],
              ),
            ),
          )),
    );
  }
}
