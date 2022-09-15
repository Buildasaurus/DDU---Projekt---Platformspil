class Skraldespand
{
  PVector location;
  int h = 72;
  int w = 65;
  String sortingType;
  PImage skraldespandsImage;
  
  Skraldespand(String _sortingType, PImage _image, PVector _location)
  {
    this.sortingType = _sortingType;
    this.skraldespandsImage = _image.copy();
    this.location = _location.copy();
  }
  
  void update()
  {
  
  }
  
  void display()
  {
    image(skraldespandsImage, location.x, location.y, w, h);
  }

}
