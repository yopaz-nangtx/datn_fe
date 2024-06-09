import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewController extends StatefulWidget {
  final String url;
  final String title;
  PdfViewController({required this.url, required this.title});

  @override
  State<PdfViewController> createState() => _PdfViewControllerState();
}

class _PdfViewControllerState extends BaseState<PdfViewController> {
  Uint8List? data;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    try {
      data = (await NetworkAssetBundle(Uri.parse(widget.url)).load(widget.url))
          .buffer
          .asUint8List();
      setState(() {});
    } catch (e) {
      throw (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : PDFView(
              pdfData: data,
              // enableSwipe: true,
              // swipeHorizontal: true,
              // autoSpacing: false,
              // pageFling: false,
            ),
    );
  }
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

abstract class BaseState<T extends StatefulWidget> extends State<T>
    with RouteAware {
  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    super.didChangeDependencies();
  }

  @override
  void didPush() {}

  @override
  void didPopNext() {}

  @override
  void didPop() {
    BotToast.closeAllLoading();
  }

  @override
  void didPushNext() {}

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
