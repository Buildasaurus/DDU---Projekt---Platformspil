class Skrald
{
  //variables to control of skrald
  //direction and velocity of skrald
  PVector location;
  PVector velocity = new PVector(0,0);
  int h;
  int w;
  String ID;
  PImage skraldImage;
  boolean isPickedUp = false;
  
  void update()
  {

  }
  
  Skrald(String _ID, PImage _image, int _h, int _w, PVector _location) //e.g "bioaffald"
  {
    this.ID = _ID;
    this.skraldImage = _image;
    this.h = _h;
    this.w = _w;
    this.location = _location;
  }
  

  void display()//Showing skrald (right now a rectangle)
  {
    image(skraldImage, location.x, location.y, w, h); 
  }
  
  void set(PVector newLocation)//making a set function to change location of skrald in myre class
  {
    this.location = newLocation;
  }
}
