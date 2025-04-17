PImage img;
color bgColor = color(15, 23, 42); // #0F172A
color dotColor = color(129, 140, 248); // #818CF8
color lightBgColor = color(17, 12, 24); 
color accentColor = color(100, 115, 200);

void setup() {
  // Étape 1 : Définir la taille du canvas
  size(450, 450); // Taille réduite comme demandé
  
  // Étape 2 : Charger et vérifier l'image
  img = loadImage("cat-1.png");

  
  // Étape 3 : Redimensionnement PROPORTIONNEL
  float ratio = min((float)width/img.width, (float)height/img.height);
  img.resize(int(img.width * ratio), int(img.height * ratio));
  
  
  // Étape 4 : Centrer l'image si nécessaire
  imageMode(CENTER);
  
  frameRate(10);
  noStroke();
}

void draw() {
  background(bgColor);
  fill( 0);
 
  
  // Votre traitement des pixels
  float tiles = mouseX/2; 
  float tileSize = width/tiles;
  
  translate(tileSize/2, tileSize/2);
  
  for(int x = 0; x < tiles; x++) {
    for(int y = 0; y < tiles; y++) {
      
      int px = int(map(x*tileSize, 0, width, 0, img.width));
      int py = int(map(y*tileSize, 0, height, 0, img.height));
      
      if (px >= 0 && px < img.width && py >= 0 && py < img.height) {
        color c = img.get(px, py);
        float size = map(brightness(c), 0, 255, tileSize, 0);
        ellipse(x*tileSize, y*tileSize, size, size);
      }
    }
  }
}