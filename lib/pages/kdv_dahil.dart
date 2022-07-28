import 'package:flutter/material.dart';

import '../core/constants/page_constant.dart';

class KdvDahilFiyatScreen extends StatefulWidget {
  const KdvDahilFiyatScreen({Key? key}) : super(key: key);

  @override
  _KdvDahilFiyatScreenState createState() => _KdvDahilFiyatScreenState();
}

class _KdvDahilFiyatScreenState extends State<KdvDahilFiyatScreen> {
  final kdvHaricFiyat = TextEditingController();
  final kdvOrani = TextEditingController();
  double _kdvliFiyatSonuc = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text(
          PageConstant.kdvDahilFiyatHesapla,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shadowColor: Colors.black,
              elevation: 20,
              margin: const EdgeInsets.all(20),
              color: Colors.amber.shade100,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: kdvHaricFiyat,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 20.0, color: Colors.redAccent),
                      border: UnderlineInputBorder(),
                      labelText: PageConstant.kdvHaricFiyat,
                      fillColor: Colors.black),
                ),
              ),
            ),
            Card(
              shadowColor: Colors.black,
              elevation: 20,
              margin: const EdgeInsets.all(20),
              color: Colors.amber.shade100,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: kdvOrani,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: PageConstant.kdvOrani,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        shadowColor: Colors.black,
                        side: const BorderSide(color: Colors.black, width: 1),
                        elevation: 20,
                        primary: Colors.amber.shade100),
                    onPressed: () {
                      setState(() {
                        _kdvliFiyatSonuc =
                            ((int.parse(kdvHaricFiyat.text) / 100) *
                                    int.parse(kdvOrani.text)) +
                                int.parse(kdvHaricFiyat.text);
                      });
                    },
                    child: const Text(
                      PageConstant.hesapla,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        shadowColor: Colors.black,
                        side: const BorderSide(color: Colors.black, width: 1),
                        elevation: 20,
                        primary: Colors.amber.shade100),
                    onPressed: () {
                      setState(() {
                        kdvHaricFiyat.clear();
                        kdvOrani.clear();
                        _kdvliFiyatSonuc = 0;
                      });
                    },
                    child: const Text(
                      PageConstant.temizle,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ],
            ),
            Text(
              _kdvliFiyatSonuc.toStringAsFixed(2) + PageConstant.turkishLira,
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
