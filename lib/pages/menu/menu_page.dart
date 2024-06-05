import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texasgrill_app/blocs/categories/categories_bloc.dart';
import 'package:texasgrill_app/blocs/product/product_bloc.dart';
import 'package:texasgrill_app/models/category_menu.dart';
import 'package:texasgrill_app/models/product_menu.dart';
import 'package:texasgrill_app/pages/menu/product_item_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  CategoriesBloc categoriesBloc = CategoriesBloc();
  ProductBloc productBloc = ProductBloc();
  late CategoryMenu categoryMenu;
  int _itemSelected = 0;
  List<ProductMenu> productos = [];

  @override
  void initState() {
    super.initState();
    categoriesBloc.add(LoadCategoriesEvent());

    for (int c = 0; c <= 20; c++) {
      productos.add(ProductMenu());
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _itemSelected = index;
    });
    categoryMenu = categoriesBloc.categories![_itemSelected];
    productBloc.add(LoadProductEvent(category: categoryMenu));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocListener<CategoriesBloc, CategoriesState>(
        bloc: categoriesBloc,
        listener: (context, state) {
          if (state is LoadedCategoriesState) {
            categoryMenu = state.categories[_itemSelected];
            productBloc.add(LoadProductEvent(category: categoryMenu));
          }
        },
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
            bloc: categoriesBloc,
            builder: (context, state) {
              if (state is LoadingCategoriesState ||
                  state is InitialCategoriesState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoadedCategoriesState) {
                return Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 11, right: 8, bottom: 30, top: 20),
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  _onItemTapped(index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(10),
                                    color: index == _itemSelected
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context).colorScheme.surface,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Center(
                                    child: Text(
                                      state.categories[index].nombre!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: index == _itemSelected
                                            ? Theme.of(context)
                                                .colorScheme
                                                .tertiary
                                            : Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    BlocBuilder<ProductBloc, ProductState>(
                      bloc: productBloc,
                      builder: (context, state) {
                        if (state is LoadedProductState) {
                          return Expanded(
                              child: ListView(
                            children: construirLista(state.products),
                          ));
                        } else if (state is LoadingProductState ||
                            state is InitalProductState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                (state as ErrorProductState).message,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    )
                  ],
                );
              } else {
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
                                (state as ErrorCategoriesState).message,
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
            }),
      ),
    );
  }

  List<Widget> construirLista(List<ProductMenu> products) {
    List<Widget> widgetList = [];
    if (products.length % 2 == 0) {
      for (int contador = 0; contador < products.length; contador += 2) {
        Row row = Row(
          children: [
            ProductWidget(product: products[contador]),
            ProductWidget(product: products[contador + 1]),
          ],
        );
        widgetList.add(row);
      }
    } else {
      for (int contador = 0; contador < products.length; contador += 2) {
        if (contador == products.length - 1) {
          Row row = Row(
            children: [
              ProductWidget(product: products[contador]),
            ],
          );
          widgetList.add(row);
        } else {
          Row row = Row(
            children: [
              ProductWidget(product: products[contador]),
              ProductWidget(product: products[contador + 1]),
            ],
          );
          widgetList.add(row);
        }
      }
    }
    return widgetList;
  }
}
