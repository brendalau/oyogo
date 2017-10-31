class CoinBar {
  int x, y, count;
  
  CoinBar() {
    x = width * 4 / 5 + 70;
    y = upperBound / 2;
    count = 0;
  }
  
  void render() {
    pushStyle();
    strokeWeight(0);
    fill(61, 171, 29);
    
    int barProgress = count * 10;
    
    if (barProgress >= 155) {
      endGame();
      gameState = "Game is won";
    } else {
      rect(x - 75, y - 15, barProgress, 29);
    }
    
    image(coinBar, x, y);
    popStyle();
  }
}

class Heart {
  int x, y;
  boolean isDamaged;
  boolean isDepleted;
  
  Heart(int x) {
    this.x = x;
    y = upperBound / 2;
    isDamaged = false;
    isDepleted = false;
  }
  
  void render() {
    if (isDamaged && isDepleted) {
      image(depletedHeart, x, y);
    } else if (isDamaged) {
      image(damagedHeart, x, y);
    } else {
      image(heart, x, y);
    }
  }
}