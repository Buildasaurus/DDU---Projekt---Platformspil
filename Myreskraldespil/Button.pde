class Button
{
  PVector location;      // Position of square button
  PVector size;  // Position of circle button
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
    if ( overRect(location.x, location.y, size.x, size.y)) 
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
  
  boolean overRect(float x, float y, float width, float height)  {
    if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
  }
}
