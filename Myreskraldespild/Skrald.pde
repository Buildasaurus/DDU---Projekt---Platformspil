class Skrald
{
  //variables to control of skrald
  //direction and velocity of skrald
  PVector location = new PVector(200,415);
  PVector velocity = new PVector(0,0);
  int h = 5;
  int w = 10;
  

  void display()//Showing skrald (right now a rectangle)
  {
    rect(location.x, location.y, w, h); 
  }
  void set(PVector newLocation)//making a set function to change location of skrald in myre class
  {
    this.location = newLocation;
  }
}
