import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:forestvpn_test/repositories/news/presentation/blocs/news/news_bloc.dart';
import 'package:forestvpn_test/repositories/news/presentation/pages/news_by_id.dart';
import 'package:forestvpn_test/repositories/news/presentation/widgets/container_widget.dart';
import 'package:forestvpn_test/repositories/news/presentation/widgets/list_container.dart';
import 'package:forestvpn_test/utils/app_bar.dart';
import 'package:forestvpn_test/utils/colors.dart';
import 'package:forestvpn_test/utils/test_style.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  bool isRead = false;
  late NewsBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of(context);
    _bloc.add(const GetNewsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: _bloc,
      builder: (context, state) {
        print(state);
        if (state is NewsError) {
          _bloc.add(const GetNewsEvent());
          return const Center(
            child: Text('Xatolik bor'),
          );
        } else if (state is NewsLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is NewsLoaded) {
          var data = state.data;
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBarWidget(
              onTap: () {
                for (var i = 0; i < data.length; i++) {
                  context.read<NewsBloc>().add(IsRead(index: i));
                }
                setState(() {});
              },
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Featured', style: AppTextStyles.body1),
                    const SizedBox(height: 10),
                    ContainerWidget(data: data),
                    const SizedBox(height: 10),
                    Text('Latest news', style: AppTextStyles.body1),
                    const SizedBox(height: 10),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                        data.length,
                        (index) => ListCOntainer(
                          color: data[index].readed
                              ? Colors.grey.shade200
                              : Colors.white,
                          image: data[index].imageUrl,
                          title: data[index].title,
                          date: data[index].publicationDate.toString(),
                          onTap: () {
                            _bloc.add(IsRead(index: index));

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => NewsByIdPage(
                                  id: data[index].id,
                                ),
                              ),
                            ).then((value) => setState(() {}));
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return Center(
          child: CupertinoActivityIndicator(
            color: AppColors.black,
          ),
        );
      },
    );
  }
}
