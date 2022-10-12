  class Button
{
  PVector location;      // Position of square button
  PVector size;  // Position of circle button
  boolean hovered;
  PImage sprite;
  
  Button(PImage _sprite, PVector _location, PVector _size)
  {
    location = _location;
    size = _size;
    sprite = _sprite;
  }
  
  void display() {
    if ( overRect()) 
    {
      tint(75);
      image(sprite, location.x, location.y, size.x, size.y);
      hovered = true;
      noTint();
    }
    else
    {
      noTint();
      image(sprite,location.x, location.y, size.x, size.y);
      hovered = false;
    }
  }
  
  boolean overRect()  {
    if (mouseX >= location.x && mouseX <= location.x+size.x && mouseY >= location.y && mouseY <= location.y+size.y) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
  }
}
