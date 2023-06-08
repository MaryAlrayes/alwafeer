import 'package:flutter/material.dart';

import '../../../../../core/ui/widgets/background.dart';
import '../widgets/date_item.dart';
import '../widgets/ticket_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventsTicketsScreen extends StatefulWidget {
  static const routeName = 'event_tickets_screen';
  EventsTicketsScreen({super.key});

  @override
  State<EventsTicketsScreen> createState() => _EventsTicketsScreenState();
}

class _EventsTicketsScreenState extends State<EventsTicketsScreen> {
  DateTime date = DateTime.now();
  Set<DateTime> dates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.tickets_appbar_label),
        backgroundColor: Colors.black,
        actions: [_buildCalendarBtn(context)],
      ),
      backgroundColor: Colors.black,
      body: Stack(children: [
        const Background(),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDaysList(context),
                _buildTicketsList(),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  IconButton _buildCalendarBtn(BuildContext context) {
    return IconButton(
      onPressed: () async {
        DateTime? selectedDate = await pickDateRange(context);
        if (selectedDate != null) {
          setState(() {
            dates.add(selectedDate);
          });
        }
      },
      icon: const Icon(Icons.calendar_month_rounded),
    );
  }

  ListView _buildTicketsList() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const SizedBox(height: 12);
        },
        separatorBuilder: (context, index) {
          return TicketItem(
              day: DateTime.now(),
              price: 20,
              note1: 'الدوري الأردني',
              note2: 'الوحدات x الفيصلي',
              note3: 'ملاحظة');
        },
        itemCount: 10);
  }

  Wrap _buildDaysList(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      spacing: 3,
      children: dates
          .map(
            (e) => DateItem(
              width: (MediaQuery.of(context).size.width - 24 - 3) / 2,
              date: e,
              handler: () {
                setState(() {
                  dates.remove(e);
                });
              },
            ),
          )
          .toList(),
    );
  }

  Future<DateTime?> pickDateRange(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year+1),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.purple,
            ),
          ),
          child: child!,
        );
      },
    );

    return selectedDate;
  }
}
