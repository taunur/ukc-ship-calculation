import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double draftKapal = 0.0;
  double kedalamanPerairan = 0.0;
  double tinggiPasang = 0.0;
  double tinggiSurut = 0.0;
  double hasilUkc = 0.0;

  // sas
  double speed = 0.0;
  double maxSquat = 0.0;

  void hitungUkc() {
    setState(() {
      hasilUkc = kedalamanPerairan - (draftKapal + tinggiPasang + tinggiSurut);
      hitungMaxSquat();
    });
  }

  void hitungMaxSquat() {
    // Contoh perhitungan sederhana max squat berdasarkan UKC
    maxSquat = hasilUkc * speed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UKC Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Draft Kapal (m)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                draftKapal = double.tryParse(value) ?? 0.0;
              },
            ),
            TextField(
              decoration:
                  const InputDecoration(labelText: 'Kedalaman Perairan (m)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                kedalamanPerairan = double.tryParse(value) ?? 0.0;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Tinggi Pasang (m)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                tinggiPasang = double.tryParse(value) ?? 0.0;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Tinggi Surut (m)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                tinggiSurut = double.tryParse(value) ?? 0.0;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Tinggi Pasang (m)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                speed = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: hitungUkc,
              child: const Text('Hitung UKC'),
            ),
            const SizedBox(height: 16),
            Text(
              'UKC (Under Keel Clearance): $hasilUkc m',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Max Squat: $maxSquat m', // Tampilkan hasil max squat di layar
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
