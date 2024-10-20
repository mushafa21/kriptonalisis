

/// Caesar


class ChiperModel{
  String plainLetter;
  String cipherLetter;
  ChiperModel({required this.plainLetter,required this.cipherLetter});

}

class FrequencyModel{
  String letter;
  double frequency;
  FrequencyModel({required this.frequency,required this.letter});
}


List<FrequencyModel> letterFrequencies = [
  FrequencyModel(letter: 'A', frequency: 20.39),
  FrequencyModel(letter: 'B', frequency: 2.64),
  FrequencyModel(letter: 'C', frequency: 0.76),
  FrequencyModel(letter: 'D', frequency: 5.00),
  FrequencyModel(letter: 'E', frequency: 8.28),
  FrequencyModel(letter: 'F', frequency: 0.21),
  FrequencyModel(letter: 'G', frequency: 3.66),
  FrequencyModel(letter: 'H', frequency: 2.74),
  FrequencyModel(letter: 'I', frequency: 7.98),
  FrequencyModel(letter: 'J', frequency: 0.87),
  FrequencyModel(letter: 'K', frequency: 5.14),
  FrequencyModel(letter: 'L', frequency: 3.26),
  FrequencyModel(letter: 'M', frequency: 4.21),
  FrequencyModel(letter: 'N', frequency: 9.33),
  FrequencyModel(letter: 'O', frequency: 1.26),
  FrequencyModel(letter: 'P', frequency: 2.61),
  FrequencyModel(letter: 'Q', frequency: 0.01),
  FrequencyModel(letter: 'R', frequency: 4.64),
  FrequencyModel(letter: 'S', frequency: 4.15),
  FrequencyModel(letter: 'T', frequency: 5.58),
  FrequencyModel(letter: 'U', frequency: 4.62),
  FrequencyModel(letter: 'V', frequency: 0.18),
  FrequencyModel(letter: 'W', frequency: 0.48),
  FrequencyModel(letter: 'X', frequency: 0.03),
  FrequencyModel(letter: 'Y', frequency: 1.88),
  FrequencyModel(letter: 'Z', frequency: 0.04),
];
// Function to shift a letter based on the Caesar cipher key
String shiftLetter(String letter, int key) {
  const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  if (!alphabet.contains(letter)) return letter;

  int currentIndex = alphabet.indexOf(letter);
  int shiftedIndex = (currentIndex + key) % alphabet.length;

  return alphabet[shiftedIndex];
}



List<FrequencyModel> calculateLetterFrequency(String input) {
  // Initialize a map to store the frequency of each letter from 'A' to 'Z'
  Map<String, double> frequencyMap = {
    for (var letter in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')) letter: 0
  };

  // Variable to keep track of the total letters counted
  int totalLetters = 0;

  // Iterate through the characters in the input string
  for (int i = 0; i < input.length; i++) {
    String currentChar = input[i].toUpperCase();

    // Check if the current character is a letter from A to Z
    if (frequencyMap.containsKey(currentChar)) {
      frequencyMap[currentChar] = frequencyMap[currentChar]! + 1;
      totalLetters++;
    }
  }

  // Create a list to store the result as a list of FrequencyModel objects
  List<FrequencyModel> frequencyList = [];

  // Convert the count of each letter into a percentage (relative frequency)
  if (totalLetters > 0) {
    frequencyMap.forEach((letter, count) {
      double frequency = (count / totalLetters) * 100;
      frequencyList.add(FrequencyModel(letter: letter, frequency: frequency));
    });
  }

  return frequencyList;
}



// Function to generate the Caesar cipher mapping
List<ChiperModel> generateCaesarCipher(int key) {
  final alphabet = 'abcdefghijklmnopqrstuvwxyz'.toUpperCase();
  List<ChiperModel> mapping = [];

  for (int i = 0; i < alphabet.length; i++) {
    String plainLetter = alphabet[i];
    String cipherLetter = alphabet[(i + key) % alphabet.length];
    mapping.add(ChiperModel(plainLetter: plainLetter, cipherLetter: cipherLetter));
  }

  return mapping;
}

String encryptCaesarCipher(String plainText, int key) {
  const alphabet = 'abcdefghijklmnopqrstuvwxyz';
  String encryptedText = '';

  // Normalize the key to handle cases where the key is larger than 26
  int normalizedKey = key % alphabet.length;

  // Iterate through each character in the plain text
  for (int i = 0; i < plainText.length; i++) {
    String currentChar = plainText[i].toLowerCase();

    // Check if the current character is a letter
    if (alphabet.contains(currentChar)) {
      // Find the position of the current letter in the alphabet
      int currentIndex = alphabet.indexOf(currentChar);

      // Calculate the encrypted letter's position by shifting forward
      int encryptedIndex = (currentIndex + normalizedKey) % alphabet.length;

      // Append the encrypted letter to the result
      encryptedText += alphabet[encryptedIndex];
    } else {
      // If the character is not a letter, keep it unchanged
      encryptedText += currentChar;
    }
  }

  return encryptedText;
}


String decryptCaesarCipher(String cipherText, int key) {
  const alphabet = 'abcdefghijklmnopqrstuvwxyz';
  String decryptedText = '';

  // Normalize the key to handle cases where the key is larger than 26
  int normalizedKey = key % alphabet.length;

  // Iterate through each character in the cipher text
  for (int i = 0; i < cipherText.length; i++) {
    String currentChar = cipherText[i].toLowerCase();

    // Check if the current character is a letter
    if (alphabet.contains(currentChar)) {
      // Find the position of the current letter in the alphabet
      int currentIndex = alphabet.indexOf(currentChar);

      // Calculate the decrypted letter's position by shifting backwards
      int decryptedIndex = (currentIndex - normalizedKey) % alphabet.length;

      // Handle negative indices by wrapping around
      if (decryptedIndex < 0) {
        decryptedIndex += alphabet.length;
      }

      // Append the decrypted letter to the result
      decryptedText += alphabet[decryptedIndex];
    } else {
      // If the character is not a letter, keep it unchanged
      decryptedText += currentChar;
    }
  }

  return decryptedText;
}


