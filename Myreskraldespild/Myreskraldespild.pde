Myre myre = new Myre();
boolean TouchingFloor = true;

void setup()
{
  size(1280,720); // 16:9 ratio
}

void draw()
{
  clear();
  background(200, 250, 200);
  myre.update(); //method that update Myrerens velocity and location.
  myre.display(); //goes to the display function in Myre class, and draws whatever is there
}

void keyPressed() //input function to control the movements of myren.
{
  myre.setMove(keyCode, true);
  rect(20,20,20,20);
}

void keyReleased() //input function to control the movements of myren.
{
  myre.setMove(keyCode, false);
}
