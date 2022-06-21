import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tangani/app/routes/app_pages.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/card_carousel.dart';
import 'package:tangani/app/widgets/card_page.dart';
import 'package:tangani/app/widgets/constants.dart';
import 'package:tangani/app/widgets/dashboard_menu.dart';
import 'package:tangani/app/widgets/spacer_style.dart';

import '../../../models/card_model.dart';

import '../../../widgets/dashboard_presence.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgPrimaryColor,
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          width: 150,
        ),
        actions: <Widget>[
          IconButton(
            color: kDarkColor,
            hoverColor: kDefaultColor,
            icon: const Icon(CupertinoIcons.headphones),
            tooltip: 'Customer Service',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            color: kDarkColor,
            hoverColor: kDefaultColor,
            icon: const Icon(CupertinoIcons.qrcode_viewfinder),
            tooltip: 'QR Scanner',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              padding: const EdgeInsets.only(
                top: kDefaultPadding / 2,
                bottom: kDefaultPadding,
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: cardData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CardCarousel(card: cardData[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: kDefaultPadding * 2);
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 1.8,
              ),
              child: OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
                  return GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: orientation == Orientation.portrait ? 4 : 4,
                    crossAxisSpacing: kDefaultPadding / 10,
                    mainAxisSpacing: kDefaultPadding / 10,
                    children: <Widget>[
                      Container(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => Get.toNamed(Routes.TANGAWARTA),
                          child: DashboardMenu(
                            menuImage: 'assets/icons/news.png',
                            menuTitle: 'TangaWarta',
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => Get.toNamed(Routes.TANGARESPONSE),
                          child: DashboardMenu(
                            menuImage: 'assets/icons/response.png',
                            menuTitle: 'TangaResponse',
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => Get.toNamed(Routes.TANGAPANGAN),
                          child: DashboardMenu(
                            menuImage: 'assets/icons/wheat.png',
                            menuTitle: 'TangaPangan',
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => Get.toNamed(Routes.TANGAAMBULANCE),
                          child: DashboardMenu(
                            menuImage: 'assets/icons/ambulance.png',
                            menuTitle: 'TangaAmbulance',
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => Get.toNamed(Routes.TANGASIAGA),
                          child: DashboardMenu(
                            menuImage: 'assets/icons/emergency.png',
                            menuTitle: 'TangaSiaga',
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => Get.toNamed(Routes.TANGAWARTA),
                          child: DashboardMenu(
                            menuImage: 'assets/icons/map.png',
                            menuTitle: 'TangaPeta',
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => Get.toNamed(Routes.TANGAWARTA),
                          child: DashboardMenu(
                            menuImage: 'assets/icons/phonevid.png',
                            menuTitle: 'Laporan/Video',
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => Get.toNamed(Routes.TANGAWARTA),
                          child: DashboardMenu(
                            menuImage: 'assets/icons/ekstra.png',
                            menuTitle: 'Lainnya',
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width / 1.1,
              margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultPadding),
                color: kDarkColor,
              ),
              child: DashboardPresence(),
            ),
            SpacerStyle(),
            Container(
              height: MediaQuery.of(context).size.height / 1.25,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding,
                horizontal: kDefaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Tangerang Tanggap Covid-19",
                    style: AppStyleText.CARDTITLE_TEXT,
                  ),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Text(
                    "Tetap aman, sehat, dan produktif selama masa pandemi Covid-19",
                    style: AppStyleText.CARDSUBTITLE_TEXT,
                  ),
                  SizedBox(
                    height: kDefaultPadding * 1.5,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding * 2,
                      children: [
                        Container(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => Get.toNamed(Routes.TANGARESPONSE),
                            child: CardPage(
                              imageCard: 'assets/images/tanganews-min.png',
                              titleCard: 'TangaWarta',
                              subtitleCard:
                                  'Berita terkini di sekitar Pemkot Tangerang',
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => Get.toNamed(Routes.TANGARESPONSE),
                            child: CardPage(
                              imageCard: 'assets/images/tangaemergency-min.png',
                              titleCard: 'TangaSiaga',
                              subtitleCard:
                                  'Nomor Siaga di sekitar Pemkot Tangerang',
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => Get.toNamed(Routes.TANGARESPONSE),
                            child: CardPage(
                              imageCard: 'assets/images/tangaresponse-min.png',
                              titleCard: 'TangaResponse',
                              subtitleCard:
                                  'Respon masyarakat di sekitar Pemkot Tangerang',
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => Get.toNamed(Routes.TANGARESPONSE),
                            child: CardPage(
                              imageCard: 'assets/images/tangamap-min.png',
                              titleCard: 'TangaPemetaan',
                              subtitleCard:
                                  'Pemetaan di sekitar Pemkot Tangerang',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SpacerStyle(),
            Container(
              height: MediaQuery.of(context).size.height / 1.25,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding,
                horizontal: kDefaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "TANGA #BikinGampang",
                    style: AppStyleText.CARDTITLE_TEXT,
                  ),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Text(
                    "Temukan segala kebutuhanmu di Tangerang di TANGA",
                    style: AppStyleText.CARDSUBTITLE_TEXT,
                  ),
                  SizedBox(
                    height: kDefaultPadding * 1.5,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding * 2,
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () => Get.toNamed(Routes.TANGARESPONSE),
                            child: CardPage(
                              imageCard: 'assets/images/tanganews-min.png',
                              titleCard: 'TangaWarta',
                              subtitleCard:
                                  'Berita terkini di sekitar Pemkot Tangerang',
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () => Get.toNamed(Routes.TANGARESPONSE),
                            child: CardPage(
                              imageCard: 'assets/images/tangaemergency-min.png',
                              titleCard: 'TangaSiaga',
                              subtitleCard:
                                  'Nomor Siaga di sekitar Pemkot Tangerang',
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () => Get.toNamed(Routes.TANGARESPONSE),
                            child: CardPage(
                              imageCard: 'assets/images/tangaresponse-min.png',
                              titleCard: 'TangaResponse',
                              subtitleCard:
                                  'Respon masyarakat di sekitar Pemkot Tangerang',
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () => Get.toNamed(Routes.TANGARESPONSE),
                            child: CardPage(
                              imageCard: 'assets/images/tangamap-min.png',
                              titleCard: 'TangaPemetaan',
                              subtitleCard:
                                  'Pemetaan di sekitar Pemkot Tangerang',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SpacerStyle(),
          ],
        ),
      ),
    );
  }
}
