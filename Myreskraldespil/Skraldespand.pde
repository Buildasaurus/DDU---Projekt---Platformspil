class Skraldespand
{
  PVector location;
  int h = 72;
  int w = 65;
  String sortingType;
  PImage skraldespandsImage;
  
  Skraldespand(String _sortingType, PImage _image, PVector _location) //constructor, saves the values
  {
    this.sortingType = _sortingType;
    this.skraldespandsImage = _image.copy();
    this.location = _location.copy();
  }

  
  String toString() //to string, in case there are problems
  {
    return("sorterings type: " + sortingType + " location: " + location.x + " " + location.y);
  }
  
  void display()
  {
    image(skraldespandsImage, location.x, location.y, w, h);
  }
}
