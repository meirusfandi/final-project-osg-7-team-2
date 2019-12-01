import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  AboutUsScreen({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/appsbg.jpg',
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.grey.withOpacity(0.7),
                    width: MediaQuery.of(context).size.height,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Meals DB Apps',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Card(
              margin: EdgeInsets.only(
                bottom: 4,
                top: 4,
                left: 8,
                right: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'About Apps',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Aplikasi Flutter daftar makanan (Tugas Akhir - OSG07) Team 2 dengan fitur : \n\n1. menampilkan daftar makanan, \n\n2. kategori makanan, \n\n3. fitur pencarian makanan dan \n\n4. detail makanan dari TheMealDB. \n\n5. tentang aplikasi dan developer \n\n6. menu (drawer / bottom navigation)'
                    ),
                  )
                ],
              )
            ),
            Card(
              margin: EdgeInsets.only(
                bottom: 4,
                top: 4,
                left: 8,
                right: 8,
              ),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/saya.png',
                      fit: BoxFit.cover
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.grey.withOpacity(0.7),
                      height: 40,
                      child: Center(
                        child: Text(
                          'Mei Rusfandi as Project Leader',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              elevation: 5,
            ),

            Card(
              margin: EdgeInsets.only(
                bottom: 4,
                top: 4,
                left: 8,
                right: 8,
              ),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/dev.jpg',
                      fit: BoxFit.cover
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.grey.withOpacity(0.7),
                      height: 40,
                      child: Center(
                        child: Text(
                          'Joko Waluyo as Developer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              elevation: 5,
            ),

            Card(
              margin: EdgeInsets.only(
                bottom: 4,
                top: 4,
                left: 8,
                right: 8,
              ),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/devs.jpg',
                      fit: BoxFit.cover
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.grey.withOpacity(0.7),
                      height: 40,
                      child: Center(
                        child: Text(
                          'Deddy Triyadi as Developer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              elevation: 5,
            ),

            Card(
              margin: EdgeInsets.only(
                bottom: 4,
                top: 4,
                left: 8,
                right: 8,
              ),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/user_lg.jpg',
                      fit: BoxFit.cover
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.grey.withOpacity(0.7),
                      height: 40,
                      child: Center(
                        child: Text(
                          'Hendra Basri as Developer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              elevation: 5,
            ),
            Card(
              margin: EdgeInsets.only(
                bottom: 4,
                top: 4,
                left: 8,
                right: 8,
              ),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/user.jpg',
                      fit: BoxFit.cover
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.grey.withOpacity(0.7),
                      height: 40,
                      child: Center(
                        child: Text(
                          'Mustofa Kamal as Developer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              elevation: 5,
            ),

            Card(
              margin: EdgeInsets.only(
                bottom: 4,
                top: 4,
                left: 8,
                right: 8,
              ),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'About Eudeka',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Online Study Group Eudeka!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Salah satu program dari Eudeka! untuk belajar secara full online via Whatsapp/Telegram dan Google Classroom, dengan para praktisi handal di bidangnya. Selain itu juga kamu dapat berkesempatan untuk memperluas koneksimu dengan peserta lain.',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'OSG07 - Flutter Basic',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Dengan jangka waktu lebih kurang 2 bulan, peserta diharapkan dapat mengenal dan membuat aplikasi simple Flutter dengan menggunakan data dari internet (API).',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Cara Mendaftar Online Study Group',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Untuk pendaftaran kelas selanjutnya, silahkan kunjungi atau hubungi kami di dawah ini.',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Info Lebih Lengkap',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Website : www.eudeka.id \n\nTwitter: @EudekaID \n\nTelegram : @eudekainfo \n\nInstagram : @eudeka.id \n\nWhatsApp : 0895351577557 \n\nEmail : info@eudeka.id',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}