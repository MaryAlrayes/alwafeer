import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomeStepper extends StatelessWidget {
  final int length;
  final double width;
  final List<IconData> icons;
  final List<String> titles;
  final int curStep;

  final Color circleActiveColor;
  final Color circleInactiveColor;

  final Color? iconActiveColor;
  final Color? iconInactiveColor;

  final Color? textActiveColor;
  final Color? textInactiveColor;
  final double lineWidth = 4.0;
  final List<Widget> content;
  final Function resetHandler;
  const CustomeStepper(
      {super.key,
      required this.length,
      this.icons = const [],
      this.titles = const [],
      required this.curStep,
      required this.width,
      required this.circleActiveColor,
      required this.circleInactiveColor,
      required this.resetHandler,
      this.iconActiveColor,
      this.iconInactiveColor,
      this.textActiveColor,
      this.textInactiveColor,
      this.content = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _iconViews(context),
              const SizedBox(
                height: 10,
              ),
              _buildTitles(context, titles)
            ],
          ),
        ),
        _buildMainContent()
      ],
    );
  }

  Widget _iconViews(BuildContext context) {
    var list = <Widget>[];

    for (int i = 0; i < length; i++) {
      (i == 0 || curStep >= i )
          ? list.add(_buildActiveStep(i, curStep  == i, context))
          : list.add(_buildInactiveStep(i));

      var lineColor = (i == 0 || curStep >= i )
          ? circleActiveColor
          : circleInactiveColor;

      //line between icons
      if (i != length - 1) {
        list.add(
          Expanded(
            child: Container(
              height: lineWidth,
              color: lineColor,
            ),
          ),
        );
      }
    }

    return Row(children: list);
  }

  Expanded _buildMainContent() {
    return Expanded(
      child: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 16),
          child: content[curStep]),
    );
  }

  Container _buildInactiveStep(int i) {
    return Container(
      width: 50.0,
      height: 50.0,
      padding: const EdgeInsets.all(0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: circleInactiveColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: _buildNumber(i, Colors.white),
    );
  }

  Widget _buildActiveStep(int i, bool isCur, BuildContext context) {
    return InkWell(
      onTap: () {
        if (curStep != length-1 && !isCur) {
          resetHandler(i , context);
          BlocProvider.of<StepperCubit>(context).setStep(i );
        }
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        padding: const EdgeInsets.all(0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: circleActiveColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        child: isCur
            ? _buildSecondCircle(i)
            : _buildNumber(
                i,
                Colors.white,
              ),
      ),
    );
  }

  Container _buildSecondCircle(int i) {
    return Container(
      width: 38.0,
      height: 38.0,
      padding: const EdgeInsets.all(0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: _buildNumber(i, Colors.black),
    );
  }

  Text _buildNumber(int i, Color textColor) {
    return Text(
      '${i + 1}',
      style: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTitles(BuildContext context, List<String> titles) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _titleViews(context, titles),
    );
  }

  List<Widget> _titleViews(BuildContext context, List<String?> titles) {
    String lastStepTitle =
        curStep == length-1 ? AppLocalizations.of(context)!.done_recharge_process : '';

    if (titles.length == 3) {
      titles.add(lastStepTitle);
    } else {
      titles[titles.length - 1] = (lastStepTitle);
    }

    var list = <Widget>[];
    titles.asMap().forEach(
      (i, text) {
        list.add(
          _buildTitleItem(text),
        );
      },
    );
    return list;
  }

  Container _buildTitleItem(String? text) {
    return Container(
          width: 50.0,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(0),
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
  }
}
