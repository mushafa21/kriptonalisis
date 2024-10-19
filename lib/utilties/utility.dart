

/// Caesar
// Function to generate the Caesar cipher mapping
List<Map<String, String>> generateCaesarChiper(int key) {
  final alphabet = 'abcdefghijklmnopqrstuvwxyz'.toUpperCase();
  List<Map<String, String>> mapping = [];

  for (int i = 0; i < alphabet.length; i++) {
    String plainLetter = alphabet[i];
    String cipherLetter = alphabet[(i + key) % alphabet.length];
    mapping.add({plainLetter: cipherLetter});
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


