import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatelessWidget {
  // ignore: unused_field
  final TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Herramientas')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl760O9Q-b37z5DV1MRFK9-m99a-itU5pG1A&usqp=CAU',
                width: 500,
                height: 500,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GenderAndAgePrediction(),
                    ),
                  );
                },
                child: const Column(
                  children: [
                    Text('Predecir Género y Edad'),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showUniversitiesDialog(context);
                },
                child: const Text('Universidades por país'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showWeatherDialog(context);
                },
                child: const Text('Clima'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WordPressNews(),
                    ),
                  );
                },
                child: const Text('Últimas noticias de WordPress'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showAboutDialog(context);
                },
                child: const Text('Acerca de'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  void _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Acerca de'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://media.licdn.com/dms/image/D4E03AQEzTzhLweix4g/profile-displayphoto-shrink_100_100/0/1708044919149?e=1715817600&v=beta&t=0whMdTgWBoPS6F5JdPreggpYz5oDJYCPGh3JKo8rMXw'),
            ),
            const Text('Contacto: Brayham310@gmail.com'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cerrar'),
            ),
          ],
        ),
      ),
    );
  }

  void _showUniversitiesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => UniversitiesDialog(),
    );
  }

  void _showWeatherDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const WeatherDialog(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class WordPressNews extends StatelessWidget {
  void _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Noticias de WordPress')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'data:image/png;base64,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',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Who is the real Javier Milei?'),
                      subtitle: const Text(
                          'Los residentes de Buenos Aires inundaron las extensas avenidas y plazas de la ciudad la semana pasada, con utensilios de cocina en mano, para literalmente expresar su furia por una vertiginosa serie de cambios económicos y de políticas públicas que están dividiendo profundamente a Argentina. En lo que se ha descrito como una “terapia de choque” para la decadente economía del país, se han desregulado sectores que van desde la atención sanitaria hasta la construcción, se han destruido los derechos laborales y se han eliminado por completo nueve de los 18 ministerios estatales.'),
                      onTap: () {
                        _launchURL(
                            'https://www.codastory.com/rewriting-history/javier-milei-argentina-judaism/');
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Israel and the ‘crime of crimes’'),
                      subtitle: const Text(
                          'El 26 de enero, la Corte Internacional de Justicia de La Haya dictaminó que el continuo bombardeo de Gaza por parte de Israel y el bloqueo de la ayuda humanitaria al enclave podrían constituir “plausiblemente” genocidio. Sudáfrica, que presentó el caso, no obtuvo el alto el fuego ordenado por el tribunal que buscaba, pero los jueces advirtieron a Israel que debe asegurarse de no violar la Convención sobre Genocidio de la ONU. También ordenaron a Israel que prevenga y castigue la incitación interna al genocidio, así como que permita la entrada de ayuda humanitaria a Gaza. '),
                      onTap: () {
                        _launchURL(
                            'https://www.codastory.com/rewriting-history/narrative-spin/');
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                          'Year in review: How memory wars have shaped global headlines'),
                      subtitle: const Text(
                          'Los autoritarios suelen ser expertos en manipular narrativas sobre el pasado en su beneficio. La historia y la memoria son fundamentales para la identidad nacional e individual, definen fronteras y afirman normas culturales e identidades religiosas. La reescritura de la historia de Ucrania por parte de Rusia le ha dado una base ideológica para su invasión a gran escala y su intento de borrar la identidad ucraniana. En India, el Partido Bharatiya Janata del primer ministro Narendra Modi ha evocado el pasado lejano para avivar la tensión intercomunitaria y redefinir el Estado secular indio como uno basado en el hinduismo. Y en Estados Unidos, los políticos republicanos decididos a librar una guerra cultural están atacando a profesores y bibliotecarios, politizando los libros de historia y los programas escolares.'),
                      onTap: () {
                        _launchURL(
                            'https://www.codastory.com/rewriting-history/2023-year-in-review-history/');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class UniversitiesDialog extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _UniversitiesDialogState createState() => _UniversitiesDialogState();
}

class _UniversitiesDialogState extends State<UniversitiesDialog> {
  final TextEditingController _countryController = TextEditingController();
  List<dynamic> _universities = [];
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Universidades por país'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  TextField(
                    controller: _countryController,
                    decoration: const InputDecoration(
                        labelText: 'Ingrese un país en inglés'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _fetchUniversities();
                    },
                    child: const Text('Buscar'),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _universities.length,
                      itemBuilder: (context, index) {
                        final university = _universities[index];
                        return ListTile(
                          title: Text(university['name']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Dominio: ${university['domains'].join(', ')}'),
                              Text(
                                  'Página web: ${university['web_pages'].join(', ')}'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _fetchUniversities() async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await http.get(Uri.parse(
          'http://universities.hipolabs.com/search?country=${_countryController.text}'));
      final data = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        _universities = data;
        _loading = false;
      });
    } catch (error) {
      // ignore: avoid_print
      print('Error al obtener las universidades: $error');
      setState(() {
        _loading = false;
      });
    }
  }
}

class WeatherDialog extends StatefulWidget {
  const WeatherDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherDialogState createState() => _WeatherDialogState();
}

class _WeatherDialogState extends State<WeatherDialog> {
  Map<String, dynamic> _weatherData = {};
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _weatherData.isEmpty
                ? const Text('No se pudo obtener el clima',
                    style: TextStyle(color: Colors.blue))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Temperatura: ${_kelvinToCelsius(_weatherData['main']['temp'])}°C',
                          style: const TextStyle(color: Colors.blue)),
                      Text('Humedad: ${_weatherData['main']['humidity']}%',
                          style: const TextStyle(color: Colors.blue)),
                      Text(
                          'Clima: ${_weatherData['weather'][0]['description']}',
                          style: const TextStyle(color: Colors.blue)),
                    ],
                  ),
      ),
    );
  }

  void _fetchWeather() async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=18.47186&lon=-69.89232&appid=f5b8d3be09f306a765f18959d5d53167'));
      final data = jsonDecode(response.body);
      setState(() {
        _weatherData = data;
        _loading = false;
      });
    } catch (error) {
      // ignore: avoid_print
      print('Error al obtener el clima: $error');
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  double _kelvinToCelsius(double tempInKelvin) {
    return tempInKelvin - 273.15;
  }
}

