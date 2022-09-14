class Myre
{
  //variables to control position of myre.
  //direction and velocity of myre.
  PVector location = new PVector(200,600);
  PVector velocity = new PVector(0,0);
  int tallness = 20;
  int breadth = 10;
  boolean right = false, left = false, up = false, touchingGround = false, touchingCeiling = false, pickedUp = false; 
  float jumpPower = -4;
  float gravity = 0.05;
  

   
  
  void update()
  {
    move(); //moves myren if the move booleans are true (if a key is pressed)
    bounce();
    dontWalkThroughWalls();
    location.x = location.x + velocity.x;
    location.y = location.y + velocity.y;
    velocity.x = 0; // reset the x velocity of myreren.
  }
  
  void display()
  //method that shows a figure (currently a rectangle), at the
  //coordinats of the myre.
  {
      rect(location.x, location.y, breadth, tallness);
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
      velocity.y = jumpPower; //<>// //<>// //<>//
      touchingGround = false;
    }
    if(touchingGround == false) //if not touching ground, apply gravity.
    {
      velocity.y += gravity;
    }
    if(touchingGround == true && up != true) // if touching ground, stop accelerating downw
    {
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
    color[] colors = new color[200];
    for(int i = 1; i < colors.length; i++)
    {
      colors[i] = get(ceil(location.x), ceil(location.y + 20 + i*0.01));
    }

    for(int i = 0; i < colors.length; i++)
    {
      if (colors[i] == -16777216) //if the color beneath the myre is black, then it the myre is touching the floor
      {
        location.y = location.y + i*0.01 - 0.2; // the last constant choses the velocity of which myren is pushed up from the floor

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
      colors[i] = get(ceil(location.x), ceil(location.y - i*0.02));
    }

    for(int i = 0; i < colors.length; i++)
    {
      if (colors[i] == -16777216) //if the color above the myre is black, then it the myre is touching the floor
      {
        return true;
      }
    }
    return false;
  }
  
  void pickUp(Skrald skrald)//Making a method to change the location of skrald.
  {
  //calling the set funktion to set the location of skrald above myre and follow.
  skrald.set(new PVector(this.location.x,this.location.y-skrald.tallness));
  }
  
  void bounce() //bounces the myre off the walls, and the roof.
  {
    if(location.x < 3)
    {
      location.x = location.x + 3;
    }
    if (location.x > width-12)
    {
      location.x = location.x -3;
    }
    if (location.y < 0)
    {
      location.y = location.y +3;
      velocity.y = 0;
    }
  }
  
 void dontWalkThroughWalls() //returns a bool, whether the myre is touching ground or not
  {
    int depthWidthRatio = 2;
    int heightToScan = tallness-4; //how many pixels to the side of the myre should be checked if they are a wall. This is not equal to the height of the myre, since we don't want to scan the pixels at the feet of the myre, enabling it to walk on crooked floors
    int arraySize = 200;
    color[] leftColors = new color[arraySize];    
    color[] rightColors = new color[arraySize];    

    //checking left side
    for(int j = 0; j < arraySize/depthWidthRatio; j++) //each repeat is a different heigh level. it will currently look 4 pixels to the side of the myre
      {
        for(int k = 0; k < depthWidthRatio; k++)
        {
           leftColors[j*(k+1)] = get(ceil(location.x - breadth/2 - k +0.1), ceil(location.y + heightToScan*j/(arraySize/depthWidthRatio))); //check all the pixels in a rectangle to the left of the myre, above the ground.
        }
      }
      fill(100, 200, 100);

      for(int i = 0; i < arraySize; i++)
      {
        if (leftColors[i] == -16777216) //if the color beneath the myre is black, then it the myre is touching the floor
        {
          velocity.x = velocity.x + 0.1; //move the myre backwards to the right the amount of
        }
      }
      
      
      //checking right side
      for(int j = 0; j < arraySize/depthWidthRatio; j++) //each repeat is a different heigh level. it will currently look 4 pixels to the side of the myre
      {
        for(int k = 0; k < depthWidthRatio; k++)
        {
           rightColors[j*(k+1)] = get(ceil(location.x + breadth/2 - k +0.1), ceil(location.y + heightToScan*j/(arraySize/depthWidthRatio))); //check all the pixels in a rectangle to the right of the myre, above the ground.
        }
      }
      fill(100, 200, 100);

      for(int i = 0; i < arraySize; i++)
      {
        if (rightColors[i] == -16777216) //if the color beneath the myre is black, then it the myre is touching the floor
        {
          velocity.x = velocity.x - 0.1; //move the myre backwards to the right the amount of
        }
      }
    
  } // end dontWalkThroughWalls
}// end class
