class Skraldespand
{
  PVector location = new PVector();
  int h = 30;
  int w = 20;
  
  Skraldespand(PVector l)
  {
     location = l.copy();
  }
  void update()
  {
  
  }
  
  void display()
  {
    rect(location.x, location.y, w, h);
  }

}
