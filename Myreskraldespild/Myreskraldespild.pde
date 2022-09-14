Myre myre = new Myre();
ArrayList<Skrald> skralds = new ArrayList<Skrald>();
Skraldespand[] skraldespands = {new Skraldespand(new PVector(100,100)),new Skraldespand(new PVector(200,200))};
boolean start = true;
float startKnapx = 140;
float startKnapy = 100;
PImage startskaerm, startlogo, startknap;
PImage front, platforms;
PImage banan, pizzabakke;
ArrayList<Particle> p = new ArrayList<Particle>();
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
  banan = loadImage("banan.png");
  pizzabakke = loadImage("Pizzabakke.png");
  frameRate(300);
  skralds.add(new Skrald("bioaffald", banan, 20, 20, new PVector(400, 300)));
  skralds.add(new Skrald("bioaffald", pizzabakke, 40, 40, new PVector(300, 400)));

}

void draw()
{
  if (start == true)
   {
     startscreen(); 
   } 
   else
   {
     game(); 
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
    rectMode(CORNER);
    imageMode(CORNER);
  }
}


void game()
{
  clear();
  background(platforms);
  myre.update(); //method that update Myrerens velocity and location.
  background(front);
  myre.display(); //goes to the display function in Myre class, and draws whatever is there
  for(Skrald skrald : skralds)
  {
    skrald.display();
  }
  for (int i = 0; i < skraldespands.length; i++)
  {
    skraldespands[i].display();
  }
  if (q == true)
  {
    zote();
  }
  if (z == true)
  {
    for(Particle part:p)
    {
      if (part.lifespan < 0)
      {
        p.remove(part); 
        break;
      }
      part.update();
    }
  }
}


void mousePressed()
{
  q = true;
}


void zote()
{
   for (int i=0; i<200; i++) 
   {
     p.add(new Particle(new PVector(skraldespands[0].location.x,skraldespands[0].location.y)));
   }
   q = false;
   z = true;
}


void keyPressed() //input function to control the movements of myren.
{
  myre.setMove(keyCode, true);
  if (keyCode == 32)//if space is pressed it flips the bool value, so you drop or pick up skrald
  {
    myre.pickedUp = !myre.pickedUp;
  }
  rect(20,20,20,20);
  fill(200, 300, 300);
}


void keyReleased() //input function to control the movements of myren.
{
  myre.setMove(keyCode, false);
}


void findColor()
{
  color col = get(mouseX, mouseY);
  text("color is " + col, 300, 300);
  fill(300, 300, 300);
  text("mouse x: " + mouseX + " mouse y: " + mouseY, 600, 300);
}
