import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RandomUserScreen extends StatefulWidget {
  const RandomUserScreen({super.key});

  @override
  State<RandomUserScreen> createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends State<RandomUserScreen> {
  List? listResponse;
  Map? mapResponse;
  List? listofResult;
  // List? listofName;

  Future fechData() async {
    http.Response response;
    response = await http.get(Uri.parse('http://randomuser.me/api/'));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listofResult = mapResponse!['results'];
        // listofName = mapResponse!['results']['name'];
      });
      print("Hello");
      print(listofResult.toString());
      print("Hello2");
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
        title: Text("Random User"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
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
                              itemCount: listofResult == null
                                  ? 0
                                  : listofResult!.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          children: [
                                            Text(("Name: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(
                                                listofResult![index]['name']
                                                            ['title']
                                                        .toString() +
                                                    (" ") +
                                                    listofResult![index]['name']
                                                        ['first'] +
                                                    (" ") +
                                                    listofResult![index]['name']
                                                        ['last'],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("Gender: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                              listofResult![index]['gender']
                                                  .toString(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("D.O.B and Time: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(listofResult![index]
                                                      ['dob']['date']
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("Age: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(listofResult![index]['dob']
                                                    ['age']
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("Phone Number: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(listofResult![index]['phone']
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("Cell Number: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(listofResult![index]['cell']
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("E-mail: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(listofResult![index]
                                                      ['email']
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("Address: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(listofResult![index]['location']
                                                          ['street']['number']
                                                      .toString() +
                                                  (", ") +
                                                  listofResult![index]['location']
                                                          ['street']['name']
                                                      .toString() +
                                                  (", ") +
                                                  listofResult![index]['location']['city']
                                                      .toString() +
                                                  (", ") +
                                                  listofResult![index]
                                                          ['location']['state']
                                                      .toString() +
                                                  (", ") +
                                                  listofResult![index]['location']
                                                          ['country']
                                                      .toString() +
                                                  (" - ") +
                                                  listofResult![index]['location']
                                                          ['postcode']
                                                      .toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("Co-ordinates: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(listofResult![index]
                                                                  ['location']
                                                              ['coordinates']
                                                          ['latitude']
                                                      .toString() +
                                                  (" latitude   ") +
                                                  listofResult![index]
                                                              ['location']
                                                          ['coordinates']
                                                      ['longitude'] +
                                                  (" longituide").toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("TimeZone: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(listofResult![index]
                                                            ['location']
                                                        ['timezone']['offset']
                                                    .toString() +
                                                (" ") +
                                                listofResult![index]['location']
                                                            ['timezone']
                                                        ['discription']
                                                    .toString()),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("UUID: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(listofResult![index]
                                                      ['login']['uuid']
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("Username: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(listofResult![index]
                                                      ['login']['username']
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("Password: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(listofResult![index]
                                                      ['login']['password']
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("Registered on: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(listofResult![index]
                                                      ['registered']['date']
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("Registered Since:"),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(listofResult![index]
                                                        ['registered']['age']
                                                    .toString() +
                                                (" Years")),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("salt: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(listofResult![index]
                                                      ['login']['salt']
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("md5: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(listofResult![index]
                                                      ['login']['md5']
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("sha1: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(listofResult![index]
                                                      ['login']['sha1']
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(("sha256: "),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Expanded(
                                              child: Text(listofResult![index]
                                                      ['login']['sha256']
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text('ID: ',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(listofResult![index]['id']
                                                    ['name']
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text('Value: ',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(listofResult![index]['id']
                                                    ['value']
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text('Large Image:          ',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Image.network(listofResult![index]
                                                ['picture']['large']),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text('Medium Image:          ',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Image.network(listofResult![index]
                                                ['picture']['medium']),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text('Thumbnail Image:          ',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Image.network(listofResult![index]
                                                ['picture']['thumbnail']),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Divider(color: Colors.black),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text('NAT: ',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(listofResult![index]['nat']
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 15,
                              width: MediaQuery.of(context).size.width,
                              child: Divider(color: Colors.black),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text('SEED: ',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  Text(mapResponse!['info']['seed'].toString()),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                              width: MediaQuery.of(context).size.width,
                              child: Divider(color: Colors.black),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text('Result: ',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  Text(mapResponse!['info']['results']
                                      .toString()),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                              width: MediaQuery.of(context).size.width,
                              child: Divider(color: Colors.black),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text('Page: ',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  Text(mapResponse!['info']['page'].toString()),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                              width: MediaQuery.of(context).size.width,
                              child: Divider(color: Colors.black),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text('Version: ',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  Text(mapResponse!['info']['version']
                                      .toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
