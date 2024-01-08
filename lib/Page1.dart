import 'package:ajeesdemo/DataModle.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<Datum> dataList = [];

  List<Color> value = [
    Colors.greenAccent,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.white,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await request();
      print("ajees");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          itemCount: dataList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: value[index % value.length],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(dataList[index].employeeName),
                  Text(dataList[index].employeeAge.toString()),
                  Text(dataList[index].employeeSalary.toString()),
                ],
              ),
            );
          }),
    );
  }

  Future<void> request() async {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    Response response = await dio.get('https://dummy.restapiexample.com/api/v1/employees');
    DatModel datModel = datModelFromJson(response.toString());
    if (datModel.data.isNotEmpty) {
      dataList.clear();
      setState(() {
        dataList.addAll(datModel.data);
      });
    }
  }
}
