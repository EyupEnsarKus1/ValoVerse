import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';

import '../../bloc/connection_cubit/connection_cubit.dart';
import '../../core/locale_keys.g.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  const CustomAlertDialog(
      {Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionCubit, ConnectionStatus>(
      listener: (context, state) {
        if (state is ConnectionSuccess) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                LocaleKeys.connectivity_connectionRestored.translate,
                style: TextStyle(
                  fontFamily: AppFonts.roboto,
                  fontSize: AppSizes.size12,
                ),
              ),
            ),
          );
        }
      },
      child: AlertDialog(
        title: Text(
          title.translate,
          style: const TextStyle(
            fontFamily: AppFonts.archivo,
            fontSize: AppSizeConstants.size16,
          ),
        ),
        content: Text(
          content.translate,
          style: const TextStyle(
            fontFamily: AppFonts.roboto,
            fontSize: AppSizeConstants.size12,
          ),
        ),
      ),
    );
  }
}
