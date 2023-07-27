import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypeneedz/core/failures/shoes_Failure.dart';

import '../../application/shoes/controller/bloc/news_controller_bloc.dart';
import '../../application/shoes/observe/bloc/observer_bloc_bloc.dart';

import '../../config/routes/routes.gr.dart';
import '../../injection.dart';

class TodoPage extends StatelessWidget {
  String _mapFailureToMessage(ShoesFailure todoFailure) {
    switch (todoFailure.runtimeType) {
      case InsufficientPermisssons:
        return "You have not the permissions to do that";
      case UnexpectedFailure:
        return "Something went wrong";

      default:
        return "Something went wrong";
    }
  }

  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final observeBloc = sl<ShoesObserverBloc>()..add(ObserveAll());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => observeBloc,
        ),
        BlocProvider(
          create: (context) => sl<ControllerBloc>(),
        ),
      ],
      child: BlocListener<ControllerBloc, ShoesControllerState>(
        listener: (context, state) {
          if (state is ControllerFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(_mapFailureToMessage(state.shoesFailure))));
          }
        },
        child: const NewsList(),
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoesObserverBloc, ShoesObserverState>(
        builder: (context, state) {
      if (state is ShoesObserverInitial) {
        return Container();
      } else if (state is ShoesObserverLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is ShoesObserverSucsses) {
        final shoes = state.shoes;
        void showDeletDialog(
            {required BuildContext context,
            required index,
            required ControllerBloc bloc}) {
          final shoes = state.shoes;
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Selected Todo to delete:"),
                  content: Text(
                    shoes[index].name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "CANCLE",
                          style: TextStyle(color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () {
                          bloc.add(DeleteShoesEvent(shoes: shoes[index]));
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "DELETE",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                );
              });
        }

        return Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: shoes.length,
                itemBuilder: (context, index) {
                  final shoe = shoes[index];
                  return InkResponse(
                    onLongPress: () => showDeletDialog(
                        context: context,
                        index: index,
                        bloc: BlocProvider.of<ControllerBloc>(context)),
                    child: ListTile(
                      title: Text(shoe.modell),
                      subtitle: Text(shoe.name),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(shoe.images.first),
                      ),
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton(
              onPressed: () =>
                  AutoRouter.of(context).push(ShoesFormRoute(shoes: null)),
              child: const Icon(Icons.close),
            )
          ],
        );
      } else if (state is ShoesObserverFailure) {
        return const Center(child: Text("Error"));
      }
      return Container();
    });
  }
}
