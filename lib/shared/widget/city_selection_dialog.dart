import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:weather_report/provider/weather_provider.dart';
import 'package:weather_report/shared/const/string_const.dart';

class CitySelectionDialog extends StatelessWidget {
  const CitySelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(StringConst.cityName),
      content: TypeAheadField<dynamic>(
        suggestionsCallback: (search) async {
          return await Provider.of<WeatherProvider>(context, listen: false).fetchCitySuggestions(search);
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion[StringConst.name]),
          );
        },
        onSelected: (city) {
          Provider.of<WeatherProvider>(context, listen: false).setCity(city[StringConst.name]);
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(StringConst.cancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(StringConst.submit),
        ),
      ],
    );
  }
}
