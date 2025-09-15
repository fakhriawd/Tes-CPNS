import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tes CPNS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.blueAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade700,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class QuizCategory {
  final String title;
  final IconData icon;
  final List<Question> questions;

  QuizCategory({
    required this.title,
    required this.icon,
    required this.questions,
  });
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String? imageUrl;
  int? userSelectedIndex;
  bool isAnswered;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    this.imageUrl,
    this.userSelectedIndex,
    this.isAnswered = false,
  });
}

class MaterialContent {
  final String title;
  final IconData icon;
  final String content;

  MaterialContent({
    required this.title,
    required this.icon,
    required this.content,
  });
}

// Data kuis lengkap
final List<QuizCategory> fullQuizData = [
  QuizCategory(
    title: 'TWK',
    icon: Icons.gavel,
    questions: [
      Question(
        questionText: 'Siapa tokoh yang dikenal sebagai Bapak Proklamator Indonesia bersama Soekarno?',
        options: ['Mohammad Hatta', 'Sutan Sjahrir', 'Tan Malaka', 'Ahmad Soebardjo'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Pancasila sebagai dasar negara dan pandangan hidup bangsa Indonesia tercantum dalam?',
        options: ['Pembukaan UUD 1945', 'Batang Tubuh UUD 1945', 'TAP MPR', 'UU No. 12 Tahun 2011'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Undang-Undang Dasar Negara Republik Indonesia Tahun 1945 disahkan oleh?',
        options: ['BPUPKI', 'PPKI', 'MPR', 'DPR'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Pada tanggal berapa Hari Kesaktian Pancasila diperingati?',
        options: ['1 Juni', '17 Agustus', '1 Oktober', '10 November'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Apa sebutan lain untuk Bhinneka Tunggal Ika?',
        options: ['Persatuan', 'Kesatuan', 'Keragaman', 'Semboyan Negara'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: 'Siapa pencipta lagu kebangsaan Indonesia Raya?',
        options: ['Ismail Marzuki', 'W.R. Supratman', 'C. Simanjuntak', 'H. Mutahar'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Tujuan dibentuknya ASEAN adalah?',
        options: ['Kerjasama militer', 'Kerjasama ekonomi dan sosial-budaya', 'Kerjasama politik', 'Kerjasama pendidikan'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Sumpah Pemuda dicetuskan pada kongres pemuda ke-?',
        options: ['I', 'II', 'III', 'IV'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Apa arti dari simbol Bintang pada Pancasila?',
        options: ['Ketuhanan Yang Maha Esa', 'Kemanusiaan yang Adil dan Beradab', 'Persatuan Indonesia', 'Kerakyatan yang Dipimpin oleh Hikmat Kebijaksanaan'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Hak untuk memilih dan dipilih dalam pemilihan umum disebut?',
        options: ['Hak Asasi Manusia', 'Hak Konstitusional', 'Hak Politik', 'Hak Sipil'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Siapa yang memimpin perlawanan Pangeran Diponegoro?',
        options: ['Pangeran Diponegoro', 'Pattimura', 'Tuanku Imam Bonjol', 'Teuku Umar'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Sistem pemerintahan Indonesia berdasarkan UUD 1945 adalah?',
        options: ['Monarki', 'Otokrasi', 'Presidensial', 'Parlementer'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Apa nama organisasi bentukan Jepang yang bertujuan untuk melatih pemuda Indonesia dalam bidang militer?',
        options: ['PETA', 'Jibakutai', 'Heiho', 'Fujinkai'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Ibu kota kerajaan Majapahit adalah?',
        options: ['Singasari', 'Trowulan', 'Pajajaran', 'Kediri'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Kapan Hari Lahir Pancasila diperingati?',
        options: ['17 Agustus', '1 Juni', '1 Oktober', '28 Oktober'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Korupsi, Kolusi, dan Nepotisme (KKN) merupakan tindakan yang melanggar nilai?',
        options: ['Kerja Keras', 'Keadilan', 'Integritas', 'Toleransi'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Siapakah yang dijuluki "Bapak Koperasi Indonesia"?',
        options: ['Mohammad Hatta', 'Soekarno', 'Sutan Sjahrir', 'Jusuf Kalla'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Apa nama organisasi yang mengusulkan Pancasila sebagai dasar negara?',
        options: ['BPUPKI', 'PPKI', 'KNIP', 'MPRS'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Sistem pemerintahan yang kekuasaan tertingginya di tangan rakyat adalah?',
        options: ['Demokrasi', 'Monarki', 'Oligarki', 'Komunisme'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Apa nama bendera Merah Putih?',
        options: ['Sang Saka Merah Putih', 'Sang Dwiwarna', 'Sang Putih Merah', 'Sang Merah Putih'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Salah satu fungsi lambang negara Garuda Pancasila adalah sebagai?',
        options: ['Lambang Kebudayaan', 'Lambang Kedaulatan', 'Lambang Persatuan', 'Lambang Kehormatan'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Apa sebutan untuk sila kedua Pancasila?',
        options: ['Keadilan Sosial bagi Seluruh Rakyat Indonesia', 'Persatuan Indonesia', 'Kemanusiaan yang Adil dan Beradab', 'Ketuhanan Yang Maha Esa'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Siapa yang dikenal sebagai Bapak Proklamasi?',
        options: ['Soekarno', 'Mohammad Hatta', 'Sutan Sjahrir', 'Ahmad Soebardjo'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Apa yang dimaksud dengan Hak Asasi Manusia (HAM)?',
        options: ['Hak yang diberikan oleh negara', 'Hak yang dimiliki sejak lahir', 'Hak yang diperoleh melalui hukum', 'Hak yang didapatkan setelah dewasa'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Apa nama organisasi yang pertama kali dibentuk untuk memerdekakan Indonesia?',
        options: ['Budi Utomo', 'Sarekat Islam', 'Indische Partij', 'Perhimpunan Indonesia'],
        correctAnswerIndex: 0,
      ),
    ],
  ),
  QuizCategory(
    title: 'TIU',
    icon: Icons.calculate,
    questions: [
      Question(
        questionText: 'Jika semua kucing adalah hewan, dan semua hewan bisa makan, maka?',
        options: ['Semua kucing bisa makan', 'Semua hewan adalah kucing', 'Beberapa hewan tidak bisa makan', 'Beberapa kucing tidak bisa makan'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Carilah lawan kata dari "Abadi"?',
        options: ['Kekal', 'Fana', 'Langgeng', 'Terkini'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: '25% dari 200 adalah?',
        options: ['25', '50', '75', '100'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Jika Budi lebih tua dari Doni, dan Doni lebih muda dari Wati, maka?',
        options: ['Budi lebih tua dari Wati', 'Wati lebih tua dari Doni', 'Doni lebih tua dari Budi', 'Wati lebih muda dari Doni'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Carilah sinonim dari "Absurd"?',
        options: ['Wajar', 'Masuk akal', 'Mustahil', 'Logis'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Jika 3, 5, 8, 12, ... maka angka selanjutnya adalah?',
        options: ['15', '16', '17', '18'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: '2 + 5 * 3 - 4 = ?',
        options: ['13', '15', '17', '21'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Jika Riza lebih tinggi dari Fajar, dan Fajar sama tingginya dengan Tio, maka?',
        options: ['Riza lebih tinggi dari Tio', 'Tio lebih tinggi dari Riza', 'Fajar lebih tinggi dari Riza', 'Tio lebih pendek dari Fajar'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Carilah lawan kata dari "Skeptis"?',
        options: ['Ragu-ragu', 'Yakin', 'Acuh', 'Masa bodoh'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Jika sebuah mobil menempuh jarak 120 km dalam waktu 2 jam, berapa kecepatan rata-ratanya?',
        options: ['50 km/jam', '60 km/jam', '70 km/jam', '80 km/jam'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Jika 5, 7, 11, 13, ... angka selanjutnya adalah?',
        options: ['15', '17', '19', '21'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Carilah sinonim dari "Defisit"?',
        options: ['Kelebihan', 'Kekurangan', 'Keuntungan', 'Keseimbangan'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Ayah lebih tua dari Paman. Paman lebih muda dari Kakak. Mana pernyataan yang benar?',
        options: ['Paman lebih tua dari Ayah', 'Kakak lebih tua dari Ayah', 'Paman lebih muda dari Kakak', 'Ayah lebih muda dari Kakak'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Jika harga 3 kg apel adalah Rp 60.000, berapa harga 5 kg apel?',
        options: ['Rp 80.000', 'Rp 90.000', 'Rp 100.000', 'Rp 120.000'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Carilah lawan kata dari "Otonomi"?',
        options: ['Mandiri', 'Independen', 'Subordinasi', 'Kedaulatan'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Jika sebuah kelereng jatuh dari ketinggian 125 meter, berapa waktu yang dibutuhkan untuk mencapai tanah?',
        options: ['3 detik', '4 detik', '5 detik', '6 detik'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Carilah sinonim dari "Konvensi"?',
        options: ['Kesepakatan', 'Pertentangan', 'Perdebatan', 'Kerjasama'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Jika x = 2, maka 5x + 3 = ?',
        options: ['8', '10', '13', '18'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Carilah lawan kata dari "Fiksi"?',
        options: ['Khayalan', 'Realita', 'Dongeng', 'Cerita'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Sebuah persegi memiliki sisi 4 cm, berapa luasnya?',
        options: ['8 cm²', '12 cm²', '16 cm²', '20 cm²'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Jika semua siswa rajin, dan Rina adalah siswa, maka?',
        options: ['Rina tidak rajin', 'Semua siswa adalah Rina', 'Rina adalah siswa yang rajin', 'Tidak ada yang rajin'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Carilah sinonim dari "Sanksi"?',
        options: ['Hukuman', 'Toleransi', 'Persetujuan', 'Maaf'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Jika a+b = 10 dan b=4, maka a = ?',
        options: ['5', '6', '7', '8'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Lawan kata dari "Transparan" adalah?',
        options: ['Jelas', 'Terbuka', 'Palsu', 'Keruh'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: 'Jika sebuah jam menunjukkan pukul 09.00, berapa besar sudut antara jarum jam dan jarum menit?',
        options: ['30°', '60°', '90°', '180°'],
        correctAnswerIndex: 2,
      ),
    ],
  ),
  QuizCategory(
    title: 'TKP',
    icon: Icons.people,
    questions: [
      Question(
        questionText: 'Anda ditugaskan memimpin tim yang terdiri dari berbagai latar belakang. Apa yang Anda lakukan untuk memastikan kerja tim yang efektif?',
        options: ['Memberikan instruksi yang jelas dan kaku', 'Membangun komunikasi terbuka dan saling menghargai', 'Membiarkan anggota tim bekerja sesuai cara mereka sendiri', 'Hanya fokus pada target dan hasil'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda menemukan rekan kerja yang sering datang terlambat. Bagaimana sikap Anda?',
        options: ['Menegurnya di depan umum', 'Melaporkannya kepada atasan', 'Menegur secara personal dan menanyakan alasannya', 'Mendiamkannya saja, itu bukan urusan Anda'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Anda menghadapi kritik dari atasan. Apa yang akan Anda lakukan?',
        options: ['Merasa tersinggung dan membela diri', 'Menerima kritik dengan lapang dada dan mencari cara untuk perbaikan', 'Menyalahkan orang lain', 'Mengabaikan kritik tersebut'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Saat rekan kerja meminta bantuan, padahal Anda sedang sibuk. Apa yang Anda lakukan?',
        options: ['Menolaknya dengan halus dan menjelaskan alasan Anda', 'Menyelesaikan pekerjaan Anda terlebih dahulu baru membantunya', 'Membantunya segera, meski pekerjaan Anda tertunda', 'Menyuruhnya menunggu hingga Anda selesai tanpa memberikan kepastian'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Anda mendapatkan tugas yang tidak sesuai dengan keahlian Anda. Apa yang Anda lakukan?',
        options: ['Menolak tugas tersebut', 'Mencari cara untuk mempelajari hal baru agar bisa menyelesaikan tugas', 'Meminta orang lain untuk mengerjakan tugas tersebut', 'Mengeluh kepada atasan'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda menemukan data rahasia perusahaan yang tidak sengaja bocor. Apa yang akan Anda lakukan?',
        options: ['Menyebarkannya kepada rekan kerja', 'Mengabaikannya', 'Segera melaporkannya kepada atasan', 'Menyimpan data tersebut untuk kepentingan pribadi'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Anda menemukan perbedaan pendapat yang tajam dalam rapat tim. Sikap Anda?',
        options: ['Memilih pihak yang paling Anda setujui', 'Menjadi penengah dan mencoba mencari solusi terbaik', 'Mengundurkan diri dari rapat', 'Membiarkan perdebatan berlangsung tanpa intervensi'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda diberikan target yang sangat tinggi oleh atasan. Reaksi Anda?',
        options: ['Merasa pesimis dan menyerah', 'Menerima tantangan dan menyusun strategi untuk mencapainya', 'Menolak target tersebut', 'Meminta keringanan target'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda melihat rekan kerja melakukan kesalahan fatal. Apa yang akan Anda lakukan?',
        options: ['Membiarkannya agar ia menyadari sendiri kesalahannya', 'Menegurnya dengan nada keras di depan umum', 'Memberikan masukan dan bantuan secara personal', 'Mengabaikannya karena bukan tugas Anda'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Anda adalah seorang pemimpin tim. Bagaimana cara Anda memotivasi anggota tim yang kurang produktif?',
        options: ['Memberikan hukuman', 'Mengancam untuk mengeluarkan dari tim', 'Membicarakan secara personal dan memberikan dukungan', 'Membiarkan saja agar tidak mengganggu anggota lain'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Anda menemukan sistem kerja yang tidak efisien. Apa yang akan Anda lakukan?',
        options: ['Mengikutinya saja karena sudah menjadi prosedur', 'Mengusulkan perbaikan kepada atasan dengan data pendukung', 'Mengeluh kepada rekan kerja', 'Menemukan cara pintas yang tidak sesuai prosedur'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda diminta untuk lembur, padahal Anda sudah memiliki janji. Apa yang Anda lakukan?',
        options: ['Menolak lembur dengan tegas', 'Membatalkan janji dan memilih lembur', 'Menjelaskan situasi Anda dan mencari solusi alternatif', 'Tidak datang ke kantor dan membiarkan atasan marah'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Anda berhasil menyelesaikan tugas dengan baik, namun rekan tim Anda tidak. Apa yang akan Anda lakukan?',
        options: ['Membanggakan diri sendiri', 'Membantunya agar bisa menyelesaikan tugas', 'Mencari-cari kesalahannya', 'Membicarakan keburukannya di belakangnya'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda menerima feedback negatif dari pelanggan. Apa yang Anda lakukan?',
        options: ['Menyalahkan pelanggan', 'Meminta maaf dan mencari solusi', 'Mengabaikannya karena tidak relevan', 'Menolak untuk bertanggung jawab'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda menemukan rekan kerja yang sering menggunakan fasilitas kantor untuk urusan pribadi. Apa yang akan Anda lakukan?',
        options: ['Meniru perilakunya', 'Melaporkan ke atasan', 'Menegur secara personal dengan baik', 'Mencari bukti dan menyebarkannya di media sosial'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Anda dihadapkan dengan dua tugas penting dengan deadline yang sama. Apa yang Anda lakukan?',
        options: ['Mengerjakan tugas yang paling mudah terlebih dahulu', 'Mengerjakan tugas yang paling Anda sukai', 'Membuat daftar prioritas dan alokasi waktu', 'Menyerah dan tidak mengerjakan keduanya'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Anda mengetahui seorang pegawai baru yang kesulitan beradaptasi. Apa yang Anda lakukan?',
        options: ['Mengabaikannya', 'Mengajaknya berinteraksi dan memperkenalkan kepada tim', 'Membuat lelucon tentang kesulitan adaptasinya', 'Menunggunya untuk berinisiatif sendiri'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda menemukan sebuah kesalahan dalam laporan yang sudah Anda kirim. Apa yang Anda lakukan?',
        options: ['Mengabaikannya dan berharap tidak ada yang menyadari', 'Segera melaporkan kesalahan dan mengirimkan revisi', 'Menyalahkan sistem', 'Menunggu atasan menyadari kesalahan tersebut'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Bagaimana Anda menjaga kerahasiaan informasi di tempat kerja?',
        options: ['Menyimpannya di laptop pribadi', 'Membagikan hanya kepada teman dekat', 'Hanya membagikan kepada pihak yang berwenang', 'Menyebarkannya melalui grup chat internal'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Anda menemukan sebuah ide inovatif untuk meningkatkan efisiensi kerja. Apa yang Anda lakukan?',
        options: ['Menyimpannya untuk diri sendiri', 'Mempresentasikan ide tersebut kepada atasan dan rekan kerja', 'Menunggu orang lain untuk mengusulkannya', 'Menyebarkan ide tersebut di media sosial'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda diminta untuk bekerja di bawah tekanan dengan deadline yang ketat. Bagaimana Anda menghadapi situasi ini?',
        options: ['Menyelesaikan tugas secara terburu-buru', 'Tetap tenang, fokus, dan bekerja secara terstruktur', 'Menyerah dan meminta bantuan orang lain', 'Menunda pekerjaan sampai menit terakhir'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda melihat rekan kerja menggunakan jam kantor untuk berbelanja online. Apa yang akan Anda lakukan?',
        options: ['Ikut berbelanja juga', 'Menegurnya dengan baik dan mengingatkan tentang etika kerja', 'Membiarkannya karena tidak mengganggu Anda', 'Melaporkan langsung kepada atasan'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda dihadapkan dengan tugas yang membutuhkan kolaborasi tim. Bagaimana peran Anda?',
        options: ['Menunggu perintah dari tim', 'Berinisiatif untuk berdiskusi dan berbagi ide', 'Menyelesaikan bagian Anda sendiri tanpa berinteraksi', 'Menyuruh anggota tim lain untuk mengambil alih'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Bagaimana Anda menunjukkan sikap loyalitas terhadap instansi?',
        options: ['Menjaga rahasia perusahaan', 'Bekerja sesuai prosedur dan target', 'Berpartisipasi aktif dalam setiap kegiatan instansi', 'Semua jawaban benar'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: 'Anda diminta untuk presentasi di depan atasan dan senior. Apa yang akan Anda lakukan?',
        options: ['Menolak dengan alasan gugup', 'Menyiapkan materi presentasi dengan matang dan berlatih', 'Menyuruh rekan kerja untuk menggantikan', 'Hanya membaca materi tanpa interaksi'],
        correctAnswerIndex: 1,
      ),
    ],
  ),
  QuizCategory(
    title: 'SKB',
    icon: Icons.work,
    questions: [
      Question(
        questionText: 'Apa fungsi utama dari Badan Kepegawaian Negara (BKN)?',
        options: ['Menentukan gaji pegawai', 'Mengelola manajemen PNS', 'Melakukan audit keuangan', 'Mengawasi kinerja menteri'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Dalam manajemen PNS, apa yang dimaksud dengan promosi?',
        options: ['Perpindahan ke instansi lain', 'Kenaikan pangkat', 'Penghargaan atas kinerja', 'Mutasi ke posisi yang sama'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Apa yang dimaksud dengan Laporan Harta Kekayaan Pejabat Negara (LHKPN)?',
        options: ['Laporan keuangan tahunan', 'Laporan harta pribadi pejabat', 'Laporan kinerja pegawai', 'Laporan anggaran instansi'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Sebagai seorang PNS, Anda diwajibkan untuk menjaga?',
        options: ['Keharmonisan keluarga', 'Kepercayaan masyarakat', 'Kerahasiaan data pribadi', 'Integritas dan kode etik'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: 'Apa nama lembaga yang bertugas melakukan audit keuangan negara?',
        options: ['Kementerian Keuangan', 'Badan Pemeriksa Keuangan (BPK)', 'Komisi Pemberantasan Korupsi (KPK)', 'Otoritas Jasa Keuangan (OJK)'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Apa peran utama dari Kementerian Keuangan?',
        options: ['Mengelola sistem pendidikan', 'Mengatur dan mengelola keuangan negara', 'Mengurus pertahanan negara', 'Mengawasi kinerja kementerian lain'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Undang-Undang yang mengatur tentang Aparatur Sipil Negara (ASN) adalah?',
        options: ['UU No. 5 Tahun 2014', 'UU No. 12 Tahun 2011', 'UU No. 36 Tahun 2009', 'UU No. 1 Tahun 2020'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Sistem merit dalam rekrutmen CPNS adalah?',
        options: ['Berdasarkan rekomendasi', 'Berdasarkan prestasi dan kompetensi', 'Berdasarkan kedekatan dengan pejabat', 'Berdasarkan pengalaman kerja'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Apa sanksi bagi PNS yang melakukan pelanggaran disiplin?',
        options: ['Teguran lisan', 'Penundaan gaji', 'Penurunan pangkat', 'Semua jawaban benar'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: 'Apa yang dimaksud dengan jabatan fungsional?',
        options: ['Jabatan yang berhubungan dengan teknis dan keahlian', 'Jabatan yang berhubungan dengan kepemimpinan', 'Jabatan yang diberikan kepada PNS senior', 'Jabatan yang tidak memiliki tugas dan fungsi'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Tujuan utama dari reformasi birokrasi adalah?',
        options: ['Meningkatkan jumlah pegawai', 'Mewujudkan birokrasi yang bersih dan melayani', 'Meningkatkan anggaran negara', 'Menciptakan birokrasi yang besar'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Apa yang dimaksud dengan Kode Etik PNS?',
        options: ['Aturan berpakaian', 'Aturan perilaku PNS', 'Aturan jam kerja', 'Aturan cuti pegawai'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Bagaimana cara PNS meningkatkan kompetensinya?',
        options: ['Menunggu pelatihan dari instansi', 'Mengikuti seminar dan pelatihan secara mandiri', 'Meminta promosi', 'Menyalahkan instansi jika tidak ada pelatihan'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Siapa yang berwenang mengangkat dan memberhentikan PNS?',
        options: ['Presiden', 'Menteri', 'Kepala BKN', 'Semua jawaban benar'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Apa yang dimaksud dengan PPPK?',
        options: ['Pegawai Pemerintah dengan Perjanjian Kerja', 'Pusat Pengembangan Pelatihan Kerja', 'Pegawai Penyelenggara Pelayanan Khusus', 'Penyelenggara Perizinan Perusahaan'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Apa nama dokumen yang memuat rencana kerja tahunan seorang PNS?',
        options: ['SKP (Sasaran Kerja Pegawai)', 'LHKPN', 'LKJ (Laporan Kinerja Jabatan)', 'SPT (Surat Pemberitahuan Tahunan)'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Tujuan dari evaluasi kinerja PNS adalah?',
        options: ['Menentukan siapa yang harus dipecat', 'Menilai prestasi kerja dan pengembangan karir', 'Meningkatkan konflik antar pegawai', 'Menentukan besarnya gaji'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Apa yang dimaksud dengan "ASN BerAkhlak"?',
        options: ['Nilai-nilai dasar ASN', 'Slogan kampanye', 'Program pelatihan', 'Aturan berpakaian'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Apa fungsi utama dari Sistem Informasi Kepegawaian (SIK)?',
        options: ['Mencatat kehadiran pegawai', 'Mengelola data kepegawaian', 'Mengirimkan surat resmi', 'Menyimpan dokumen pribadi'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Seorang PNS harus menjaga kerahasiaan data yang?',
        options: ['Bersifat umum', 'Bisa diakses publik', 'Bersifat rahasia negara', 'Sudah kadaluarsa'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Apa yang dimaksud dengan "whistleblower" dalam konteks PNS?',
        options: ['Seseorang yang melaporkan pelanggaran disiplin', 'Seseorang yang memimpin demonstrasi', 'Seseorang yang melakukan kesalahan', 'Seseorang yang tidak memiliki integritas'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Apa nama tes yang digunakan untuk menilai kompetensi manajerial dan sosial kultural?',
        options: ['Tes Psikologi', 'Tes Wawasan Kebangsaan', 'Tes Kemampuan Manajerial', 'Tes Kompetensi Manajerial'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: 'Hak PNS yang tidak dapat diganggu gugat adalah?',
        options: ['Hak untuk berpolitik praktis', 'Hak untuk cuti', 'Hak untuk pensiun', 'Hak untuk mendirikan partai politik'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Apa yang dimaksud dengan "ASN Netral"?',
        options: ['Tidak berpihak pada partai politik', 'Tidak memiliki pendapat', 'Tidak aktif di media sosial', 'Tidak memiliki hubungan dengan instansi lain'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Apa tugas pokok dan fungsi dari seorang PNS?',
        options: ['Melayani masyarakat', 'Menyusun peraturan', 'Melakukan riset', 'Menjadi politikus'],
        correctAnswerIndex: 0,
      ),
    ],
  ),
];

final List<QuizCategory> testDataTPA = [
  QuizCategory(
    title: 'TWK',
    icon: Icons.gavel,
    questions: [
      Question(
        questionText: 'Peristiwa Rengasdengklok terjadi karena perbedaan pendapat antara golongan muda dan tua mengenai?',
        options: ['Tanggal proklamasi', 'Bentuk pemerintahan', 'Isi teks proklamasi', 'Lokasi proklamasi'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Tujuan utama dibentuknya BPUPKI adalah untuk?',
        options: ['Menyiapkan kemerdekaan Indonesia', 'Membantu tentara Jepang', 'Melakukan perlawanan terhadap Belanda', 'Mengatur pemerintahan militer'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Peran Moh. Yamin dalam perumusan Pancasila adalah?',
        options: ['Mengusulkan dasar negara pada 29 Mei 1945', 'Menjadi ketua panitia sembilan', 'Membacakan teks proklamasi', 'Mengusulkan nama Indonesia Raya'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Semboyan Bhinneka Tunggal Ika berasal dari kitab?',
        options: ['Sutasoma', 'Negarakertagama', 'Pararaton', 'Arjunawiwaha'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Lagu "Bagimu Negeri" diciptakan oleh?',
        options: ['Ismail Marzuki', 'R. Suhardjo', 'C. Simanjuntak', 'H. Mutahar'],
        correctAnswerIndex: 1,
      ),
    ],
  ),
  QuizCategory(
    title: 'TIU',
    icon: Icons.calculate,
    questions: [
      Question(
        questionText: 'Jika 1/3 dari suatu bilangan adalah 9, berapakah 2/3 dari bilangan tersebut?',
        options: ['18', '27', '36', '54'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Sinonim dari "Delusi" adalah?',
        options: ['Khayalan', 'Kenyataan', 'Impian', 'Fakta'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Jika semua A adalah B, dan beberapa B adalah C, maka?',
        options: ['Semua A adalah C', 'Semua C adalah A', 'Beberapa B adalah A', 'Semua C adalah B'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Deret: 1, 4, 9, 16, ... Angka selanjutnya adalah?',
        options: ['20', '25', '30', '36'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Jika harga sebuah buku adalah Rp 40.000 dan diskon 15%, berapa harga yang harus dibayar?',
        options: ['Rp 34.000', 'Rp 36.000', 'Rp 32.000', 'Rp 38.000'],
        correctAnswerIndex: 2,
      ),
    ],
  ),
  QuizCategory(
    title: 'TKP',
    icon: Icons.people,
    questions: [
      Question(
        questionText: 'Seorang atasan memberikan tugas dengan waktu yang sangat mepet. Anda akan...',
        options: ['Menolak tugas tersebut', 'Mengerjakannya semaksimal mungkin', 'Meminta bantuan rekan kerja', 'Menjelaskan kepada atasan bahwa waktunya tidak cukup'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda mengetahui seorang rekan kerja mencuri ide Anda. Apa yang akan Anda lakukan?',
        options: ['Marah dan memusuhi rekan kerja', 'Mencoba berbicara baik-baik dengannya', 'Melaporkan ke atasan', 'Mendiamkannya saja'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda ditugaskan memimpin sebuah proyek yang gagal. Sikap Anda?',
        options: ['Menyalahkan anggota tim', 'Mengundurkan diri sebagai pemimpin', 'Bertanggung jawab dan menganalisis penyebab kegagalan', 'Mengeluh kepada atasan'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Anda merasa jenuh dengan rutinitas pekerjaan. Anda akan...',
        options: ['Cuti panjang', 'Mencari pekerjaan baru', 'Mengusulkan inovasi untuk membuat pekerjaan lebih menarik', 'Bekerja seadanya saja'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Anda diminta untuk memberikan pelatihan kepada tim Anda. Anda akan...',
        options: ['Menolak karena tidak memiliki pengalaman', 'Mempelajari materi dan menyiapkannya dengan baik', 'Meminta atasan untuk mencari pelatih lain', 'Memberikan pelatihan seadanya'],
        correctAnswerIndex: 1,
      ),
    ],
  ),
  QuizCategory(
    title: 'SKB',
    icon: Icons.work,
    questions: [
      Question(
        questionText: 'Peraturan Pemerintah Nomor 11 Tahun 2017 mengatur tentang?',
        options: ['Manajemen PNS', 'Peraturan Cuti PNS', 'Disiplin PNS', 'Pemberhentian PNS'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Salah satu prinsip dasar manajemen ASN adalah?',
        options: ['Prinsip kekeluargaan', 'Prinsip efisiensi', 'Prinsip profesionalitas', 'Prinsip kesejahteraan'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Apa yang dimaksud dengan pangkat dalam ASN?',
        options: ['Kedudukan yang menunjukkan tingkatan PNS', 'Penghargaan atas masa kerja', 'Jabatan fungsional', 'Posisi dalam hierarki'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Kewajiban PNS yang diatur dalam Peraturan Pemerintah Nomor 53 Tahun 2010 adalah?',
        options: ['Berpartisipasi dalam politik praktis', 'Menghadiri apel pagi', 'Membayar pajak tepat waktu', 'Menjaga rahasia jabatan'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: 'Tujuan dari SKB berbasis komputer (CAT) adalah untuk?',
        options: ['Menilai kemampuan manajerial', 'Menilai pengetahuan bidang', 'Mengukur kemampuan psikologis', 'Menilai integritas diri'],
        correctAnswerIndex: 1,
      ),
    ],
  ),
];

final List<QuizCategory> testDataPribadi = [
  QuizCategory(
    title: 'TWK',
    icon: Icons.gavel,
    questions: [
      Question(
        questionText: 'Siapa yang mengetik naskah proklamasi yang telah disetujui?',
        options: ['Sayuti Melik', 'Soekarno', 'Mohammad Hatta', 'Ahmad Soebardjo'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Piagam Jakarta dirumuskan oleh?',
        options: ['Panitia Sembilan', 'BPUPKI', 'PPKI', 'KNIP'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Kerja paksa yang dilakukan Jepang di Indonesia disebut?',
        options: ['Romusha', 'Seikeirei', 'Jibakutai', 'Heiho'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Siapa tokoh yang mengusulkan nama Pancasila?',
        options: ['Soekarno', 'Mohammad Hatta', 'Moh. Yamin', 'Mr. Soepomo'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Tujuan utama dari G30S/PKI adalah?',
        options: ['Mengubah ideologi Pancasila menjadi komunis', 'Merebut kekuasaan dari Soekarno', 'Mendirikan negara Islam', 'Melakukan kudeta militer'],
        correctAnswerIndex: 0,
      ),
    ],
  ),
  QuizCategory(
    title: 'TIU',
    icon: Icons.calculate,
    questions: [
      Question(
        questionText: 'Jika sebuah lingkaran memiliki jari-jari 7 cm, berapa kelilingnya?',
        options: ['14 cm', '22 cm', '44 cm', '49 cm'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Lawan kata dari "Skeptis" adalah?',
        options: ['Percaya', 'Ragu', 'Acuh', 'Puas'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Jika semua pegawai adalah lulusan universitas, dan Rina adalah pegawai, maka?',
        options: ['Rina bukan lulusan universitas', 'Rina adalah lulusan universitas', 'Beberapa pegawai tidak lulus universitas', 'Semua lulusan universitas adalah pegawai'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Deret: 100, 95, 85, 70, ... Angka selanjutnya adalah?',
        options: ['50', '55', '60', '65'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Sebuah kubus memiliki sisi 5 cm, berapa volumenya?',
        options: ['25 cm³', '50 cm³', '75 cm³', '125 cm³'],
        correctAnswerIndex: 3,
      ),
    ],
  ),
  QuizCategory(
    title: 'TKP',
    icon: Icons.people,
    questions: [
      Question(
        questionText: 'Saat rekan kerja memuji hasil pekerjaan Anda, Anda akan...',
        options: ['Merasa malu dan menolak pujian', 'Mengucapkan terima kasih', 'Merasa bangga dan membanggakan diri sendiri', 'Menganggap itu hal biasa'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda melihat atasan Anda melakukan kesalahan. Apa yang akan Anda lakukan?',
        options: ['Mendiamkannya saja', 'Memberi tahu atasan secara pribadi dengan sopan', 'Membicarakan kesalahan atasan di belakangnya', 'Menyebarkan informasi tersebut'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Bagaimana cara Anda memotivasi diri saat pekerjaan terasa berat?',
        options: ['Mengambil cuti', 'Mengeluh kepada teman', 'Mengatur ulang target dan istirahat sejenak', 'Menyalahkan diri sendiri'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Anda adalah anggota tim yang kesulitan berkolaborasi. Apa yang Anda lakukan?',
        options: ['Menyelesaikan semua pekerjaan sendiri', 'Mencoba memahami peran masing-masing anggota', 'Menyalahkan anggota tim lain', 'Meminta atasan untuk mengganti anggota tim'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda melihat rekan kerja Anda sedang di-bully. Apa yang Anda lakukan?',
        options: ['Mengabaikannya', 'Membantu rekan kerja tersebut dan melaporkan ke atasan', 'Merekamnya untuk dijadikan bukti', 'Ikut menertawakan'],
        correctAnswerIndex: 1,
      ),
    ],
  ),
  QuizCategory(
    title: 'SKB',
    icon: Icons.work,
    questions: [
      Question(
        questionText: 'Dalam UU ASN, PNS memiliki hak untuk mendapatkan?',
        options: ['Gaji', 'Tunjangan', 'Cuti', 'Semua jawaban benar'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: 'Apa yang dimaksud dengan cuti besar dalam PNS?',
        options: ['Cuti sakit', 'Cuti tahunan', 'Cuti lebih dari 3 bulan', 'Cuti karena alasan penting'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Tujuan utama dari LHKPN adalah untuk mencegah?',
        options: ['Disiplin kerja', 'Korupsi', 'Malas bekerja', 'Kolusi'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Sanksi disiplin bagi PNS diatur dalam?',
        options: ['UU ASN', 'PP 11 Tahun 2017', 'PP 53 Tahun 2010', 'UU 1 Tahun 2020'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Peraturan yang memuat tentang kode etik dan kode perilaku PNS adalah?',
        options: ['Peraturan Pemerintah', 'Peraturan Menteri', 'Peraturan Presiden', 'Undang-Undang'],
        correctAnswerIndex: 0,
      ),
    ],
  ),
];

// Data kuis latihan (5-10 soal)
final List<QuizCategory> practiceQuizData = [
  QuizCategory(
    title: 'TWK',
    icon: Icons.gavel,
    questions: [
      Question(
        questionText: 'Siapa yang memproklamasikan kemerdekaan Indonesia?',
        options: ['Soekarno dan Hatta', 'Soekarno', 'Hatta', 'Sutan Syahrir'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Semboyan bangsa Indonesia adalah...',
        options: ['Tunggal Ika Bhinneka', 'Indonesia Jaya', 'Bhinneka Tunggal Ika', 'Merdeka!'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Undang-Undang Dasar 1945 disahkan pada tanggal...',
        options: ['17 Agustus 1945', '18 Agustus 1945', '1 Juni 1945', '10 November 1945'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Ketuhanan Yang Maha Esa adalah sila ke...',
        options: ['1', '2', '3', '4'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Teks proklamasi dirumuskan di rumah...',
        options: ['Laksamana Maeda', 'Soekarno', 'Hatta', 'Sutan Syahrir'],
        correctAnswerIndex: 0,
      ),
    ],
  ),
  QuizCategory(
    title: 'TIU',
    icon: Icons.calculate,
    questions: [
      Question(
        questionText: 'Antonim dari "Mahir" adalah...',
        options: ['Terampil', 'Pandai', 'Bodoh', 'Keterampilan'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Jika 5x + 10 = 30, berapakah nilai x?',
        options: ['3', '4', '5', '6'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Bunga : Kuntum = Bintang : ...',
        options: ['Langit', 'Angkasa', 'Galaksi', 'Gugus'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: 'Jika ada 100 orang dalam sebuah ruangan, dan 60 orang memakai topi, dan 40 orang memakai syal, berapa orang yang memakai keduanya?',
        options: ['Tidak dapat ditentukan', '20', '30', '40'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Deret: 2, 4, 8, 16, ... Angka selanjutnya adalah?',
        options: ['24', '30', '32', '36'],
        correctAnswerIndex: 2,
      ),
    ],
  ),
  QuizCategory(
    title: 'TKP',
    icon: Icons.people,
    questions: [
      Question(
        questionText: 'Anda melihat rekan kerja mengambil barang milik kantor tanpa izin. Apa yang Anda lakukan?',
        options: ['Mengabaikannya', 'Menegurnya secara pribadi', 'Melaporkan ke atasan', 'Ikut mengambil barang'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda menghadapi pelanggan yang marah. Sikap Anda?',
        options: ['Ikut marah', 'Meminta maaf dan mencari solusi', 'Mengabaikan pelanggan', 'Menyerahkan masalah ke rekan kerja'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Jika ada konflik di tim, apa yang Anda lakukan?',
        options: ['Menjadi penengah', 'Memilih salah satu pihak', 'Membiarkan konflik selesai sendiri', 'Mencari-cari kesalahan semua orang'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Anda diberi tugas baru yang tidak familiar. Apa yang Anda lakukan?',
        options: ['Menolak tugas tersebut', 'Mencari cara untuk mempelajarinya', 'Meminta orang lain mengerjakannya', 'Mengeluh ke atasan'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Anda melihat rekan kerja kesulitan menyelesaikan tugas. Sikap Anda?',
        options: ['Membiarkannya', 'Menawarkan bantuan', 'Menertawakannya', 'Mengatakan bahwa tugas itu mudah'],
        correctAnswerIndex: 1,
      ),
    ],
  ),
  QuizCategory(
    title: 'SKB',
    icon: Icons.work,
    questions: [
      Question(
        questionText: 'Apa yang dimaksud dengan ASN?',
        options: ['Aparatur Sipil Negara', 'Asosiasi Sipil Nasional', 'Akademisi Sipil Nasional', 'Anggota Sipil Negara'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Tujuan utama dari reformasi birokrasi adalah...',
        options: ['Mewujudkan birokrasi yang bersih dan melayani', 'Meningkatkan jumlah pegawai', 'Meningkatkan anggaran negara', 'Menciptakan birokrasi yang besar'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Siapa yang berwenang mengangkat dan memberhentikan PNS?',
        options: ['Kepala BKN', 'Menteri', 'Presiden', 'Gubernur'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Sistem merit dalam rekrutmen PNS adalah...',
        options: ['Berdasarkan rekomendasi', 'Berdasarkan prestasi dan kompetensi', 'Berdasarkan kedekatan dengan pejabat', 'Berdasarkan pengalaman kerja'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Apa yang dimaksud dengan jabatan fungsional?',
        options: ['Jabatan yang berhubungan dengan keahlian teknis', 'Jabatan yang berhubungan dengan kepemimpinan', 'Jabatan yang diberikan kepada PNS senior', 'Jabatan yang tidak memiliki tugas'],
        correctAnswerIndex: 0,
      ),
    ],
  ),
];

// Data materi
final List<MaterialContent> materialContentData = [
  MaterialContent(
    title: 'TWK',
    icon: Icons.gavel,
    content: """
      ## Materi Tes Wawasan Kebangsaan (TWK)
      
      TWK menguji pengetahuan dan pemahaman Anda tentang **nasionalisme, integritas, bela negara, pilar negara, dan bahasa Indonesia**.
      
      ### Pancasila
      Pancasila adalah dasar negara Indonesia. Kelima silanya memiliki makna mendalam:
      - **Sila ke-1:** Ketuhanan Yang Maha Esa. Menekankan toleransi beragama dan kebebasan beribadah.
      - **Sila ke-2:** Kemanusiaan yang Adil dan Beradab. Mengakui persamaan derajat, hak, dan kewajiban setiap manusia.
      - **Sila ke-3:** Persatuan Indonesia. Menjunjung tinggi persatuan dan kesatuan bangsa di atas kepentingan pribadi.
      - **Sila ke-4:** Kerakyatan yang Dipimpin oleh Hikmat Kebijaksanaan dalam Permusyawaratan/Perwakilan. Menganut sistem demokrasi dan musyawarah untuk mencapai mufakat.
      - **Sila ke-5:** Keadilan Sosial bagi Seluruh Rakyat Indonesia. Mewujudkan keadilan di berbagai aspek kehidupan.
      
      ### Pilar Negara
      Pilar negara yang wajib dipahami:
      1.  **Pancasila:** Sebagai ideologi dan dasar negara.
      2.  **UUD 1945:** Konstitusi negara yang mengatur sistem pemerintahan.
      3.  **NKRI (Negara Kesatuan Republik Indonesia):** Mengutamakan persatuan dan kesatuan wilayah.
      4.  **Bhinneka Tunggal Ika:** Semboyan yang berarti "Berbeda-beda tetapi tetap satu".
      
      ### Sejarah Nasional
      Materi sejarah mencakup peristiwa penting seperti **Proklamasi Kemerdekaan**, **Sumpah Pemuda**, dan peranan tokoh-tokoh kemerdekaan (Soekarno, Hatta, Sutan Sjahrir).
      """,
  ),
  MaterialContent(
    title: 'TIU',
    icon: Icons.calculate,
    content: """
      ## Materi Tes Intelegensi Umum (TIU)
      
      TIU mengukur **kemampuan verbal, numerik, dan figural** Anda. Berikut adalah beberapa materi utama dan tips penyelesaiannya.
      
      ### 1. Penalaran Verbal
      Fokus pada hubungan kata.
      - **Sinonim (Persamaan Kata):** Carilah kata yang memiliki arti sama.
      - **Contoh Soal:** Lawan kata dari **Fana** adalah **Kekal**.
      
      - **Antonim (Lawan Kata):** Carilah kata yang memiliki arti berlawanan.
      - **Contoh Soal:** Sinonim dari **Absurd** adalah **Mustahil** atau **Aneh**.
      
      - **Analogi:** Carilah hubungan antar dua kata.
      - **Contoh Soal:** **Matahari : Panas = Es : Dingin**. Hubungannya adalah "sumber dari sifat".
      
      ### 2. Penalaran Numerik
      Fokus pada kemampuan berhitung dan logika angka.
      - **Aritmetika:** Hitungan dasar seperti persentase dan pecahan.
      - **Contoh Soal:** Berapakah 25% dari 200?
      - **Penyelesaian:** (25/100) * 200 = 50.
      
      - **Deret Angka:** Temukan pola pada deret angka.
      - **Contoh Soal:** 3, 5, 8, 12, ... Angka selanjutnya adalah?
      - **Penyelesaian:** Polanya adalah penambahan berurutan (+2, +3, +4, ...). Jadi, 12 + 5 = 17.
      
      ### 3. Penalaran Logis & Analitis
      Fokus pada penarikan kesimpulan.
      - **Silogisme:** Menarik kesimpulan dari dua premis.
      - **Contoh Soal:**
        * Premis 1: Semua pegawai adalah pekerja keras.
        * Premis 2: Budi adalah pegawai.
        * **Kesimpulan:** Budi adalah pekerja keras.
      
      - **Soal Analitis:** Analisis narasi atau tabel untuk menjawab pertanyaan.
      """,
  ),
  MaterialContent(
    title: 'TKP',
    icon: Icons.people,
    content: """
      ## Materi Tes Karakteristik Pribadi (TKP)
      
      TKP mengukur **kepribadian, sikap, dan perilaku** Anda. Tidak ada jawaban benar atau salah mutlak, tetapi ada jawaban yang memiliki nilai lebih tinggi.
      
      ### Nilai-Nilai Utama
      - **Pelayanan Publik**: Anda harus memilih jawaban yang menunjukkan sikap **proaktif, ramah, dan berorientasi pada kepuasan masyarakat**.
      - **Jejaring Kerja**: Menunjukkan kemampuan Anda untuk **berkolaborasi, membangun hubungan, dan bersinergi** dengan tim atau pihak lain.
      - **Sosial Kultural**: Sikap **toleransi, empati, dan penghargaan** terhadap perbedaan budaya.
      - **Teknologi Informasi**: Kemauan untuk **menggunakan dan beradaptasi** dengan teknologi baru untuk meningkatkan efisiensi kerja.
      - **Profesionalisme**: Menunjukkan **integritas, tanggung jawab, dan komitmen** terhadap pekerjaan dan aturan.
      
      **Tips Mengerjakan:**
      Pilih jawaban yang paling **positif dan konstruktif**. Prioritaskan **kepentingan organisasi dan publik** di atas kepentingan pribadi. Hindari jawaban yang menunjukkan sikap pasif, mengeluh, atau menyalahkan orang lain.
      """,
  ),
  MaterialContent(
    title: 'SKB',
    icon: Icons.work,
    content: """
      ## Materi Seleksi Kompetensi Bidang (SKB)
      
      Materi SKB sangat spesifik untuk formasi yang Anda lamar. Namun, ada beberapa pengetahuan dasar yang umum diujikan, terutama terkait dengan **manajemen ASN dan nilai-nilai inti pegawai**.
      
      ### Manajemen ASN
      - **Sistem Merit**: Kebijakan dan manajemen ASN yang didasarkan pada **kualifikasi, kompetensi, dan kinerja** tanpa membedakan latar belakang.
      - **Tugas Pokok & Fungsi ASN**: ASN berfungsi sebagai **pelaksana kebijakan publik, pelayan publik, serta perekat dan pemersatu bangsa**.
      
      ### Nilai-Nilai Dasar ASN (BerAKHLAK)
      Semboyan **BerAKHLAK** adalah panduan bagi setiap ASN.
      - **Berorientasi Pelayanan**: Memahami dan memenuhi kebutuhan masyarakat.
      - **Akuntabel**: Bertanggung jawab atas pekerjaan.
      - **Kompeten**: Terus belajar dan mengembangkan kapabilitas.
      - **Harmonis**: Saling peduli dan menghargai perbedaan.
      - **Loyal**: Berdedikasi dan mengutamakan kepentingan bangsa dan negara.
      - **Adaptif**: Cepat menyesuaikan diri menghadapi perubahan.
      - **Kolaboratif**: Membangun kerja sama yang sinergis.
      """,
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tes CPNS'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade200,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Menu Utama',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Grid untuk Materi dan Latihan Soal
                      GridView.count(
                        shrinkWrap: true, // Untuk memastikan GridView tidak memakan ruang tak terbatas
                        physics: const NeverScrollableScrollPhysics(), // Menonaktifkan scroll di dalam grid
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        children: [
                          _buildMenuItem(
                            context,
                            'Materi',
                            Icons.menu_book,
                                () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MaterialScreen()),
                            ),
                          ),
                          _buildMenuItem(
                            context,
                            'Latihan Soal',
                            Icons.school,
                                () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizCategoryScreen(
                                      quizData: practiceQuizData, isTestMode: false)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Menu Tes dengan lebar penuh
                      SizedBox(
                        width: double.infinity,
                        child: _buildMenuItem(
                          context,
                          'Tes CPNS 1',
                          Icons.edit,
                              () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizCategoryScreen(
                                    quizData: fullQuizData, isTestMode: true)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: _buildMenuItem(
                          context,
                          'Tes CPNS 2',
                          Icons.edit,
                              () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizCategoryScreen(
                                    quizData: testDataTPA, isTestMode: true)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: _buildMenuItem(
                          context,
                          'Tes CPNS 3',
                          Icons.edit,
                              () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizCategoryScreen(
                                    quizData: testDataPribadi, isTestMode: true)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 64,
                color: Colors.blue.shade700,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Pelatihan'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade200,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pilih Kategori Materi',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: materialContentData.length,
                  itemBuilder: (context, index) {
                    final material = materialContentData[index];
                    return MaterialCard(material: material);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MaterialCard extends StatefulWidget {
  final MaterialContent material;

  const MaterialCard({required this.material, super.key});

  @override
  State<MaterialCard> createState() => _MaterialCardState();
}

class _MaterialCardState extends State<MaterialCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovered = true),
      onExit: (event) => setState(() => _isHovered = false),
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 200),
        tween: Tween<double>(begin: 1.0, end: _isHovered ? 1.05 : 1.0),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MaterialContentScreen(material: widget.material),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.material.icon,
                    size: 64,
                    color: Colors.blue.shade700,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.material.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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

class MaterialContentScreen extends StatelessWidget {
  final MaterialContent material;

  const MaterialContentScreen({required this.material, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> _parseContent(String content) {
      final List<Widget> widgets = [];
      final lines = content.split('\n');

      for (var line in lines) {
        if (line.trim().isEmpty) continue;

        if (line.startsWith('## ')) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
              child: Text(
                line.substring(3).trim(),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
          );
        } else if (line.startsWith('### ')) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
              child: Text(
                line.substring(4).trim(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
            ),
          );
        } else if (line.startsWith('* ') || line.startsWith('- ')) {
          final textContent = line.substring(2).trim();
          final parts = textContent.split(':');

          if (parts.length > 1) {
            widgets.add(
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextSpan(
                        text: parts[0].trim(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      TextSpan(
                        text: ': ${parts.sublist(1).join(':').trim()}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            widgets.add(
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextSpan(
                        text: textContent,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        } else if (line.startsWith('    * ')) {
          final textContent = line.substring(6).trim();
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(left: 32.0, bottom: 4.0),
              child: Text(
                '• $textContent',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
            ),
          );
        }
        else {
          widgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                line.trim(),
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
            ),
          );
        }
      }
      return widgets;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(material.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade200,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _parseContent(material.content),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizCategoryScreen extends StatelessWidget {
  final List<QuizCategory> quizData;
  final bool isTestMode;

  const QuizCategoryScreen(
      {required this.quizData, required this.isTestMode, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isTestMode ? 'Pilih Kategori Tes' : 'Pilih Kategori Latihan'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade200,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.9,
            ),
            itemCount: quizData.length,
            itemBuilder: (context, index) {
              final category = quizData[index];
              return QuizCategoryCard(category: category, isTestMode: isTestMode);
            },
          ),
        ),
      ),
    );
  }
}

class QuizCategoryCard extends StatefulWidget {
  final QuizCategory category;
  final bool isTestMode;

  const QuizCategoryCard({required this.category, required this.isTestMode, super.key});

  @override
  State<QuizCategoryCard> createState() => _QuizCategoryCardState();
}

class _QuizCategoryCardState extends State<QuizCategoryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovered = true),
      onExit: (event) => setState(() => _isHovered = false),
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 200),
        tween: Tween<double>(begin: 1.0, end: _isHovered ? 1.05 : 1.0),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizScreen(category: widget.category, isTestMode: widget.isTestMode),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.category.icon,
                    size: 64,
                    color: Colors.blue.shade700,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.category.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.category.questions.length} Pertanyaan',
                    style: TextStyle(color: Colors.grey.shade600),
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

class QuizScreen extends StatefulWidget {
  final QuizCategory category;
  final bool isTestMode;

  const QuizScreen({required this.category, required this.isTestMode, super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> _shuffledQuestions;
  late int _currentQuestionIndex;

  @override
  void initState() {
    super.initState();
    _shuffledQuestions = widget.category.questions.map((q) {
      return Question(
        questionText: q.questionText,
        options: q.options,
        correctAnswerIndex: q.correctAnswerIndex,
        imageUrl: q.imageUrl,
        userSelectedIndex: null,
        isAnswered: false,
      );
    }).toList();
    _shuffledQuestions.shuffle();
    _currentQuestionIndex = 0;
  }

  void _checkAnswer(int selectedIndex) {
    if (widget.isTestMode && _shuffledQuestions[_currentQuestionIndex].isAnswered) {
      return;
    }
    setState(() {
      final question = _shuffledQuestions[_currentQuestionIndex];
      question.userSelectedIndex = selectedIndex;
      question.isAnswered = true;
    });
  }

  bool _allQuestionsAnswered() {
    return _shuffledQuestions.every((q) => q.isAnswered);
  }

  void _nextQuestion() {
    setState(() {
      if (_allQuestionsAnswered() && _currentQuestionIndex < _shuffledQuestions.length - 1) {
        _currentQuestionIndex = _shuffledQuestions.length - 1;
      } else if (_currentQuestionIndex < _shuffledQuestions.length - 1) {
        _currentQuestionIndex++;
      } else {
        if (widget.isTestMode) {
          _showFinishConfirmationDialog();
        } else {
          _finishQuiz();
        }
      }
    });
  }

  void _skipQuestion() {
    setState(() {
      if (_allQuestionsAnswered() && _currentQuestionIndex < _shuffledQuestions.length - 1) {
        _currentQuestionIndex = _shuffledQuestions.length - 1;
      } else if (_currentQuestionIndex < _shuffledQuestions.length - 1) {
        _currentQuestionIndex++;
      } else {
        if (widget.isTestMode) {
          _showFinishConfirmationDialog();
        } else {
          _finishQuiz();
        }
      }
    });
  }

  void _goToQuestion(int index) {
    if (widget.isTestMode) {
      if (_shuffledQuestions[index].isAnswered) {
        return;
      }
    }
    setState(() {
      _currentQuestionIndex = index;
    });
  }

  void _showFinishConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Konfirmasi Selesai',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.info_outline, color: Colors.blueAccent, size: 50),
            const SizedBox(height: 16),
            const Text(
              'Pastikan seluruh soal sudah terisi. Setelah menekan "Selesai", Anda tidak bisa kembali untuk mengubah jawaban.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Kembali', style: TextStyle(color: Colors.blue.shade700)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _finishQuiz();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Selesai'),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _finishQuiz() {
    int score = 0;
    for (var question in _shuffledQuestions) {
      if (question.userSelectedIndex != null &&
          question.userSelectedIndex == question.correctAnswerIndex) {
        score++;
      }
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          score: score,
          totalQuestions: _shuffledQuestions.length,
          category: widget.category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _shuffledQuestions[_currentQuestionIndex];
    final bool isLastQuestion =
        _currentQuestionIndex == _shuffledQuestions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category.title} Test'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade200,
            ],
          ),
        ),
        child: Column(
          children: [
            _buildProgressBar(_currentQuestionIndex),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildQuestionCard(question, _currentQuestionIndex),
                      const SizedBox(height: 20),
                      _buildOptionsList(question),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildAnimatedButton('Lewati', Colors.grey.shade400, Colors.black87, _skipQuestion),
                          if (isLastQuestion)
                            _buildAnimatedButton('Selesai', Colors.blue.shade700, Colors.white, _showFinishConfirmationDialog),
                          if (!isLastQuestion)
                            _buildAnimatedButton('Selanjutnya', Colors.blue.shade700, Colors.white, _nextQuestion),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildQuestionNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedButton(String text, Color bgColor, Color textColor, VoidCallback onPressed) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              foregroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              elevation: 0,
            ),
            child: Text(text),
          ),
        );
      },
    );
  }

  Widget _buildProgressBar(int currentQuestionIndex) {
    return LinearProgressIndicator(
      value: (currentQuestionIndex + 1) / _shuffledQuestions.length,
      backgroundColor: Colors.blue.shade100,
      color: Colors.blue.shade700,
      minHeight: 12,
    );
  }

  Widget _buildQuestionCard(Question question, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Pertanyaan ${index + 1} dari ${_shuffledQuestions.length}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 16),
            if (question.imageUrl != null)
              Image.network(
                question.imageUrl!,
                height: 150,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
            if (question.imageUrl != null) const SizedBox(height: 16),
            Text(
              question.questionText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionsList(Question question) {
    return Column(
      children: List.generate(question.options.length, (index) {
        final isSelected = question.userSelectedIndex == index;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SizedBox(
            width: double.infinity,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue.shade900 : Colors.blue.shade700,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: isSelected ? Colors.blue.shade900.withOpacity(0.5) : Colors.transparent,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () => _checkAnswer(index),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.blue.shade900 : Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  elevation: 0,
                ),
                child: Text(
                  question.options[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildQuestionNavigation() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Navigasi Soal:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _shuffledQuestions.length,
              itemBuilder: (context, index) {
                final question = _shuffledQuestions[index];
                final isAnswered = question.isAnswered;
                final isCurrent = index == _currentQuestionIndex;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: InkWell(
                    onTap: (widget.isTestMode && isAnswered)
                        ? null
                        : () => _goToQuestion(index),
                    child: CircleAvatar(
                      backgroundColor: isCurrent
                          ? Colors.blue.shade900
                          : isAnswered
                          ? Colors.green.shade600
                          : Colors.red.shade600,
                      child: Text(
                        (index + 1).toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String category;

  const ResultScreen({
    required this.score,
    required this.totalQuestions,
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = (score / totalQuestions) * 100;
    final String resultMessage = percentage >= 70
        ? 'Luar biasa! Anda berhasil!'
        : 'Jangan menyerah, coba lagi!';
    final Color resultColor = percentage >= 70 ? Colors.green : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Tes'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade200,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      percentage >= 70
                          ? Icons.check_circle_outline
                          : Icons.cancel_outlined,
                      size: 80,
                      color: resultColor,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      resultMessage,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: resultColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Kategori: $category',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Skor Anda: $score dari $totalQuestions',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                              (Route<dynamic> route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text('Kembali ke Beranda'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
