class Instruktion
{
  PVector location; 
  PImage Image;
  int w;
  int h;
  int tint;
  int xposition;
  int yposition;
  
  Instruktion(PImage _image, PVector _location, int _xposition, int _yposition)
  {
    this.location = _location.copy();
    this.Image = _image;
    w = 250;
    h = 100;
    xposition = _xposition;
    yposition = _yposition; 
    tint = 0;
  }
  
  void setTint(int _tint)
  {
    tint = _tint;
  }
  
  void run()
   {
    update();
    display();
   }
  
   void update()
  {
    if (myre.location.x > xposition && myre.location.y < yposition && tint < 255)
    {
      tint +=10;
    }
    //hvis myren kommer inden for et bestemt område, så dukker instruktionerne gradvist frem
  }
  
  void display()
  {
    tint(255,tint);
    image(Image, location.x, location.y, w, h);
    noTint();
    //Viser introduktionerne, og sikre at alle andre billeder ikke har samme gennemsigtighed.
  }
}
