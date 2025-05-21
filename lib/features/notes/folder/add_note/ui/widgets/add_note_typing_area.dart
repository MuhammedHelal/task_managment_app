import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:gap/gap.dart';

class AddNoteTypingArea extends StatefulWidget {
  const AddNoteTypingArea({super.key});

  @override
  State<AddNoteTypingArea> createState() => _AddNoteTypingAreaState();
}

class _AddNoteTypingAreaState extends State<AddNoteTypingArea> {
  late final QuillController controller;
  final FocusNode controllerFocusNode = FocusNode();
  bool showHint = true;
  @override
  void initState() {
    super.initState();
    controller = QuillController.basic();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHint)
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque, // Important!

                onTap: () {
                  setState(
                    () {
                      showHint = false;
                      controllerFocusNode.requestFocus();
                    },
                  );
                },
                child: const SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Text('Type something'),
                ),
              ),
            )
          else
            Expanded(
              child: QuillEditor.basic(
                focusNode: controllerFocusNode,
                controller: controller,
                config: const QuillEditorConfig(
                  expands: true,
                  padding: EdgeInsets.all(8),
                  scrollable: true,
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
            ),
          const Gap(10),
          QuillSimpleToolbar(
            controller: controller,
            config: const QuillSimpleToolbarConfig(
              showBoldButton: true, // Show Bold button
              showItalicButton: true, // Show Italic button
              showUnderLineButton: true, // Show Underline button
              showStrikeThrough: false, // Hide Strike-through button
              showInlineCode: false, // Hide Inline code button
              showListBullets: false, // Hide Bullet List button
              showListNumbers: false, // Hide Number List button
              showQuote: false, // Hide Quote button
              showLink: false, // Hide Link button
              // showImage: false, // Hide Image button
              // showVideo: false, // Hide Video button
              showAlignmentButtons: false, // Hide Align Center button
              showJustifyAlignment: false, // Hide Align Justify button
              showClearFormat: true, // Hide Clear Formatting button
              showFontFamily: false,
              showBackgroundColorButton: false,
              showCodeBlock: false,
              showSmallButton: false,
              showDirection: false,
              showCenterAlignment: false, // Show Align Center button
              showIndent: false,
              showSubscript: false,
              showSuperscript: false,
              headerStyleType: HeaderStyleType.original,
              multiRowsDisplay: false,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
