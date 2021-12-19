import 'package:flutter/material.dart';

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
        title: Text(
          'KDV Dahil Fiyatı Hesapla',
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
              margin: EdgeInsets.all(20),
              color: Colors.amber.shade100,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: kdvHaricFiyat,
                  style: TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 20.0, color: Colors.redAccent),
                      border: UnderlineInputBorder(),
                      labelText: 'Kdv Hariç Fiyat',
                      fillColor: Colors.black),
                ),
              ),
            ),
            Card(
              shadowColor: Colors.black,
              elevation: 20,
              margin: EdgeInsets.all(20),
              color: Colors.amber.shade100,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: kdvOrani,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'KDV Oranı (%)',
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
                        side: BorderSide(color: Colors.black, width: 1),
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
                    child: Text(
                      'Hesapla',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        shadowColor: Colors.black,
                        side: BorderSide(color: Colors.black, width: 1),
                        elevation: 20,
                        primary: Colors.amber.shade100),
                    onPressed: () {
                      setState(() {
                        kdvHaricFiyat.clear();
                        kdvOrani.clear();
                        _kdvliFiyatSonuc = 0;
                      });
                    },
                    child: Text(
                      'Temizle',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ],
            ),
            Text(
              _kdvliFiyatSonuc.toStringAsFixed(2) + ' ₺',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
