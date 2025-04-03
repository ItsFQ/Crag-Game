# 🎲 README – Crag Dice Game

## 🔍 Project Summary

This project implements the dice game **Crag** in Pharo; a modern implementation of Smalltalk. The `Crag` class provides full game logic for evaluating a roll of three dice, determining the scoring category, and calculating the total score based on game rules.

> 📖 Not familiar with the game? You can read about how Crag is played on [Wikipedia](https://en.wikipedia.org/wiki/Crag_(dice_game)).

---

## 🧱 Class Overview

### Class: `Crag`

- **Superclass**: `Object`
- **Package**: `CragGamePackage`
- **Instance Variable**:
  - `roll` – an array of three integers representing the values of a dice roll.

---

## 🧪 Class Methods

- `Crag class >> new: dice`  
  Creates a new instance of `Crag` with the given array of dice values.

- `Crag class >> surprise`  
  Generates a random roll of three dice (values from 1 to 6), then returns a new `Crag` instance using that roll.

---

## 🌀 Instance Methods

- `setRoll: dice` – Stores the given array into the instance variable `roll`.

- `getRoll` – Returns the current roll stored in the object.

- `isCrag` – Returns `true` if the roll sums to 13 and includes a pair (i.e., two matching values).

- `isThirteen` – Returns `true` if the total is 13 and it’s **not** a Crag.

- `isThreeOfAKind` – Returns `true` if all three dice show the same value.

- `isStraight` – Returns `true` if the roll matches one of the four special sequences (Low, High, Even, or Odd straights).

- `category` – Evaluates the current roll and returns its category as a string, such as:
  - `'Crag'`, `'Thirteen'`, `'Three-Of-A-Kind'`, `'Low Straight'`, `'High Straight'`, `'Odd Straight'`, `'Even Straight'`, `'Sixes'`, `'Fives'`, etc.

- `score` – Calculates the numerical score for the current roll based on the game rules:
  - Crag → 50  
  - Thirteen → 26  
  - Three-of-a-kind → 25  
  - Straight → 20  
  - Otherwise, the score is based on the value that appears most often in the roll.

---

## ✅ Testing Your Code (Using Playground)

You can test the implementation by running tests in the **Playground** browser.

## 🧪 (Example) Test Case: A Known Crag

```smalltalk
| crag |
crag := Crag new: #(5 5 3).
crag getRoll.       "#(5 5 3)"
crag isCrag.        "true"
crag isThirteen.    "false"
crag category.      "'Crag'"
crag score.         "50"
