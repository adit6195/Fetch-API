import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoindeskScreen extends StatefulWidget {
  const CoindeskScreen({super.key});

  @override
  State<CoindeskScreen> createState() => _CoindeskScreenState();
}

class _CoindeskScreenState extends State<CoindeskScreen> {
  Map? mapResponse;
  Future fetchData() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CoinDesk Bitcoin Price Index"),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mapResponse!['disclaimer'].toString(),
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 20,
                              width: MediaQuery.of(context).size.width,
                              child: Divider(color: Colors.black),
                            ),
                            Text("Updated Time: " +
                                "    " +
                                mapResponse!['time']['updated'].toString()),
                            Text("Updated ISO: " +
                                "      " +
                                mapResponse!['time']['updatedISO'].toString()),
                            Text("Updated DUK: " +
                                "     " +
                                mapResponse!['time']['updateduk'].toString()),
                            SizedBox(
                              height: 20,
                              width: MediaQuery.of(context).size.width,
                              child: Divider(color: Colors.black),
                            ),
                            Text("Chart Name: " +
                                "  " +
                                mapResponse!['chartName'].toString()),
                            SizedBox(
                              height: 20,
                              width: MediaQuery.of(context).size.width,
                              child: Divider(color: Colors.black),
                            ),
                            Text("CODE: " +
                                "  " +
                                mapResponse!['bpi']['USD']['code'].toString()),
                            Text("Symbol: " +
                                "  " +
                                mapResponse!['bpi']['USD']['symbol']
                                    .toString()),
                            Text("Rate: " +
                                "  " +
                                mapResponse!['bpi']['USD']['rate'].toString()),
                            Text("Discription: " +
                                "  " +
                                mapResponse!['bpi']['USD']['discription']
                                    .toString()),
                            Text("Rate Float: " +
                                "  " +
                                mapResponse!['bpi']['USD']['rate_float']
                                    .toString()),
                            SizedBox(
                              height: 20,
                              width: MediaQuery.of(context).size.width,
                              child: Divider(color: Colors.black),
                            ),
                            Text("CODE: " +
                                "  " +
                                mapResponse!['bpi']['GBP']['code'].toString()),
                            Text("Symbol: " +
                                "  " +
                                mapResponse!['bpi']['GBP']['symbol']
                                    .toString()),
                            Text("Rate: " +
                                "  " +
                                mapResponse!['bpi']['GBP']['rate'].toString()),
                            Text("Discription: " +
                                "  " +
                                mapResponse!['bpi']['GBP']['discription']
                                    .toString()),
                            Text("Rate Float: " +
                                "  " +
                                mapResponse!['bpi']['GBP']['rate_float']
                                    .toString()),
                            SizedBox(
                              height: 20,
                              width: MediaQuery.of(context).size.width,
                              child: Divider(color: Colors.black),
                            ),
                            Text("CODE: " +
                                "  " +
                                mapResponse!['bpi']['EUR']['code'].toString()),
                            Text("Symbol: " +
                                "  " +
                                mapResponse!['bpi']['EUR']['symbol']
                                    .toString()),
                            Text("Rate: " +
                                "  " +
                                mapResponse!['bpi']['EUR']['rate'].toString()),
                            Text("Discription: " +
                                "  " +
                                mapResponse!['bpi']['EUR']['discription']
                                    .toString()),
                            Text("Rate Float: " +
                                "  " +
                                mapResponse!['bpi']['EUR']['rate_float']
                                    .toString()),
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
