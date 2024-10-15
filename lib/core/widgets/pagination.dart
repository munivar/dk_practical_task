import 'package:flutter/material.dart';
import 'package:sgmasms/core/constants/sizes.dart';
import 'package:sgmasms/core/device/utils.dart';

class AppPagination extends StatelessWidget {
  final String itemCountIndex;
  final void Function(String?) onItemChanged;
  final List<String> itemCountList;
  final bool hasPrevPage;
  final bool hasNextPage;
  final int currentPage;
  final int totalPages;
  final void Function()? onPrevPageTap;
  final void Function()? onNextPageTap;
  final EdgeInsetsGeometry? padding;
  const AppPagination({
    super.key,
    required this.itemCountIndex,
    required this.onItemChanged,
    required this.itemCountList,
    required this.hasPrevPage,
    required this.hasNextPage,
    required this.currentPage,
    required this.totalPages,
    required this.onPrevPageTap,
    required this.onNextPageTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.only(
              left: size6, right: size6, top: size12, bottom: size4),
      child: Utils.bigDv(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                hasPrevPage
                    ? const SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 95,
                            child: DropdownButtonFormField(
                              value: itemCountIndex,
                              decoration: InputDecoration(
                                labelText: "Items",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: size12,
                                    vertical: Utils.isWeb ? 13 : 10),
                              ),
                              style: Theme.of(context).textTheme.titleSmall,
                              items: itemCountList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      overflow: TextOverflow.ellipsis),
                                );
                              }).toList(),
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(size12),
                              onChanged: onItemChanged,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Items per Page",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                hasPrevPage || hasNextPage
                    ? const Padding(
                        padding: EdgeInsets.only(top: size10, bottom: size10),
                        child: Divider(),
                      )
                    : const SizedBox(height: size36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    hasPrevPage
                        ? IconButton.filledTonal(
                            onPressed: onPrevPageTap,
                            icon: const Icon(Icons.chevron_left_rounded))
                        : const SizedBox(width: 15),
                    hasPrevPage || hasNextPage
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "Page $currentPage of $totalPages",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          )
                        : const SizedBox(width: 15),
                    hasNextPage
                        ? IconButton.filledTonal(
                            onPressed: onNextPageTap,
                            icon: const Icon(Icons.chevron_right_rounded))
                        : const SizedBox(width: 15),
                  ],
                ),
                hasPrevPage || hasNextPage
                    ? const Padding(
                        padding: EdgeInsets.only(top: size10, bottom: size10),
                        child: Divider(),
                      )
                    : const SizedBox(height: size36),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                hasPrevPage
                    ? const SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 95,
                            child: DropdownButtonFormField(
                              value: itemCountIndex,
                              decoration: InputDecoration(
                                labelText: "Items",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: size12,
                                    vertical: Utils.isWeb ? 13 : 10),
                              ),
                              style: Theme.of(context).textTheme.titleSmall,
                              items: itemCountList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      overflow: TextOverflow.ellipsis),
                                );
                              }).toList(),
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(size12),
                              onChanged: onItemChanged,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Items per Page",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    hasPrevPage
                        ? IconButton.filledTonal(
                            onPressed: onPrevPageTap,
                            icon: const Icon(Icons.chevron_left_rounded))
                        : const SizedBox(width: 15),
                    hasPrevPage || hasNextPage
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "Page $currentPage of $totalPages",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          )
                        : const SizedBox(width: 15),
                    hasNextPage
                        ? IconButton.filledTonal(
                            onPressed: onNextPageTap,
                            icon: const Icon(Icons.chevron_right_rounded))
                        : const SizedBox(width: 15),
                  ],
                ),
              ],
            ),
    );
  }
}
