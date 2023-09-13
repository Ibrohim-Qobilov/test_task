import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/repositories/news/presentation/blocs/news/news_bloc.dart';
import 'package:forestvpn_test/repositories/news/presentation/blocs/news_by_id/news_by_id_bloc.dart';
import 'package:forestvpn_test/repositories/news/presentation/pages/news_page.dart';

void main() {
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsBloc(),
        ),
        BlocProvider(
          create: (context) => NewsByIdBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ForestVPN test',
        home: NewsPage(),
      ),
    );
  }
}
