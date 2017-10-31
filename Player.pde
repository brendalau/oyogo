class Player {
  float bellyX, bellyY, velY, pX, pY, pWidth, pHeight, swelling;

  Player() {
    bellyX = width / 4;
    bellyY = height / 2;
    velY = 10;
    pX = bellyX + 5;
    pY = bellyY - 10;
    pWidth = 60;
    pHeight = pWidth;
    swelling = 31;
  }

  void move(boolean up) {
    if (up) {
      bellyY -= velY;
      pY -= velY;
    } else {
      bellyY += velY;
      pY += velY;
    }

    if (bellyY - pHeight / 2 <= upperBound) {
      bellyY = upperBound + pHeight / 2;
      pY = bellyY - 10;
    } else if (bellyY + pHeight / 2 >= lowerBound) {
      bellyY = lowerBound - pHeight / 2;
      pY = bellyY - 10;
    }
  }

  void swell() {
    if (frameCount % 50 == 0) {
      belly = loadImage("images/belly.png");
      belly.resize(0, (int) swelling);
      pWidth += 1;
      pHeight += 1;
      swelling += 1;
    }
  }

  void render() {
    pushStyle(); 
    //rectMode(CENTER);
    //rect(pX, pY, pWidth, pHeight);
    image(belly, bellyX, bellyY);
    image(noodle, bellyX + 45, bellyY - 200);
    image(head, bellyX + 15, bellyY - 20);
    
    strokeWeight(20);
    line(0, 0, width, 0);
    popStyle();
  }

  // to check if a coin was collided with
  boolean collectsCoin(Topping t) {
    return (t.x - t.tWidth / 2 < pX + pWidth / 2
      && !(t.x + t.tWidth / 2 < pX - pWidth / 2)
      && t.y > pY - pHeight / 2
      && t.y < pY + pHeight / 2
      && t.getType().equals("ScallionCoin"));
  }

  // to check if magic corn was collided with
  boolean collectsMagicCorn(Topping t) {
    return (t.x - t.tWidth / 2 < pX + pWidth / 2
      && !(t.x + t.tWidth / 2 < pX - pWidth / 2)
      && t.y > pY - pHeight / 2
      && t.y < pY + pHeight / 2 
      && t.getType().equals("MagicCorn"));
  }

  // to check if any other topping was collided with
  boolean bumpsOtherTopping(Topping t) {
    return (t.x - t.tWidth / 2 < pX + pWidth / 2
      && !(t.x + t.tWidth / 2 < pX - pWidth / 2)
      && t.y > pY - pHeight / 2
      && t.y < pY + pHeight / 2 
      && !(t.getType().equals("ScallionCoin") 
      || t.getType().equals("MagicCorn"))) ;
  }
}