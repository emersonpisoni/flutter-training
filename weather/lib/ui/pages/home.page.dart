import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/models/forecast.model.dart';
import 'package:weather/models/result.model.dart';
import 'package:weather/models/weather.response.dart';
import 'package:weather/network/api.dart';
import 'package:weather/ui/components/forecast.component.dart';
import 'package:weather/ui/components/loader.component.dart';
import 'package:weather/ui/pages/city.drawer.dart';
import 'package:weather/utils/image.utils.dart';
import 'package:weather/utils/local_data.utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _defaultCityWoeid = 455823;
  WeatherResponse _weatherResponse;

  @override
  void initState() {
    super.initState();

    LocalDataUtils.setApiKey();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _getData(_defaultCityWoeid);
  }

  _getData(int woeid) async {
    _weatherResponse = null;
    setState(() {});
    _weatherResponse = await Api.retrieveWeather(woeid);
    setState(() {});
  }

  Widget _buildContent(Result result) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color:
          result.currently == 'noite' ? Colors.grey[700] : Colors.yellow[700],
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                result.city,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ImageUtils.getSvgForCondition(result.conditionSlug),
              SizedBox(
                height: 20,
              ),
              Text(
                '${result.temp}°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    result.forecasts.first.weekday,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Text(
                    result.forecasts.first.max.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(result.forecasts.first.min.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'Próximos dias',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: result.forecasts.map<Widget>((item) {
                  return ForecastComponent(forecast: item);
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Weather'),
      ),
      drawer: CityDrawer(
        onTap: _getData,
      ),
      body: _weatherResponse == null
          ? LoaderComponent()
          : _buildContent(_weatherResponse.result),
    );
  }
}
