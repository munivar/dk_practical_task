import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgmasms/core/constants/sizes.dart';
import 'package:sgmasms/core/widgets/no_image.dart';
import 'package:sgmasms/demo/demo_cubit.dart';
import 'package:sgmasms/demo/demo_state.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DemoBloc>();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        cubit.onBackBtnTap(context);
        return Future(() => false);
      },
      child: BlocBuilder<DemoBloc, DemoState>(
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            body: mainLayout(context),
          ));
        },
      ),
    );
  }

  mainLayout(BuildContext context) {
    final cubit = context.read<DemoBloc>();
    return BlocBuilder<DemoBloc, DemoState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final Size itemSize =
                Size(constraints.maxWidth / 3, constraints.maxWidth / 3);
            int customGridItemRC = cubit.demoList.length ~/ 3 +
                (cubit.demoList.length % 3 > 0 ? 1 : 0);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: customGridItemRC,
                    itemBuilder: (context, index) {
                      int renderedItem = cubit.demoList.length - index * 3;
                      int ri = renderedItem > 3 ? 3 : renderedItem;
                      return Column(
                        children: [
                          mainListItemLayout(context, ri, index, itemSize),
                          optionLayout(context, index),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  mainListItemLayout(BuildContext context, int ri, int index, Size itemSize) {
    final cubit = context.read<DemoBloc>();
    return Row(
      children: List.generate(
        ri,
        (j) => GestureDetector(
          onTap: () {
            cubit.onItemTap(j, index);
          },
          child: SizedBox(
            height: itemSize.height,
            width: itemSize.width,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: cubit.demoList[(index * 3) + j].image,
                    fit: BoxFit.fill,
                    height: itemSize.height - 10,
                    width: itemSize.width - 10,
                    errorWidget: (context, url, error) {
                      return const AppNoImage(size: size24);
                    },
                    placeholder: (context, url) {
                      return const AppNoImage(size: size24);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            cubit.demoList[(index * 3) + j].title,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        if ((index * 3) + j == cubit.checkedIndex)
                          Icon(Icons.expand_less_rounded)
                        else
                          Icon(Icons.expand_more_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //     Container(
          //   padding: EdgeInsets.all(8),
          //   width: itemSize.width,
          //   height: itemSize.height,
          //   color: cubit.checkedIndex == j + (index * 3)
          //       ? Colors.cyanAccent
          //       : Colors.grey,
          //   child: Text(
          //       "${cubit.demoList[(index * 3) + j].title}"),
          // ),
        ),
      ),
    );
  }

  optionLayout(BuildContext context, int index) {
    final cubit = context.read<DemoBloc>();
    return AnimatedContainer(
      height: cubit.checkedIndex > -1 &&
              index <= cubit.checkedIndex / 3 &&
              index > (cubit.checkedIndex / 3) - 1
          ? 240
          : 0,
      duration: Duration(milliseconds: 250),
      margin: EdgeInsets.all(size6),
      color: Colors.blueAccent.withOpacity(0.1),
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider();
        },
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        itemCount: cubit.menuList.length,
        itemBuilder: (context, index) {
          var items = cubit.menuList[index];
          return Padding(
            padding: const EdgeInsets.all(2),
            child: InkWell(
                onTap: () {
                  debugPrint("Item : ${index + 1} => Tapped");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: size10, vertical: size4),
                  child: Text(
                    items,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                )),
          );
        },
      ),
    );
  }
}
