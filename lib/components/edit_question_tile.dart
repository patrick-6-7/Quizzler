import 'package:flutter/material.dart';

class EditQuestionTile extends StatelessWidget {
  final String questionTxt;
  final VoidCallback del;
  final VoidCallback edit;
  const EditQuestionTile({
    super.key,
    required this.questionTxt,
    required this.del,
    required this.edit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 16,
        child: Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 18,),
              Expanded(
                child: Text(
                  questionTxt,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  
                ),
              ),
              const SizedBox(width: 18,),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      edit();
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Colors.green,
                    ) 
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        del();
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ) 
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}