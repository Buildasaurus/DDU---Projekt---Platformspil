Myre myre = new Myre();
Eksplosion eksplosion;
Door door;
ArrayList<Skrald> skralds = new ArrayList<Skrald>();
ArrayList<Skraldespand> skraldespands = new ArrayList<Skraldespand>();
ArrayList<Instruktion> instruktions = new ArrayList<Instruktion>();

boolean start = true;
boolean Game = false, completedLevel = false, Liste = false, duFuckingLort = false; // game situation booleans
boolean explode = false;

float startKnapx = 140;
float startKnapy = 100;

int startFrame, winFrame;
int tint = 0;
int difficultyGradient = 20; //time between every lost skraldespand Star
int difficultyStart = 45; //time before you lose your first skraldespand Star

PImage startskaerm, startlogo, startknap;
PImage front, platforms, Genbrugsknap, sorteringsliste, skipknap, timer;
PImage banan, pizzabakke, toothbrush;
PImage madaffaldsspand, plastaffaldsspand, papaffaldsspand, restaffaldsspand;
PImage tabeskaerm, genstartknap;
PImage bevaegelsesIns, opsamlingsIns, smidningsIns, maalIns, listeIns;
PImage myreimage, openDoor, closedDoor;
PImage fullStarSkraldespand, emptyStarSkraldespand;
PImage[] myrereWithSkrald = new PImage[3];
PImage[] myrereWithoutSkrald = new PImage[3];
<<<<<<< Updated upstream
=======
boolean explode = false;
Eksplosion eksplosion;
int tint = 0;
int difficultyGradient = 20; //time between every lost skraldespand Star
int difficultyStart = 45; //time before you lose your first skraldespand Star
PFont font;

>>>>>>> Stashed changes

void setup()
{
  size(1280,720); // 16:9 ratio
  platforms = loadImage("Baggrund.png");
  front = loadImage("Forgrund.png");
  startskaerm = loadImage("Myrestartskaerm.png");
  
  startlogo = loadImage("Startlogo.png");
  startknap = loadImage("Startknap.png");
  Genbrugsknap = loadImage("Genbrugsknap.png");
  
  banan = loadImage("banan.png");
  pizzabakke = loadImage("Pizzabakke.png");
  toothbrush = loadImage("Toothbrush.png");
  
  myrereWithSkrald[0] = loadImage("Myre med skrald.png");
  myrereWithSkrald[1] = loadImage("Myre med skrald 2.png");
  myrereWithSkrald[2] = loadImage("Myre med skrald 3.png");
  myrereWithoutSkrald[0] = loadImage("Myre uden skrald.png");
  myrereWithoutSkrald[1] = loadImage("Myre uden skrald 2.png");
  myrereWithoutSkrald[2] = loadImage("Myre uden skrald 3.png");
  
  madaffaldsspand = loadImage("Skraldespand - Madaffald.png");
  plastaffaldsspand = loadImage("Skraldespand - Plastaffald.png");
  papaffaldsspand = loadImage("Skraldespand - Papaffald.png");
  restaffaldsspand = loadImage("Skraldespand - Restaffald.png");
  
  bevaegelsesIns = loadImage("BevaegelsesInstruktion.png");
  opsamlingsIns = loadImage("SamleOpInstruktion.png");
  smidningsIns = loadImage("SmideIgenInstruktion.png");
  maalIns = loadImage("MaalInstruktion.png");
  listeIns = loadImage("GuideTilSkraldInstruktion.png");
  
  sorteringsliste = loadImage("Sorteringsliste.png");
  skipknap = loadImage("Skipknap.png");
  
  tabeskaerm = loadImage("tabeskaerm.png");
  genstartknap = loadImage("genstartknap.png");
  timer = loadImage("Timer.png");
  
  
  closedDoor = loadImage("Doer.png");
  openDoor = loadImage("Doer_aaben.png");
  fullStarSkraldespand = loadImage("Fuld stjerne.png");
  emptyStarSkraldespand = loadImage("Tom stjerne.png");

  font = createFont("Dubai-Bold-48.vlw", 24);
  textFont(font);
  frameRate(60);
  skralds.add(new Skrald("madaffald", banan, 40, 40, new PVector(400, 650)));
  skralds.add(new Skrald("restaffald", pizzabakke, 80, 80, new PVector(650, 150)));
  skralds.add(new Skrald("plastaffald", toothbrush, 100, 100, new PVector(1150, 450), 90));
  
  
  skraldespands.add(new Skraldespand("madaffald", madaffaldsspand, new PVector(1150, 605)));
  skraldespands.add(new Skraldespand("plastaffald", plastaffaldsspand, new PVector(440, 115)));
  skraldespands.add(new Skraldespand("restaffald", restaffaldsspand, new PVector(1200, 405)));
  skraldespands.add(new Skraldespand("papaffald", papaffaldsspand, new PVector(255, 315)));
  
  instruktions.add(new Instruktion(bevaegelsesIns, new PVector(50, 520), 100,700));
  instruktions.add(new Instruktion(opsamlingsIns, new PVector(350, 500), 350,700));
  instruktions.add(new Instruktion(smidningsIns, new PVector(900, 580), 900,700));
  instruktions.add(new Instruktion(maalIns, new PVector(600, 350), 600, 600));
  instruktions.add(new Instruktion(listeIns, new PVector(100, 100), 100, 200));
  
  door = new Door(new PVector(900, 110), openDoor, closedDoor);
}

