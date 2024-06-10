import 'package:flutter/material.dart';

class SelfErrorWidget extends StatelessWidget {
  final String message;
  const SelfErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.report_problem_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 100,),
                            const SizedBox(width: 25,),
                            Flexible(
                              child: Text(
                                message,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 20
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                );
  }
}