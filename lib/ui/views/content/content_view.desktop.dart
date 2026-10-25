import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';

import 'content_viewmodel.dart';

class ContentViewDesktop extends ViewModelWidget<ContentViewModel> {
  const ContentViewDesktop({super.key});

  @override
  Widget build(BuildContext context, ContentViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1,
                child:
                    SingleChildScrollView(child: _buildLeftPanel(viewModel))),
            Container(
              width: 1,
              decoration: const BoxDecoration(color: kcChatBoxBorder),
            ),
            Expanded(flex: 4, child: _buildContentPanel(viewModel)),
          ]),
    );
  }

  Widget _buildLeftPanel(ContentViewModel viewModel) {
    return ExpansionPanelList.radio(
      expandIconColor: kcMediumGrey,
      expansionCallback: (id, expanded) {
        if (expanded) {}
      },
      children: viewModel.tablesByLevel.entries.map((entry) {
        return ExpansionPanelRadio(
            backgroundColor: kcWhite,
            value: entry.key,
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Center(
                child: Text(
                  viewModel.getLevelName(entry.key),
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 0,
                      color: isExpanded ? kcPrimaryColor : kcDarkGreyColor,
                      fontWeight: FontWeight.w600,
                      height: 1.33),
                ),
              );
            },
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: entry.value.map((table) {
                final isSelected = viewModel.selectedTable == table;
                return Material(
                  color: isSelected ? kcPrimaryColor : kcWhite,
                  child: InkWell(
                    onTap: () => viewModel.selectTable(table),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Text(
                        'Table of ${table.table_number}',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            letterSpacing: 0,
                            color: isSelected ? kcWhite : kcDarkGreyColor,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w400,
                            height: 1.33),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ));
      }).toList(),
    );
  }

  Widget _buildContentPanel(ContentViewModel viewModel) {
    final table = viewModel.selectedTable;
    if (table != null && viewModel.isLoadingUrls) {
      return const Center(child: CircularProgressIndicator());
    }
    return table == null || viewModel.list.isEmpty
        ? Center(
            child: Text(
              table == null ? 'Select a table' : 'No images for this table',
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  letterSpacing: 0,
                  color: kcDarkGreyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  height: 1.33),
            ),
          )
        : Column(
            children: [
              // Fill the space above the paginator and scale the image to fit
              // it, keeping its aspect ratio.
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: CachedNetworkImage(
                    imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
                    imageUrl: viewModel.list[viewModel.controller.currentPage],
                    // The Stack hugs the scaled image, so the edit button sits
                    // on the image's corner rather than the panel's.
                    imageBuilder: (context, imageProvider) => Center(
                      child: Stack(
                        children: [
                          Image(image: imageProvider, fit: BoxFit.contain),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: _buildEditButton(viewModel),
                          ),
                        ],
                      ),
                    ),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              _buildNumberPaginator(viewModel),
              const SizedBox(height: 24),
            ],
          );
  }

  Widget _buildEditButton(ContentViewModel viewModel) {
    return Material(
      color: kcWhite,
      shape: const CircleBorder(),
      elevation: 2,
      child: IconButton(
        tooltip: 'Edit image',
        icon: const Icon(Icons.edit, color: kcPrimaryColor, size: 20),
        onPressed: () => viewModel.editImage(
            viewModel.selectedTable!.table_number!,
            viewModel.controller.currentPage),
      ),
    );
  }

  Widget _buildNumberPaginator(ContentViewModel viewModel) {
    final controller = viewModel.controller;
    final lastPage = viewModel.list.length - 1;
    return Center(
        child: SizedBox(
      width: 420,
      child: NumberPaginator(
        // by default, the paginator shows numbers as center content
        controller: controller,
        config: const NumberPaginatorUIConfig(
          height: 32,
          buttonPadding: EdgeInsets.zero,
          buttonTextStyle: TextStyle(fontSize: 12),
          buttonSelectedBackgroundColor: kcPrimaryColor,
        ),
        numberPages: viewModel.list.length,
        onPageChange: (int index) {
          viewModel.rebuildUi();
        },
        // show/hide the prev/next buttons
        showPrevButton: true,
        showNextButton: true,
        // defaults to true
        // custom content of the prev/next buttons, maintains their behavior
        nextButtonBuilder: (context) => TextButton(
          onPressed: controller.currentPage < lastPage
              ? () => controller.next()
              : null,
          child: const Row(children: [
            Text("Next",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  letterSpacing: 0,
                  color: kcDarkGreyColor,
                  fontWeight: FontWeight.w600,
                )),
            Icon(Icons.chevron_right, size: 16),
          ]),
        ),
        // custom prev/next buttons using builder (ignored if showPrevButton/showNextButton is false)
        prevButtonBuilder: (context) => TextButton(
          onPressed:
              controller.currentPage > 0 ? () => controller.prev() : null,
          // _controller must be passed to NumberPaginator
          child: const Row(children: [
            Icon(Icons.chevron_left, size: 16),
            Text("Previous",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  letterSpacing: 0,
                  color: kcDarkGreyColor,
                  fontWeight: FontWeight.w600,
                )),
          ]),
        ),
      ),
    ));
  }
}
