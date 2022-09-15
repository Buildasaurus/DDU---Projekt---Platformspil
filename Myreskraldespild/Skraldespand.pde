class Skraldespand
{
  PVector location;
  int h;
  int w;
  String sortingType;
  PImage skraldespandsImage;
  
  Skraldespand(String _sortingType, PImage _image, int _h, int _w, PVector _location)
  {
    this.sortingType = _sortingType;
    this.skraldespandsImage = _image;
    this.h = _h;
    this.w = _w;
    this.location = _location;
  }
  
  void update()
  {
  
  }
  
  void display()
  {
    image(skraldespandsImage, location.x, location.y, w, h);
  }

}
