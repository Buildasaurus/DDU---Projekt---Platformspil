class Skrald
{
  //variables to control of skrald
  //direction and velocity of skrald
  PVector location = new PVector(200,415);
  PVector velocity = new PVector(0,0);
  int h;
  int w;
  String ID;
  PImage image;
  
  void update()
  {

  }
  
  Skrald(String _ID, PImage _image, int _h, int _w) //e.g "bioaffald"
  {
    this.ID = _ID;
    this.image = _image;
    this.h = _h;
    this.w = _w;
  }
  

  void display()//Showing skrald (right now a rectangle)
  {
    rect(location.x, location.y, w, h); 
  }
  
  void set(PVector newLocation)//making a set function to change location of skrald in myre class
  {
    this.location = newLocation;
  }
}
