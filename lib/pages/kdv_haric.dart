import 'package:flutter/material.dart';
import 'package:kdv_app/core/constants/page_constant.dart';

class KDVHaricFiyatScreen extends StatefulWidget {
  const KDVHaricFiyatScreen({Key? key}) : super(key: key);

  @override
  _KDVHaricFiyatScreenState createState() => _KDVHaricFiyatScreenState();
}

class _KDVHaricFiyatScreenState extends State<KDVHaricFiyatScreen> {
  final kdvDahilFiyat = TextEditingController();
  final kdvOrani = TextEditingController();
  double _kdvsizFiyatSonuc = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text(
          PageConstant.kdvHaricFiyatHesapla,
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
                  controller: kdvDahilFiyat,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 20.0, color: Colors.redAccent),
                      border: UnderlineInputBorder(),
                      labelText: PageConstant.kdvDahilFiyat,
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
                        _kdvsizFiyatSonuc = int.parse(kdvDahilFiyat.text) /
                            (1 + (int.parse(kdvOrani.text) / 100));
                      });
                    },
                    child: const Text(
                      'Hesapla',
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
                        kdvDahilFiyat.clear();
                        kdvOrani.clear();
                        _kdvsizFiyatSonuc = 0;
                      });
                    },
                    child: const Text(
                      PageConstant.temizle,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ],
            ),
            Text(
              _kdvsizFiyatSonuc.toStringAsFixed(2) + PageConstant.turkishLira,
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
