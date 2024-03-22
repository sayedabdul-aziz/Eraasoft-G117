import 'package:counter_with_cubit/cubit/counter_cubit.dart';
import 'package:counter_with_cubit/cubit/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<CounterCubit, CounterStates>(
              listener: (context, state) {
            if (state is UpdateTextState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Updatedd')));
            }
          }, builder: (context, state) {
            if (state is UpdateLoadingState) {
              return const CircularProgressIndicator();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.read<CounterCubit>().counter.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.small(
                      onPressed: () {
                        context.read<CounterCubit>().remove();
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FloatingActionButton.small(
                      onPressed: () {
                        context.read<CounterCubit>().add();
                      },
                      child: const Icon(Icons.add),
                    )
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
