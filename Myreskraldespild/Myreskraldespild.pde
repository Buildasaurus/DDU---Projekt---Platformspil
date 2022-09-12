Myre myre = new Myre();
Skrald skrald = new Skrald();
PImage scene;

void setup()
{
  size(1280,720); // 16:9 ratio
  scene = loadImage("bane.png");
  frameRate(300);
}

void draw()
{
  clear();
  background(scene);
  myre.update(); //method that update Myrerens velocity and location.
  myre.display(); //goes to the display function in Myre class, and draws whatever is there
  skrald.display(); 

  findColor();
}

void keyPressed() //input function to control the movements of myren.
{
  myre.setMove(keyCode, true);
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
