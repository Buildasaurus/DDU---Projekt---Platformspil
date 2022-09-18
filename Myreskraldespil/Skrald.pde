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
  int rotateAngle = 0;
  
  void setLocation(PVector _location)
  {
    location = _location.copy();
  }
  
  Skrald(String _ID, PImage _image, int _h, int _w, PVector _location, int _rotateAngle) //e.g "bioaffald"
  {
    this.sortingType = _ID;
    this.skraldImage = _image.copy();
    this.h = _h;
    this.w = _w;
    this.location = _location.copy();
    this.rotateAngle = _rotateAngle;
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
    pushMatrix();
    imageMode(CENTER);
    translate(location.x, location.y);
    rotate(radians(rotateAngle));
    image(skraldImage, 0, 0, w, h);
    imageMode(CORNER);
    popMatrix();    
  }
  
  void set(PVector newLocation)//making a set function to change location of skrald in myre class
  {
    this.location = newLocation;
  }
}
