import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UniversitiesScreen extends StatefulWidget {
  const UniversitiesScreen({super.key});

  @override
  State<UniversitiesScreen> createState() => _UniversitiesScreenState();
}

class _UniversitiesScreenState extends State<UniversitiesScreen> {
  List? listResponse;
  Map? mapResponse;

  Future fechData() async {
    print("fetch data call");
    http.Response response;
    response = await http.get(Uri.parse(
        'http://universities.hipolabs.com/search?country=United+States'));
    print('printing response');
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        listResponse = json.decode(response.body);
        mapResponse = listResponse![0];
      });
      print("Hello");
      print(listResponse.toString());
      print("HelloUniversity2");
    }
  }

  @override
  void initState() {
    fechData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Universities Hipolabs"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  mapResponse == null
                      ? Container(
                          child: Text("Loading...",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        )
                      : Column(
                          children: [
                            ListView.builder(
                                itemCount: listResponse == null
                                    ? 0
                                    : listResponse!.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ("Name: ") +
                                              ("  ") +
                                              listResponse![index]['name']
                                                  .toString(),
                                        ),
                                        Text(
                                          ("Country: ") +
                                              ("  ") +
                                              listResponse![index]['country']
                                                  .toString(),
                                        ),
                                        Text(
                                          ("Alpha Two Code: ") +
                                              ("  ") +
                                              listResponse![index]
                                                      ['alpha_two_code']
                                                  .toString(),
                                        ),
                                        Text(
                                          ("Web Page: ") +
                                              ("  ") +
                                              listResponse![index]['web_pages']
                                                      [0]
                                                  .toString(),
                                        ),
                                        Text(
                                          ("Domain: ") +
                                              ("  ") +
                                              listResponse![index]['domains'][0]
                                                  .toString(),
                                        ),
                                        Text(
                                          ("State Province: ") +
                                              ("  ") +
                                              listResponse![index]
                                                      ['state-province']
                                                  .toString(),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Divider(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
