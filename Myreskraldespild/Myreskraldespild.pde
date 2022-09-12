Myre myre = new Myre();
boolean TouchingFloor = true;
ParticleSystem ps;
void setup()
{
  size(1280,720); // 16:9 ratio
  ps = new ParticleSystem(new PVector(myre.location.x,myre.location.y));
}

void draw()
{
  clear();
  background(200, 250, 200);
  myre.update(); //method that update Myrerens velocity and location.
  myre.display(); //goes to the display function in Myre class, and draws whatever is there
  if (myre.location.x > 430)
  {
   ps.addParticle();
   ps.run();
  }
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
