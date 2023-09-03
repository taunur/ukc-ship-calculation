import 'package:flutter/material.dart';
import 'package:ukc_ship/config/app.color.dart';
import 'package:ukc_ship/config/app.font.dart';
import 'package:ukc_ship/config/app.routes.dart';
import 'package:ukc_ship/widgets/appbar_custom.dart';
import 'package:ukc_ship/widgets/double_button_custom.dart';
import 'package:ukc_ship/widgets/title_custom.dart';

class UKCExplainPage extends StatelessWidget {
  const UKCExplainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listFaktor = [
      "Pengamatan/perhitungan draft Termasuk perkiraan hogaing dan sagging",
      "Peningkatan draft karena gerakan naik-turun, pitching, dan rolling",
      "Efek-efek dari gerakan squat",
      "Peningkatan draft karena perubahan densitas air Kedalaman minimum yang dipetakan yang tersedia",
      "Ketinggian air pasang yang diperkirakan (minimum yang tersedia selama jendela transit yang direncanakan)",
      "Keadaan laut dan gelombang"
    ];

    List<String> listDipandu = [
      "Keakuratan data hidrografi (referensi keakuratan sering kali disertakan pada peta)",
      "Ukuran kapal dan karakteristik penanganan",
      "Perubahan-perubahan dalam ketinggian pasang surut yang diperkirakan, yang disebabkan oleh kecepatan dan arah angin dan tekanan barometrik yang tinggi atau rendah.",
      "Sifat dan kestabilan dasar laut - misalnya, gelombang pasir, endapan lumpur, jaringan pipa, penghalang, dan lain-lain",
    ];

    List<String> listPosisi = [
      "Efek stres dan stabilitas",
      "Sifat dan tingkat dasar laut",
    ];
    return Scaffold(
      appBar: CustomAppbar(title: "Menghitung UKC", context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Center(
                child: CustomTitle(
                  title: "Menghitung UKC",
                ),
              ),
              Text(
                "Faktor-faktor spesifik berikut ini harus dipertimbangkan selama perencanaan pelayaran dan dicatat sebelum melanjutkan perjalanan :",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              listTile(listFaktor),
              const SizedBox(height: 8),
              Text(
                "Dipandu oleh pengetahuan dan pengalaman setempat, mungkin perlu bagi Nakhoda untuk memperhitungkan margin keselamatan tambahan untuk memberikan kelonggaran yang sesuai untuk variabel-variabel berikut ini :",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              listTile(listDipandu),
              const SizedBox(height: 8),
              Text(
                "Banyak peta laut yang masih didasarkan pada data sounding yang jarang dan tidak memadai yang diperoleh dari berbagai sumber dengan keandalan dan akurasi yang berbeda-beda. Akurasi peta paling baik di sepanjang rute yang sering dilalui, tetapi bahkan di perairan ini bahaya yang tidak terdeteksi mungkin masih ada, terutama untuk kapal-kapal modern yang berlayar di perairan dalam. Hanya sedikit sekali Samudra yang telah disurvei secara menyeluruh. Daerah-daerah tertentu dapat mengalami gempa bumi dan aktivitas gunung berapi yang dapat menyebabkan terbentuknya beting bahkan di daerah-daerah yang telah disurvei dengan baik; karang laut terus tumbuh Perkiraan posisi banyak. daerah dangkal yang berbahaya telah dipetakan; daerah ini harus diberi tempat berlabuh yang luas.",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              Text(
                "Buku Pegangan Pelaut. Lintasan-lintasan Samudra Dunia dan Petunjuk Pelayaran yang relevan, harus dibaca untuk mendapatkan informasi lebih lanjut mengenai bahaya-bahaya yang ditimbulkan oleh ketergantungan yang berlebihan pada peta.",
                style: blackTextStyle.copyWith(
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              Text(
                "Jika permintaan telah dibuat oleh penyewa untuk mengurangi parameter di atas atau diketahui bahwa kriteria di atas tidak dapat dipenuhi (seperti saran dari otoritas pelabuhan atau pilot), Nakhoda harus memberi tahu dan meminta persetujuan DPA kapal yang menunjukkan UKC yang dihitung dan membandingkannya dengan kebijakan Perusahaan. Pemberitahuan ini harus disertai dengan penilaian risiko yang sesuai yang dilakukan pada faktor-faktor yang diketahui oleh Nakhoda. Penilaian Risiko ini harus mencakup kontrol yang relevan, misalnya, penjagaan anjungan tambahan, kecepatan minimum, bantuan kapal tunda, sounding, dan pemantauan posisi. Informasi sounding terbaru, termasuk sifat dasar laut, harus dipastikan langsung dari otoritas atau terminal setempat.",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pendekatan ke Perairan Dangkal",
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Text(
                "Sangat penting bagi tim anjungan untuk menjaga ruang mesin agar tetap mendapatkan informasi tentang kemajuan kapal.\nAsupan air pendingin harus diganti ke hisapan laut lepas sebelum kapal memasuki area di mana jarak bebas di bawah lunas dibatasi. Sejumlah besar lumpur dan puing-puing dapat masuk ke dalam sistem pendingin jika hal ini tidak dilakukan dalam waktu yang cukup.",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Di samping",
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Text(
                "UKC minimum saat berada di samping, sesuai dengan persyaratan di atas, harus dicatat dalam Rencana Penanganan Kargo, Ini harus mencakup instruksi yang menguraikan rancangan, trim, dan daftar maksimum.",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mengambil Posisi Darat",
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Text(
                "Mungkin ada saat-saat di mana, karena sifat pelabuhan, kapal-kapal yang lebih kecil diharuskan untuk 'mengambil 'mendarat' - yaitu duduk di dasar. Dalam keadaan seperti itu, kapal harus disertifikasi berdasarkan kelas untuk pemuatan/pengeluaran di darat. Selain itu, penilaian risiko harus dipersiapkan sebelum panggilan pelabuhan untuk menilai sepenuhnya risiko yang dihadapi kapal, termasuk:",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              listTile(listPosisi),
              const SizedBox(height: 8),
              Text(
                "Persyaratan kapal untuk mempertahankan layanan seperti pemadam kebakaran dan air pendingin mesin, Berdasarkan penilaian risiko ini, Daftar Periksa Operasi Kritis harus dikembangkan untuk pengambilan tanah dan pengapungan ulang berikutnya dan ini harus direferensikan dalam rencana kargo",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              const DoubleButton(
                route: AppRoute.ukc,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView listTile(List<String> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Icon(
                Icons.circle,
                size: 8,
                color: AppColor.black,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                list[index],
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
