class Skrald
{
  //variables to control of skrald
  //direction and velocity of skrald
  PVector location;
  PVector velocity = new PVector(0,0);
  int h;
  int w;
  String sortingType;
  PImage skraldImage;
  boolean isPickedUp = false;
  
  void update()
  {

  }
  
  Skrald(String _ID, PImage _image, int _h, int _w, PVector _location) //e.g "bioaffald"
  {
    this.sortingType = _ID;
    this.skraldImage = _image.copy();
    this.h = _h;
    this.w = _w;
    this.location = _location.copy();
  }
  

  void display()//Showing skrald (right now a rectangle)
  {
    image(skraldImage, location.x, location.y - h + h/5, w, h); 
    System.out.println("location x: " + location.x + "location y: " +  location.y);
  }
  
  void set(PVector newLocation)//making a set function to change location of skrald in myre class
  {
    this.location = newLocation;
  }
}
