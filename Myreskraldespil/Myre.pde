class Myre
{
  //variables to control position of myre.
  //direction and velocity of myre.
  PVector location = new PVector(200,600);
  PVector velocity = new PVector(0,0);
  int h = 50;
  int w = 30;
  boolean right = false, left = false, up = false, touchingGround = false, touchingCeiling = false, pickedUp = false, holdingSkrald = false; 
  float myreSpeed = 7.9;
  float jumpPower = -19.5;
  float gravity = 1;
  boolean lastright = true;
  int walkingPace = 6;
  int lastpicture = 0;
  
  void setLocation(PVector _Location)
  {
   location = _Location; 
  }
  
  void update()
  {
    move(); //moves myren if the move booleans are true (if a key is pressed)
    bounce();
    dontWalkThroughWalls();
    for(Skrald skrald : skralds)
    {
      if(skrald.isPickedUp == true)
      {
        hold(skrald);
      }
    }
    location.x = location.x + velocity.x;
    location.y = location.y + velocity.y;
    velocity.x = 0; // reset the x velocity of myreren.
  }
    
  
  void display()
  //method that shows a figure (currently a rectangle), at the
  //coordinats of the myre.
  {
    holdingSkrald = false;
    
    for(Skrald skrald : skralds)
    {
      if(skrald.isPickedUp)
      {
        holdingSkrald = true;
      }
    }
    
    
    if (lastright == true) // if the last thing myre did was walking right
    {
     if(holdingSkrald == true)//if holding skrald and walking right
      { 
        if(right == true) // if currently walking right
        {
          //change images when walking
          if(frameCount % walkingPace > walkingPace - walkingPace/6 || frameCount % walkingPace <= walkingPace/6) // top and bottom part of framrates
          {
            lastpicture = 0;
            image(myrereWithSkrald[0], location.x, location.y, w+3, h+3); //plussing with 3, because the myre doesn't perfectly fit the square that it is calculated in
          }
          else if(frameCount % walkingPace > walkingPace/6 && frameCount % walkingPace <= walkingPace/2) // middle bottom part of framrates
          {
            lastpicture = 1;
            image(myrereWithSkrald[1], location.x, location.y, w+3, h+3);
          }
          else
          {
            lastpicture = 2;
            image(myrereWithSkrald[2], location.x, location.y, w+3, h+3);
          }
        }
        
        else // if not not currently walking, but turned right and holding skrald
        {
          image(myrereWithSkrald[lastpicture], location.x, location.y, w+3, h+3); 
        }
      }
      
      
      else //if not holding skrald and  right
      {
        if(right == true) // if currently walking right
        {
          //change images when walking
          if(frameCount % walkingPace > walkingPace - walkingPace/6 || frameCount % walkingPace <= walkingPace/6) // top and bottom part of framrates
          {
            lastpicture = 0;
            image(myrereWithoutSkrald[0], location.x, location.y, w+3, h+3); //plussing with 3, because the myre doesn't perfectly fit the square that it is calculated in
          }
          else if(frameCount % walkingPace > walkingPace/6 && frameCount % walkingPace <= walkingPace/2) // middle bottom part of framrates
          {
            lastpicture = 1;
            image(myrereWithoutSkrald[1], location.x, location.y, w+3, h+3);
          }
          else
          {
            lastpicture = 2;
            image(myrereWithoutSkrald[2], location.x, location.y, w+3, h+3);
          }
        }
        
        else // if not not currently walking, but turned right and not holding skrald
        {
          image(myrereWithoutSkrald[lastpicture], location.x, location.y, w+3, h+3); 
        }
      }     
    }    
    
    
    //if the last thing the myre did was walking right
    
    if (lastright == false) //if the last thing myre did was walking left
    {
      if(holdingSkrald == true)//if holding skrald and walking left
      {
        if(left == true) // if currently walking right
        {
          if(frameCount % walkingPace > walkingPace - walkingPace/6 || frameCount % walkingPace <= walkingPace/6) //top and bottom part of framrates
          {
            lastpicture = 0;
            pushMatrix();
            translate(location.x + w, location.y);
            scale(-1, 1);
            image(myrereWithSkrald[0], 0, 0, w+3, h+3); //plussing with 3, because the myre doesn't perfectly fit the square that it is calculated in
            popMatrix();
          }
          else if(frameCount % walkingPace > walkingPace/6 && frameCount % walkingPace <= walkingPace/2) // middle bottom part of framrates
          {
            lastpicture = 1;
            pushMatrix();
            translate( location.x + w, location.y);
            scale( -1, 1 );
            image(myrereWithSkrald[1], 0, 0, w+3, h+3); //plussing with 3, because the myre doesn't perfectly fit the square that it is calculated in
            popMatrix();
          }
          else // if not currently walking left/
          {
            lastpicture = 2;
            pushMatrix();
            translate( location.x + w, location.y);
            scale( -1, 1 );
            image(myrereWithSkrald[2], 0, 0, w+3, h+3); //plussing with 3, because the myre doesn't perfectly fit the square that it is calculated in
            popMatrix();
          }
        }
        
        else // if not not currently walking, but turned right and holding skrald
        {
          pushMatrix();
          translate( location.x + w, location.y);
          scale( -1, 1 );
          image(myrereWithSkrald[lastpicture], 0, 0, w+3, h+3); //plussing with 3, because the myre doesn't perfectly fit the square that it is calculated in
          popMatrix();
        }
      }
      else //if not holding skrald and walking left
      {
        pushMatrix();
        translate( location.x + w, location.y);
        scale( -1, 1 );
        image(myrereWithoutSkrald[0], 0, 0, w+3, h+3); //plussing with 3, because the myre doesn't perfectly fit the square that it is calculated in
        popMatrix();      
      }
    }
  }
  
  
  void move() //moves myren if the arrows are clicked.
  {
    touchingGround = isTouchingGround();
    touchingCeiling = isTouchingCeiling();
    if(right == true)
    {
      velocity.x += myreSpeed;
      lastright = true;
    }
    if(left == true)
    {
      velocity.x -= myreSpeed;
      lastright = false;
    }
     //<>//
    //jump only if myren is on the ground //<>//
    if(up == true && touchingGround == true) //<>// //<>//
    { //<>// //<>//
      velocity.y = jumpPower;  //<>//
      touchingGround = false; //<>//
    }
    if(touchingGround == false) //if not touching ground, apply gravity.
    {
      velocity.y += gravity;
    }
    if(touchingGround == true && up != true) // if touching ground, stop accelerating downw
    {
      velocity.y = 0;
    }
    
    
    //if touching the celing, then make velocity negative.
    if (touchingCeiling == true)
    {
      velocity.y = abs(velocity.y) * 0.5;
    }
  }


  void setMove(int keycode, boolean bool) //set the booleans of the directions, to figure which key is pressed
  {
    switch(keycode) //alternative if statement.
    {
      case 38: //if up arrow is clicked
        up = bool;
        return;
      case 39: //if right arrow is clicked
        right = bool;
        lastright = true;
        return;
      case 37: //if left arrow is clicked
        left = bool;
        lastright = false;
        return;
      case 32:
        pickedUp = bool;
        return;
    }
  }


  boolean isTouchingGround() //returns a bool, whether the myre is touching ground or not
  {
    color[] colors = new color[400];
    for(int i = 1; i < colors.length; i++)
    {
      colors[i] = get(ceil(location.x), ceil(location.y + h + i*0.04));
    }

    for(int i = 0; i < colors.length; i++)
    {
      if (colors[i] == -16777216) //if the color beneath the myre is black, then it the myre is touching the floor
      {
        location.y = location.y + i*0.04 - 5; // the last constant choses the velocity of which myren is pushed up from the floor
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
  
  void hold(Skrald skrald)//Making a method to change the location of skrald.
  {
    //calling the set funktion to set the location of skrald above myre and follow.
    skrald.set(new PVector(this.location.x, this.location.y));
  }
  
  void bounce() //bounces the myre off the walls, and the roof.
  {
    if(location.x < myreSpeed)
    {
      location.x = location.x + myreSpeed + myreSpeed/5;
    }
    if (location.x > width-w-myreSpeed)
    {
      location.x = location.x - myreSpeed - myreSpeed/5;
    }
    if (location.y < 0)
    {
      location.y = location.y + myreSpeed;
      velocity.y = 0;
    }
  }
  
  
 void dontWalkThroughWalls() //returns a bool, whether the myre is touching ground or not
  {
    int depthWidthRatio = 10;
    int heightToScan = h-4; //how many pixels to the side of the myre should be checked if they are a wall. This is not equal to the height of the myre, since we don't want to scan the pixels at the feet of the myre, enabling it to walk on crooked floors
    int arraySize = 200;
    color[] leftColors = new color[arraySize];    
    color[] rightColors = new color[arraySize];    

    //checking left side
    for(int j = 0; j < arraySize/depthWidthRatio; j++) //each repeat is a different heigh level. it will currently look 4 pixels to the side of the myre
    {
      for(int k = 0; k < depthWidthRatio; k++)
      {
         leftColors[j*(k+1)] = get(ceil(location.x - k - w/10), ceil(location.y + heightToScan*j/(arraySize/depthWidthRatio))); //check all the pixels in a rectangle to the left of the myre, above the ground.
      }
    }

    for(int i = 0; i < arraySize; i++)
    {
      if (leftColors[i] == -16777216) //if the color beneath the myre is black, then it the myre is touching the floor
      {
        velocity.x = velocity.x + 0.2; //move the myre backwards to the right the amount of
      }
    }
      
    
    //checking right side
    for(int j = 0; j < arraySize/depthWidthRatio; j++) //each repeat is a different heigh level. it will currently look 4 pixels to the side of the myre
    {
      for(int k = 0; k < depthWidthRatio; k++)
      {
         rightColors[j*(k+1)] = get(ceil(location.x + w/1.3 + k), ceil(location.y + heightToScan*j/(arraySize/depthWidthRatio))); //check all the pixels in a rectangle to the right of the myre, above the ground.
      }
    }

    for(int i = 0; i < arraySize; i++)
    {
      if (rightColors[i] == -16777216) //if the color beneath the myre is black, then it the myre is touching the floor
      {
        velocity.x = velocity.x - 0.34; //move the myre backwards to the right the amount of
      }
    }
  } // end dontWalkThroughWalls
  
  
  void wantToPickUp() //pick up
  {
    PVector distanceToSkrald;
    PVector distanceToSkraldespand;
    
    for(int i = skralds.size()-1; i >= 0; i--)
    {
      distanceToSkrald = PVector.sub(skralds.get(i).location, location);
      if(abs(skralds.get(i).location.y - location.y) < 80 && distanceToSkrald.mag() < 80)
      {
        skralds.get(i).isPickedUp = !skralds.get(i).isPickedUp;
        if(skralds.get(i).isPickedUp == false)
        {
          for(Skraldespand skraldespand : skraldespands)
          {
            distanceToSkraldespand = PVector.sub(skraldespand.location, location);
            if((skraldespand.location.y - location.y) < 40 && distanceToSkraldespand.mag() < 60)
            if(abs(skraldespand.location.y - location.y) < 40 && distanceToSkraldespand.mag() < 40)
            {
              System.out.println("skraldespand.sortingType: " + skraldespand.sortingType + " skrald.sortingType: " + skralds.get(i).sortingType + " Skraldespand location: " + skraldespand.location);
              if(skraldespand.sortingType != skralds.get(i).sortingType)
              {
                eksplosion = new Eksplosion(skraldespand.location, 300);
                explode = true;
              } //<>//
              if(skraldespand.sortingType == skralds.get(i).sortingType)
              {
                System.out.println(" you are in the if statement"); //<>//
                skralds.remove(skralds.get(i));
                System.out.println(" you removed skrald");
              }
              System.out.println(" you are past breakpoint");
            }
          }//end skraldespandforloop
        }
      }
    }
  }
  
}// end class
