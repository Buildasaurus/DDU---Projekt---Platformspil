class Particle
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  int lifespan;
  float particleSize;
  float theta;

  Particle (PVector _location) // constructer of particle, saves the values.
  {
    theta = random(0,2*PI);
    velocity = new PVector(cos(theta)*random(0,5),sin(theta)*random(0,5)); //gør så at disse partikler skyder ud tifældigt i en cirkelbevægelse frem for en firkant
    acceleration = new PVector(0,0.01);
    location = _location.copy();
    lifespan = 255;
    particleSize = 1;
  }
  


  void update ()  //gør så partiklen bevæger sig samtidig med at den gradvist forsvinder og bliver større.
  {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2;
    particleSize +=0.4;
    fill (255,random(125,255),random(0), lifespan);
    noStroke();
    rect (location.x, location.y, particleSize, particleSize);
    stroke(0);
    fill(255);
  }
}
