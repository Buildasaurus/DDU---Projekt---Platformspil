class Instruktion
{
  PVector location; 
  PImage Image;
  int w;
  int h;
  
  Instruktion(PImage _image, PVector _location)
  {
    this.location = _location;
    this.Image = _image;
  }
  
   void update()
  {
  
  }
  
  void display()
  {
    image(Image, location.x, location.y);
  }
  
  
  
  
  
  
  
  
  
}