class GenderAndAgePrediction extends StatefulWidget {
  // ignore: use_super_parameters
  const GenderAndAgePrediction({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GenderAndAgePredictionState createState() => _GenderAndAgePredictionState();
}

class _GenderAndAgePredictionState extends State<GenderAndAgePrediction> {
  String name = '';
  String gender = '';
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Predecir Género y Edad')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Ingrese un nombre'),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _predictGenderAndAge(context);
              },
              child: const Text('Predecir'),
            ),
            const SizedBox(height: 20),
            Text('Género: $gender'),
            const SizedBox(height: 10),
            _buildGenderColorDisplay(),
            const SizedBox(height: 20),
            Text('Edad: $age'),
            const SizedBox(height: 10),
            _buildAgeDisplay(),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderColorDisplay() {
    if (gender.toLowerCase() == 'masculino') {
      return Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      );
    } else if (gender.toLowerCase() == 'femenino') {
      return Container(
        width: 100,
        height: 100,
        color: Colors.pink,
      );
    } else {
      return Container();
    }
  }

  Widget _buildAgeDisplay() {
    if (age == 0) {
      return Container();
    } else if (age <= 35) {
      return _buildAgeStatus('Joven',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnymLr9uh4-UsGtoX2GCGpc3GL-PwofEf8ow&usqp=CAU');
    } else if (age <= 60) {
      return _buildAgeStatus('Adulto',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVyzmY-_41PxwrBGtgNOtDPMwInm3472NxHw&usqp=CAU');
    } else {
      return _buildAgeStatus('Anciano',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDT2nr9quQkDDq2T6t8eXrthGKQSyqTd4sWw&usqp=CAU');
    }
  }

  Widget _buildAgeStatus(String status, String imageUrl) {
    return Column(
      children: [
        Text(status),
        Image.network(
          imageUrl,
          width: 100,
          height: 100,
        ),
      ],
    );
  }

  void _predictGenderAndAge(BuildContext context) async {
    try {
      final response =
          await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
      final data = jsonDecode(response.body);
      setState(() {
        gender = data['gender'] == 'male' ? 'Masculino' : 'Femenino';
      });
    } catch (error) {
      // ignore: avoid_print
      print('Error al obtener el género: $error');
    }

    try {
      final response =
          await http.get(Uri.parse('https://api.agify.io/?name=$name'));
      final data = jsonDecode(response.body);
      setState(() {
        age = data['age'];
      });
    } catch (error) {
      // ignore: avoid_print
      print('Error al obtener la edad: $error');
    }
  }
}
