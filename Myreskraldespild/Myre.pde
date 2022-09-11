class Myre
{
  // variables to control position of myre.
  //direction and velocity of myre.
  PVector location = new PVector(400,400);
  PVector velocity = new PVector(0,0);
  int height = 20;
  int width = 10;
  boolean right = false, left = false, up = false, touchingGround = true;
  
  
  
  void update()
  {
    move(); //moves myren if the move booleans are true (if a key is pressed)
    location = PVector.add(location, velocity);
    velocity.x = 0; // reset the x velocity of myreren.
  }
  
  void display() 
  //method that shows a figure (currently a rectangle), at the
  //coordinats of the myre.
  {
      rect(location.x, location.y, width,height);
  }
  
  void move()
  {
    touchingGround = true;
    if(location.y < 400)
    {
      touchingGround = false;
    }
    //touchingGround = isTouchingGround();
    text("tg = " + touchingGround, 40, 40);
    fill(0,0,200);
    if(right == true)
    {
      velocity.x += 2;
    }
    if(left == true)
    {
      velocity.x -= 2;
    }
    if(up == true && touchingGround == true)
    {
      velocity.y -= 10;
      touchingGround= false;
    }
    if(touchingGround == false)
    {
      velocity.y += 1;
    }
    if(touchingGround == true)
    {
      velocity.y = 0;
    }
  }
  
  void setMove(int keycode, boolean bool)
  {
    text("keycode:" + keycode, 40, 140);
    switch(keycode)
    {
      case 39:
        right = bool;
        text("case right" + right, 20, 100);
        return;
      case 38:
        up = bool;
        text("up true true:" + up, 80, 180);
        return;
      case 37:
        left = bool;
        text("left true:" + left, 60, 160);
        return;
    }
  }
  
  boolean isTouchingGround()
  {
    //write code to check if myre is touching ground
    return false;
  }
}
