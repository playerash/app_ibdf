import 'package:app_ibdf/app/blocs/versiculo_do_dia/versiculododia_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VersiculoDoDiaCard extends StatelessWidget {
  const VersiculoDoDiaCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return Center(
      child: Container(
        constraints:
            const BoxConstraints(minHeight: 150, minWidth: 250, maxWidth: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: BlocBuilder<VersiculoDoDiaBloc, VersiculoDoDiaState>(
          builder: (context, state) {
            if (state is VersiculododiaLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is VersiculoDoDiaLoaded) {
              String title =
                  "${state.versiculoDoDia.livro} ${state.versiculoDoDia.capitulo}:${state.versiculoDoDia.versiculo}";

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Text(
                          state.versiculoDoDia.textoVersiculo,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
            return const Text("Deu algo errado");
          },
        ),
      ),
    );
  }
}
