import 'package:alwafeer/core/utils/constants/assets_path.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BasicTile {
  final String title;
  final List<String> subtitles;
  final String icon;
  BasicTile({required this.title, required this.subtitles, required this.icon});

  static List<BasicTile> getData(BuildContext context) {
    final List<BasicTile> dataPayBills = [
      BasicTile(
        title: AppLocalizations.of(context)!.pay_bills_governmental,
        subtitles: [
          'دائرة الأراضي والمساحة',
          'ضريبة أبنية البلديات',
          'وزارة الداخلية',
          ' البنك المركزي الأردني',
          'دائرة ضريبة الدخل والمبيعات',
          'وزارة العدل',
          'دائرة مراقبة الشركات',
          'وزارة المالية الأموال العامة',
          'إدارة ترخيص السواقين والمركبات',
          'الضمان الاجتماعي-منشأت',
          'رخص االمهن-عمان',
          'وزارة العدل البوابة الالكترونية',
          'وزارة الصناعة والتجارة والتموين',
          'دائرة قاضي القضاة',
          'شركة العقبة لإدارة وتشغيل الموانىء',
          'صندوق التنمية والتشغيل',
          'المؤسسة العامة للغذاء والدواء',
          'دائرة المخابرات العامة',
          'أمانة عمان',
          'مخالفات السير',
          'سلطة منطقة العقبة الاقتصادية الخاصة',
          'مركز تكنولوجيا المعلومات الوطني',
          'وزارة التعليم العالي والبحث العلمي',
          'الجمارك الأردنية',
          'وزارة العمل',
          'وزارة السياحة',
          'مجمع اللغة العربيى الأردني',
          'دائرة الأحوال المدنية والجوازات',
          'وزارة التنمية الاجتماعية',
          'دفعات الجمارك الأردنية',
          ',وزارة الصحة',
          'وزارة الطاقة والثروة المعدنية',
          'دائرة الحج والعمرة',
          'هيئة تنظيم قطاع الطاقة والمعادن',
          'هيئة تنظيم قطاع الاتصالات',
          'وحدة تنسيق القبول الموحد',
          'وزارة الاستثمار',
          'سلطة اقليم البترا التنموي السياحي',
          'مديرية شؤون الضباط - طلبات التجنيد',
          'وزارة الأوقاف - زكاة',
          'هيئة تنشيط السياحة',
          'البنك المركزي همة وطن',
          'نظام الشراء الالكتروني الأردني',
          'وزارة السياحة عودة المغتربين',
          'وزارة التنمية الاجتماعية تبرع',
          'الضمان الاجتماعي - أفراد',
          'مديرية الدفاع المدني',
          'المجلس التمريضي الأردني',
          'مديرية الثقافة العسكرية',
          'مؤسسة تنمية أموال الأيتام',
          'مؤسسة التدريب المهني',
          'وزارة التربية والتعليم',
          'مؤسسة استثمار الموارز الوطنية وتنميتها',
          'وزارة الأوقاف والشؤون والمقدسات الإسلامية',
          'وزارة البيئة',
          'المنظومة الوطنية لمطالبات التأمين الصحي',
          'مؤسسة المواصفات والمقاييس',
          'شركة البريد الالكتروني',
          'وزارة الصحة - إدارة التأمين الصحي',
          'صندوق توفير البريد',
          'منطقة معان التنموية',
          'هيئة تنظيم النقل البحري',
          'هيئة الإعلام',
          'وزارة الصحة خدمة توصيل الأودية',
          'صندوق تسليف الفقة',
          'هيئة الأوراق المالية',
          'المركز الجغرافي الملكي الأردني',
          'شركة المدن الصناعية الأردنية',
          'هيئة تنظيم الطيران المدني',
          'مؤسسة الإقراض الزراعي',
          'القوات المسلحة الأردنية',
          'وزارة الزراعة'
        ],
        icon: AssetsPath.GOVERMENT_ICON,
      ),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_communication,
          subtitles: [
            'زين',
            'أورانج خلوي ونت وين ماكان',
            'أورانج انترنت',
            'أورانج الخط الثابت',
            'مدى للاتصاللات',
            'داماماكس',
            'فيتل الأردن',
            'اشحن خدمات انترنت',
            'بلينك نتوركس',
            'نايتل',
          ],
          icon: AssetsPath.COMMUNICATION_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_insurance,
          subtitles: [
            'المتحدة للتأمين',
            'نيوتن للتأمين',
            'شركة الشرق الأوسط للتأمين',
            'شركة المجموعة العربية الأوروبية للتأمين',
            'شركة التأمين العربية الأردن',
            'شركة المتوسط والخليج العربي',
            'الإتحاد الأردني لشركات التأمين',
            'شركة التأمين الوطنية',
            'الاتحاد العربي الدولي للتأمين - الأردن',
            'شركة الضامنون العرب للتـأمين',
            'شركة التأمين الأردنية م ع م',
            'المتحدة للتأمين',
            'نيوتن للتأمين',
            'شركة الشرق الأوسط للتأمين',
            'شركة المجموعة العربية الأوروبية للتأمين',
            'شركة التأمين العربية الأردن',
            'شركة المتوسط والخليج العربي',
            'الإتحاد الأردني لشركات التأمين',
            'شركة التأمين الوطنية',
            'الاتحاد العربي الدولي للتأمين - الأردن',
            'شركة العرب للتأمين على الحياة والحوادث',
            'شركة النسر العربي للتأمين',
            'شركة المنارة للتأمين',
            'شركة دلتا للتأمين',
            'شركة القدس للتأمين',
            'مجموعة الخليج للتأمين - الأردن',
            'شركة الأولى للتأمين',
            'المجموعة العربية الأردنية للتأمين',
            'الشركة الأردنية الفرنسية للتأمين',
            'شركة الأراضي المقدسة للتأمين م.ع.م'
          ],
          icon: AssetsPath.INSURANCE_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_bank,
          subtitles: [
            'البنك الاستثماري',
            'بنك المؤسسة العربية المصرفية',
            'بنك الاسكان',
            'بنك ستاندرد تشارتريد',
            'البنك التجاري الأردني',
            'بنك القاهرة عمان',
            'بنك الاتحاد',
            'بنك الأردن',
            'البنك العقاري المصري العربي',
            'البنك الأهلي الأردني',
            'بلينك',
            'كابيتال بنك',
          ],
          icon: AssetsPath.BANK_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_health,
          subtitles: [
            'الخدمات الطبية الملكية الأردنية',
            'المستشفى التخصصي',
            'مستودع البتراء للمواد الطبية',
            'طبكان',
            'مستشفى العبدلي',
            'شركة أدوية الحكمة د.م.م',
            'أوميت',
            'مشتشفى الأردن',
            'الطبي',
            'المركز الوطني للسكري والغدد الصم والوراثة'
          ],
          icon: AssetsPath.HEALTH_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_education,
          subtitles: [
            'مدارس قرطاج الدولية',
            'أكاديمية نورث سيتي',
            'مدرسة المواهب الانجليزية',
            'أكاديمية الحضارات العالمية النيات',
            'مدارس الشوف الدولية',
            'مدارس الحكمة',
            'أكاديمية ومدارس الاحتراف الدولية',
            'المدارس المستقلة الدولية - فرع المطار',
            'المدارس المشتقلة الدولية - فرع خلدا',
            'مدارس البشر الدولية',
            'مدسة أكاديمية خليل الرحمن - النزهة',
            'مدرسة أكاديمية خليل الرحمن - العقبة',
            'مدرسة أكاديمية خليل الرحمن - التاج',
            'مدرسة أكاديمية خليل الرحمن -الصويفية',
            'روضة ومدارس كلية السعادة',
            'مدارس أكاديمية جولدن ساندس الوطنية',
            'مدرسة وروضة روابي القدس',
            'كلية لومينوس للحوسبة المتقدمة',
            'مدارس الجزيرة',
            'مدارس الأمد التكنولوجية',
            'روضة ومارس المدار الدولية',
            'مدارس ليفانت الدولية',
            'كروان أكاديمي العالمية',
            'أكاديمية التركية الدولية',
            'روضة ومدارس الرأي',
            'الأكاديمية الأردنية للدراسات البحرية',
            'مدارس التلال الذهبية',
            'مدارس و روضة المحمدية',
            'مدارس أكسفورد',
            'مدارس قرطبة الدولية',
            'مدارس الأمم الابداعية',
            'مدارس العقيق العالمية',
            'مدارس الإبداع التربوي',
            'كلية الزرقاء التقنية المتوسطة',
            'شركة مدارس الإتحاد',
            'أكاديمية المستوى العالي',
            'مركز أبو غزالة الثقافي',
            'أكاديمية ومدارس نجمة الفريد',
            'مدارس الريادة الدولية',
            'جامعة اربد الأهلية',
            'شركة المدارس العمرية',
            'المدارس العالمية',
            'مدارس النظم الحديثة',
            'روضة ومدرسة الراجح',
            'روضة ومدارس أكاديمية الإتفاق الدولية',
            'مدرسة المسار',
            'مدارس جامعة الزرقاء',
            'مدارس الانجليزية الحديثة',
            'شركة كينغز أكاديمي',
            'مدرسة المنار الثانوية',
            'مدارس إربد النموذجية',
            'مدرسة راهبات الوردية مرج الحمام',
            'المدارس الأردنية الدولية',
            'إمد إيست',
            'مدرسة اليوبيل',
            'أكاديمية القادة الدولية',
            'جامعة الزرقاء',
            'الكلية العلمية الاسلامية - الجبيهة',
            'المدرسة المعمدانية عمان',
            'مدرسة عمان الوطنية',
            'أكاديمية الحضارات العالمية طارق',
            'أكاديمية صناع التفوق',
            'جامعة الزيتونة الأردنية',
            'أكاديمية مدى الدولية',
            'مركز لنغوارت  للغات والتدريب'
                'الكلية العلمية الإسلامية جبل عمان',
            'المدارس العصرية',
            'مدارس العصرية',
            'مدارس التربية الريادية',
            'مدارس فلادلفيا الوطنية',
            'مدارس ميار الدولية',
            'جامعة الإسراء',
            'شركة لومينوس لصناعة الأفلام والإعلام',
            'كلية لومينوس الجامعية التقنية اربد',
            'كلية لومينوس الجامعية التقنية عمان',
            'شركة لومينوس لافاللفن وعلوم التجميل',
            'جامعة العلوم الإسلامية العالمية',
            'جامعة عمان الأهلية',
            'أكاديمية الحفاظ',
            'هلو وورلد كيدز',
            'مدارس الحصاد التربوي',
            'جامعة البترا',
            'جامعة فيلادلفيا',
            'جامعة الشرق الأوسط',
            'جامعة جدارا',
            'جامعة البلقاء التطبيقية',
            'مدارس أكاديمية ريتال الدولية',
            'جامعة الحسين التقنية',
            'جامعة عمان العربية',
            'جامعة الحسين بن طلال',
            'مدارس الرضوان',
            'مدرسة المشرق الدولية',
            'جامعة العلوم التطبيقية',
            'الجامعة العربية المفتوحة',
            'جامعة اليرموك',
            'جامعة الطفيلة التقنية',
            'الجامعة الهاشمية',
            'معهد الدراسات المصرفية',
            'روضة الأهلية والمطران',
            'المدرسة الأهلية للبنات',
            'مدرسة المطران للبنين'
          ],
          icon: AssetsPath.EDUCATION_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_water_and_electricity,
          subtitles: [],
          icon: AssetsPath.WATER_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_travelling,
          subtitles: [],
          icon: AssetsPath.TRAVELLING_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_advertisment,
          subtitles: [],
          icon: AssetsPath.ADVERTISMENT_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_organizations,
          subtitles: [],
          icon: AssetsPath.ORGANIZATIONS_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_gas,
          subtitles: [],
          icon: AssetsPath.GAS_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_finance,
          subtitles: [],
          icon: AssetsPath.FINANCE_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_ecommerce,
          subtitles: [],
          icon: AssetsPath.ECOMMERCE_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_charity,
          subtitles: [],
          icon: AssetsPath.CHARITY_ICON),
      BasicTile(
          title: AppLocalizations.of(context)!.pay_bills_services,
          subtitles: [],
          icon: AssetsPath.SERVICES_ICON),
    ];
    return dataPayBills;
  }
}