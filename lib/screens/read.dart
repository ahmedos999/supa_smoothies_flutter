import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supasmoothies/models/smoothie_model.dart';
import 'package:supasmoothies/services/curd.dart';

class view extends StatelessWidget {
  const view({super.key});

  @override
  Widget build(BuildContext context) {
    Services s = Services();
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: s.readData(),
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: (snapshot.data! as List<Smoothie>).length,
                itemBuilder: ((BuildContext context, int index) {
                  Smoothie smoothie = (snapshot.data! as List<Smoothie>)[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          smoothie.title,
                          style: GoogleFonts.poppins(),
                        ),
                        subtitle: Text(
                          smoothie.method,
                          style: GoogleFonts.poppins(),
                        ),
                        trailing: Text(
                          smoothie.rating.toString(),
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ),
                  );
                }),
              );
            }

            // until the data has been loaded, we will see this progess indicator.
            return const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}
