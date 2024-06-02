import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texasgrill_app/blocs/categories/categories_bloc.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  CategoriesBloc categoriesBloc = CategoriesBloc();

  @override
  void initState() {
    super.initState();
    categoriesBloc.add(LoadCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
        bloc: categoriesBloc,
        builder: (context, state) {
          if (state is LoadingCategoriesState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedCategoriesState) {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              body: ListView.builder(
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        decoration:  BoxDecoration(
                          border:  Border(
                            bottom: index  <= state.categories.length - 2 ? BorderSide(
                              color: Theme.of(context).colorScheme.secondary, // Color del borde
                              width: 1.5, // Ancho del borde
                            ) : BorderSide.none,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.categories[index].nombre!,
                              style:  TextStyle(
                                fontSize: 25,
                                color: Theme.of(context).colorScheme.secondary
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                            color: Theme.of(context).colorScheme.surface,),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const Center(
              child: Text("Algo ha ocurrido"),
            );
          }
        });
  }
}
