import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tangani/app/widgets/constants.dart';

class CardModel {
  String title;
  String subtitle;
  Color cardColor;
  String cardImage;
  CardModel(
      {required this.title,
      required this.subtitle,
      required this.cardColor,
      required this.cardImage});
}

List<CardModel> cardData = [
  CardModel(
    title: "Pendaftaran Vaksinasi Covid-19",
    subtitle: "Vaksinasi untuk warga usia 6 tahun ke atas",
    cardColor: kDarkColor,
    cardImage: "assets/images/vaksin.png",
  ),
  CardModel(
    title: "Cari Lowongan Kerja di Tangerang",
    subtitle: "Informasi dan Pengembangan Karir untuk Warga Tangerang",
    cardColor: kDarkColor,
    cardImage: "assets/images/lowongan.png",
  ),
  CardModel(
    title: "Peraturan PPKM Tangerang Terbaru",
    subtitle: "Cek aktivitas yang diperbolehkan selama PPKM",
    cardColor: kDarkColor,
    cardImage: "assets/images/ppkm.png",
  ),
  CardModel(
    title: "Destinasi Wisata Tangerang",
    subtitle: "Temukan Destinasi dan Akomodasi Wisata di Tangerang disini!",
    cardColor: kDarkColor,
    cardImage: "assets/images/holiday.png",
  ),
  CardModel(
    title: "Tangerang Smart City",
    subtitle:
        "Lihat Transformasi Kota Tangerang Menjadi Kota Pintar di Indonesia",
    cardColor: kDarkColor,
    cardImage: "assets/images/smartcity.png",
  ),
];
