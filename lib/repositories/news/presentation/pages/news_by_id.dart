import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:forestvpn_test/repositories/news/presentation/blocs/news_by_id/news_by_id_bloc.dart';
import 'package:forestvpn_test/utils/colors.dart';
import 'package:forestvpn_test/utils/icons.dart';
import 'package:forestvpn_test/utils/test_style.dart';

class NewsByIdPage extends StatefulWidget {
  final String? id;
  const NewsByIdPage({Key? key, this.id}) : super(key: key);

  @override
  State<NewsByIdPage> createState() => _NewsByIdPageState();
}

class _NewsByIdPageState extends State<NewsByIdPage> {
  late NewsByIdBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of(context);
    _bloc.add(GetNewsByIdEvent(id: widget.id));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => NewsByIdBloc(),
        child: BlocBuilder<NewsByIdBloc, NewsByIdState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is NewsByIdLoading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is NewsLoadedByID) {
                var data = state.data;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        height: 493,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(data.imageUrl)),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50, left: 20),
                            child: SvgPicture.asset(
                              AppIcon.icon,
                              // ignore: deprecated_member_use
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          data.title,
                          style: AppTextStyles.body1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          data.description.toString(),
                          style: AppTextStyles.body1,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
            }),
      ),
    );
  }
}
