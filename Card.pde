class Card {
  String name;
  String rules;
  String type;
  int attackValue;
  int id;
  boolean alive;
  boolean isBeing;
  char[] code = {'w', 'w', 'w'};

  Card(String name_, String rules_, String type_) {
    this.name=name_;
    this.rules=rules_;
    this.type=type_;
    globalId++;
    this.id=globalId;
    this.alive=true;
    this.isBeing=false;
  }

  Card(String name_, String rules_, String type_, int attackValue_) {
    this.name=name_;
    this.rules=rules_;
    this.type=type_;
    this.attackValue=attackValue_;
    globalId++;
    this.id=globalId;
    this.alive=true;
    this.isBeing=true;
  }

  void whenPlayed() {
    new Reflector(deep,"whenPlayed"+id);
  }
  
  void attack(Card c, boolean onPlayer) {
    for (int i=0; i<this.attackValue; i++) {
      if (checkGuess(c,requestGuess())==3) {
        c.alive=false;
      }
    }
  }
  
  void display(float x, float y) {
    fill(255);
    rect(x,y,cardWidth,cardHeight,60);
    fill(0);
    textFont(title,60);
    text(this.name,x-cardWidth/2+20,y-cardHeight/2+50);
    textFont(ruletext,40);
    text(this.rules,x-cardWidth/2+20,y);
  }
}