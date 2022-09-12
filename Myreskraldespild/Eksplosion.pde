class Eksplosion{
 PVector location;
 PVector velocity;
 PVector acceleration;
 float lifespan;
 
 
  Eksplosion(PVector l){
  velocity = new PVector(random(-2,2),random(-3,0));
  acceleration = new PVector(0,0.05);
  location = l.copy();
  lifespan = 255;
 }
 
void run(){
 update();
 display();
}

 void update()
 {
   if (lifespan > 0)
   {
   velocity.add(acceleration);
  location.add(velocity);
  lifespan -= 5;
   }
 }
 
 void display()
 {
   stroke(0, lifespan);
   fill(255,255,0,lifespan);
   ellipse(location.x,location.y,10,10);
 }
  boolean isDead()
  {
    if (lifespan < 0) 
    {
      return true;
    } else 
    {
      return false;
    }
  }
}