void draw()
{
  if (start == true)
   {
     startscreen(); 
   } 
   else if (Game == true)
   {
     game(); 
   } 
   else if (Liste == true)
   {
     liste();
   } 
   else if (duFuckingLort ==true)
   {
    tabening(); 
   }
   else if(completedLevel)
   {
     winningScreen();
   }
}

void startscreen(){
  background(startskaerm);
  textAlign(CENTER);
  fill(0);
  imageMode(CENTER);
  image(startlogo,width/2,height/2-200, 1080,240);
  rectMode(CENTER);
  image(startknap,width/2,height/2+50,startKnapx,startKnapy);
  if (mouseX<(width+startKnapx)/2 && mouseX>(width-startKnapx)/2 && mouseY<(height+startKnapy+100)/2 && mouseY>(height-startKnapy+100)/2 && mousePressed)
  {
    start = false;
    Game = true;
    startFrame = frameCount;
    rectMode(CORNER);
    imageMode(CORNER);
  }
}


void game()
{
  //findInfo();
  clear();
  background(platforms);
  myre.update(); //method that update Myrerens velocity and location.
  background(front);
  displayTimer();
  door.display();
  for(Skraldespand skraldespand : skraldespands)
  {
    skraldespand.display();
  }
  for (Instruktion instruktion: instruktions)
  {
    instruktion.run();
  }
  myre.display(); //goes to the display function in Myre class, and draws whatever is there
  for(Skrald skrald : skralds)
  {
    skrald.display();
  }
  if(explode == true)
  {
    eksplosion.explode();
  }
  rect(0, 0, 85, 85);
  fill(150, 200, 150, 200);
  noStroke();
  image(Genbrugsknap, 10, 10, 65, 65);
  if (mouseX < 75 && mouseX> 10 && mouseY< 75 && mouseY> 10 && mousePressed)
  {
    Game = false; 
    Liste = true;
  }
}


void liste() //shows the sorteringsliste in fullscreen mode. only runs if game is false. Cancelled by making game = true.
{
  imageMode(CENTER);
  image(sorteringsliste, width/2, height/2);
  imageMode(CORNER);
  image(skipknap,1120,670,150,60);
  if (mouseX < 1270 && mouseX > 1120 && mouseY< 730 && mouseY> 670 && mousePressed)
  {
    Liste = false;
    Game = true;
  }
}

void tabening()
{
  lastImage();
  fill(0,200);
  rect(0,0,width,height);
  image(tabeskaerm,0,0,width, height);
  tint(255,tint);
  imageMode(CENTER);
  image(genstartknap,width/2,height/2,150,50);
  imageMode(CORNER);
  if (tint < 255)
   {
     tint += 15;
   } 
   else if (mouseX<(width+150)/2 && mouseX>(width-150)/2 && mouseY<(height+50)/2 && mouseY>(height-50)/2 && mousePressed)
   {
     restart();
   }
}

