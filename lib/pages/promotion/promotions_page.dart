import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texasgrill_app/blocs/promotions/promotions_bloc.dart';
import 'package:texasgrill_app/pages/promotion/promotion_item_widget.dart';

class PromotionsPage extends StatefulWidget {
  const PromotionsPage({super.key});

  @override
  State<PromotionsPage> createState() => _PromotionsPageState();
}

class _PromotionsPageState extends State<PromotionsPage> {
  PromotionsBloc promotionsBloc = PromotionsBloc();

  @override
  void initState(){
    super.initState();
    promotionsBloc.add(LoadPromotionsEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: BlocBuilder<PromotionsBloc, PromotionsState>(
        bloc: promotionsBloc,
        builder: (context, state){
          if(state is LoadingPromotionsState || state is InitialPromotionsState){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is LoadedPromotionsState){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.promotions.length,
                itemBuilder: (BuildContext context, int index) { 
                    return PromotionWidget(promotion: state.promotions[index],);
                 },
                
              ),
            );
          }else{
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
                                (state as ErrorPromotionsState).message,
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
        },
      ),
    );
  }
}