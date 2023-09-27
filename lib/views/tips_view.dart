import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../widgets/tip_item.dart';

// ignore: must_be_immutable
class TipsView extends StatelessWidget {
  TipsView({super.key});

  List<Map<String, dynamic>> tipsItem = [
    {
      'title': "instructions",
      'body': [
        "إكثار الإنسان المسلم من ذكر الله سبحانهُ وتعالى في الليل والنهار، عن طريق التسبيح والتهليل",
        "تجنب النميمة بكل أشكالها، والتكلّم عن الناس من وراء ظهروهم",
        "التزام الصدق أثناء التعامل مع الآخرين، وتجنّب الكذب بأشكالهِ المختلفة",
        "قراءة القرآن الكريم بشكلٍ يومي، والتمعّن بمعاني الآيات والإلتزام بكل ما يردُ فيها من معلوماتٍ مهمة",
        "غض البصر، والترفّع عن كبائر الذنوب وصغائرها",
        "إخلاص النيّة إلى رب العالمين",
        "صلة الرحم، وزيارة العائلة في الأعياد والمناسبات، والسؤال عن أحوالهم، وتقديم العون والمساعدة لكل من يحتاجها منهم",
        "تقديم الصدقات لكل الفقراء والمحتاجين",
        "التحلّي بالصبر في حال الابتلاء، والتوكّل فقط على رب العالمين",
        "الإكثار من الصلاة على رسول الله محمد صلى الله عليه وسلم",
        "الحرص على تعلّم المزيد عن الدين الإسلامي، وقراءة معاني الآيات القرآنية",
        "المواظبة على أداء الصلاة في وقتها المناسب، وبالنسبة للرجال أداء الصلاة في الجوامع والمساجد",
        "عدم التكبّر على الناس، وعدم التعامل معهم بتعالي، وعدم التجريح بأي شخصٍ كان",
        "على المسلم أن يتمنى الخير لنفسهِ وللآخرين",
        "عدم السماح لهموم الدنيا ومشاغلها بأن تلهيك عن ذكر الله والتوجه إليهِ بالدعاء المخلص والصادق",
      ]
    },
    {
      'title': " أداء الصلاة اليوميّة في وقتها",
      'body': [
        "وهي من أهم النصائح التي على كل مسلم أن يلتزم بها، وذلك لأنّ الصلاة هي من أعظم أركان الإسلام وأهمها، فإذا قام الإنسان بها صلحت كل أعمالهُ، وإن لم يقم بها فسدت كل أعمالهُ، وهذا ما جاء في العديد من الآيات الكريمة مثل"
            "قال الله تعالى: (وَاسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ وَإِنَّهَا لَكَبِيرَةٌ إِلَّا عَلَى الْخَاشِعِينَ)",
        "قال الله تعالى: (قُلْ لِعِبَادِيَ الَّذِينَ آمَنُوا يُقِيمُوا الصَّلَاةَ وَيُنْفِقُوا مِمَّا رَزَقْنَاهُمْ سِرًّا وَعَلَانِيَةً مِنْ قَبْلِ أَنْ يَأْتِيَ يَوْمٌ لَا بَيْعٌ فِيهِ وَلَا خِلَالٌ)",
        "قال الله تعالى: ( إِنَّمَا يَعْمُرُ مَسَاجِدَ اللَّهِ مَنْ آمَنَ بِاللَّهِ وَالْيَوْمِ الْآخِرِ وَأَقَامَ الصَّلَاةَ وَآتَى الزَّكَاةَ وَلَمْ يَخْشَ إِلَّا اللَّهَ فَعَسَى أُولَئِكَ أَنْ يَكُونُوا مِنَ الْمُهْتَدِينَ)",
        "قال رسول الله صلى الله عليه وسلم : (الصلاة عمود الدين إن قبلت قبل ما سواها و إن ردت رد ما سواها)",
        "قال رسول الله صلى الله عليه وسلم : (الصلاة الصلاة الصلاة إن قبلت قبل ما سواها و إن ردت رد ما سواها.)",
        "قال رسول الله صلى الله عليه وسلم : (العهد بيننا و بينكم الصلاة, من تركها فقد كفر)",
      ]
    },
    {
      'title': "برّ الوالدين",
      'body': [
        "لقد حثّ الدين الإسلامي كل إنسان مسلم ومؤمن بالله سبحانهُ وتعالى على أن يبر بوالديهِ، ويُقدم لهم الطاعة والاحترام في كل وقتٍ وحين، وألّا يقوم بأي عمل يُسبب لهم الضيق أو الانزعاج، كما وحثّ المسلم على تقديم الرعاية والاهتمام لهم عندما يكبرون في العمر، أو عندما يُصابون بالعجز دون أن يُظهر لهم أي نوع من التعب أو الملل، ولقد ذكر الله تعالى أهمية بر الوالدين في العديد من الآيات الكريمة مثل",
        "قال الله تعالى: (وَإِذْ أَخَذْنَا مِيثَاقَ بَنِي إِسْرَائِيلَ لَا تَعْبُدُونَ إِلَّا اللَّهَ وَبِالْوَالِدَيْنِ إِحْسَانًا وَذِي الْقُرْبَى وَالْيَتَامَى وَالْمَسَاكِينِ وَقُولُوا لِلنَّاسِ حُسْنًا وَأَقِيمُوا الصَّلَاةَ وَآتُوا الزَّكَاةَ ثُمَّ تَوَلَّيْتُمْ إِلَّا قَلِيلًا مِنْكُمْ وَأَنْتُمْ مُعْرِضُونَ)",
        "قال الله تعالى: (وَاعْبُدُوا اللَّهَ وَلَا تُشْرِكُوا بِهِ شَيْئًا وَبِالْوَالِدَيْنِ إِحْسَانًا).",
        "قال اللهُ تعالى: (وَوَصَّيْنَا الْإِنْسَانَ بِوَالِدَيْهِ حُسْنًا).",
        "عن عبدالله بن مسعودٍ رضي الله عنه، قال: سألتُ رسول الله صلى الله عليه وسلم قلتُ: يا رسول الله، أي العمل أفضل؟ قال: الصلاة على ميقاتها، قلت: ثم أي؟ قال: ثم بِرُّ الوالدينِ، قلت: ثم أي؟ قال: الجهاد في سبيل الله",
        "عن أبو داود عن أبي سعيدٍ الخدري: أن رجلًا هاجر إلى رسول الله صلى الله عليه وسلم من اليمَن، فقال: هل لك أحدٌ باليمن؟، قال: أبواي، قال: أذِنا لك؟ قال: لا، قال: ارجع إليهما فاستأذنهما، فإن أذِنا لك فجاهد، وإلا فبَرَّهما",
      ]
    },
    {
      'title': "تقوى الله في السر والعلن",
      'body': [
        "وهي من الأعمال المُحببة عند الله سبحانهُ وتعالى، والتي طلب من كل إنسان مؤمن ومسلم الإلتزام بها، لهذا يجب على الإنسان المسلم أن يطلع على كل الأشياء التي حرمحها الله ومنعنا عنها، وذلك لكي يتقيها في السر والعلن، وهذا ما جاء في العديد من الآيات الكريمة مثل:",
        "قال اللهُ تعالى: (وَاذْكُرُوا اللَّهَ فِي أَيَّامٍ مَعْدُودَاتٍ فَمَنْ تَعَجَّلَ فِي يَوْمَيْنِ فَلَا إِثْمَ عَلَيْهِ وَمَنْ تَأَخَّرَ فَلَا إِثْمَ عَلَيْهِ لِمَنِ اتَّقَى وَاتَّقُوا اللَّهَ وَاعْلَمُوا أَنَّكُمْ إِلَيْهِ تُحْشَرُونَ)",
        "قال اللهُ تعالى: (وَاتَّقُوا يَوْمًا لَا تَجْزِي نَفْسٌ عَنْ نَفْسٍ شَيْئًا وَلَا يُقْبَلُ مِنْهَا عَدْلٌ وَلَا تَنْفَعُهَا شَفَاعَةٌ وَلَا هُمْ يُنْصَرُونَ)",
        "قال اللهُ تعالى: (يَا أَيُّهَا الَّذِينَ آمَنُوا اتَّقُوا اللَّهَ حَقَّ تُقَاتِهِ وَلَا تَمُوتُنَّ إِلَّا وَأَنْتُمْ مُسْلِمُونَ)",
        "قال الله تعالى: (ذَلِكَ الْكِتَابُ لَا رَيْبَ فِيهِ هُدًى لِلْمُتَّقِينَ)",
        "قال رسول الله صلى الله عليه وسلم : (عن أبي هريرة رضي الله عنه قال: قيل : يا رسول الله من أكرم الناس؟ قال أتقاهم)",
        "عن أبي مسعود رضي اللهُ عنهُ أنّ النبي صلى الله عليه وسلم كان يقول: اللهم إني أسألك الهدى والتقى والعفاف والغنى)"
      ]
    },
    {
      'title': "الأمر بالمعروف والنهي عن المنكر",
      'body': [
        "وهي من أهم الفرائض التي حثّ الإسلام الإنسان المؤمن على القيام بها، فمن واجب كل مسلم أن يعمل على نهي نفسهِ والآخرين عن كل الأشياء المحرمة والتي منعها الإسلام، وأن يأمر نفسهُ والآخرين بفعل الخير والترغيب بهِ، ولكن بإسلوبٍ لطيف بعيدًا عن القوة والتسلط، وهذا ما جاء في العديد من الآيات الكريمة مثل",
        "قال اللهُ تعالى: (كُنْتُمْ خَيْرَ أُمَّةٍ أُخْرِجَتْ لِلنَّاسِ تَأْمُرُونَ بِالْمَعْرُوفِ وَتَنْهَوْنَ عَنِ الْمُنْكَرِ وَتُؤْمِنُونَ بِاللَّهِ وَلَوْ آمَنَ أَهْلُ الْكِتَابِ لَكَانَ خَيْرًا لَهُمْ مِنْهُمُ الْمُؤْمِنُونَ وَأَكْثَرُهُمُ الْفَاسِقُونَ)",
        "قال اللهُ تعالى: (يَا بُنَيَّ أَقِمِ الصَّلَاةَ وَأْمُرْ بِالْمَعْرُوفِ وَانْهَ عَنِ الْمُنْكَرِ وَاصْبِرْ عَلَى مَا أَصَابَكَ إِنَّ ذَلِكَ مِنْ عَزْمِ الْأُمُورِ)",
        "قال اللهُ تعالى: (خُذِ الْعَفْوَ وَأْمُرْ بِالْعُرْفِ وَأَعْرِضْ عَنِ الْجَاهِلِينَ)",
        "قال رسول الله صلى الله عليه وسلم : (من رأى منكم منكرًا فليغيره بيده فإن لم يستطع فبلسانه، ومن لم يستطع فبقلبه، وذلك أضعف الإيمان)",
        "عن حذيفة عن النبي صلى الله عليه وسلم قال: (والذي نفسي بيده لتأمرن بالمعروف ولتنهون عن المنكر أو ليوشكن الله عز وجل أن يبعث عليكم عذابًا من عنده ثم تدعونه فلا يستجاب لكم)",
      ]
    },
    {
      'title': "كفالة اليتيم والعطف عليهِ",
      'body': [
        "لقد خصّ الله سبحانه وتعالى كل إنسان يكفل يتيم ويُساعدُ في الحياة بالكثير من الحسنات والمكارم، أهمها دخول الجنّة، لهذا فإنّ الإسلام حثّ الإنسان المسلم على العناية باليتيم وتقديم العون لهُ، لينال محبة الله ورضاهُ عنهُ، وهذا ما جاء في العديد من الآيات الكريمة مثل",
        "قال اللهُ سبحانهُ وتعالى: (يَسْأَلُونَكَ مَاذَا يُنفِقُونَ قُلْ مَا أَنفَقْتُم مِّنْ خَيْرٍ فَلِلْوَالِدَيْنِ وَالأَقْرَبِينَ وَالْيَتَامَى وَالْمَسَاكِينِ وَابْنِ السَّبِيلِ وَمَا تَفْعَلُواْ مِنْ خَيْرٍ فَإِنَّ اللّهَ بِهِ عَلِيمٌ)",
        "قال الله سبحانهُ وتعالى: (وَآتُواْ الْيَتَامَى أَمْوَالَهُمْ وَلاَ تَتَبَدَّلُواْ الْخَبِيثَ بِالطَّيِّبِ وَلاَ تَأْكُلُواْ أَمْوَالَهُمْ إِلَى أَمْوَالِكُمْ إِنَّهُ كَانَ حُوبًا كَبِيرًا)",
        "قال اللهُ سبحانهُ وتعالى: (إِنَّ الَّذِينَ يَأْكُلُونَ أَمْوَالَ الْيَتَامَى ظُلْمًا إِنَّمَا يَأْكُلُونَ فِي بُطُونِهِمْ نَارًا وَسَيَصْلَوْنَ سَعِيرًا)",
        "قال اللهُ سبحانهُ وتعالى: (وَلاَ تَقْرَبُواْ مَالَ الْيَتِيمِ إِلاَّ بِالَّتِي هِيَ أَحْسَنُ حَتَّى يَبْلُغَ أَشُدَّهُ وَأَوْفُواْ بِالْعَهْدِ إِنَّ الْعَهْدَ كَانَ مَسْؤُولاً)",
        "قال رسول الله صلى الله عليه وسلم : (من وضع يده على رأس يتيم رحمة كتب الله له بكل شعرة مدت على يده حسنة)",
        "قال رسول الله صلى الله عليه وسلم : (أنا وكافل اليتيم في الجنة)",
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svgs/menu-icon.svg'),
            ),
            const SizedBox(width: 24),
            Text(
              'Tips',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svgs/search-icon.svg'),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 131,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0, .6, 1],
                      colors: [
                        Color(0xFFB691FF),
                        Color(0xFF6918B4),
                        Color(0xFF36117E),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: Text(
                      'Important Islamic advice and guidance for every Muslim',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
        body: ListView.builder(
          itemCount: tipsItem.length,
          itemBuilder: (context, index) {
            return TipItem(
              title: tipsItem[index]['title'],
              body: tipsItem[index]['body'],
            );
          },
        ),
      ),
    );
  }
}
