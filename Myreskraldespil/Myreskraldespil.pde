Myre myre = new Myre();
ArrayList<Skrald> skralds = new ArrayList<Skrald>();
ArrayList<Skraldespand> skraldespands = new ArrayList<Skraldespand>();
ArrayList<Instruktion> instruktions = new ArrayList<Instruktion>();
boolean start = true;
boolean Game = false;
float startKnapx = 140;
float startKnapy = 100;
PImage startskaerm, startlogo, startknap;
PImage front, platforms, Genbrugsknap, sorteringsliste;
PImage banan, pizzabakke;
PImage madaffaldsspand, plastaffaldsspand, papaffaldsspand, restaffaldsspand;
PImage bevaegelsesIns, opsamlingsIns, smidningsIns, maalIns;
PImage myreimage;
PImage myreimageWithSkrald, myreimageWithoutSkrald;
boolean z = false;
boolean q = false;

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
  myreimageWithSkrald = loadImage("Myre med skrald.png");
  myreimageWithoutSkrald = loadImage("Myre uden skrald.png");
  madaffaldsspand = loadImage("Skraldespand - Madaffald.png");
  plastaffaldsspand = loadImage("Skraldespand - Plastaffald.png");
  papaffaldsspand = loadImage("Skraldespand - Papaffald.png");
  restaffaldsspand = loadImage("Skraldespand - Restaffald.png");
  bevaegelsesIns = loadImage("BevaegelsesInstruktion.png");
  opsamlingsIns = loadImage("SamleOpInstruktion.png");
  smidningsIns = loadImage("SmideIgenInstruktion.png");
  maalIns = loadImage("MaalInstruktion.png");
  sorteringsliste = loadImage("Sorteringsliste.png");

  frameRate(300);
  skralds.add(new Skrald("madaffald", banan, 20, 20, new PVector(400, 300)));
  skralds.add(new Skrald("madaffald", pizzabakke, 60, 60, new PVector(300, 600)));
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
   else
   {
     liste();
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


  rect(0, 0, 85, 85);
  fill(150, 200, 150, 200);
  noStroke();
  image(Genbrugsknap, 10, 10, 65, 65);
  if (mouseX < 75 && mouseX> 10 && mouseY< 75 && mouseY> 10 && mousePressed)
  {
    Game = false; 
  }
}


void liste() //shows the sorteringsliste in fullscreen mode. only runs if game is false. Cancelled by making game = true.
{
  imageMode(CENTER);
  image(sorteringsliste, width/2, height/2);
  if (mouseX>1000)
  {
    imageMode(CORNER);
    Game = true;
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
