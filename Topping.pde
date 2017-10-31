abstract class Topping {
  int x, y, tWidth, tHeight, velX;
  
  void move() {
    x += velX;
  }
  
  abstract void render();   
  
  abstract String getType();
}

class ScallionCoin extends Topping {
  ScallionCoin() {
    x = width;
    y = int(random(upperBound, lowerBound));
    tWidth = 20;
    tHeight = tWidth;
    velX = int(random(-5, -1));
  }
  
  void render() {
    image(scallionCoin, x, y);
  }
  
  String getType() {
    return "ScallionCoin";
  }
}

class MagicCorn extends Topping {
  MagicCorn() {
    x = width;
    y = int(random(upperBound, lowerBound));
    tWidth = 20;
    tHeight = tWidth;
    velX = int(random(-5, -1));
  }
  
  void render() {
    image(magicCorn, x, y);
  }
  
  String getType() {
    return "MagicCorn";
  }
}

class Egg extends Topping {
  Egg() {
    x = width;
    y = int(random(upperBound, lowerBound));
    tWidth = 60;
    tHeight = tWidth;
    velX = int(random(-5, -1));
  }
  
  void render() {
    image(egg, x, y);
  }
  
  String getType() {
    return "Egg";
  }
}

class Fishcake extends Topping {
  Fishcake() {
    x = width;
    y = int(random(upperBound, lowerBound));
    tWidth = 70;
    tHeight = tWidth;
    velX = int(random(-5, -1));
  }
  
  void render() {
    image(fishcake, x, y);
  }
  
   String getType() {
    return "Fishcake";
  }
}

class Mushroom extends Topping {
  Mushroom() {
    x = width;
    y = int(random(upperBound, lowerBound));
    tWidth = 55;
    tHeight = 50;
    velX = int(random(-5, -1));
  }
  
  void render() {
    image(mushroom, x, y);
  }
  
  String getType() {
    return "Mushroom";
  }
}

class Broccoli extends Topping {
  Broccoli() {
    x = width;
    y = int(random(upperBound, lowerBound));
    tWidth = 55;
    tHeight = 50;
    velX = int(random(-5, -1));
  }
  
  void render() {
    image(broccoli, x, y);
  }
  
  String getType() {
    return "Broccoli";
  }
}