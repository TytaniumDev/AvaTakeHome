import 'package:ava_take_home/common/text_validators.dart';
import 'package:ava_take_home/theme.dart';
import 'package:flutter/material.dart';

showFeedbackSheet(BuildContext context) {
  showModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (_) => const FeedbackSheetView(),
  );
}

class FeedbackSheetView extends StatefulWidget {
  const FeedbackSheetView({super.key});

  @override
  State<FeedbackSheetView> createState() => _FeedbackSheetViewState();
}

class _FeedbackSheetViewState extends State<FeedbackSheetView> {
  bool isInputValid = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            width: 640,
            height: 338,
            decoration: const BoxDecoration(
              color: AppColors.lightPurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
          ),
        ),
        Container(
          width: 640,
          height: 324,
          decoration: const BoxDecoration(
            color: AppColors.manilla,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Text(
                  'Give us feedback',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textPrimaryDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  maxLines: 7,
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  validator: notEmptyValidator,
                  onChanged: (text) {
                    setState(() {
                      isInputValid = notEmptyValidator(text) == null;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FilledButton(
                  onPressed: isInputValid ? () => Navigator.pop(context) : null,
                  child: const Text('Send feedback'),
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ],
    );
  }
}
