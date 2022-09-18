class Door
{
  PVector location ;
  PImage openDoorImg;
  PImage closedDoorImg;
  
  Door(PVector _location, PImage _openDoorImg, PImage _closedDoorImg) 
  {
    this.location = _location;
    this.openDoorImg = _openDoorImg;
    this.closedDoorImg = _closedDoorImg;
  } 


  void display()
  {
    if(skralds.size() == 0) 
    {
      image(openDoorImg, location.x, location.y, 80, 80);
    } 
    else
    {
      image(closedDoorImg, location.x, location.y, 50, 80);
    } 
    //Tjekker om alt skraldet er væk, og hvis ja, så åbnes døren. 
  }
} 
