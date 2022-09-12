class Myre
{
  //variables to control position of myre.
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
  
  void move() //moves myren if the arrows are clicked.
  {
    touchingGround = true;
    if(location.y < 400)
    {
      touchingGround = false;
    }
    //touchingGround = isTouchingGround();
    fill(0,0,200);
    if(right == true)
    {
      velocity.x += 2;
    }
    if(left == true)
    {
      velocity.x -= 2;
    }
    
    //jump only if myren is on the ground
    if(up == true && touchingGround == true)
    {
      velocity.y -= 10;
      touchingGround= false;
    }
    if(touchingGround == false) //if not touching ground, apply gravity.
    {
      velocity.y += 1;
    }
    if(touchingGround == true) // if touching ground, stop accelerating downw
    {
      velocity.y = 0;
    }
  }
  
  void setMove(int keycode, boolean bool) //set the booleans of the directions, to figure which key is pressed
  {
    switch(keycode) //alternative if statement.
    {
      case 39: //if right arrow is clicked
        right = bool;
        return;
      case 38: //if up arrow is clicked
        up = bool;
        return;
      case 37: //if left arrow is clicked
        left = bool;
        return;
      case 32:
        
    }
  }
  
  boolean isTouchingGround()
  {
    //write code to check if myre is touching ground
    return false;
  }
  void pickUp(Skrald skrald)//Making a method to change the location of skrald.
  {
  skrald.set(new PVector(this.location.x,this.location.y-skrald.height));
  //calling the set funktion to set the location of skrald above myre and follow.
  }
}
