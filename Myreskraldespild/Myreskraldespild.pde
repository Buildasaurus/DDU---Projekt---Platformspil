Myre myre = new Myre();
Skrald skrald = new Skrald();
Skraldespand[] skraldespands = {new Skraldespand(new PVector(100,100)),new Skraldespand(new PVector(200,200))};
boolean start = true;
float startKnap = 50;
PImage platforms;
PImage front;
PImage startskaerm;
Particle[] p = new Particle [200];
boolean z = false;
boolean q = false;

void setup()
{
  size(1280,720); // 16:9 ratio
  platforms = loadImage("Baggrund til myrespil.png");
  front = loadImage("Forgrund til myrespil 2.png");
  startskaerm = loadImage("Myrestartskaerm.png");
  frameRate(300);
}

void draw()
{
  if (start == true)
   {
     Start(); 
   } else
   {
     game(); 
   }
}

void Start(){
  background(startskaerm);
  PFont font;
  font = loadFont("KRAnts-48.vlw");
  textFont(font);
  textAlign(CENTER);
  fill(0);
  text("SPIL",width/2,height/2-75);
  rectMode(CENTER);
  rect(width/2,height/2,startKnap,startKnap);
  if (mouseX<(width+startKnap)/2 && mouseX>(width-startKnap)/2 && mouseY<(height+startKnap)/2 && mouseY>(height-startKnap)/2 && mousePressed)
  {
    start = false;
    rectMode(CORNER);
  }
  
}

void game()
{
  clear();
  background(platforms);
  myre.update(); //method that update Myrerens velocity and location.
  background(front);
  myre.display(); //goes to the display function in Myre class, and draws whatever is there
  skrald.display();
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
    for(int i=0; i<p.length; i++) 
    {
      p[i].update();
    }
  }
}

void mousePressed()
{
  q = true;
}

void zote()
{
   for (int i=0; i<p.length; i++) 
   {
     p[i] = new Particle(new PVector(skraldespands[0].location.x,skraldespands[0].location.y)); 
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
