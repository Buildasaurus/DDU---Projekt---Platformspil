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
  
  void update()
  {

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
    translate(location.x, location.y - h/2 );
    rotate(radians(rotateAngle));
    image(skraldImage, 0, 0, w, h); 
    popMatrix();    
  }
  
  void set(PVector newLocation)//making a set function to change location of skrald in myre class
  {
    this.location = newLocation;
  }
}
