import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final profile = <String, String>{};

  final List<Map<String, String>> menuItems = [
    {
      'name': 'Ayam Penyet',
      'description':
          'Ayam goreng yang disajikan dengan sambal terasi dan lalapan.',
      'category': 'Makanan'
    },
    {
      'name': 'Sop Buntut',
      'description': 'Sop buntut yang gurih dengan sayuran dan rempah-rempah.',
      'category': 'Makanan'
    },
    {
      'name': 'Ikan Bakar Sedap',
      'description':
          'Ikan segar yang dibakar dengan bumbu khas, disajikan dengan sambal dan nasi.',
      'category': 'Makanan'
    },
    {
      'name': 'Rendang Daging',
      'description':
          'Daging sapi yang dimasak dengan rempah-rempah hingga empuk.',
      'category': 'Makanan'
    },
    {
      'name': 'Tahu Tempe Goreng',
      'description':
          'Tahu dan tempe yang digoreng renyah, disajikan dengan sambal kecap.',
      'category': 'Makanan'
    },
    {
      'name': 'Pisang Goreng',
      'description':
          'Pisang yang dibalut adonan tepung dan digoreng hingga kuning keemasan.',
      'category': 'Makanan'
    },
    {
      'name': 'Kerupuk Udang',
      'description':
          'Kerupuk udang renyah yang cocok sebagai pelengkap makanan.',
      'category': 'Makanan'
    },
    {
      'name': 'Es Teh/Panas',
      'description':
          'Teh manis yang diaduk hingga berbuih, disajikan panas atau dingin.',
      'category': 'Minuman'
    },
    {
      'name': 'Es Jeruk/Panas',
      'description':
          'Minuman segar dari perasan jeruk asli yang memberikan rasa manis dan asam yang menyegarkan. ',
      'category': 'Minuman'
    },
    {
      'name': 'Es Kelapa Muda',
      'description':
          'Minuman segar dari kelapa muda dengan daging kelapa yang kenyal.',
      'category': 'Minuman'
    },
    {
      'name': 'Air Mineral',
      'description':
          'Air mineral murni yang bersih dan menyegarkan.',
      'category': 'Minuman'
    },
  ];

  MainApp({super.key}) {
    profile['email'] = 'rmsedaprasa@gmail.com';
    profile['phone'] = '+62345678910';
    profile['image'] = 'main_logo.png';
    profile['addr'] =
        "Jl. Imam Bonjol No.207, Pendrikan Kidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50131";
    profile['hours'] =
        'Senin - Kamis : 10:00 - 22:00\nJumat - Minggu : 13:00 - 23:00';
    profile['desc'] =
        "Rumah makan Sedap Rasa adalah sebuah rumah makan yang menawarkan berbagai hidangan lezat yang terinspirasi dari masakan tradisional. Dengan suasana yang hangat dan ramah akan menjadi tempat ideal untuk berkumpul bersama keluarga dan teman. Kami berkomitmen untuk menggunakan bahan-bahan segar dan berkualitas tinggi dalam setiap hidangan yang kami sajikan. Dari menu aneka lauk pauk yang menggugah selera dan menjanjikan pengalaman kuliner yang memuaskan. Kunjungi kami dan nikmati cita rasa autentik yang membuat setiap momen berkesan!";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Profil Resto",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "RM. Sedap Rasa",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xFFF7BB0E),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // teksKotak(Colors.black, biodata['name'] ?? ''),
              Image(image: AssetImage('assets/${profile["image"] ?? ''}')),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0), // Memberikan jarak antar tombol
                      child: btnContact(Icons.email, Colors.blueAccent,
                          "mailto:${profile['email']}?subject=Tanya%20Seputar%20Resto"),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: btnContact(Icons.phone, Colors.deepPurple,
                          "tel:${profile['phone']}"),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: btnContact(Icons.map, Colors.green[900],
                          "https://maps.app.goo.gl/JxFPSKN6vsAjo5Mk8"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // DESKRIPSI
              teksKotak(Color(0xFFF7BB0E), 'Deskripsi'),
              SizedBox(
                height: 10,
              ),
              Text(
                profile['desc'] ?? '',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),

              // LIST MENU 
              teksKotak(Color(0xFFF7BB0E), 'List Menu'),
              SizedBox(height: 10),

              // LIST MENU - Makanan
              teksKotak2(Colors.black, 'Makanan'),
              SizedBox(height: 5),
              Column(
                children: menuItems
                    .where((item) => item['category'] == 'Makanan')
                    .map((item) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(item['name'] ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(item['description'] ?? ''),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),

              // LIST MENU - Minuman
              teksKotak2(Colors.black, 'Minuman'),
              SizedBox(height: 5),
              Column(
                children: menuItems
                    .where((item) => item['category'] == 'Minuman')
                    .map((item) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(item['name'] ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(item['description'] ?? ''),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),

              // ALAMAT
              teksKotak(Color(0xFFF7BB0E), 'Alamat'),
              SizedBox(
                height: 10,
              ),
              Text(
                profile['addr'] ?? '',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),

              // JAM & PELAYANAN
              teksKotak(Color(0xFFF7BB0E), 'Jam & Pelayanan'),
              SizedBox(
                height: 10,
              ),
              Text(
                profile['hours'] ?? '',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        teks,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  Container teksKotak2(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      width: 150,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        teks,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(0xFFF7BB0E),
        ),
      ),
    );
  }
}

Expanded btnContact(IconData icon, var color, String uri) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () {
        launch(uri);
      },
      child: Icon(icon),
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: color,
          foregroundColor: Colors.white),
    ),
  );
}

Future launch(String uri) async {
  if (!await launchUrl(Uri.parse(uri))) {
    throw Exception('Tidak dapat memanggil : $uri');
  }
}
