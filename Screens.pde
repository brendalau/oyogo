void homeScreen() {
  image(homeScreen, width / 2, height / 2);
  image(oyogo, width / 2, height / 3);

  if (isOverlappingR(mouseX, mouseY, width / 2 - 140, height * 2 / 3 - 55, 280, 110)) {
    image(startButtonHover, width / 2, height * 2 / 3 + 10);
  } else {
    image(startButton, width / 2, height * 2 / 3 + 10);
  }

  if (isOverlappingC("instructions", mouseX, mouseY)) {
    image(instructionsButtonHover, width * 4 / 5 + 80, height / 5);
  } else {
    image(instructionsButton, width * 4 / 5 + 80, height / 5);
  }
}

void instructionsScreen1() {
  if (frameCount % 100 == 0) {
    autoPress = !autoPress;
  }

  image(instructionsScreen1, width / 2, height / 2);

  pushStyle();
  imageMode(CORNER);
  image(moveUp, width * 2 / 8 + 10, height / 2 - 90);
  image(moveDown, width * 2 / 8 + 10, height / 2 + 50);
  popStyle();

  strokeWeight(30);
  line(0, height, width, height);

  if (autoPress) {
    image(upButtonPressed, width / 8 + 50, height / 2 - 70);
    image(downButton, width / 8 + 50, height / 2 + 70);
    image(kaji, width * 6 / 8 + 50, lastY - 1);

    lastY -= 1;
  } else {
    image(upButton, width / 8 + 50, height / 2 - 70);
    image(downButtonPressed, width / 8 + 50, height / 2 + 70);

    image(kaji, width * 6 / 8 + 50, lastY + 1);

    lastY += 1;
  }

  if (isOverlappingR(mouseX, mouseY, width * 7 / 8 - 79, height * 7 / 8 - 31, 158, 62)) {
    image(nextButtonHover, width * 7 / 8, height * 7 / 8);
  } else {
    image(nextButton, width * 7 / 8, height * 7 / 8);
  }
}

void instructionsScreen2() {
  scallionCoin = loadImage("images/scallionCoin.png");
  magicCorn = loadImage("images/magicCorn.png");

  image(instructionsScreenBlank, width / 2, height / 2);
  image(collectThese, width / 2, height / 8);
  image(kaji, width / 3, height / 2);

  if (autoPieceX > width / 3 + 80) {
    if (isCoin) {
      image(scallionCoin, autoPieceX, height / 2);
    } else {
      image(magicCorn, autoPieceX, height / 2);
    }

    autoPieceX -= 3;
  } else if (autoPieceX <= width / 3 + 80) {
    isCoin = !isCoin;
    autoPieceX = width;
  }

  if (isOverlappingR(mouseX, mouseY, width * 7 / 8 - 79, height * 7 / 8 - 31, 158, 62)) {
    image(nextButtonHover, width * 7 / 8, height * 7 / 8);
  } else {
    image(nextButton, width * 7 / 8, height * 7 / 8);
  }

  if (isOverlappingR(mouseX, mouseY, width / 8 - 79, height * 7 / 8 - 31, 158, 62)) {
    image(backButtonHover, width / 8, height * 7 / 8);
  } else {
    image(backButton, width / 8, height * 7 / 8);
  }
}

void instructionsScreen3() {
  egg = loadImage("images/egg.png");
  fishcake = loadImage("images/fishcake.png");
  mushroom = loadImage("images/mushroom.png");
  broccoli = loadImage("images/broccoli.png");

  image(instructionsScreenBlank, width / 2, height / 2);
  image(avoidThese, width / 2, height / 8);
  image(kaji, width / 3, height / 2);

  if (autoPieceX - 40 > width / 3 + 80) {
    if (autoToppingType == 0) {
      image(egg, autoPieceX, height / 2);
    } else if (autoToppingType == 1) {
      image(fishcake, autoPieceX, height / 2);
    } else if (autoToppingType == 2) {
      image(mushroom, autoPieceX, height / 2);
    } else {
      image(broccoli, autoPieceX, height / 2);
    }

    autoPieceX -= 3;
  } else if (autoPieceX - 40 <= width / 3 + 80) {
    if (autoToppingType == 3) {
      autoToppingType = 0;
    } else {
      autoToppingType++;
    }
    autoPieceX = width;
  }

  if (isOverlappingR(mouseX, mouseY, width * 7 / 8 - 79, height * 7 / 8 - 31, 158, 62)) {
    image(nextButtonHover, width * 7 / 8, height * 7 / 8);
  } else {
    image(nextButton, width * 7 / 8, height * 7 / 8);
  }

  if (isOverlappingR(mouseX, mouseY, width / 8 - 79, height * 7 / 8 - 31, 158, 62)) {
    image(backButtonHover, width / 8, height * 7 / 8);
  } else {
    image(backButton, width / 8, height * 7 / 8);
  }
}

