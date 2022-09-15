class Instruktion
{
  PVector location; 
  PImage Image;
  int w;
  int h;
  int trans;
  int xposition;
  
  Instruktion(PImage _image, PVector _location, int _xposition)
  {
    this.location = _location.copy();
    this.Image = _image;
    w = 200;
    h = 100;
    xposition = _xposition; 
    trans = 0;
  }
   void run()
   {
    update();
    display();
   }
  
   void update()
  {
    if (myre.location.x > xposition && trans < 255)
    {
      trans +=10;
    }
  }
  
  void display()
  {
    tint(255,trans);
    image(Image, location.x, location.y, w, h);
    noTint();
  }
}
