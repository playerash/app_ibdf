// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class VersiculoDoDiaCard extends StatelessWidget {
//   const VersiculoDoDiaCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;

//     Future<DocumentSnapshot> getVersiculoInfo() async {
//       DocumentSnapshot versiculoFirebase =
//           await firestore.collection("versiculos").doc("1").get();
//       return versiculoFirebase;
//     }

//     return Center(
//       child: Container(
//         constraints:
//             const BoxConstraints(minHeight: 150, minWidth: 250, maxWidth: 250),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           color: Colors.white,
//         ),
//         child: FutureBuilder(
//           future: getVersiculoInfo(),
//           builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//             if (snapshot.connectionState != ConnectionState.done) {
//               return const Center(
//                 child: SizedBox(
//                   height: 50,
//                   width: 50,
//                   child: CircularProgressIndicator(),
//                 ),
//               );
//             } else {
//               String title =
//                   "${snapshot.data?.get("livro")} ${snapshot.data?.get("capitulo")}:${snapshot.data?.get("versiculo")}";

//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Wrap(
//                       children: [
//                         Text(
//                           title,
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                       ],
//                     ),
//                     Wrap(
//                       children: [
//                         Text(
//                           snapshot.data?.get("textoVersiculo"),
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

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
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Text(
                          state.versiculoDoDia.textoVersiculo,
                          style: const TextStyle(
                            fontSize: 14,
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