void winningScreen()
{
  int distanceBetweenStars = 150;
  lastImage();
  fill(0,200);
  rect(0,0,width,height);
  rectMode(CENTER);
  imageMode(CENTER);
  //rect(width/2,height/2, 460, 290);
  fill(255);
  int emptyStar = ceil((((float)(winFrame - startFrame)/60)-difficultyStart)/difficultyGradient);
  System.out.println("empty star %f " + emptyStar + "time above 30 secs %f" + (float)((winFrame - startFrame)/60-difficultyStart));
  if(emptyStar < 0) // if you are fast enough, you could potentially have a negative amount of empty stars, this will be fixed here, mening you will just have 0
  {
    emptyStar = 0;
  }
  System.out.println(emptyStar);

  for(int i = 0; i < 3-emptyStar; i++) // draw full star skraldespands until the amount that should be empty are missing
  {
    image(fullStarSkraldespand, width/2 + i*distanceBetweenStars - distanceBetweenStars, height/2, 100, 100);
    System.out.println("first loop" + i);
  }

  for(int i = 0; i < emptyStar; i++) //draw the rest as empty
  {
    image(emptyStarSkraldespand, width/2 - i*distanceBetweenStars + distanceBetweenStars, height/2, 100, 100);
    System.out.println("second loop" + i);
    System.out.println(emptyStar);

  }
  text("Du gennemførte på " + (float)(winFrame - startFrame)/60 + " sekunder!", width/2, height/2 + 100);
  imageMode(CORNER);
  rectMode(CORNER);
  
}

void restart()
{
  Game = true;
  Liste = false;
  duFuckingLort = false;
  startKnapx = 140;
  startKnapy = 100;
  explode = false;
  tint = 0;
  startFrame = frameCount;
  myre.setLocation(new PVector(200,600));
  for (Instruktion instruktion: instruktions)
  {
    instruktion.setTint(0);
  }
  for (int i=skralds.size()-1; i >= 0; i--)
  {
    skralds.remove(skralds.get(i));
  }
  skralds.add(new Skrald("madaffald", banan, 40, 40, new PVector(400, 650)));
  skralds.add(new Skrald("restaffald", pizzabakke, 80, 80, new PVector(650, 150)));
  skralds.add(new Skrald("plastaffald", toothbrush, 100, 100, new PVector(1150, 450), 90));
  
}

void lastImage() //draws the background as without enabling movement.
{
  background(front);
  for(Skraldespand skraldespand : skraldespands)
  {
    skraldespand.display();
  }
  for (Instruktion instruktion: instruktions)
  {
    instruktion.display();
  }
  for(Skrald skrald : skralds)
  {
    skrald.display();
  }
  door.display();
}

void keyPressed() //input function to control the movements of myren.
{
  myre.setMove(keyCode, true); //sets a boolean of the arrow that was pressed to true, making the myre move.
  if (keyCode == 32)//if space is pressed it flips the bool value, so you drop or pick up skrald
  {
    myre.wantToPickUp();
    if(abs(door.location.y - myre.location.y) < 40 && PVector.sub(myre.location, door.location).mag() < 40 && skralds.size() == 0)
    {
      completedLevel = true;
      winFrame = frameCount;
      Game = false;
    }
  }
  if (keyCode == 82)
  {
    restart();
  }
}


void keyReleased() //input function to control the movements of myren.
{
  myre.setMove(keyCode, false);
}

void displayTimer()
{
  int boxHeight = 50;
  imageMode(CENTER);
  fill(0);
  image(timer, width/2, boxHeight/2, 2*boxHeight, boxHeight); 
  fill(255);
  text((frameCount-startFrame)/60, width/2, boxHeight/2); 
  imageMode(CORNER);
}

void findInfo()
{
  color col = get(mouseX, mouseY);
  System.out.println("color is " + col);
  fill(300, 300, 300);
  System.out.println("mouse x: " + mouseX + " mouse y: " + mouseY);
}
