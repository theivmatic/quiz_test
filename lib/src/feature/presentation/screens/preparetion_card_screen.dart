import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/feature/presentation/screens/preparations_screen.dart';

class PreparationCardScreen extends StatelessWidget {
  const PreparationCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cлово пацанв',
          style: GoogleFonts.robotoFlex(
            textStyle: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const PreparationsScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      ),
      backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '50 фактов о сериале «Слово пацана. Кровь на асфальте»',
                style: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(247, 247, 251, 1),
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Факт №1',
                style: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(247, 247, 251, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Сериал «Слово пацана. Кровь на асфальте» основан на реальных событиях. В обозначенные годы в Казани действительно начали появляться бандитские группировки, которые формировались преимущественно из подростков. Массовые драки, грабежи и даже убийства заставляли людей соблюдать комендантский час, а женщины и дети старались не появляться на улицах без мужчин. В 1990-е годы часть этих сообществ превратилась в организованные преступные группы. Усмирить беспредел властям удалось лишь в ближе к 2000-м. Одним из членов подобных фирм был Роберт Гараев, который создал книгу о тех страшных временах. «Слово пацана. Криминальный Татарстан 1970–2010-х» как раз-таки и стала основой, которая всерьез заинтересовала Жору Крыжовникова. Режиссер два года изучал «казанский феномен» и создал собственную историю, основанную на исторической базе. Кстати, на сегодняшний день все экземпляры издания раскуплены, несмотря на то, что герои «Универсама» являются выдуманными людьми, а ведь именно из-за них многие и полюбили фильм.',
                style: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(189, 193, 203, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                  child: Image.asset(
                      'assets/images/training_images/training_image1.png')),
              const SizedBox(height: 5),
              Text(
                'Валера Турбо в исполнении Славы Копейкина стал одним из самых неоднозначных персонажей, в него влюбляются и ненавидят',
                style: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(189, 193, 203, 1),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Факт №2',
                style: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(247, 247, 251, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Первоначально съемки сериала планировалось проводить в Казани. В городе даже открыли кастинг, однако он довольно быстро свернулся. Оказывается, местные общественники воспротивились созданию истории о тяжелых казанских временах. Они подали иски в ГК с требованием заблокировать показ картины. Долго ответа ждать не пришлось. Дело в том, что власти Татарстана тоже посчитали «казанский феномен» настоящим позором для региона, а потому запретили снимать художественную хронику жестоких столкновений подростковых группировок на их территории. Таким образом, перед создателями сериала встала новая задача: найти локации, которые идеально смогли бы передать атмосферу Казани тех лет. После продолжительных поисков, выбор пал на Ярославль, где были похожие улицы, дворы и здания. Главными местами стали Ленинский и Дзержинский районы города, а в некоторых сценах можно увидеть и центр Ярославля, Волжскую набережную, Октябрьский мост.',
                style: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(189, 193, 203, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                  child: Image.asset(
                      'assets/images/training_images/training_image2.png')),
              const SizedBox(height: 5),
              Text(
                'Сцену похорон Желтого воспроизводили на реально существующем кладбище',
                style: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(189, 193, 203, 1),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
