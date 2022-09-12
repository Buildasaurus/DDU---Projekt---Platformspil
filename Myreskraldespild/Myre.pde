class Myre
{
  //variables to control position of myre.
  //direction and velocity of myre.
  PVector location = new PVector(400,400);
  PVector velocity = new PVector(0,0);
  int h = 20;
  int w = 10;
  boolean right = false, left = false, up = false, touchingGround = false, pickedUp = false;
  

   
  
  void update()
  {
    move(); //moves myren if the move booleans are true (if a key is pressed)
    location.x = location.x + velocity.x;
    location.y = location.y + velocity.y;
    velocity.x = 0; // reset the x velocity of myreren.
    text("velocity y: " + velocity.y, 300, 250);
    text("velocity x: " + velocity.x, 450, 250);

  }
  
  void display()
  //method that shows a figure (currently a rectangle), at the
  //coordinats of the myre.
  {
      rect(location.x, location.y, w, h);
  }
  
  void move() //moves myren if the arrows are clicked.
  {
    touchingGround = isTouchingGround();
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
      velocity.y -= 6;
      touchingGround= false;
    }
    if(touchingGround == false) //if not touching ground, apply gravity.
    {
      velocity.y += 0.05;
    }
    if(touchingGround == true) // if touching ground, stop accelerating downw
    {
      velocity.y = 0;
    }
    if(pickedUp == true)
    {
      pickUp(skrald);
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

  boolean isTouchingGround() //returns a bool, whether the myre is touching ground or not
  {
    text("location y: " + location.y, 450, 300);
    color[] colors = new color[10];
    for(int i = 0; i < colors.length; i++)
    {
      colors[i] = get(ceil(location.x), ceil(location.y + 20 + i*0.2));
    }
    
    color c = get(ceil(location.x), ceil(location.y + 20)); //gets the color underneath the myre
    if (location.y > 400)
    {
      //return true;
    }
    for(int i = 0; i < colors.length; i++)
    {
      if (colors[i] == -16777216) //if the color beneath the myre is black, then it the myre is touching the floor
      {
        location.y = location.y + i*0.2;
        return true;
      }
    }
    return false;
  }
  
  boolean isTouchingCeil()//checks whether the myre is touching the cealing
  {
    color c = get(ceil(location.x), ceil(location.y  - 1)); //gets the color underneath the myre
    if (c == -16777216) //if the color beneath the myre is black, then it the myre is touching the floor
    {
      text("nice", 400, 300);
      location.y = location.y - 1;
      return true;
    }
    return false;
  }
  
  void pickUp(Skrald skrald)//Making a method to change the location of skrald.
  {
  //calling the set funktion to set the location of skrald above myre and follow.
  skrald.set(new PVector(this.location.x,this.location.y-skrald.height));
  }
}
