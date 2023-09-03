import 'package:flutter/material.dart';
import 'package:ukc_ship/config/app.font.dart';
import 'package:ukc_ship/config/app.routes.dart';
import 'package:ukc_ship/widgets/appbar_custom.dart';
import 'package:ukc_ship/widgets/double_button_custom.dart';
import 'package:ukc_ship/widgets/title_custom.dart';

class AbstractPage extends StatelessWidget {
  const AbstractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Abstrak", context: context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const CustomTitle(
            title: "Abstrak",
          ),
          textNormal(
            "Nakhoda kapal dapat mengelola UKC kapalnya dengan: Mengambil tindakan yang memengaruhi draft dinamis kapal (seperti mengubah kecepatan kapal) dan Menjadwalkan transit kapalnya pada rute yang direncanakan untuk memastikan bahwa akan ada ketinggian air yang cukup untuk perjalanan yang aman ketika kapal mencapai lokasi dengan kedalaman yang terkendali.",
          ),
          const SizedBox(height: 8),
          textNormal(
            "Namun, untuk melakukan hal ini, dia harus memiliki informasi lingkungan real-time dan prakiraan yang akurat di sepanjang rutenya, serta metode yang tervalidasi untuk memprediksi gerakan kapalnya (dan dengan demikian rancangan dinamis) untuk berbagai situasi. Paling tidak, informasi ini harus mencakup kedalaman dan bahaya bawah air yang dipetakan secara akurat, ketinggian air, dan rumus prediksi khusus alur khusus kapal untuk draft dinamis (berdasarkan kecepatan kapal, draft statis, dan kedalaman air). Perhitungan draft dinamis mungkin juga memerlukan informasi mengenai arus, densitas air, dan gelombang, ombak, dan/atau seiching.",
          ),
          const SizedBox(height: 8),
          textNormal(
            "APP ini dimaksudkan untuk memberikan panduan dasar tentang penentuan jarak bebas lunas minimum kapal dan penentuan jarak jongkok untuk memberikan navigasi yang aman melalui area-area dengan kedalaman air yang terbatas dan dengan demikian meningkatkan keselamatan pelayaran dan perlindungan lingkungan. APP ini memberikan gambaran umum tentang pengelolaan Jarak Bebas Lunas Kapal. Penentuan UKC yang tidak akurat dari setiap kapal yang memasuki atau meninggalkan pelabuhan dengan kedalaman terbatas dapat menimbulkan konsekuensi keselamatan, ekonomi, dan lingkungan yang serius.",
          ),
          const SizedBox(height: 8),
          textNormal(
            "Pengguna dipersilakan untuk mengunduh dan menggunakan aplikasi seluler ini hanya untuk tujuan informasi dan edukasi, tidak disarankan untuk digunakan untuk tujuan navigasi kapal. Sumber informasi dalam aplikasi ini berasal dari berbagai buku studi navigasi laut. Pengembang tidak bertanggung jawab atas penggunaan aplikasi ini.",
          ),
          const DoubleButton(
            route: AppRoute.about,
          ),
        ],
      ),
    );
  }

  Text textNormal(String textNormal) {
    return Text(
      textNormal,
      style: blackTextStyle,
      textAlign: TextAlign.justify,
    );
  }
}
