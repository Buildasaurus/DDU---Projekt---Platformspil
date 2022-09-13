class Myre
{
  //variables to control position of myre.
  //direction and velocity of myre.
  PVector location = new PVector(400,400);
  PVector velocity = new PVector(0,0);
  int h = 20;
  int w = 10;
  boolean right = false, left = false, up = false, touchingGround = false, touchingCeiling = false, pickedUp = false; 
  float jumpPower = -5;
  float gravity = 0.05;
  

   
  
  void update()
  {
    move(); //moves myren if the move booleans are true (if a key is pressed)
    location.x = location.x + velocity.x;
    text("location y: " + location.y, 550, 250);
    location.y = location.y + velocity.y;
    System.out.println("last" + location.y);
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
    touchingCeiling = isTouchingCeiling();
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
      velocity.y = jumpPower; //<>//
      touchingGround = false;
    }
    if(touchingGround == false) //if not touching ground, apply gravity.
    {
      velocity.y += gravity;
    }
    if(touchingGround == true && up != true) // if touching ground, stop accelerating downw
    {
      text("this does happen" + up, 200, 200);
      velocity.y = 0;
    }
    if(pickedUp == true)
    {
      pickUp(skrald);
    }
    if (touchingCeiling == true)
    {
      velocity.y = abs(velocity.y) * 0.5;
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
    color[] colors = new color[200];
    for(int i = 1; i < colors.length; i++)
    {
      colors[i] = get(ceil(location.x), ceil(location.y + 20 + i*0.01));
    }

    for(int i = 0; i < colors.length; i++)
    {
      if (colors[i] == -16777216) //if the color beneath the myre is black, then it the myre is touching the floor
      {
            System.out.println("before" + location.y);
        location.y = location.y + i*0.01 - 0.1;
            System.out.println("after" + location.y + " " + i);

        return true;
      }
    }
    return false;
  }
  
  boolean isTouchingCeiling()//checks whether the myre is touching the cealing
  {
    color[] colors = new color[100];
    for(int i = 1; i < colors.length; i++)
    {
      colors[i] = get(ceil(location.x), ceil(location.y - i*0.1));
    }

    for(int i = 0; i < colors.length; i++)
    {
      if (colors[i] == -16777216) //if the color above the myre is black, then it the myre is touching the floor
      {
        text("true", 399, 300);
        return true;
      }
    }
    text("false", 399, 300);
    return false;
  }
  
  void pickUp(Skrald skrald)//Making a method to change the location of skrald.
  {
  //calling the set funktion to set the location of skrald above myre and follow.
  skrald.set(new PVector(this.location.x,this.location.y-skrald.height));
  }
}
