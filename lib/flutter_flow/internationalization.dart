import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ml', 'mr', 'ta'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? mlText = '',
    String? mrText = '',
    String? taText = '',
  }) =>
      [enText, mlText, mrText, taText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // UTPFamilyDashboard
  {
    '068qjf6h': {
      'en': 'Below is a summary ',
      'ml': 'ഒരു സംഗ്രഹം ചുവടെയുണ്ട്',
      'mr': 'खाली एक सारांश आहे',
      'ta': 'கீழே ஒரு சுருக்கம் உள்ளது',
    },
    '4na2sfmt': {
      'en': 'Days until next Hearing',
      'ml': 'അടുത്ത ഹിയറിംഗിന് ദിവസങ്ങൾ',
      'mr': 'पुढील सुनावणीपर्यंत दिवस',
      'ta': 'அடுத்த விசாரணைக்கு நாட்கள்',
    },
    'qtpxxb7z': {
      'en': '',
      'ml': '24',
      'mr': '२४',
      'ta': '24',
    },
    'acquih38': {
      'en': 'Lawyer Details',
      'ml': 'അഭിഭാഷകന്റെ വിശദാംശങ്ങൾ',
      'mr': 'वकील तपशील',
      'ta': 'வழக்கறிஞர் விவரங்கள்',
    },
    'h73ss3dy': {
      'en': '',
      'ml': 'അശോക് ദേശായി',
      'mr': 'अशोक देसाई',
      'ta': 'அசோக் தேசாய்',
    },
    'ooxt5rxl': {
      'en': 'More Details',
      'ml': 'കൂടുതൽ വിശദാംശങ്ങൾ',
      'mr': 'अधिक माहितीसाठी',
      'ta': 'கூடுதல் தகவல்கள்',
    },
    'epvbqbaj': {
      'en': 'Case Status',
      'ml': 'കേസ് നില',
      'mr': 'केसची स्थिती',
      'ta': 'வழக்கு நிலை',
    },
    'zgns4xqk': {
      'en': 'Details',
      'ml': 'വിശദാംശങ്ങൾ',
      'mr': 'तपशील',
      'ta': 'விவரங்கள்',
    },
    'mvidp55d': {
      'en': 'Chatbot',
      'ml': 'ചാറ്റ്ബോട്ട്',
      'mr': 'चॅटबॉट',
      'ta': 'சாட்போட்',
    },
    'vbo0u8gd': {
      'en': 'Details',
      'ml': 'വിശദാംശങ്ങൾ',
      'mr': 'तपशील',
      'ta': 'விவரங்கள்',
    },
    '9ifzey40': {
      'en': 'Lawyer Communication',
      'ml': 'അഭിഭാഷക ആശയവിനിമയം',
      'mr': 'वकील संप्रेषण',
      'ta': 'வழக்கறிஞர் தொடர்பு',
    },
    '5u8uhzw2': {
      'en': 'Dashboard',
      'ml': 'ഡാഷ്ബോർഡ്',
      'mr': 'डॅशबोर्ड',
      'ta': 'டாஷ்போர்டு',
    },
    'jwz7qadr': {
      'en': 'Dashboard',
      'ml': 'ഡാഷ്ബോർഡ്',
      'mr': 'डॅशबोर्ड',
      'ta': 'டாஷ்போர்டு',
    },
  },
  // LawyerPage
  {
    '67xgthju': {
      'en': 'Ashok Desai',
      'ml': 'അശോക് ദേശായി',
      'mr': 'अशोक देसाई',
      'ta': 'அசோக் தேசாய்',
    },
    'lsktvtnf': {
      'en': 'Contact Number: ',
      'ml': 'ബന്ധപ്പെടേണ്ട നമ്പർ: 1234567890',
      'mr': 'संपर्क क्रमांक: 1234567890',
      'ta': 'தொடர்பு எண்: 1234567890',
    },
    'ohbnhlxs': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'tp2a17x0': {
      'en': 'Bar ID: ',
      'ml': 'അഭിഭാഷക ഐഡി: 987654321',
      'mr': 'वकील आयडी: 987654321',
      'ta': 'வழக்கறிஞர் ஐடி: 987654321',
    },
    'p9h7ydyu': {
      'en': 'Back',
      'ml': 'തിരികെ',
      'mr': 'मागे',
      'ta': 'மீண்டும்',
    },
    'qz45ij0b': {
      'en': 'Lawyer Details',
      'ml': '',
      'mr': '',
      'ta': '',
    },
  },
  // Profile
  {
    'bu14ffq7': {
      'en': '',
      'ml': 'ഡേവിഡ് ജെറോം',
      'mr': 'डेव्हिड जेरोम',
      'ta': 'டேவிட் ஜெரோம்',
    },
    '3ofhf4sh': {
      'en': 'CASE ID: ',
      'ml': 'തടവുകാരൻ ഐഡി',
      'mr': 'कैदी आयडी',
      'ta': 'கைதி ஐடி',
    },
    'sptxd3qk': {
      'en': '',
      'ml': 'തടവുകാരൻ ഐഡി',
      'mr': 'कैदी आयडी',
      'ta': 'கைதி ஐடி',
    },
    '7hm6mmmp': {
      'en': 'PRISONER ID: ',
      'ml': 'തടവുകാരൻ ഐഡി',
      'mr': 'कैदी आयडी',
      'ta': 'கைதி ஐடி',
    },
    'jk9rcvl4': {
      'en': '',
      'ml': 'തടവുകാരൻ ഐഡി',
      'mr': 'कैदी आयडी',
      'ta': 'கைதி ஐடி',
    },
    's60szyhc': {
      'en': 'Documents',
      'ml': 'പ്രമാണങ്ങൾ',
      'mr': 'कागदपत्रे',
      'ta': 'ஆவணங்கள்',
    },
    'tl1l9utw': {
      'en': 'Profile',
      'ml': 'പ്രൊഫൈൽ',
      'mr': 'प्रोफाइल',
      'ta': 'சுயவிவரம்',
    },
    'axu8rvh1': {
      'en': 'Phone Number',
      'ml': 'ഫോൺ നമ്പർ',
      'mr': 'फोन नंबर',
      'ta': 'தொலைபேசி எண்',
    },
    'yo3hp5o1': {
      'en': '',
      'ml': 'ഇംഗ്ലീഷ് (ഇംഗ്ലീഷ്)',
      'mr': 'इंग्रजी (eng)',
      'ta': 'ஆங்கிலம் (eng)',
    },
    'i0jju8fe': {
      'en': 'Aadhar Number',
      'ml': 'ആധാർ നമ്പർ',
      'mr': 'आधार क्रमांक',
      'ta': 'ஆதார் எண்',
    },
    'f6qzdz6z': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'pf44ybw5': {
      'en': 'Age',
      'ml': 'പ്രായം',
      'mr': 'वय',
      'ta': 'வயது',
    },
    'vky4m5m3': {
      'en': '',
      'ml': '18',
      'mr': '१८',
      'ta': '18',
    },
    'j3enr6bx': {
      'en': 'Languages',
      'ml': 'ഭാഷകൾ',
      'mr': 'भाषा',
      'ta': 'மொழிகள்',
    },
    'aiu43rkx': {
      'en': '',
      'ml': 'ഇംഗ്ലീഷ്, മറാത്തി',
      'mr': 'इंग्रजी, मराठी',
      'ta': 'ஆங்கிலம், மராத்தி',
    },
    'uvpns8m7': {
      'en': 'Logout',
      'ml': 'പുറത്തുകടക്കുക',
      'mr': 'बाहेर पडणे',
      'ta': 'வெளியேறு',
    },
    'maebqolm': {
      'en': 'Profile',
      'ml': 'വീട്',
      'mr': 'मुख्यपृष्ठ',
      'ta': 'வீடு',
    },
  },
  // Resources
  {
    'w7wedfc1': {
      'en': 'Resources',
      'ml': 'വിഭവങ്ങൾ',
      'mr': 'संसाधने',
      'ta': 'வளங்கள்',
    },
    'rohndvrz': {
      'en': 'Search all articles...',
      'ml': 'എല്ലാ ലേഖനങ്ങളും തിരയുക...',
      'mr': 'सर्व लेख शोधा...',
      'ta': 'அனைத்து கட்டுரைகளையும் தேடு...',
    },
    '4bpcd3mx': {
      'en': 'Ramkrishna Mission',
      'ml': 'എച്ച്എസ്ബിസി ഉപഭോക്തൃ വായ്പയിലേക്ക് തിരിച്ചുവരുന്നു...',
      'mr': 'त्यानुसार HSBC आमच्यामध्ये ग्राहक कर्जामध्ये परत येत आहे...',
      'ta': 'எச்எஸ்பிசி மீண்டும் நுகர்வோர் கடனில் இறங்குகிறது...',
    },
    'wm5wcnya': {
      'en': 'Read Now',
      'ml': 'ഇപ്പോൾ വായിക്കുക',
      'mr': 'आता वाचा',
      'ta': 'இப்போது படியுங்கள்',
    },
    'm3kk2f3g': {
      'en': 'Kerala Knowledge Economy Mission',
      'ml': 'എച്ച്എസ്ബിസി ഉപഭോക്തൃ വായ്പയിലേക്ക് തിരിച്ചുവരുന്നു...',
      'mr': 'त्यानुसार HSBC आमच्यामध्ये ग्राहक कर्जामध्ये परत येत आहे...',
      'ta': 'எச்எஸ்பிசி மீண்டும் நுகர்வோர் கடனில் இறங்குகிறது...',
    },
    'nu5mrhkh': {
      'en': 'Read Now',
      'ml': 'ഇപ്പോൾ വായിക്കുക',
      'mr': 'आता वाचा',
      'ta': 'இப்போது படியுங்கள்',
    },
    'h1wlqd48': {
      'en': 'Karnataka German           \nTechnical Training Institute',
      'ml': 'എച്ച്എസ്ബിസി ഉപഭോക്തൃ വായ്പയിലേക്ക് തിരിച്ചുവരുന്നു...',
      'mr': 'त्यानुसार HSBC आमच्यामध्ये ग्राहक कर्जामध्ये परत येत आहे...',
      'ta': 'எச்எஸ்பிசி மீண்டும் நுகர்வோர் கடனில் இறங்குகிறது...',
    },
    '7jhxb9jb': {
      'en': 'Read Now',
      'ml': 'ഇപ്പോൾ വായിക്കുക',
      'mr': 'आता वाचा',
      'ta': 'இப்போது படியுங்கள்',
    },
    '2omaqw66': {
      'en': 'Home',
      'ml': 'വീട്',
      'mr': 'मुख्यपृष्ठ',
      'ta': 'வீடு',
    },
  },
  // DocumentUploads
  {
    '39ewgwzo': {
      'en': 'Select a document to upload',
      'ml': 'അപ്‌ലോഡ് ചെയ്യാൻ ഒരു പ്രമാണം തിരഞ്ഞെടുക്കുക',
      'mr': 'अपलोड करण्यासाठी एक दस्तऐवज निवडा',
      'ta': 'பதிவேற்ற ஆவணத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'd64mst10': {
      'en': 'Browse Files',
      'ml': 'ഫയലുകൾ ബ്രൗസ് ചെയ്യുക',
      'mr': 'फायली ब्राउझ करा',
      'ta': 'கோப்புகளை உலாவவும்',
    },
    'ka4lhcxe': {
      'en': 'Document Upload',
      'ml': 'ഡോക്യുമെന്റ് അപ്‌ലോഡ്',
      'mr': 'दस्तऐवज अपलोड करा',
      'ta': 'ஆவணப் பதிவேற்றம்',
    },
  },
  // homeLoginScreen
  {
    'l9huizmr': {
      'en': 'TRIALS',
      'ml': 'Trials',
      'mr': 'Trials',
      'ta': '',
    },
    'q7sjazbe': {
      'en': 'Lawyer',
      'ml': 'അഭിഭാഷകൻ',
      'mr': 'वकील',
      'ta': 'வழக்கறிஞர்',
    },
    '0lbcksdf': {
      'en': 'Welcome ',
      'ml': 'സ്വാഗതം',
      'mr': 'स्वागत आहे',
      'ta': 'வரவேற்பு',
    },
    'hk9svi5q': {
      'en': 'Enter  your User ID to continue',
      'ml': 'തുടരാൻ നിങ്ങളുടെ തടവുകാരൻ ഐഡി നൽകുക',
      'mr': 'सुरू ठेवण्यासाठी तुमचा कैदी आयडी एंटर करा',
      'ta': 'தொடர, உங்கள் கைதி ஐடியை உள்ளிடவும்',
    },
    '18fht4j0': {
      'en': 'User ID',
      'ml': 'ഇമെയിൽ',
      'mr': 'ईमेल',
      'ta': 'மின்னஞ்சல்',
    },
    'mw68b7p3': {
      'en': 'Password',
      'ml': 'Password',
      'mr': 'पासवर्ड',
      'ta': 'கடவுச்சொல்',
    },
    'v9mfvh0n': {
      'en': 'Sign In',
      'ml': 'സൈൻ ഇൻ',
      'mr': 'साइन इन करा',
      'ta': 'உள்நுழையவும்',
    },
    'n8tov4if': {
      'en': 'Not a User? ',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'rgcwriez': {
      'en': 'Sign Up ',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'k25flmxi': {
      'en': 'UTP',
      'ml': 'യു.ടി.പി',
      'mr': 'UTP',
      'ta': 'யுடிபி',
    },
    'e3x9i8j6': {
      'en': 'Welcome ',
      'ml': 'സ്വാഗതം',
      'mr': 'स्वागत आहे',
      'ta': 'வரவேற்பு',
    },
    'r34xyqzj': {
      'en': 'Enter  your Prisoner ID to continue',
      'ml': 'തുടരാൻ നിങ്ങളുടെ തടവുകാരൻ ഐഡി നൽകുക',
      'mr': 'सुरू ठेवण्यासाठी तुमचा कैदी आयडी एंटर करा',
      'ta': 'தொடர, உங்கள் கைதி ஐடியை உள்ளிடவும்',
    },
    'gjxdllnc': {
      'en': 'Prisoner ID',
      'ml': 'ഇമെയിൽ',
      'mr': 'ईमेल',
      'ta': 'மின்னஞ்சல்',
    },
    'z0sgouxe': {
      'en': 'Sign In',
      'ml': 'സൈൻ ഇൻ',
      'mr': 'साइन इन करा',
      'ta': 'உள்நுழையவும்',
    },
    'ty590z60': {
      'en': 'UTP Family',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'r823wl5c': {
      'en': 'Welcome ',
      'ml': 'സ്വാഗതം',
      'mr': 'स्वागत आहे',
      'ta': 'வரவேற்பு',
    },
    'tpoz65me': {
      'en': 'Enter  your Prisoner ID to continue',
      'ml': 'തുടരാൻ നിങ്ങളുടെ തടവുകാരൻ ഐഡി നൽകുക',
      'mr': 'सुरू ठेवण्यासाठी तुमचा कैदी आयडी एंटर करा',
      'ta': 'தொடர, உங்கள் கைதி ஐடியை உள்ளிடவும்',
    },
    'p2ae5hno': {
      'en': 'Prisoner ID',
      'ml': 'ഇമെയിൽ',
      'mr': 'ईमेल',
      'ta': 'மின்னஞ்சல்',
    },
    'ekisvfta': {
      'en': 'Password',
      'ml': 'Password',
      'mr': 'पासवर्ड',
      'ta': 'கடவுச்சொல்',
    },
    'lc73kidr': {
      'en': 'Sign In',
      'ml': 'സൈൻ ഇൻ',
      'mr': 'साइन इन करा',
      'ta': 'உள்நுழையவும்',
    },
    'iqtfd6br': {
      'en': 'Home',
      'ml': 'വീട്',
      'mr': 'मुख्यपृष्ठ',
      'ta': 'வீடு',
    },
  },
  // Lawyer_UTPList
  {
    'adizfu8n': {
      'en': 'UTPs Assigned',
      'ml': 'യുടിപികൾ അസൈൻ ചെയ്‌തു',
      'mr': 'UTP नियुक्त केले',
      'ta': 'UTPகள் ஒதுக்கப்பட்டுள்ளன',
    },
    '2qdou9j3': {
      'en': 'Your Assigned UTPs - ',
      'ml': 'നിങ്ങളുടെ നിയുക്ത യുടിപികൾ -',
      'mr': 'तुमचे नियुक्त UTP -',
      'ta': 'உங்களுக்கு ஒதுக்கப்பட்ட UTPகள் -',
    },
    'sdhu1j9s': {
      'en': 'Create New UTP',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    '8fgn11jn': {
      'en': 'Home',
      'ml': 'വീട്',
      'mr': 'मुख्यपृष्ठ',
      'ta': 'வீடு',
    },
  },
  // Lawyer_Dashboard
  {
    'hjd9hoz2': {
      'en': 'Below are the details ',
      'ml': 'വിശദാംശങ്ങൾ താഴെ',
      'mr': 'खाली तपशील आहेत',
      'ta': 'கீழே விவரங்கள் உள்ளன',
    },
    'aoejztp5': {
      'en': 'Days until next hearing',
      'ml': 'അടുത്ത വാദം കേൾക്കാൻ ദിവസങ്ങൾ',
      'mr': 'पुढील सुनावणीपर्यंत दिवस',
      'ta': 'அடுத்த விசாரணைக்கு நாட்கள்',
    },
    'rldzsv9m': {
      'en': '',
      'ml': '24',
      'mr': '२४',
      'ta': '24',
    },
    'y31ok1kj': {
      'en': 'UTP Information',
      'ml': 'UTP വിശദാംശങ്ങൾ',
      'mr': 'UTP तपशील',
      'ta': 'UTP விவரங்கள்',
    },
    'xx0g6tft': {
      'en': 'UTP Details',
      'ml': 'UTP വിശദാംശങ്ങൾ',
      'mr': 'UTP तपशील',
      'ta': 'UTP விவரங்கள்',
    },
    'sthps40h': {
      'en': 'Messages',
      'ml': 'സന്ദേശങ്ങൾ',
      'mr': 'संदेश',
      'ta': 'செய்திகள்',
    },
    'oriemcf0': {
      'en': 'Document View',
      'ml': 'പ്രമാണ കാഴ്ച',
      'mr': 'दस्तऐवज दृश्य',
      'ta': 'ஆவணக் காட்சி',
    },
    'kq11nupb': {
      'en': 'Below is an a summary of activity.',
      'ml': 'പ്രവർത്തനത്തിന്റെ ഒരു സംഗ്രഹം ചുവടെയുണ്ട്.',
      'mr': 'खाली क्रियाकलापांचा सारांश आहे.',
      'ta': 'செயல்பாட்டின் சுருக்கம் கீழே உள்ளது.',
    },
    'n9ugcc8m': {
      'en': 'Document Genration',
      'ml': 'പ്രമാണ കാഴ്ച',
      'mr': 'दस्तऐवज दृश्य',
      'ta': 'ஆவணக் காட்சி',
    },
    'seznw9nk': {
      'en': 'Generate nessary documents',
      'ml': 'പ്രവർത്തനത്തിന്റെ ഒരു സംഗ്രഹം ചുവടെയുണ്ട്.',
      'mr': 'खाली क्रियाकलापांचा सारांश आहे.',
      'ta': 'செயல்பாட்டின் சுருக்கம் கீழே உள்ளது.',
    },
    'zg5dwmgj': {
      'en': '',
      'ml': 'ഹർഷാദ് മേത്ത',
      'mr': 'हर्षद मेहता',
      'ta': 'ஹர்ஷத் மேத்தா',
    },
    '1zzc10y3': {
      'en': '',
      'ml': '__',
      'mr': '__',
      'ta': '__',
    },
  },
  // UPT_CheckCNR
  {
    'jc9nzowv': {
      'en': 'Check your Case Status',
      'ml': 'നിങ്ങളുടെ കേസ് നില പരിശോധിക്കുക',
      'mr': 'तुमची केस स्टेटस तपासा',
      'ta': 'உங்கள் வழக்கு நிலையைச் சரிபார்க்கவும்',
    },
    'vlgaiem6': {
      'en': 'Home',
      'ml': 'വീട്',
      'mr': 'मुख्यपृष्ठ',
      'ta': 'வீடு',
    },
  },
  // ChatBot
  {
    'le7xi61y': {
      'en': 'LawInfo Bot',
      'ml': 'ലോഇൻഫോ ബോട്ട്',
      'mr': 'LawInfo बॉट',
      'ta': 'LawInfo Bot',
    },
    'ffyn4ed6': {
      'en': 'ChatBot',
      'ml': 'ചാറ്റ്ബോട്ട്',
      'mr': 'चॅटबॉट',
      'ta': 'ChatBot',
    },
  },
  // Lawyer_Account_CreateforUTP
  {
    'n7xnf23h': {
      'en': 'Trials',
      'ml': 'പരീക്ഷണങ്ങൾ',
      'mr': 'चाचण्या',
      'ta': 'சோதனைகள்',
    },
    'jp2fax7d': {
      'en': 'Create an account for the UTP and UTP Family',
      'ml': 'UTP-യ്‌ക്കായി ഒരു അക്കൗണ്ട് സൃഷ്‌ടിക്കുക',
      'mr': 'UTP साठी खाते तयार करा',
      'ta': 'UTP க்காக ஒரு கணக்கை உருவாக்கவும்',
    },
    'v495llun': {
      'en': 'Fill in the details below',
      'ml': 'ചുവടെയുള്ള വിശദാംശങ്ങൾ പൂരിപ്പിക്കുക',
      'mr': 'खालील तपशील भरा',
      'ta': 'கீழே உள்ள விவரங்களை நிரப்பவும்',
    },
    'slp64cjv': {
      'en': 'UTP Name',
      'ml': 'പേര്',
      'mr': 'नाव',
      'ta': 'பெயர்',
    },
    'y5rsho5b': {
      'en': 'Prison',
      'ml': 'തടവുകാരൻ ഐഡി',
      'mr': 'कैदी आयडी',
      'ta': 'கைதி ஐடி',
    },
    'h7ynklow': {
      'en': 'Case ID',
      'ml': 'പേര്',
      'mr': 'नाव',
      'ta': 'பெயர்',
    },
    'lb48txm4': {
      'en': 'Password',
      'ml': 'Password',
      'mr': 'पासवर्ड',
      'ta': 'கடவுச்சொல்',
    },
    'wfstespd': {
      'en': 'Confirm Password',
      'ml': 'പാസ്വേഡ് സ്ഥിരീകരിക്കുക',
      'mr': 'पासवर्डची पुष्टी करा',
      'ta': 'கடவுச்சொல்லை உறுதிப்படுத்தவும்',
    },
    '2xckiwra': {
      'en': 'Phone Number',
      'ml': 'ഫോൺ നമ്പർ',
      'mr': 'फोन नंबर',
      'ta': 'தொலைபேசி எண்',
    },
    'v16huy06': {
      'en': 'Aadhar Number',
      'ml': 'ആധാർ നമ്പർ',
      'mr': 'आधार क्रमांक',
      'ta': 'ஆதார் எண்',
    },
    'djoou9n0': {
      'en': 'Create Account',
      'ml': 'അക്കൗണ്ട് സൃഷ്ടിക്കുക',
      'mr': 'खाते तयार करा',
      'ta': 'உங்கள் கணக்கை துவங்குங்கள்',
    },
    '3n9pme6c': {
      'en': 'Already have an account? ',
      'ml': 'ഇതിനകം ഒരു അക്കൗണ്ട് ഉണ്ടോ?',
      'mr': 'आधीपासूनच एक खाते आहे?',
      'ta': 'ஏற்கனவே ஒரு கணக்கு உள்ளதா?',
    },
    'owk8m401': {
      'en': 'Sign In here',
      'ml': 'ഇവിടെ സൈൻ ഇൻ ചെയ്യുക',
      'mr': 'येथे साइन इन करा',
      'ta': 'இங்கே உள்நுழையவும்',
    },
    'dx82o1km': {
      'en': 'Home',
      'ml': 'വീട്',
      'mr': 'मुख्यपृष्ठ',
      'ta': 'வீடு',
    },
  },
  // Lawyer_UTPProfile
  {
    'jcsiwsm6': {
      'en': '',
      'ml': 'ഹർഷാദ് മേത്ത',
      'mr': 'हर्षद मेहता',
      'ta': 'ஹர்ஷத் மேத்தா',
    },
    'vcyr45sb': {
      'en': 'Profile',
      'ml': 'പ്രൊഫൈൽ',
      'mr': 'प्रोफाइल',
      'ta': 'சுயவிவரம்',
    },
    'ry71l9nd': {
      'en': 'Phone Number',
      'ml': 'ഫോൺ നമ്പർ',
      'mr': 'फोन नंबर',
      'ta': 'தொலைபேசி எண்',
    },
    '2u4uda5a': {
      'en': '',
      'ml': '1234567890',
      'mr': '१२३४५६७८९०',
      'ta': '1234567890',
    },
    'lxmm3f1s': {
      'en': 'Password for UTP',
      'ml': 'UTP-യുടെ പാസ്‌വേഡ്',
      'mr': 'UTP साठी पासवर्ड',
      'ta': 'UTPக்கான கடவுச்சொல்',
    },
    'zb1fiixj': {
      'en': '',
      'ml': '1234567890',
      'mr': '१२३४५६७८९०',
      'ta': '1234567890',
    },
    'dljs3v1g': {
      'en': 'aadhar Number',
      'ml': 'ആധാർ നമ്പർ',
      'mr': 'आधार क्रमांक',
      'ta': 'ஆதார் எண்',
    },
    'urhjdebq': {
      'en': '',
      'ml': '12345678910',
      'mr': '१२३४५६७८९१०',
      'ta': '12345678910',
    },
    '2mixadcb': {
      'en': 'Switch UTP',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    '5ok7vk7r': {
      'en': 'Home',
      'ml': 'വീട്',
      'mr': 'मुख्यपृष्ठ',
      'ta': 'வீடு',
    },
  },
  // Lawyer_SuccessPage
  {
    'gta70wfg': {
      'en': 'Account Created!',
      'ml': 'അക്കൗണ്ട് സൃഷ്ടിച്ചു!',
      'mr': 'खाते तयार केले!',
      'ta': 'கணக்கு உருவாக்கப்பட்டது!',
    },
    'z9110f3s': {
      'en': 'Move Ahead',
      'ml': 'മുന്നോട്ട് നീങ്ങുക',
      'mr': 'पुढे जा',
      'ta': 'முன்னோக்கி நகர்த்தவும்',
    },
    '6yffeghs': {
      'en': 'Home',
      'ml': 'വീട്',
      'mr': 'मुख्यपृष्ठ',
      'ta': 'வீடு',
    },
  },
  // UTP_RamKrishna
  {
    'v4rqwnu6': {
      'en': 'Ramkrishna Mission',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'xap8kpn6': {
      'en': 'Home',
      'ml': '',
      'mr': '',
      'ta': '',
    },
  },
  // UTP_KKEM
  {
    'lgjqi8uw': {
      'en': 'Kerala Knowledge Economy Mission',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'kgizg9js': {
      'en': 'Home',
      'ml': '',
      'mr': '',
      'ta': '',
    },
  },
  // UTP_KGTTI
  {
    'ky9bsh5q': {
      'en': 'Karataka German Training',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'wk65t5ay': {
      'en': 'Home',
      'ml': '',
      'mr': '',
      'ta': '',
    },
  },
  // lawyerAccountCreation
  {
    'rpco6wwp': {
      'en': 'Trials',
      'ml': 'പരീക്ഷണങ്ങൾ',
      'mr': 'चाचण्या',
      'ta': 'சோதனைகள்',
    },
    'tp2ytgmx': {
      'en': 'Create Account for Lawyer',
      'ml': 'UTP-യ്‌ക്കായി ഒരു അക്കൗണ്ട് സൃഷ്‌ടിക്കുക',
      'mr': 'UTP साठी खाते तयार करा',
      'ta': 'UTP க்காக ஒரு கணக்கை உருவாக்கவும்',
    },
    '85rkcvqp': {
      'en': 'Fill in the details below',
      'ml': 'ചുവടെയുള്ള വിശദാംശങ്ങൾ പൂരിപ്പിക്കുക',
      'mr': 'खालील तपशील भरा',
      'ta': 'கீழே உள்ள விவரங்களை நிரப்பவும்',
    },
    'da1yovx5': {
      'en': 'Full Name',
      'ml': 'പേര്',
      'mr': 'नाव',
      'ta': 'பெயர்',
    },
    'etkh3vd4': {
      'en': 'User Name',
      'ml': 'പേര്',
      'mr': 'नाव',
      'ta': 'பெயர்',
    },
    '1jj17l26': {
      'en': 'Email',
      'ml': 'പേര്',
      'mr': 'नाव',
      'ta': 'பெயர்',
    },
    '6zl524j2': {
      'en': 'BAR ID',
      'ml': 'പേര്',
      'mr': 'नाव',
      'ta': 'பெயர்',
    },
    '13ymrjfl': {
      'en': 'Password',
      'ml': 'Password',
      'mr': 'पासवर्ड',
      'ta': 'கடவுச்சொல்',
    },
    'emkvdaj6': {
      'en': 'Confirm Password',
      'ml': 'പാസ്വേഡ് സ്ഥിരീകരിക്കുക',
      'mr': 'पासवर्डची पुष्टी करा',
      'ta': 'கடவுச்சொல்லை உறுதிப்படுத்தவும்',
    },
    '5pjvoe6x': {
      'en': 'Phone Number',
      'ml': 'ഫോൺ നമ്പർ',
      'mr': 'फोन नंबर',
      'ta': 'தொலைபேசி எண்',
    },
    'rwz91l1f': {
      'en': 'Aadhar Number',
      'ml': 'ആധാർ നമ്പർ',
      'mr': 'आधार क्रमांक',
      'ta': 'ஆதார் எண்',
    },
    '2qs8xc6d': {
      'en': 'Create Account',
      'ml': 'അക്കൗണ്ട് സൃഷ്ടിക്കുക',
      'mr': 'खाते तयार करा',
      'ta': 'உங்கள் கணக்கை துவங்குங்கள்',
    },
    'mcffvpo3': {
      'en': 'Already have an account? ',
      'ml': 'ഇതിനകം ഒരു അക്കൗണ്ട് ഉണ്ടോ?',
      'mr': 'आधीपासूनच एक खाते आहे?',
      'ta': 'ஏற்கனவே ஒரு கணக்கு உள்ளதா?',
    },
    'anj87gir': {
      'en': 'Sign In here',
      'ml': 'ഇവിടെ സൈൻ ഇൻ ചെയ്യുക',
      'mr': 'येथे साइन इन करा',
      'ta': 'இங்கே உள்நுழையவும்',
    },
    'czy8f1hq': {
      'en': 'Home',
      'ml': 'വീട്',
      'mr': 'मुख्यपृष्ठ',
      'ta': 'வீடு',
    },
  },
  // UTPDashboad
  {
    'x4ekv7hc': {
      'en': 'Below is a summary ',
      'ml': 'ഒരു സംഗ്രഹം ചുവടെയുണ്ട്',
      'mr': 'खाली एक सारांश आहे',
      'ta': 'கீழே ஒரு சுருக்கம் உள்ளது',
    },
    'i5weu2rb': {
      'en': 'Days until next Hearing',
      'ml': 'അടുത്ത ഹിയറിംഗിന് ദിവസങ്ങൾ',
      'mr': 'पुढील सुनावणीपर्यंत दिवस',
      'ta': 'அடுத்த விசாரணைக்கு நாட்கள்',
    },
    'gdlk5ee0': {
      'en': '',
      'ml': '24',
      'mr': '२४',
      'ta': '24',
    },
    'wolpfjkt': {
      'en': 'Lawyer Details',
      'ml': 'അഭിഭാഷകന്റെ വിശദാംശങ്ങൾ',
      'mr': 'वकील तपशील',
      'ta': 'வழக்கறிஞர் விவரங்கள்',
    },
    'nhv0x580': {
      'en': '',
      'ml': 'അശോക് ദേശായി',
      'mr': 'अशोक देसाई',
      'ta': 'அசோக் தேசாய்',
    },
    'qa2t0fqe': {
      'en': 'Case Status',
      'ml': 'കേസ് നില',
      'mr': 'केसची स्थिती',
      'ta': 'வழக்கு நிலை',
    },
    'i6e9u192': {
      'en': 'Details',
      'ml': 'വിശദാംശങ്ങൾ',
      'mr': 'तपशील',
      'ta': 'விவரங்கள்',
    },
    '30lf18wh': {
      'en': 'Helpful Resources',
      'ml': 'അഭിഭാഷക ആശയവിനിമയം',
      'mr': 'वकील संप्रेषण',
      'ta': 'வழக்கறிஞர் தொடர்பு',
    },
    '4i9h2whd': {
      'en': 'Details',
      'ml': 'വിശദാംശങ്ങൾ',
      'mr': 'तपशील',
      'ta': 'விவரங்கள்',
    },
    'g41cdbud': {
      'en': 'Recreantial Resources',
      'ml': 'അഭിഭാഷക ആശയവിനിമയം',
      'mr': 'वकील संप्रेषण',
      'ta': 'வழக்கறிஞர் தொடர்பு',
    },
    'g7myblpb': {
      'en': 'Details',
      'ml': 'വിശദാംശങ്ങൾ',
      'mr': 'तपशील',
      'ta': 'விவரங்கள்',
    },
    'vfgezmgs': {
      'en': 'Compliant Box',
      'ml': 'അഭിഭാഷക ആശയവിനിമയം',
      'mr': 'वकील संप्रेषण',
      'ta': 'வழக்கறிஞர் தொடர்பு',
    },
    'vu4n4a2m': {
      'en': 'Details',
      'ml': 'വിശദാംശങ്ങൾ',
      'mr': 'तपशील',
      'ta': 'விவரங்கள்',
    },
    '81yrydpt': {
      'en': 'Dashboard',
      'ml': 'ഡാഷ്ബോർഡ്',
      'mr': 'डॅशबोर्ड',
      'ta': 'டாஷ்போர்டு',
    },
    'nnac16nd': {
      'en': 'Dashboard',
      'ml': 'ഡാഷ്ബോർഡ്',
      'mr': 'डॅशबोर्ड',
      'ta': 'டாஷ்போர்டு',
    },
  },
  // Recreational
  {
    'k72l6m6u': {
      'en': 'Chess',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'oeiqlf59': {
      'en': 'Sudoku',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'v3hqh2w3': {
      'en': 'Recreational Resouces',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    '4a8aa7g2': {
      'en': 'Home',
      'ml': '',
      'mr': '',
      'ta': '',
    },
  },
  // DocumentGeneration
  {
    'oaee6o5w': {
      'en': 'Document Generation',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'amp7e0th': {
      'en': 'Bail Generation',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'r2icejik': {
      'en': 'Petitions',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'iyr0hims': {
      'en': 'Appeals to \nHigher Court',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'wjkv7tim': {
      'en': 'Motions',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'ic7nummg': {
      'en': 'Document Gneration',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'l6091fd3': {
      'en': 'Home',
      'ml': '',
      'mr': '',
      'ta': '',
    },
  },
  // pdfView
  {
    '0xgng2pl': {
      'en': 'Page Title',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    '16ep2nyd': {
      'en': 'Home',
      'ml': '',
      'mr': '',
      'ta': '',
    },
  },
  // BailGeneration
  {
    '3m6b8pvf': {
      'en': 'Bail Generation',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    '56ev8vhq': {
      'en': 'Home',
      'ml': '',
      'mr': '',
      'ta': '',
    },
  },
  // PetitionsGeneration
  {
    '0leelq6e': {
      'en': 'Example 1',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'z754ddvj': {
      'en': 'Example 2',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'o3p9pl9u': {
      'en': 'Example 3',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    '5j22bok0': {
      'en': 'Petition Generation',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'w0trhz71': {
      'en': 'Home',
      'ml': '',
      'mr': '',
      'ta': '',
    },
  },
  // Miscellaneous
  {
    '5eyx36i5': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'z57d4jnx': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'y2vzm5qz': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'fl37ytx7': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'cc44ay4r': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'uqtzssmd': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'jbcvwecy': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'lg44u5ig': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'lhwfwbfy': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    '0ernhaal': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'w9ckbi7u': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'qecoqx5j': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'bkerqx7a': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'i44zbm8x': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    't2xtej7r': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'h90d1j7o': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'n6xpc72t': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'ywrcxc38': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'wu4j5uws': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'bj1b99fj': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'gee9t683': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'wyze0yuq': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'kvs790cu': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'snqm4sm7': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'l54qbr8i': {
      'en': '',
      'ml': '',
      'mr': '',
      'ta': '',
    },
    'fw00so7z': {
      'en': 'Please authenticate to login',
      'ml': '',
      'mr': '',
      'ta': '',
    },
  },
].reduce((a, b) => a..addAll(b));
