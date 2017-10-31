void mouseClicked() {
  // start Button on home screen
  if (isOverlappingR(mouseX, mouseY, width / 2 - 140, height * 2 / 3 - 55, 280, 110) 
    && gameState.equals("Game not begun")) {
    gameState = "Game in progress";

    // instructions button on home screen
  } else if (isOverlappingC("instructions", mouseX, mouseY) 
    && gameState.equals("Game not begun")) {
    lastY = height / 2 - 15;
    gameState = "Reading instructions";

    // next button on instructions screen 1
  } else if (isOverlappingR(mouseX, mouseY, width * 7 / 8 - 79, height * 7 / 8 - 31, 158, 62) 
    && gameState.equals("Reading instructions")) {
    gameState = "Reading instructions 2";

    // back button on instructions screen 2
  } else if (isOverlappingR(mouseX, mouseY, width / 8 - 79, height * 7 / 8 - 31, 158, 62) 
    && gameState.equals("Reading instructions 2")) {
    lastY = height / 2 - 15;
    gameState = "Reading instructions";

    // next button on instructions screen 2
  } else if (isOverlappingR(mouseX, mouseY, width * 7 / 8 - 79, height * 7 / 8 - 31, 158, 62) 
    && gameState.equals("Reading instructions 2")) {
    gameState = "Reading instructions 3";

    // back button on instructions screen 3
  } else if (isOverlappingR(mouseX, mouseY, width / 8 - 79, height * 7 / 8 - 31, 158, 62) 
    && gameState.equals("Reading instructions 3")) {
    gameState = "Reading instructions 2";

    // next button on instructions screen 3
  } else if (isOverlappingR(mouseX, mouseY, width * 7 / 8 - 79, height * 7 / 8 - 31, 158, 62) 
    && gameState.equals("Reading instructions 3")) {
    gameState = "Reading instructions 4";

    // back button on instructions screen 4
  } else if (isOverlappingR(mouseX, mouseY, width / 8 - 79, height * 7 / 8 - 31, 158, 62) 
    && gameState.equals("Reading instructions 4")) {
    gameState = "Reading instructions 3";

    // home button on game won screen
  } else if (isOverlappingC("home", mouseX, mouseY) 
    && gameState.equals("Game is won")) {
    gameState = "Game not begun";

    // replay button on game won screen
  } else if (isOverlappingC("replay", mouseX, mouseY) 
    && gameState.equals("Game is won")) {
    gameState = "Game in progress";
  
  // home button on game lost screen
  } else if (isOverlappingC("home", mouseX, mouseY) 
    && gameState.equals("Game is lost")) {
    gameState = "Game not begun";

    // replay button on game lost screen
  } else if (isOverlappingC("replay", mouseX, mouseY) 
    && gameState.equals("Game is lost")) {
    gameState = "Game in progress";
  }
}

void keyPressed() {
  if (keyCode == UP) {
    mainPlayer.move(true);
  } else if (keyCode == DOWN) {
    mainPlayer.move(false);
  } else if (key == 'Q' || key == 'q') {
    endGame();
    gameState = "Game not begun";
  }
}