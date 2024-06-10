import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texasgrill_app/blocs/promotions/promotions_bloc.dart';
import 'package:texasgrill_app/pages/promotion/promotion_item_widget.dart';
import 'package:texasgrill_app/widgets/error_widget.dart';

class PromotionsPage extends StatefulWidget {
  const PromotionsPage({super.key});

  @override
  State<PromotionsPage> createState() => _PromotionsPageState();
}

class _PromotionsPageState extends State<PromotionsPage> {

  @override
  void initState(){
    super.initState();
    promotionsBloc.add(LoadPromotionsEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocBuilder<PromotionsBloc, PromotionsState>(
        bloc: promotionsBloc,
        builder: (context, state){
          if(state is LoadingPromotionsState || state is InitialPromotionsState){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is LoadedPromotionsState){
            return state.promotions.isNotEmpty ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.promotions.length,
                itemBuilder: (BuildContext context, int index) { 
                    return PromotionWidget(promotion: state.promotions[index],);
                 },
                
              ),
            ) : Center(child: Text("No hay ofertas en este momento",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),));
          }else{
            return SelfErrorWidget(message: (state as ErrorPromotionsState).message);
          }
        },
      ),
    );
  }
}