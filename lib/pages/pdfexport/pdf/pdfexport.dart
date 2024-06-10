import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;

Future<Uint8List> makePdf() async {
  final pdf = pw.Document(
    title: 'how who',

  );

  final fontData = await rootBundle.load('assets/Cairo.ttf');
  final ttf = pw.Font.ttf(fontData.buffer.asByteData());
  const PdfColor bg = PdfColor.fromInt(0xff161616);
  const PdfColor green = PdfColor.fromInt(0xffD2F446);

  pdf.addPage(
    pw.Page(
      pageTheme: pw.PageTheme(
        theme: pw.ThemeData(
          defaultTextStyle: const pw.TextStyle(color: PdfColors.white),
        ),
        buildBackground: (pw.Context context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Container(
              decoration: const pw.BoxDecoration(
                color: bg,
                border: pw.Border.fromBorderSide(
                  pw.BorderSide(
                    color: green,
                    width: 10,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Center(
              child: pw.Text(
                "عبدالفتاج المكسيكي",
                style: pw.TextStyle(
                  font: ttf,
                  fontSize: 40,
                  fontWeight: pw.FontWeight.bold,
                ),
                textDirection: pw.TextDirection.rtl,
              ),
            ),
            pw.Center(
              child: pw.Text(
                "العاصمة الإدارية",
                style: pw.TextStyle(
                  font: ttf,
                  fontSize: 32,
                  fontWeight: pw.FontWeight.bold,
                  color: green,
                ),
                textDirection: pw.TextDirection.rtl,
              ),
            ),
            pw.SizedBox(height: 50),
            pw.Table(
              border: pw.TableBorder.all(color: green),
              columnWidths: {
                0: const pw.FlexColumnWidth(3),
                1: const pw.FlexColumnWidth(3),
                2: const pw.FlexColumnWidth(5),
              },
              children: [
                pw.TableRow(
                  decoration: pw.BoxDecoration(color: green),
                  children: [
                    pw.Center(
                      child: pw.Text(
                        "الوصف",
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: bg,
                        ),
                        textDirection: pw.TextDirection.rtl,
                      ),
                    ),
                    pw.Center(
                      child: pw.Text(
                        "السعر",
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: bg,
                        ),
                        textDirection: pw.TextDirection.rtl,
                      ),
                    ),
                    pw.Center(
                      child: pw.Text(
                        "الخدمة",
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: bg,
                        ),
                        textDirection: pw.TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Center(
                      child: pw.Text(
                        "Data 1",
                        style: pw.TextStyle(font: ttf, fontSize: 14),
                      ),
                    ),
                    pw.Center(
                      child: pw.Text(
                        "Data 3",
                        style: pw.TextStyle(font: ttf, fontSize: 14),
                      ),
                    ),
                    pw.Center(
                      child: pw.Text(
                        "Data 2",
                        style: pw.TextStyle(font: ttf, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.Spacer(),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  children: [
                    pw.Text(
                      "المجموع",
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 30,
                        fontWeight: pw.FontWeight.bold,
                      ),
                      textDirection: pw.TextDirection.rtl,
                    ),
                    pw.Text(
                      "2200",
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 28,
                        fontWeight: pw.FontWeight.bold,
                        color: green,
                      ),
                      textDirection: pw.TextDirection.rtl,
                    ),
                  ],
                ),
                pw.Column(
                  children: [
                    pw.Text(
                      "الحاج سيد",
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 30,
                        fontWeight: pw.FontWeight.bold,
                      ),
                      textDirection: pw.TextDirection.rtl,
                    ),
                    pw.Text(
                      "22-10-2024",
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 28,
                        fontWeight: pw.FontWeight.bold,
                        color: green,
                      ),
                      textDirection: pw.TextDirection.rtl,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ),
  );

  return pdf.save();
}
