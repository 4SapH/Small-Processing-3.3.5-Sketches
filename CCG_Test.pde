float offset=140;
//card id's
int globalId=0;
int lifeTotal=10;
int money=20;

//board, hand declaration;
ArrayList<Card> allyBoard;
ArrayList<Card> allyHand;
ArrayList<Card> enemyBoard;
ArrayList<Card> enemyHand;

float cardWidth;
float cardHeight;

PFont title;
PFont ruletext;

String rules1="Gain 5 life.";
Card card1;
Card card2;
PApplet deep;

int checkGuess(Card c, char[] guess) {
    int correct=0;
    for (int i=0; i<guess.length; i++) {
      if (guess[i]==c.code[i]) {
        correct++;
      }
    }
    return correct;
}
 
void setup() {
  // phone width: 1080px
  // phone height: 1794
  size(1080, 1000);
  allyBoard = new ArrayList<Card>();
  allyHand = new ArrayList<Card>();
  enemyBoard = new ArrayList<Card>();
  enemyHand = new ArrayList<Card>();
  card1 = new Card("Spirit Thirst",rules1,"Being", 3);
  card2 = new Card("La Bala", "Do nothing.", "Being");
  card2.code[0] = 'W';
  card2.code[1] = 'B';
  card2.code[2] = 'B';
  title = createFont("Arial",60,true);
  ruletext = createFont("Verdana",40,true);
  deep = this;
  cardWidth=360;
  cardHeight=448.5;
  rectMode(CENTER);
}

void draw() {
  card1.display(width/2,height/2);
  card1.attack(card2, false); // <--- THIS
}

// FOR DEBUGGING
/*void bile() {
  background(0);
  char[] guess={'W','B','W'};
  if(guess[0] == 'W') {
    fill (255);
  }
  else {
   fill(100);
  }
  ellipse(width/2-offset,height/2,60,60);
  if(guess[1] == 'W') {
    fill (255);
  }
  else {
   fill(100);
  }
  ellipse(width/2,height/2,60,60);
  if(guess[2] == 'W') {
    fill (255);
  }
  else {
   fill(100);
  }
  ellipse(width/2+offset,height/2,60,60);
}*/

char[] requestGuess() {
  char[] guess={'W','W','W'};
  boolean done = false;
  fill(0,25);
  rect(0,0,width,height);
  
  
  while (!done) {
    if (mousePressed && dist(width/2,height/2,mouseX,mouseY)<=60) {
        if (guess[1]=='W') {
            guess[1]='B';
        } else {
            guess[1]='W';
        }
    }
    if (guess[1]=='W') {
      fill(255);
    } else {
      fill(100);
    }
    ellipse(width/2,height/2,60,60);
    println("FAIL!");
    if (mousePressed && dist(width/2-offset,height/2,mouseX,mouseY)<=60) {
        if (guess[0]=='W') {
            guess[0]='B';
        } else {
            guess[0]='W';
        }
    }
    if (guess[0]=='W') {
      fill(255);
    } else {
      fill(100);
    }
    ellipse(width/2-offset,height/2,60,60);
    if (mousePressed && dist(width/2+offset,height/2,mouseX,mouseY)<=60) {
        if (guess[2]=='W') {
            guess[2]='B';
        } else {
            guess[2]='W';
        }
    }
    if (guess[2]=='W') {
      fill(255);
    } else {
      fill(100);
    }
    ellipse(width/2+offset,height/2,60,60);
    fill(0,255,0);
    rect(width/2,height/2+120,180,60);
    if (mouseX>=width/2-90 && mouseX<=width/2+90 && mouseY>=height/2+90 && mouseY<=height/2+150
        && mousePressed) {
      done = true;
    }
  }
  return guess;
} 


  