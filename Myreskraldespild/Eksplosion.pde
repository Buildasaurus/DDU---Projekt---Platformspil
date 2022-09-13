class Particle
{
  PVector p;
  PVector v;
  PVector a;
  float lifespan;

  Particle (PVector l)
  {
    v = new PVector(random(-2,2),random(-5,0)); 
    a = new PVector(0,0.05);
    p = l.copy();
    lifespan = 255;
  }

  void update ()
  {
    v.add(a);
    p.add(v);
    lifespan -= 2;
    fill (255,255,0, lifespan);
    rect (p.x, p.y, 10, 10);
  }
}
