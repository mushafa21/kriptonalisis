import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kriptonalisis/ui/color.dart';
import 'package:kriptonalisis/ui/dimen.dart';
import 'package:kriptonalisis/ui/type.dart';

class RandomTable extends StatefulWidget {
  const RandomTable({super.key});

  @override
  State<RandomTable> createState() => _RandomTableState();
}

class _RandomTableState extends State<RandomTable> {
  // Original alphabet list
  final List<String> alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

  // Shuffle and generate the random substitution table
  List<String> shuffledAlphabet = [];

  // Store the substitution table selected by the user
  Map<String, String> substitutionTable = {};

  // Keep track of which cipher letters are still available for dragging
  Set<String> availableCipherLetters = {};

  @override
  void initState() {
    super.initState();
    generateRandomSubstitution();
  }

  void generateRandomSubstitution() {
    shuffledAlphabet = List.from(alphabet);
    shuffledAlphabet.shuffle(Random());
    substitutionTable.clear();
    availableCipherLetters = Set.from(shuffledAlphabet);
  }

  // Clear all cipher letters from the plain text
  void clearAllCipherText() {
    setState(() {
      substitutionTable.clear();
      availableCipherLetters = Set.from(shuffledAlphabet);
    });
  }

  // Randomly assign all cipher letters to the plain text
  void randomAssignCipherText() {
    setState(() {
      List<String> availableLetters = List.from(availableCipherLetters);
      availableLetters.shuffle();

      for (int i = 0; i < alphabet.length; i++) {
        substitutionTable[alphabet[i]] = availableLetters[i];
      }

      availableCipherLetters.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Text('Drag the cipher letters below the plain text or swap them',
            style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        _buildPlainAndCipherTextColumn(),
        _buildDraggableCipherTextColumn(),
        // Expanded(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       _buildPlainAndCipherTextColumn(),
        //       _buildDraggableCipherTextColumn(),
        //     ],
        //   ),
        // ),
        ElevatedButton(
          onPressed: () {
            // Generate a new random table
            setState(() {
              generateRandomSubstitution();
            });
          },
          child: Text('Shuffle Cipher Letters'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: clearAllCipherText,
              child: Text('Clear All Cipher Text'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: randomAssignCipherText,
              child: Text('Random Assign Cipher Text'),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  // Build the plain text with corresponding drag targets for cipher text
  Widget _buildPlainAndCipherTextColumn() {
    return Column(
      children: [
        Text('Plain Text / Cipher Text',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Wrap(
          children: alphabet.map((plainLetter){
            return _buildPlainAndCipherTile(plainLetter);
          }).toList(),
        )
        // ListView.builder(
        //   itemCount: alphabet.length,
        //   itemBuilder: (context, index) {
        //     String plainLetter = alphabet[index];
        //     return _buildPlainAndCipherTile(plainLetter);
        //   },
        // ),
      ],
    );
  }

  // Build the draggable cipher text column
  Widget _buildDraggableCipherTextColumn() {
    return Column(
      children: [
        Text('Cipher Letters', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Wrap(
          children: shuffledAlphabet.map((cipherLetter){
            return availableCipherLetters.contains(cipherLetter)
                ? Draggable<String>(
              data: cipherLetter,
              feedback: _buildLetterBox(cipherLetter, Colors.blue),
              child: _buildLetterBox(cipherLetter, Colors.blue),
              childWhenDragging: _buildLetterBox(cipherLetter, Colors.grey),
            )
                : _buildLetterBox(cipherLetter, Colors.grey); //
          }).toList(),
        )
        // ListView.builder(
        //   itemCount: shuffledAlphabet.length,
        //   itemBuilder: (context, index) {
        //     String cipherLetter = shuffledAlphabet[index];
        //     return availableCipherLetters.contains(cipherLetter)
        //         ? Draggable<String>(
        //       data: cipherLetter,
        //       feedback: _buildLetterBox(cipherLetter, Colors.blue),
        //       child: _buildLetterBox(cipherLetter, Colors.blue),
        //       childWhenDragging: _buildLetterBox(cipherLetter, Colors.grey),
        //     )
        //         : _buildLetterBox(cipherLetter, Colors.grey); // If used, greyed out
        //   },
        // ),
      ],
    );
  }

// Build plain letter with drag target for cipher letter underneath
  Widget _buildPlainAndCipherTile(String plainLetter) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildLetterBox(plainLetter, Colors.red), // Plain letter
          SizedBox(height: 5),
          // Make the cipher text draggable as well
          DragTarget<String>(
            builder: (context, candidateData, rejectedData) {
              String? cipherLetter = substitutionTable[plainLetter];

              return cipherLetter != null
                  ? Draggable<String>(
                data: cipherLetter,
                feedback: _buildLetterBox(cipherLetter, Colors.blue),
                child: _buildLetterBox(cipherLetter, Colors.blue),
                childWhenDragging: _buildLetterBox('_', Colors.grey),
                onDragCompleted: () {
                  setState(() {
                    // Don't immediately add it back to available set, wait until it's placed somewhere else
                    substitutionTable.remove(plainLetter);
                  });
                },
              )
                  : _buildLetterBox('_', Colors.blue); // Empty slot if no cipher letter yet
            },
            onAccept: (draggedLetter) {
              setState(() {
                // If a letter is already mapped to this plain letter, free it up for reuse
                if (substitutionTable.containsKey(plainLetter)) {
                  availableCipherLetters.add(substitutionTable[plainLetter]!);
                }

                // Assign the dragged letter to the current plain text
                substitutionTable[plainLetter] = draggedLetter;
                availableCipherLetters.remove(draggedLetter);
              });
            },
            onWillAccept: (draggedLetter) {
              // Only accept the letter if it's not already assigned to this plain letter
              return draggedLetter != substitutionTable[plainLetter];
            },
          ),
        ],
      ),
    );
  }

  // Helper method to build a box with a letter
  Widget _buildLetterBox(String letter, Color color) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
          )
        ],
      ),
      child: Text(
        letter,
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }

}
