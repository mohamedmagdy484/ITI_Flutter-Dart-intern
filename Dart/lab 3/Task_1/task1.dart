abstract class AttackStrategy {
  void attack();
}

class SwordAttack extends AttackStrategy {
  @override
  void attack() {
    print("Performing Sword Attack! Slash!");
  }
}

class MagicAttack extends AttackStrategy {
  @override
  void attack() {
    print("Casting Magic Spell! Boom!");
  }
}

class StealthAttack extends AttackStrategy {
  @override
  void attack() {
    print("Sneaking from behind... Silent Kill!");
  }
}

enum CharacterClass {
warrior,
wizard,
rogue

}

class GameCharacter {
  String name;
  AttackStrategy _attackStrategy;

  GameCharacter(this.name, this._attackStrategy);

  void setStrategy(AttackStrategy strategy) {
    _attackStrategy = strategy;
  }

  void performAttack() {
    print('$name is attacking:');
    _attackStrategy.attack();
  }

  static GameCharacter createCharacter(CharacterClass classType, String name) {
    switch (classType) {
      case CharacterClass.warrior:
        return GameCharacter(name, SwordAttack());
      case CharacterClass.wizard:
        return GameCharacter(name, MagicAttack());
      case CharacterClass.rogue:
        return GameCharacter(name, StealthAttack());
    }
  }
}

void main() {
  var hero = GameCharacter.createCharacter(CharacterClass.warrior, "Arthur");
  hero.performAttack();

  print("--- Changing Strategy ---");
  hero.setStrategy(MagicAttack());
  hero.performAttack();
}