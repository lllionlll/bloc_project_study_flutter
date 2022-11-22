import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/journeys/loading/loading_circle_widget.dart';

class LoadingScreen extends StatelessWidget {
  final Widget child;
  const LoadingScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            child,
            if (state is StartLoadingState)
              Container(
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                child: const Center(
                  child: LoadingCircleWidget(size: 200),
                ),
              ),
          ],
        );
      },
    );
  }
}
