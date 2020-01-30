// This version uses two lists to act like a map to create secret Santa pairs

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

  // check rules
  for (int i =0; i < people.length; i++) {
    if (isInvalidSanta(people[i], santas[i])) {
      draw();
      return false;
    }
  }

  // if we get here, everyone's Santa is valid
  return true;
}

bool isInvalidSanta(Person person, Person santa) => person == santa || person.lastName == santa.lastName;

  void printResults() {
    for (int i = 0; i < people.length; i++) {
      print("${santas[i]} gives to ${people[i]}");

    };
    print("\nDraws: $count");
  }

class Person {
  final String firstName;
  final String lastName;

  const Person(this.firstName, this.lastName);

  @override
  String toString() => "$firstName $lastName";
}