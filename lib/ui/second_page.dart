import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multibloc/bloc/color_bloc.dart';
import 'package:multibloc/bloc/counter_bloc.dart';
import 'package:multibloc/ui/draft_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, Color) => DraftPage(
        backgroundColor: Color,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<CounterBloc, int>(
                builder: (context, number) => GestureDetector(
                  onTap: () {
                    counterBloc.add(CounterEvent(1));
                  },
                  child: Text(
                    number.toString(),
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                  height: 20), // Memberi jarak antara teks dan tombol
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Mengatur posisi tombol di tengah
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika sesuai kebutuhan
                      colorBloc.add(ColorEvent.toPink);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: (Color == Colors.pink)
                          ? CircleBorder(
                              side: BorderSide(color: Colors.black, width: 3))
                          : CircleBorder(),
                      padding: const EdgeInsets.all(
                          16), // Memberi padding untuk ukuran tombol
                    ),
                    child: const Icon(Icons.remove,
                        color: Colors.white), // Ikon untuk tombol
                  ),
                  const SizedBox(width: 10), // Jarak antar tombol
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika sesuai kebutuhan
                      colorBloc.add(ColorEvent.toAmber);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: (Color == Colors.amber)
                          ? CircleBorder(
                              side: BorderSide(color: Colors.black, width: 3))
                          : CircleBorder(),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Icon(Icons.refresh, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika sesuai kebutuhan
                      colorBloc.add(ColorEvent.toPurple);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: (Color == Colors.purple)
                          ? CircleBorder(
                              side: BorderSide(color: Colors.black, width: 3))
                          : CircleBorder(),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
