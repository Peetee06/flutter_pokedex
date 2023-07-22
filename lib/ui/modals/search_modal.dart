import 'package:flutter/material.dart';
import 'package:pokedex/ui/widgets/modal.dart';
import 'package:pokedex/ui/widgets/search_bar.dart' as search_bar;

class SearchBottomModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;

    return Modal(
      child: Flexible(
        child: Padding(
          padding: EdgeInsets.fromLTRB(26, 14, 26, 14 + viewInsets + safeAreaBottom),
          child: search_bar.SearchBar(margin: EdgeInsets.zero),
        ),
      ),
    );
  }
}
