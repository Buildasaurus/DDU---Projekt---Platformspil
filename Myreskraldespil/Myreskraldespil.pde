Myre myre = new Myre();
ArrayList<Skrald> skralds = new ArrayList<Skrald>();
ArrayList<Skraldespand> skraldespands = new ArrayList<Skraldespand>();
ArrayList<Instruktion> instruktions = new ArrayList<Instruktion>();
boolean start = true;
boolean Game = false;
boolean Liste = false;
boolean duFuckingLort = false;
float startKnapx = 140;
float startKnapy = 100;
PImage startskaerm, startlogo, startknap;
PImage front, platforms, Genbrugsknap, sorteringsliste, skipknap;
PImage banan, pizzabakke, toothbrush;
PImage madaffaldsspand, plastaffaldsspand, papaffaldsspand, restaffaldsspand;
PImage tabeskaerm, genstartknap;
PImage bevaegelsesIns, opsamlingsIns, smidningsIns, maalIns;
PImage myreimage;
PImage[] myrereWithSkrald = new PImage[3];
PImage[] myrereWithoutSkrald = new PImage[3];
boolean explode = false;
Eksplosion eksplosion;
boolean z = false;
boolean q = false;
int tint = 0;


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
  sorteringsliste = loadImage("Sorteringsliste.png");
  skipknap = loadImage("Skipknap.png");
  tabeskaerm = loadImage("tabeskaerm.png");
  genstartknap = loadImage("genstartknap.png");

  frameRate(60);
  skralds.add(new Skrald("madaffald", banan, 20, 20, new PVector(400, 650)));
  skralds.add(new Skrald("restaffald", pizzabakke, 60, 60, new PVector(600, 190)));
  skralds.add(new Skrald("plastaffald", toothbrush, 60, 60, new PVector(300, 190), 90));
  skraldespands.add(new Skraldespand("madaffald", madaffaldsspand, new PVector(1150, 605)));
  skraldespands.add(new Skraldespand("plastaffald", plastaffaldsspand, new PVector(440, 115)));
  skraldespands.add(new Skraldespand("restaffald", restaffaldsspand, new PVector(1200, 405)));
  skraldespands.add(new Skraldespand("papaffald", papaffaldsspand, new PVector(255, 315)));
  instruktions.add(new Instruktion(bevaegelsesIns, new PVector(50, 520), 100));
  instruktions.add(new Instruktion(opsamlingsIns, new PVector(350, 500), 350));
  instruktions.add(new Instruktion(smidningsIns, new PVector(900, 580), 900));
  instruktions.add(new Instruktion(maalIns, new PVector(600, 350), 600));
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
   } else if (duFuckingLort ==true)
   {
    tabening(); 
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
    duFuckingLort = true;
  }
}

void tabening()
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
  myre.display(); //goes to the display function in Myre class, and draws whatever is there
  for(Skrald skrald : skralds)
  {
    skrald.display();
  }
  fill(0,200);
 rect(0,0,width,height);
 image(tabeskaerm,0,0,width, height);
 tint(255,tint);
 imageMode(CENTER);
 image(genstartknap,width/2,height/2,150,50);
 imageMode(CORNER);
  if (tint < 255)
 {
   tint += 5;
 } else if (mouseX<(width+150)/2 && mouseX>(width-150)/2 && mouseY<(height+50)/2 && mouseY>(height-50)/2 && mousePressed)
 {
   duFuckingLort = false;
   Game = true; 
   tint = 0;
 }
}


void keyPressed() //input function to control the movements of myren.
{
  myre.setMove(keyCode, true); //sets a boolean of the arrow that was pressed to true, making the myre move.
  if (keyCode == 32)//if space is pressed it flips the bool value, so you drop or pick up skrald
  {
    myre.wantToPickUp();
  }
}


void keyReleased() //input function to control the movements of myren.
{
  myre.setMove(keyCode, false);
}


void findInfo()
{
  color col = get(mouseX, mouseY);
  System.out.println("color is " + col);
  fill(300, 300, 300);
  System.out.println("mouse x: " + mouseX + " mouse y: " + mouseY);
}
