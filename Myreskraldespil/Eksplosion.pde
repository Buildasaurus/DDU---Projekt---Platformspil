class Eksplosion
{
  ArrayList<Particle> particles = new ArrayList<Particle>();
  PVector position;
  int size;
  
  Eksplosion(PVector _position, int _size)
  {
    this.position = _position.copy();
    this.size = _size;
    
    for(int i = 0; i < size; i++)
    {
      particles.add(new Particle(position));
    }
  }
  
  void explode()
  {
    for(Particle particle : particles)
    {
      if (particle.lifespan < 0)
      {
        particles.remove(particle); 
        Game = false;
        duFuckingLort = true;
        break;
      }
      particle.update();
    }
  }

}
