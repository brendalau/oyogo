// Brenda Lau
// ARTG2260
// bnilau@gmail.com
// assignment_07
// Oyogo!

import java.util.*;
import processing.sound.*;

void setup() {
  size(1080, 620);

  // y u no loooooppppppp
  bgMusic = new SoundFile(this, "03 I Like Jump Rope.mp3");
  bgMusic.loop();
  
  upperBound = 110;
  lowerBound = height - upperBound;
  autoPress = false;
  lastY = height / 2 + 20;
  autoPieceX = width;
  isCoin = true;
  autoToppingType = 0;
  lastCollision = -60;
  gameState = "Game not begun";

  background = loadImage("images/background.png");
  homeScreen = loadImage("images/homeScreen.png");
  oyogo = loadImage("images/oyogo.png");
  startButton = loadImage("images/startButton.png");
  startButtonHover = loadImage("images/startButtonHover.png");
  instructionsButton = loadImage("images/instructionsButton.png");
  instructionsButtonHover = loadImage("images/instructionsButtonHover.png");
  instructionsScreen1 = loadImage("images/instructionsScreen1.png");
  instructionsScreenBlank = loadImage("images/instructionsScreenBlank.png");
  moveUp = loadImage("images/moveUp.png");
  moveDown = loadImage("images/moveDown.png");
  upButton = loadImage("images/upButton.png");
  upButtonPressed = loadImage("images/upButtonPressed.png");
  downButton = loadImage("images/downButton.png");
  downButtonPressed = loadImage("images/downButtonPressed.png");
  backButton = loadImage("images/backButton.png");
  backButton.resize(0, height / 10);
  backButtonHover = loadImage("images/backButtonHover.png");
  backButtonHover.resize(0, height / 10);
  nextButton = loadImage("images/nextButton.png");
  nextButton.resize(0, height / 10);
  nextButtonHover = loadImage("images/nextButtonHover.png");
  nextButtonHover.resize(0, height / 10);
  collectThese = loadImage("images/collectThese.png");
  avoidThese = loadImage("images/avoidThese.png");
  returnHome = loadImage("images/returnHome.png");
  qButton = loadImage("images/qButton.png");
  gameOverScreen = loadImage("images/gameOverScreen.png");
  youWon = loadImage("images/youWon.png");
  youLost = loadImage("images/youLost.png");
  homeButton = loadImage("images/homeButton.png");
  homeButtonHover = loadImage("images/homeButtonHover.png");
  replayButton = loadImage("images/replayButton.png");
  replayButtonHover = loadImage("images/replayButtonHover.png");
  coinBar = loadImage("images/coinBar.png");
  coinBar.resize(0, 30);
  heart = loadImage("images/heart.png");
  heart.resize(30, 0);
  damagedHeart = loadImage("images/damagedHeart.png");
  damagedHeart.resize(30, 0);
  depletedHeart = loadImage("images/depletedHeart.png");
  depletedHeart.resize(30, 0);
  kaji = loadImage("images/kaji.png");
  belly = loadImage("images/belly.png");
  belly.resize(0, height / 20);
  head = loadImage("images/head.png");
  head.resize(0, height / 14);
  noodle = loadImage("images/noodle.png");
  noodle.resize(50, 0);

  mainPlayer = new Player();
  coinCollection = new CoinBar();
  toppings = new ArrayList<Topping>();
  hearts = new ArrayList<Heart>();

  for (int i = width * 3 / 5 + 50; i < width * 3 / 5 + 50 + 40 * 4; i += 40) {
    hearts.add(new Heart(i));
  }
}

void draw() {
  background(127);
  imageMode(CENTER);
  image(background, width / 2, height / 2); 

  if (gameState.equals("Game not begun")) {
    homeScreen();
  } else if (gameState.equals("Reading instructions")) {
    instructionsScreen1();
  } else if (gameState.equals("Reading instructions 2")) {
    instructionsScreen2();
  } else if (gameState.equals("Reading instructions 3")) {
    instructionsScreen3();
  } else if (gameState.equals("Reading instructions 4")) {
    instructionsScreen4();
  } else if (gameState.equals("Game in progress")) {
    playGame();
  } else if (gameState.equals("Game is won")) {
    gameWonScreen();
  } else if (gameState.equals("Game is lost")) {
    gameLostScreen();
  }
}

// to update the hearts after a topping collision
void updateHearts() {
  for (Heart h : hearts) {
    if (!h.isDepleted) {
      if (h.isDamaged) {
        h.isDepleted = true;
      } else {
        h.isDamaged = true;
      }

      lastCollision = frameCount;
      break;
    }
  }
}

float distanceBetween(float x0, float y0, float x1, float y1) {
  float a = abs(y1 - y0);
  float b = abs(x1 - x0);

  return sqrt(a * a + b * b);
}

boolean isOverlappingC(String type, float x, float y) {
  boolean overlapping = false;
  float d = 0;

  if (type.equals("home")) {
    d = distanceBetween(x, y, width / 2 - 125, height * 2 / 3);
  } else if (type.equals("replay")) {
    d = distanceBetween(x, y, width / 2 + 125, height * 2 / 3);
  } else if (type.equals("instructions")) {
    d = distanceBetween(x, y, width * 4 / 5 + 70, height / 5);
  } else if (type.equals("player")) {
    d = distanceBetween(x, y, mainPlayer.pWidth, mainPlayer.pHeight);
  }

  if (d <= 60) {
    overlapping = true;
  }

  return overlapping;
}

boolean isOverlappingR(float x, float y, float rectX, float rectY, 
  float rectW, float rectH) {
  boolean overlapping = false;

  if ((rectX < x && x < (rectX + rectW)) && (rectY < y && y < (rectY + rectH))) {
    overlapping = true;
  }

  return overlapping;
}

boolean heartsAreDepleted() {
  boolean depleted = true;
  
  for(Heart h : hearts) {
    if (!(h.isDamaged && h.isDepleted)) {
      depleted = false;
      break;
    }
  }
  
  return depleted;
}

void endGame() {
  coinCollection.count = 0;
  mainPlayer.bellyX = width / 4;
  mainPlayer.bellyY = height / 2;
  mainPlayer.velY = 10;
  mainPlayer.pX = mainPlayer.bellyX + 5;
  mainPlayer.pY = mainPlayer.bellyY - 10;
  mainPlayer.pWidth = 60;
  mainPlayer.pHeight = mainPlayer.pWidth;
  mainPlayer.swelling = 31;
  toppings.clear();

  for (Heart h : hearts) {
    h.isDamaged = false;
    h.isDepleted = false;
  }
}