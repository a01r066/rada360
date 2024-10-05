import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:rada360/common/utils/utils.dart';

extension StringX on String {
  Size calculateTextSize(BuildContext? context, {TextStyle? style}) {
    final double textScaleFactor = context != null
        ? MediaQuery.of(context).textScaleFactor
        : WidgetsBinding.instance.window.textScaleFactor;

    final TextDirection textDirection =
        context != null ? Directionality.of(context) : TextDirection.ltr;

    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: this, style: style),
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size;
  }

  toPhone() {
    String? phoneNumber = this;
    if (isNotEmpty && this[0] != "0") {
      phoneNumber = prefixWithNoSpace('0');
    }
    return phoneNumber;
  }

  /// Uppercase first letter inside string and let the others lowercase
  /// Example: your name => Your name
  String capitalizeFirst() {
    if (length > 0) {
      return this[0].toUpperCase() + substring(1).toLowerCase();
    }
    return this;
  }

  /// Capitalize each word inside string
  /// Example: your name => Your Name, your name => Your name
  String capitalize() {
    if (length > 0) {
      return split(' ').map((e) => e.capitalizeFirst()).join(' ');
    }
    return this;
  }

  /// Capitalize only the first letter of each word in a string
  /// Example: getx will make it easy  => Getx Will Make It Easy
  /// Example 2 : this is an example text => This Is An Example Text
  String capitalizeAllWordsFirstLetter() {
    String lowerCasedString = toLowerCase();
    String stringWithoutExtraSpaces = lowerCasedString.trim();

    if (stringWithoutExtraSpaces.isEmpty) {
      return "";
    }
    if (stringWithoutExtraSpaces.length == 1) {
      return stringWithoutExtraSpaces.toUpperCase();
    }

    List<String> stringWordsList = stringWithoutExtraSpaces.split(" ");
    List<String> capitalizedWordsFirstLetter = stringWordsList
        .map(
          (word) {
            if (word.trim().isEmpty) return "";
            return word.trim();
          },
        )
        .where(
          (word) => word != "",
        )
        .map(
          (word) {
            if (word.startsWith(RegExp(r'[\n\t\r]'))) {
              return word;
            }
            return word[0].toUpperCase() + word.substring(1).toLowerCase();
          },
        )
        .toList();
    String finalResult = capitalizedWordsFirstLetter.join(" ");
    return finalResult;
  }

  /*
  main() {
     print('Pizza'.prefixWith('I love'));
  }
  Output: I love Pizza
  */
  String prefixWith(String prefix) {
    return '$prefix $this';
  }

  String prefixWithNoSpace(String prefix) {
    return '$prefix$this';
  }

  String suffixWith(String suffix) {
    return '$this $suffix';
  }

  String suffixWithNoSpace(String suffix) {
    return '$this$suffix';
  }

  /*
  main() {
     print('Pizza'&'I Love');
  }
  Output: I love Pizza
   */
  String operator &(String prefix) => '$prefix $this';

  /// Discover if the String is a valid number
  bool get isNum => KGetUtils.isNum(this);

  /// Discover if the String is numeric only
  bool get isNumericOnly => KGetUtils.isNumericOnly(this);

  String numericOnly({bool firstWordOnly = false}) =>
      KGetUtils.numericOnly(this, firstWordOnly: firstWordOnly);

  /// Discover if the String is alphanumeric only
  bool get isAlphabetOnly => KGetUtils.isAlphabetOnly(this);

  /// Discover if the String is a boolean
  bool get isBool => KGetUtils.isBool(this);

  /// Discover if the String is a vector
  bool get isVectorFileName => KGetUtils.isVector(this);

  /// Discover if the String is a ImageFileName
  bool get isImageFileName => KGetUtils.isImage(this);

  /// Discover if the String is a AudioFileName
  bool get isAudioFileName => KGetUtils.isAudio(this);

  /// Discover if the String is a VideoFileName
  bool get isVideoFileName => KGetUtils.isVideo(this);

  /// Discover if the String is a TxtFileName
  bool get isTxtFileName => KGetUtils.isTxt(this);

  /// Discover if the String is a Document Word
  bool get isDocumentFileName => KGetUtils.isWord(this);

  /// Discover if the String is a Document Excel
  bool get isExcelFileName => KGetUtils.isExcel(this);

  /// Discover if the String is a Document Powerpoint
  bool get isPPTFileName => KGetUtils.isPPT(this);

  /// Discover if the String is a APK File
  bool get isAPKFileName => KGetUtils.isAPK(this);

  /// Discover if the String is a PDF file
  bool get isPDFFileName => KGetUtils.isPDF(this);

  /// Discover if the String is a HTML file
  bool get isHTMLFileName => KGetUtils.isHTML(this);

  /// Discover if the String is a URL file
  bool get isURL => KGetUtils.isURL(this);

  /// Discover if the String is a Email
  bool get isEmail => KGetUtils.isEmail(this);

  /// Discover if the String is a Phone Number
  bool get isPhoneNumber => KGetUtils.isPhoneNumber(this);

  /// Discover if the String is a DateTime
  bool get isDateTime => KGetUtils.isDateTime(this);

  /// Discover if the String is a MD5 Hash
  bool get isMD5 => KGetUtils.isMD5(this);

  /// Discover if the String is a SHA1 Hash
  bool get isSHA1 => KGetUtils.isSHA1(this);

  /// Discover if the String is a SHA256 Hash
  bool get isSHA256 => KGetUtils.isSHA256(this);

  /// Discover if the String is a bynary value
  bool get isBinary => KGetUtils.isBinary(this);

  /// Discover if the String is a ipv4
  bool get isIPv4 => KGetUtils.isIPv4(this);

  bool get isIPv6 => KGetUtils.isIPv6(this);

  /// Discover if the String is a Hexadecimal
  bool get isHexadecimal => KGetUtils.isHexadecimal(this);

  /// Discover if the String is a palindrom
  bool get isPalindrom => KGetUtils.isPalindrom(this);

  /// Discover if the String is a passport number
  bool get isPassport => KGetUtils.isPassport(this);

  /// Discover if the String is a currency
  bool get isCurrency => KGetUtils.isCurrency(this);

  /// Discover if the String is a CPF number
  bool get isCpf => KGetUtils.isCpf(this);

  /// Discover if the String is a CNPJ number
  bool get isCnpj => KGetUtils.isCnpj(this);

  /// Discover if the String is a case insensitive
  bool isCaseInsensitiveContains(String b) =>
      KGetUtils.isCaseInsensitiveContains(this, b);

  /// Discover if the String is a case sensitive and contains any value
  bool isCaseInsensitiveContainsAny(String b) =>
      KGetUtils.isCaseInsensitiveContainsAny(this, b);

  /// capitalize the String
  // String? get capitalize => GetUtils.capitalize(this);

  /// Capitalize the first letter of the String
  // String? get capitalizeFirst => GetUtils.capitalizeFirst(this);

  /// remove all whitespace from the String
  String get removeAllWhitespace => KGetUtils.removeAllWhitespace(this);

  /// Discover if the String is a valid URL
  String? get paramCase => KGetUtils.paramCase(this);

  /// add segments to the String
  String createPath([Iterable? segments]) {
    final path = startsWith('/') ? this : '/$this';
    return KGetUtils.createPath(path, segments);
  }

  /// capitalize only first letter in String words to upper case
  // String capitalizeAllWordsFirstLetter() =>
  //     GetUtils.capitalizeAllWordsFirstLetter(this);

  String mapIndexToAlphabet(int index) {
    var alphabet = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h',
      'i',
      'j',
      'k',
      'l',
      'm',
      'n',
      'o',
      'p',
      'q',
      'r',
      's',
      't',
      'u',
      'v',
      'w',
      'x',
      'y',
      'z'
    ];
    return alphabet[index].toUpperCase();
  }

  String removeNonASCII(String str) {
    final arrCharactorData = [
      [
        "á",
        "à",
        "ả",
        "ã",
        "ạ",
        "ă",
        "ắ",
        "ằ",
        "ẳ",
        "ẵ",
        "ặ",
        "â",
        "ấ",
        "ầ",
        "ẩ",
        "ẫ",
        "ậ"
      ],
      [
        "Á",
        "À",
        "Ả",
        "Ã",
        "Ạ",
        "Ă",
        "Ắ",
        "Ằ",
        "Ẳ",
        "Ẵ",
        "Ặ",
        "Â",
        "Ấ",
        "Ầ",
        "Ẩ",
        "Ẫ",
        "Ậ"
      ],
      ["é", "è", "ẻ", "ẽ", "ẹ", "ê", "ế", "ề", "ể", "ễ", "ệ"],
      ["É", "È", "Ẻ", "Ẽ", "Ẹ", "Ê", "Ế", "Ề", "Ể", "Ễ", "Ệ"],
      [
        "ó",
        "ò",
        "ỏ",
        "õ",
        "ọ",
        "ô",
        "ố",
        "ồ",
        "ổ",
        "ỗ",
        "ộ",
        "ơ",
        "ớ",
        "ờ",
        "ở",
        "ỡ",
        "ợ"
      ],
      [
        "Ó",
        "Ò",
        "Ỏ",
        "Õ",
        "Ọ",
        "Ô",
        "Ố",
        "Ồ",
        "Ổ",
        "Ỗ",
        "Ộ",
        "Ơ",
        "Ớ",
        "Ờ",
        "Ở",
        "Ỡ",
        "Ợ"
      ],
      ["í", "ì", "ỉ", "ĩ", "ị"],
      ["Í", "Ì", "Ỉ", "Ĩ", "Ị"],
      ["ú", "ù", "ủ", "ũ", "ụ", "ư", "ứ", "ừ", "ử", "ữ", "ự"],
      ["Ú", "Ù", "Ủ", "Ũ", "Ụ", "Ư", "Ứ", "Ừ", "Ử", "Ữ", "Ự"],
      ["ý", "ỳ", "ỷ", "ỹ", "ỵ"],
      ["Ý", "Ỳ", "Ỷ", "Ỹ", "Ỵ"],
      ["đ"],
      ["Đ"],
    ];

    final arrResultsCharactorData = [
      "a",
      "A",
      "e",
      "E",
      "o",
      "O",
      "i",
      "I",
      "u",
      "U",
      "y",
      "Y",
      "d",
      "D"
    ];
    String result = str;
    arrCharactorData.forEachIndexed((index, element) {
      for (var element in element) {
        result = result.replaceAll(element, arrResultsCharactorData[index]);
      }
    });
    return result;
  }
}
