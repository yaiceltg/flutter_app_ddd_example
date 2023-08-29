import 'package:app/src/domain/notes/notes.dart';
import 'package:app/src/presentation/core/constants.dart';
import 'package:app/src/presentation/helpers/text_helpers.dart';
import 'package:app/src/presentation/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NoteCardWidget extends StatelessWidget {
  final Note note;
  const NoteCardWidget({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,

      color: note.color.getOrCrash(),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      // clipBehavior is necessary because, without it, the InkWell's animation
      // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
      // This comes with a small performance cost, and you should not set [clipBehavior]
      // unless you need it.
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: note.color.getOrCrash(),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: SizedBox(
          height: 128,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: kPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TextHelpers.sliceText(
                        note.title.getOrElse(''),
                        10,
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      iconSize: 16,
                      onPressed: () {
                        AutoRouter.of(context).push(
                          NoteFormRoute(
                            note: note,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding,
                ),
                child: note.description != null
                    ? Text(
                        TextHelpers.sliceText(
                          note.description!.getOrElse(''),
                          100,
                        ),
                      )
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
