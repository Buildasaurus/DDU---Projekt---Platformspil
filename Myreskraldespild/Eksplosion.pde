class Particle
{
  PVector p;
  PVector v;
  PVector a;
  float lifespan;
  float particleSize;
  float theta;

  Particle (PVector l)
  {
    theta = random(0,2*PI);
    v = new PVector(cos(theta)*random(0,5),sin(theta)*random(0,5)); 
    a = new PVector(0,0.01);
    p = l.copy();
    lifespan = 255;
    particleSize = 1;
  }

  void update ()
  {
    v.add(a);
    p.add(v);
    lifespan -= 2;
    particleSize +=0.4;
    fill (255,random(125,255),random(0), lifespan);
    noStroke();
    rect (p.x, p.y, particleSize, particleSize);
    stroke(0);
    fill(255);
  }
}
