// This version uses a list to match secret Santa pairs

/*
    The program must take a list of people (first and last name) and return pairs of
    Secret Santas. A person can't be their own santa, and a person can't be a santa for someone
    with the same last name.

    Example input:

    Zoe Washburne
    Hoban Washburne
    Malcolm Reynolds
    Simon Tam
    River Tam
    Buffy Summers
    Dawn Summers
 */

final List<Person> people = List.unmodifiable([
  Person("Zoe", "Washburne"),
  Person("Hoban", "Washburne"),
  Person("Malcolm", "Reynolds"),
  Person("Simon", "Tam"),
  Person("River", "Tam"),
  Person("Buffy", "Summers"),
  Person("Dawn", "Summers"),
]);

final List<Person> santas = List.from(people);

int count = 0;

void main() {
  draw();

  printResults();
}

bool draw() {
  // count how many draws occur
  count++;

  // randomize the secret Santa list
  santas.shuffle();

  // everyone draws a secret Santa
  for (int i = 0; i < people.length; i++) {
    people[i].secretSanta = santas[i];
  }

  // check the rules
  if (people.any((Person person) => person.hasInvalidSanta)) {
    return draw();
  }

//  Any is doing the looping for us therefor we do not need to have a loop function
//  // check the rules
//  for (int i = 0; i < people.length; i++) {
//    if (people[i].hasInvalidSanta) {
//      return draw();
//    }
//  }

  // if we get here, everyone's Santa is valid
  return true;
}

void printResults() {
  people.forEach(print);
  print("\nDraws: $count");
}

class Person {
  final String firstName;
  final String lastName;

  Person secretSanta;

  Person(this.firstName, this.lastName);

  bool get hasValidSanta => secretSanta != null && secretSanta != this && secretSanta.lastName != lastName;
  bool get hasInvalidSanta => !hasValidSanta;

  @override
  String toString() => "${secretSanta.firstName} gives to $firstName";
}