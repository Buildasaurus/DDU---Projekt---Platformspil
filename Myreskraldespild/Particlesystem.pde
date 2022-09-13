class ParticleSystem
{
  ArrayList<Eksplosion> particles;
  PVector origin;
  
  ParticleSystem(PVector location)
  {
  origin = location.copy();
  particles = new ArrayList<Eksplosion>();
  }
  void addParticle() {
   particles.add(new Eksplosion(origin));
  }
  
  void run() 
  {
    for (int i = particles.size()-1; i >= 0; i--)
    {
     Eksplosion ex = particles.get(i);
     ex.run();
     if (ex.isDead())
     {
      particles.remove(i); 
     }
    }
  }
}
