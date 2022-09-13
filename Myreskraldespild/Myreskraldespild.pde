Myre myre = new Myre();
Skrald skrald = new Skrald();
Skraldespand skraldespand = new Skraldespand();
PImage platforms;
PImage front;
Particle [] p = new Particle [100];
boolean z = false;
boolean q = false;

void setup()
{
  size(1280,720); // 16:9 ratio
  platforms = loadImage("Baggrund til myrespil.png");
  front = loadImage("Forgrund til myrespil.png");
  frameRate(300);
}

void draw()
{
  clear();
  background(platforms);
  myre.update(); //method that update Myrerens velocity and location.
  background(front);
  myre.display(); //goes to the display function in Myre class, and draws whatever is there
  skrald.display();
  skraldespand.display();
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
     p[i] = new Particle(new PVector(mouseX,mouseY)); 
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
