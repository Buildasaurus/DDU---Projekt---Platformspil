class Eksplosion
{
  ArrayList<Particle> p = new ArrayList<Particle>();
  PVector position;
  int size;
  
  Eksplosion(PVector _position, int _size)
  {
    this.position = _position.copy();
    this.size = _size;
  }
  
  void explode()
  {
    for(Particle part:p)
    {
      if (part.lifespan < 0)
      {
        p.remove(part); 
        break;
      }
      part.update();
    }
  }

}
/*

  if (q == true)
  {
    zote();
  }
  
  
  void mousePressed()
{
  q = true;
}

void zote()
{
   for (int i=0; i<200; i++) 
   {
   }
   q = false;
   z = true;
}
*/