void instructionsScreen4() {
  image(instructionsScreenBlank, width / 2, height / 2);
  image(returnHome, width / 2 + 80, height / 2);
  image(qButton, width / 4, height / 2);

  if (isOverlappingR(mouseX, mouseY, width / 8 - 79, height * 7 / 8 - 31, 158, 62)) {
    image(backButtonHover, width / 8, height * 7 / 8);
  } else {
    image(backButton, width / 8, height * 7 / 8);
  }
}

void playGame() {
  scallionCoin = loadImage("images/scallionCoin.png");
  scallionCoin.resize(20, 0);
  magicCorn = loadImage("images/magicCorn.png");
  magicCorn.resize(20, 0);
  egg = loadImage("images/egg.png");
  egg.resize(0, 60);
  fishcake = loadImage("images/fishcake.png");
  fishcake.resize(0, 70);
  mushroom = loadImage("images/mushroom.png");
  mushroom.resize(0, 50);
  broccoli = loadImage("images/broccoli.png");
  broccoli.resize(0, 50);

  // generating toppings
  float r = random(1);

  if (0 <= r && r < 0.005) {
    toppings.add(new Mushroom());
  } else if (0.005 <= r && r < 0.010) {
    toppings.add(new Egg());
  } else if (0.010 <= r && r < 0.015) {
    toppings.add(new Broccoli());
  } else if (0.015 <= r && r < 0.018) {
    toppings.add(new Fishcake());
  } else if (0.018 <= r && r < 0.021) {
    toppings.add(new ScallionCoin());
  } else if (0.021 <= r && r < 0.022) {
    toppings.add(new MagicCorn());
  }

  // rendering toppings and handling collisions
  ArrayList<Topping> collectedCoins = new ArrayList<Topping>();
  ArrayList<Topping> collectedCorn = new ArrayList<Topping>();

  for (Topping t : toppings) {
    t.render();
    t.move();

    // handling coin collisions
    if (mainPlayer.collectsCoin(t)) {
      coinCollection.count++;
      collectedCoins.add(t);
    }

    // handling corn collisions
    if (mainPlayer.collectsMagicCorn(t)) {
      mainPlayer.velY = 10;
      mainPlayer.pX = mainPlayer.bellyX + 5;
      mainPlayer.pY = mainPlayer.bellyY - 10;
      mainPlayer.pWidth = 60;
      mainPlayer.pHeight = mainPlayer.pWidth;
      mainPlayer.swelling = 31;
      collectedCorn.add(t);
    }

    // handling other collisions
    if (mainPlayer.bumpsOtherTopping(t)) {
      if (frameCount - lastCollision > 60) {
        updateHearts();
        
        if (heartsAreDepleted()) {
          gameState = "Game is lost";
        }
      }
    }
  }

  toppings.removeAll(collectedCoins);
  toppings.removeAll(collectedCorn);

  // rendering hearts
  for (Heart h : hearts) {
    h.render();
  }

  // rendering scoreboard
  coinCollection.render();

  // rendering and updating player 
  mainPlayer.render();
  mainPlayer.swell();
}

void gameWonScreen() {
  image(gameOverScreen, width / 2, height / 2);
  image(youWon, width / 2, height / 3);

  if (isOverlappingC("home", mouseX, mouseY)) {
    image(homeButtonHover, width / 2 - 125, height * 2 / 3);
  } else {
    image(homeButton, width / 2 - 125, height * 2 / 3);
  }

  if (isOverlappingC("replay", mouseX, mouseY)) {
    image(replayButtonHover, width / 2 + 125, height * 2 / 3);
  } else {
    image(replayButton, width / 2 + 125, height * 2 / 3);
  }
}

void gameLostScreen() {
  image(gameOverScreen, width / 2, height / 2);
  image(youLost, width / 2, height / 3);

  if (isOverlappingC("home", mouseX, mouseY)) {
    image(homeButtonHover, width / 2 - 125, height * 2 / 3);
  } else {
    image(homeButton, width / 2 - 125, height * 2 / 3);
  }

  if (isOverlappingC("replay", mouseX, mouseY)) {
    image(replayButtonHover, width / 2 + 125, height * 2 / 3);
  } else {
    image(replayButton, width / 2 + 125, height * 2 / 3);
  }
}