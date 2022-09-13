class Skrald
{
  //variables to control of skrald
  //direction and velocity of skrald
  PVector location = new PVector(200,415);
  PVector velocity = new PVector(0,0);
  int tallness = 5;
  int breadth = 10;
  int banan = 1;
  int sugeror = 2;
  int pizza = 3;
  
  void update()
  {

    
  }

  void display()//Showing skrald (right now a rectangle)
  {
    rect(location.x, location.y, breadth, tallness); 
  }
  void set(PVector newLocation)//making a set function to change location of skrald in myre class
  {
    this.location = newLocation;
  }
}
