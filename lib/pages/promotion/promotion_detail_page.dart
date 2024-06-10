import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:texasgrill_app/blocs/countdown/countdown_bloc.dart';
import 'package:texasgrill_app/blocs/promotion/promotion_bloc.dart';
import 'package:texasgrill_app/blocs/promotions/promotions_bloc.dart';
import 'package:texasgrill_app/blocs/redeem_promotions/redeem_promotions_bloc.dart';

class PromotionDetailPage extends StatefulWidget {
  final int idPromotion;
  const PromotionDetailPage({super.key, required this.idPromotion});

  @override
  State<PromotionDetailPage> createState() => _PromotionDetailPageState();
}

class _PromotionDetailPageState extends State<PromotionDetailPage> {
  late PromotionBloc promotionBloc;
  CountDownBloc countDownBloc = CountDownBloc();
  RedeemPromotionsBloc redeemPromotionsBloc = RedeemPromotionsBloc();

  @override
  void initState() {
    super.initState();
    promotionBloc = PromotionBloc();
    promotionBloc.add(LoadPromotionEvent(idPromotion: widget.idPromotion));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    promotionsBloc.add(LoadPromotionsEvent());
  }

  @override
  void dispose() {
    super.dispose();
    promotionBloc.close();
  }

  void startCountDown() {
    redeemPromotionsBloc
        .add(LoadRedeemPromotionsEvent(idPromotion: widget.idPromotion));
    countDownBloc.add(StartCountdown(initialTime: 15 * 60));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PromotionBloc, PromotionState>(
          bloc: promotionBloc,
          listener: (context, state) {
            if (state is LoadedPromotionState) {
              if (state.promotion.activo != null &&
                  state.promotion.activo == true) {
                Duration difference = state.promotion.tiempoParaGastar!
                    .difference(DateTime.now());
                int seconds = difference.inSeconds;
                countDownBloc.add(StartCountdown(initialTime: seconds));
              }
            }
          },
        ),
        BlocListener<RedeemPromotionsBloc, RedeemPromotionsState>(
          bloc: redeemPromotionsBloc,
          listener: (context, state) {
            if (state is LoadedRedeemPromotionsState) {
              promotionBloc
                  .add(LoadPromotionEvent(idPromotion: widget.idPromotion));
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: BlocBuilder<PromotionBloc, PromotionState>(
          bloc: promotionBloc,
          builder: (context, state) {
            if (state is LoadingPromotionState ||
                state is InitialPromotionState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedPromotionState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/imagenOferta.jpg',
                        width: MediaQuery.of(context).size.width,
                      ),
                      Positioned(
                        top: 30,
                        left: 10,
                        child: IconButton(
                          onPressed: (() => context.pop()),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          iconSize: 30,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 20),
                    child: Text(
                      state.promotion.nombre!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Text(
                      state.promotion.descripcion!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Debes estar registrado para canjear esta oferta",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 0.5,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 20, right: 20, bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            "Oferta válida hasta:   ",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontSize: 14),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy')
                                .format(state.promotion.fechaFin!.toLocal()),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: state.promotion.activo != null &&
                        state.promotion.activo == true,
                    child: BlocBuilder<CountDownBloc, CountDownState>(
                      bloc: countDownBloc,
                      builder: (context, state) {
                        final int minutes = state.remainingTime ~/ 60;
                        final int seconds = state.remainingTime % 60;
                        return Padding(
                          padding: const EdgeInsets.only(top: 90),
                          child: Container(
                            width: MediaQuery.of(context).size.width*3/4,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary, // Color del borde
                                width: 2.0, // Ancho del borde
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${minutes.toString()}:${seconds.toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                      fontSize:30,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "código:",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          fontSize: 22),
                                    ),
                                    const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  (promotionBloc.state as LoadedPromotionState)
                                      .promotion
                                      .codigo!,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 25),
                                ),
                                  ],
                                ),
                                
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  state.promotion.activo != null &&
                          state.promotion.activo == true
                      ? const SizedBox()
                      : const Expanded(child: SizedBox()),
                  state.promotion.activo != null &&
                          state.promotion.activo == true
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, bottom: 80),
                          child: InkWell(
                            onTap: startCountDown,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              child: Center(
                                  child: Text(
                                "Canjear promoción",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize: 20),
                              )),
                            ),
                          ),
                        ),
                ],
              );
            } else {
              return ErrorWidget((state as ErrorPromotionState).message);
            }
          },
        ),
      ),
    );
  }
}
