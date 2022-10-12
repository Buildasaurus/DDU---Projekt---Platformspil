  class Button
{
  PVector location;      // Position of square button
  PVector size;  //
  color buttonColor;
  color rectHighlight, circleHighlight;
  boolean hovered;
  
  Button(PVector _location, PVector _size, color _buttonColor)
  {
    location = _location;
    size = _size;
    buttonColor = _buttonColor;
  }
  
  void display() {
    if ( overRect()) 
    {
      fill(buttonColor);
      rect(location.x, location.y, size.x, size.y);
      hovered = true;
    }
    else
    {
      fill(buttonColor + 50);
      rect(location.x, location.y, size.x, size.y);
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
