import de.bezier.data.sql.*;
import g4p_controls.*;
import processing.sound.*;
import java.util.*;
Myre myre = new Myre();
Eksplosion eksplosion;
Door door;
SoundFile deathSound;
SoundFile gameSound;
SQLite HighscoreDatabase;
Button profilButton;
Button createUserButton;
Button logInButton;
ArrayList<Skrald> skralds = new ArrayList<Skrald>();
ArrayList<Skraldespand> skraldespands = new ArrayList<Skraldespand>();
ArrayList<Instruktion> instruktions = new ArrayList<Instruktion>();
float[] personalRecordArray;

boolean start = true;
boolean Game = false, completedLevel = false, Liste = false, duFuckingLort = false, profilSide = false, Highscore = false; //game situation booleans
boolean explode = false;
boolean firstSkip = true;
boolean Score = true;
boolean invalidInput;
boolean erNyName = false;
boolean creatingNewUser = false;
GPassword password;
GTextField username;

float startKnapx = 140;
float startKnapy = 100;
float levelScore;

int startFrame, winFrame;
int tint = 0;
int difficultyGradient = 20; //time between every lost skraldespand Star
int difficultyStart = 45; //time before you lose your first skraldespand Star
int boxHeight = 50;

PImage startskaerm, startlogo, startknap;
PImage front, platforms, Genbrugsknap, sorteringsliste, skipknap, timer;
PImage banan, pizzabakke, toothbrush;
PImage madaffaldsspand, plastaffaldsspand, papaffaldsspand, restaffaldsspand;
PImage tabeskaerm, genstartknap, highscoreScreen, scoreBoard;
PImage bevaegelsesIns, opsamlingsIns, smidningsIns, maalIns, listeIns, klarBanenIns;
//fordi den brugte font er meget begrænset i hvilke karakterer den har, så blev det lavet til billeder frem for en reel font.
PImage myreimage, openDoor, closedDoor;
PImage fullStarSkraldespand, emptyStarSkraldespand, dansingMyre1, dansingMyre2, shine;
PImage[] myrereWithSkrald = new PImage[3];
PImage[] myrereWithoutSkrald = new PImage[3];
PImage logInKnap, signUpKnap, videreTilLoginsiden, backDrop;
PFont font;
void setup()
{ 
  size(1280,720); // 16:9 ratio
  
  deathSound = new SoundFile(this, "Død3.mp3");
  gameSound = new SoundFile(this, "VildtSoundtrack.mp3");
  
  platforms = loadImage("Baggrund.png");
  front = loadImage("Forgrund.png");
  startskaerm = loadImage("Myrestartskaerm.png");
  highscoreScreen = loadImage("High score skærm.png");
  scoreBoard = loadImage("Scoreboard.png");
  
  startlogo = loadImage("Startlogo.png");
  startknap = loadImage("Startknap.png");
  Genbrugsknap = loadImage("Genbrugsknap.png");
  
  banan = loadImage("banan.png");
  pizzabakke = loadImage("Pizzabakke.png");
  toothbrush = loadImage("Toothbrush.png");
  
  myrereWithSkrald[0] = loadImage("Myre med skrald.png");
  myrereWithSkrald[1] = loadImage("Myre med skrald 2.png");
  myrereWithSkrald[2] = loadImage("Myre med skrald 3.png");
  myrereWithoutSkrald[0] = loadImage("Myre uden skrald.png");
  myrereWithoutSkrald[1] = loadImage("Myre uden skrald 2.png");
  myrereWithoutSkrald[2] = loadImage("Myre uden skrald 3.png");
  
  madaffaldsspand = loadImage("Skraldespand - Madaffald.png");
  plastaffaldsspand = loadImage("Skraldespand - Plastaffald.png");
  papaffaldsspand = loadImage("Skraldespand - Papaffald.png");
  restaffaldsspand = loadImage("Skraldespand - Restaffald.png");
  
  bevaegelsesIns = loadImage("BevaegelsesInstruktion.png");
  opsamlingsIns = loadImage("SamleOpInstruktion.png");
  smidningsIns = loadImage("SmideIgenInstruktion.png");
  maalIns = loadImage("MaalInstruktion.png");
  listeIns = loadImage("GuideTilSkraldInstruktion.png");
  klarBanenIns = loadImage("KlareBanenIns.png");
  
  sorteringsliste = loadImage("Sorteringsliste.png");
  skipknap = loadImage("Skipknap.png");
  
  tabeskaerm = loadImage("tabeskaerm.png");
  genstartknap = loadImage("genstartknap.png");
  timer = loadImage("Timer.png");
  
  
  closedDoor = loadImage("Doer.png");
  openDoor = loadImage("Doer_aaben.png");
  fullStarSkraldespand = loadImage("Fuld stjerne.png");
  emptyStarSkraldespand = loadImage("Tom stjerne.png");
  dansingMyre1 = loadImage("Dansemyre 1.png");
  dansingMyre2 = loadImage("Dansemyre 2.png");
  shine = loadImage("Skinnende baggrund.png");
  
  logInKnap = loadImage("Log in knap.png");
  signUpKnap = loadImage("Sign up knap.png");
  videreTilLoginsiden = loadImage("Videre til login.png");
  backDrop = loadImage("Scoreboard.png");

  font = createFont("Dubai-Bold-48.vlw", 24);
  textFont(font);
  frameRate(60);
  skralds.add(new Skrald("madaffald", banan, 40, 40, new PVector(400, 650)));
  skralds.add(new Skrald("restaffald", pizzabakke, 80, 80, new PVector(650, 150)));
  skralds.add(new Skrald("plastaffald", toothbrush, 100, 16, new PVector(1150, 450), 90));
  
  
  skraldespands.add(new Skraldespand("madaffald", madaffaldsspand, new PVector(1150, 605)));
  skraldespands.add(new Skraldespand("plastaffald", plastaffaldsspand, new PVector(440, 115)));
  skraldespands.add(new Skraldespand("restaffald", restaffaldsspand, new PVector(1200, 405)));
  skraldespands.add(new Skraldespand("papaffald", papaffaldsspand, new PVector(255, 315)));
  
  instruktions.add(new Instruktion(bevaegelsesIns, new PVector(50, 520), 100,700));
  instruktions.add(new Instruktion(opsamlingsIns, new PVector(350, 500), 350,700));
  instruktions.add(new Instruktion(smidningsIns, new PVector(900, 580), 900,700));
  instruktions.add(new Instruktion(maalIns, new PVector(600, 350), 600, 600));
  instruktions.add(new Instruktion(listeIns, new PVector(100, 100), 100, 200));
  instruktions.add(new Instruktion(klarBanenIns, new PVector(700, 25), 300, 200));
  
  door = new Door(new PVector(900, 110), openDoor, closedDoor);
  
  profilButton = new Button(videreTilLoginsiden, new PVector((width-156)/2, height/2+200-20), new PVector(156, 40));
  createUserButton = new Button(signUpKnap, new PVector(width/2, height/2+100), new PVector(200, 50));
  logInButton = new Button(logInKnap, new PVector(width/2-200, height/2+100), new PVector(200, 50));
  
}

void draw()
{
  findInfo();
  if (start == true)
   {
     startscreen(); 
   } 
   else if (Game == true)
   {
     game(); 
   } 
   else if (Liste == true)
   {
     liste();
   } 
   else if (duFuckingLort ==true)
   {
    tabening(); 
   }
   else if(completedLevel)
   {
     winningScreen();
   }
   else if(profilSide)
   {
     profilside();
   }
   else if(Highscore)
   {
     showHighscore();
   }
   //opdeler spillet i mere overskuelige underkategorier, som kører når de andre ikke gør 
}

void startscreen()
{
  background(startskaerm);
  textAlign(CENTER);
  fill(0);
  imageMode(CENTER);
  image(startlogo,width/2,height/2-200, 1080,240);
  rectMode(CENTER);
  image(startknap,width/2,height/2+50,startKnapx,startKnapy);
  if (mouseX<(width+startKnapx)/2 && mouseX>(width-startKnapx)/2 && mouseY<(height+startKnapy+100)/2 && mouseY>(height-startKnapy+100)/2 && mousePressed) // if button is clicked, start the game.
  {
    start = false;
    Liste = true;
    rectMode(CORNER);
    imageMode(CORNER);
  }
  //startskærmen hvor man kan starte spillet når man klikker på en startknap. 
}


void game() // her sker det generelle spil
{
  clear();
  background(platforms); //her bliver der lavet den reelle bane som myren ser når tester for platformne i spillet.
  myre.update(); //method that update Myrerens velocity and location.
  background(front); //Her kommer en visuel forgrund ovenpå platforme, så det er pænere at se.
  displayTimer();
  door.display();
  if((frameCount-startFrame)%3600 == 10)
  {
    deathSound.stop();
    gameSound.play();
  }
  for(Skraldespand skraldespand : skraldespands)
  {
    skraldespand.display();
  }
  for (Instruktion instruktion: instruktions)
  {
    instruktion.run();
  }
  myre.display(); //goes to the display function in Myre class, and draws whatever is there
  for(Skrald skrald : skralds)
  {
    skrald.display();
  }
  if(explode == true)
  {
    eksplosion.explode();
  }
  rect(0, 0, 85, 85);
  fill(150, 200, 150, 200);
  noStroke();
  image(Genbrugsknap, 10, 10, 65, 65);
  if (mouseX < 75 && mouseX> 10 && mouseY< 75 && mouseY> 10 && mousePressed) // if recycle icon is clicked, go to the liste view.
  {
    Game = false; 
    Liste = true;
  }
}


void liste() //shows the sorteringsliste in fullscreen mode. only runs if game is false. Cancelled by making game = true.
{
  imageMode(CENTER);
  image(sorteringsliste, width/2, height/2);
  imageMode(CORNER);
  image(skipknap,1120,670,150,60);
  if (mouseX < 1270 && mouseX > 1120 && mouseY< 730 && mouseY> 670 && mousePressed)
  {
    Liste = false;
    Game = true;
    if(firstSkip == true)
    {
      startFrame = frameCount;
      firstSkip = false;
    }
  }
}


void tabening()  //laver en kopi af spillet som det er i det øjeblik og laver en halvtransperant baggrund, og hvor en genstartknap gradvist kommer ind for at prøve banen igen.
{
  lastImage();
  fill(0,200);
  rect(0,0,width,height);
  image(tabeskaerm,0,0,width, height);
  tint(255,tint);
  imageMode(CENTER);
  image(genstartknap,width/2,height/2,150,50);
  imageMode(CORNER);
  if (tint < 255) //
   {
     tint += 15;
   } 
   else if (mouseX<(width+150)/2 && mouseX>(width-150)/2 && mouseY<(height+50)/2 && mouseY>(height-50)/2 && mousePressed)
   {
     restart();
   }
}


void displayData()
{
 /* HighscoreDatabase = new SQLite(this, "Highscoreboard.sqlite");
   //If connection is succesfull
  if (HighscoreDatabase.connect() )
  {
    //Make Select query
    println("nice + " + HighscoreDatabase.toString());
    HighscoreDatabase.query("SELECT Name, Highscore, Password FROM HighscoreData;");
    //Run through recordset using next()
    while (HighscoreDatabase.next())
    {
      //Print the data to the log window.
      println("Name: " + HighscoreDatabase.getString("Name") + " \t, Highscore: " + HighscoreDatabase.getString("Highscore") + " \t, Password: " + HighscoreDatabase.getString("Password"));
    }
  }
  else
  {
    //Display error trying to get data from DB
    println("Error DB");
  }  
  HighscoreDatabase.close(); */
}


void mousePressed()
{
  displayData();
}

void winningScreen() // displays the winning image.
{
  int distanceBetweenStars = 150;
  lastImage();
  fill(0 ,200);
  rect(0,0,width,height);
  rectMode(CENTER);
  imageMode(CENTER);
  image(shine,width/2+100, 400, 2400, 1280);
  fill(255);
  int emptyStar = ceil((((float)(winFrame - startFrame)/60)-difficultyStart)/difficultyGradient); // calculates how many empty and full skraldespande should be drawn.
  if(emptyStar < 0) // if you are fast enough, you could potentially have a negative amount of empty stars, this will be fixed here, mening you will just have 0
  {
    emptyStar = 0;
  }
  if(emptyStar > 3) // if you are slow enough, you could potentially have a huge amount of amount of empty stars, this will be fixed here, mening you will just have 0
  {
    emptyStar = 3;
  }

  for(int i = 0; i < 3-emptyStar; i++) // draw full star skraldespands until the amount that should be empty are missing
  {
    image(fullStarSkraldespand, width/2 + i*distanceBetweenStars - distanceBetweenStars, height/2, 100, 100);
  }

  for(int i = 0; i < emptyStar; i++) //draw the rest as empty
  {
    image(emptyStarSkraldespand, width/2 - i*distanceBetweenStars + distanceBetweenStars, height/2, 100, 100);
  }
  
  text("Du gennemførte på " + levelScore + " sekunder!", width/2, height/2 + 100);
  
  if(frameCount%20<10)
  {
    image(dansingMyre1, width/4, height/2,210,240);
    image(dansingMyre2,3*width/4,height/2,210,240);
  }
  if(frameCount%20>=10)
  {
    image(dansingMyre2,width/4, height/2,210,240);
    image(dansingMyre1,3*width/4,height/2,210,240);
  }
   imageMode(CORNER);  
  profilButton.display();
  imageMode(CENTER);
  if(mousePressed && profilButton.hovered)
  {
    username = new GTextField(this, width/2-100, height/2-100, 200, 50);
    username.setPromptText("Username");
    password = new GPassword(this, width/2-100, height/2, 200, 50);
    hentScore();
    completedLevel = false;
    profilSide = true;
    password.setMaxWordLength(20);
  }
  imageMode(CORNER);
  rectMode(CORNER);
}


void profilside()
{
  lastImage();
  fill(0,200);
  rect(0,0,width,height);
  imageMode(CENTER);
  image(backDrop, width/2,height/2,600,600);
  imageMode(CORNER);
  createUserButton.display();
  logInButton.display();
  if (mousePressed && createUserButton.overRect()) //if you click create username 
  {
    creatingNewUser = true;
  }
  if(!creatingNewUser)
  {
    if ((keyPressed && key == ENTER && username.getText() != "" && password.getPassword() != "")||(mousePressed && logInButton.overRect()&& username.getText() != "" && password.getPassword() != "")) //when you enter a valid username and password
    {
      text(username.getText() + "password: " + password.getPassword(), 200, 200);
      if(profilTjek(username.getText(), password.getPassword()))
      {
        println(password.getPassword());
        Highscore = true;
        profilSide = false;
        scoreSortering();
        password.setVisible(false);
        username.setVisible(false);
      }
      else
      {
        text("forkert password brugernavn kombination", 100, 100);
      }
    }
    else if(keyPressed && key == ENTER)
    {
      invalidInput = true;
    }
    if(invalidInput)
    {
      text("Indtast et unikt brugernavn og en kode", width/2, height/2 - 100);
    }
  }
  else
  {
    if (keyPressed && key == ENTER && username.getText() != "" && password.getPassword() != "") //when you enter a valid username and password
    {
      if(nyBruger(username.getText(), password.getPassword(), levelScore)) //if it succesfully creates new bruger
      {
        println(password.getPassword());
        Highscore = true;
        profilSide = false;
        scoreSortering();
        password.setVisible(false);
        username.setVisible(false);
      }
      else
      {
        text("brugernavn optaget", 0, 0);
      }
    }
  }
}


void showHighscore()
{
  float topTextPlacement = height/10;
  image(highscoreScreen, 0, 0, width, height);
  fill(255);
  
  //display nuværende score
  text("Din nuværende tid: " + levelScore, width/2 + 12, topTextPlacement);
  topTextPlacement += 50;
  
  //display your score, and rank
  HighscoreDatabase = new SQLite(this, "Highscoreboard.sqlite");
  //If connection is succesfull
  if (HighscoreDatabase.connect() ) //display the highscores
  {
    HighscoreDatabase.query("SELECT Highscore FROM HighscoreData WHERE Name = '" + username.getText() + "';"); //hent din highscore
    
    //calculate position
    int placement = 0;
    while(HighscoreDatabase.getFloat("Highscore") >= personalRecordArray[placement]) //<>//
    {
      placement++;
    }
    text("Din rekord er: " + HighscoreDatabase.getFloat("Highscore") + "  placering: " + placement, width/2 + 12, topTextPlacement);
  }
  topTextPlacement += 20;

  
  //display highscores.
  personalRecordArray = removeDups(personalRecordArray); // remove duplicates before displaying, to display correctly.
  HighscoreDatabase = new SQLite(this, "Highscoreboard.sqlite");
   //If connection is succesfull
  textAlign(LEFT);
  if (HighscoreDatabase.connect() ) //display the highscores
  {
    //Make Select query
    int time = 0;
    for (int i = 0; i < 5;) //<>//
    {
      time++; //<>//
      String queryHigh = "SELECT Name FROM HighscoreData WHERE Highscore=" + personalRecordArray[i] + ";";
      HighscoreDatabase.query(queryHigh);
      println(queryHigh); //<>//
      while(HighscoreDatabase.next()) //loops through all the names in the highscoredata table, and adds them to an array.
      { //<>//
        text(i+1 + ": " + HighscoreDatabase.getString("Name"), 474, topTextPlacement + (i+1)*50);
        text("Rekord: " + personalRecordArray[time], 684, topTextPlacement + (i+1)*50);
        i++;
      }
    }
  }
  else
  {
    println("Error DB");
    HighscoreDatabase.close();
  }
  textAlign(CENTER);
  Highscore = false;
}


ArrayList<String> hentScore() //opens the database, runs 
{
  ArrayList<String> scores = new ArrayList<String>(); //local variabel kun til denne funktion, der gemmer scoren, så den kan returneres på et godt format.
  println("0");
  HighscoreDatabase = new SQLite(this, "Highscoreboard.sqlite");
  if (HighscoreDatabase.connect())
  {
    //Make Select query
    HighscoreDatabase.query("SELECT Name, Highscore FROM HighscoreData;");
    //Run through recordset using next()
    
    while(HighscoreDatabase.next()) //loops through all the names in the highscoredata table, and adds them to an array.
    {
      scores.add("Name: " + HighscoreDatabase.getString("Name") + "\t, Highscore: " + HighscoreDatabase.getString("Highscore"));
    }
  }
  else
  {
    scores.add("Error DB");
  }  
  HighscoreDatabase.close();
  return scores;
}



boolean nyBruger(String nyName, String nyPassword, float levelScore) //returnerer om den nye bruger succesfuldt blev oprettet
{
  HighscoreDatabase = new SQLite(this, "Highscoreboard.sqlite");
  if (HighscoreDatabase.connect() )
  {
    
    //tjekker først om brugernavnet alleede eksisterer.
    HighscoreDatabase.query("SELECT Name FROM HighscoreData;");
    while(HighscoreDatabase.next()) //loops through all the names in the highscoredata table, and adds them to an array.
    {
       if (HighscoreDatabase.getString("Name").equals(nyName)) //if username already exists, return false; 
       {
         HighscoreDatabase.close();
         return false;
       }
    }
    
    //if username doesn't exist, code reaches this point.
    //inserts a username, password and score into the highscoreboard.
    HighscoreDatabase.execute("INSERT INTO HighscoreData (Name, Password, Highscore) VALUES ('" + nyName + "', '" + nyPassword + "', '" + levelScore + "');");   
  }
  else
  {
    println("Error DB");
    HighscoreDatabase.close();
    return false;
  }  
  HighscoreDatabase.close();
  return true;
}

void beatscore(String username, float newHighscore) //when you beat your own score.
{
  //godt gået   <-////nice kommentar
  HighscoreDatabase = new SQLite(this, "Highscoreboard.sqlite");
  if (HighscoreDatabase.connect())
  {
    //Skifter til ny highscore, ved det input som funktionen har fået.
    HighscoreDatabase.execute("UPDATE HighscoreData SET Highscore = " + newHighscore + " WHERE Name = '" + username + "';");
  }
  else
  {
    println("Error DB");
  }
  HighscoreDatabase.close();
}


boolean profilTjek(String loginUsername, String loginPassword) //tjekker om en en et brugernavn med adgangskode eksisterer, returnerer det som en boolean.
{
  HighscoreDatabase = new SQLite(this, "Highscoreboard.sqlite");
  if (HighscoreDatabase.connect() )
  {
    HighscoreDatabase.query("SELECT Name, Password, Highscore FROM HighscoreData;");
    while(HighscoreDatabase.next()) //loops through all the names in the highscoredata table, and adds them to an array.
    {
      println(HighscoreDatabase.getInt("Highscore") + "test" + levelScore);
      if (HighscoreDatabase.getString("Name").equals(loginUsername) && HighscoreDatabase.getString("Password").equals(loginPassword)) //if input matches existing data.
      {
        //check if score should be beaten, before login in. TO BE DONE
        println(HighscoreDatabase.getInt("Highscore") + "profiltestst" + levelScore);
        if(levelScore < HighscoreDatabase.getInt("Highscore")) // if your new score is better than your older one.
        {
          HighscoreDatabase.close();
          beatscore(username.getText(), levelScore);
        }
        return true;
      }
    }
  }
  else
  {
    println("Error DB");
  }  
  HighscoreDatabase.close();
  return false; //if username and password was no match or didn't connect to database.
}

void scoreSortering()
{
  ArrayList<Float> personalRecord = new ArrayList<Float>();
  HighscoreDatabase = new SQLite(this, "Highscoreboard.sqlite");
  if (HighscoreDatabase.connect())
  {
    HighscoreDatabase.query("SELECT Highscore FROM HighscoreData;");    
    while(HighscoreDatabase.next()) //loops through all the names in the highscoredata table, and adds them to an array.
    {
      personalRecord.add(HighscoreDatabase.getFloat("Highscore"));
    }
    println(personalRecord);
    personalRecordArray = new float[personalRecord.size()];
    for (int i = 0; i < personalRecord.size(); i++)
    {
      personalRecordArray[i] = personalRecord.get(i);
    }
    personalRecordArray = sort(personalRecordArray);
    println(personalRecordArray);
  }
  else
  {
    println("Error DB");
  }  
  HighscoreDatabase.close();
}

float[] removeDups(float[] values) {
  Collection<String> noDups = new HashSet( Arrays.asList(str(values)) );
  Arrays.sort(values = float( noDups.toArray(new String[noDups.size()]) ));
  return values;
}

void restart() // restarts the game, by setting everything to its start value.
{
  Game = true;
  gameSound.stop();
  creatingNewUser = false;
  Liste = false;
  duFuckingLort = false;
  startKnapx = 140;
  startKnapy = 100;
  explode = false;
  Score = true;
  tint = 0;
  creatingNewUser = false;
  startFrame = frameCount;
  myre.setLocation(new PVector(200,600));
  for (Instruktion instruktion: instruktions)
  {
    instruktion.setTint(0);
  }
  for (int i=skralds.size()-1; i >= 0; i--)//sletter alt skrald som ikke er slettet endnu, hvorefter det placeres igen.
  {
    skralds.remove(skralds.get(i));
  }
  skralds.add(new Skrald("madaffald", banan, 40, 40, new PVector(400, 650)));
  skralds.add(new Skrald("restaffald", pizzabakke, 80, 80, new PVector(650, 150)));
  skralds.add(new Skrald("plastaffald", toothbrush, 100, 16, new PVector(1150, 450), 90)); 
}


void lastImage() //draws the background as it was a moment ago, without enabling movement.
{
  background(front);
  for(Skraldespand skraldespand : skraldespands)
  {
    skraldespand.display();
  }
  for (Instruktion instruktion: instruktions)
  {
    instruktion.display();
  }
  for(Skrald skrald : skralds)
  {
    skrald.display();
  }
  door.display();
  imageMode(CENTER);
  image(timer, width/2, boxHeight/2, 2*boxHeight, boxHeight); 
  fill(255);
  text((frameCount-startFrame)/60, width/2, boxHeight/2); 
  imageMode(CORNER);
  rect(0, 0, 85, 85);
  fill(150, 200, 150, 200);
  noStroke();
  image(Genbrugsknap, 10, 10, 65, 65);
}


void keyPressed() //input function to control the movements of myren.
{
  myre.setMove(keyCode, true); //sets a boolean of the arrow that was pressed to true, making the myre move.
  if (keyCode == 32)//if space is pressed it flips the bool value, so you drop or pick up skrald
  {
    myre.wantToPickUp();
    if(abs(door.location.y - myre.location.y) < 40 && PVector.sub(myre.location, door.location).mag() < 40 && skralds.size() == 0 && Score == true)
    {
      completedLevel = true;
      winFrame = frameCount;
      levelScore = float(round((float)(winFrame - startFrame)*100/60))/100;
      Game = false;
      Score = false;
    }
  }
  if (keyCode == 82 && !profilSide)
  {
    restart();
  }
  if (keyCode == 77 && !profilSide)
  {
      gameSound.stop();
  }
}


void keyReleased() //input function to control the movements of myren.
{
  myre.setMove(keyCode, false);
}

void displayTimer() //displays the timer at the top
{
  imageMode(CENTER);
  image(timer, width/2, boxHeight/2, 2*boxHeight, boxHeight); 
  fill(255);
  text((frameCount-startFrame)/60, width/2, boxHeight/2); 
  imageMode(CORNER);
}


void findInfo()
{
  color col = get(mouseX, mouseY);
  System.out.println("color is " + col);
  fill(300, 300, 300);
  System.out.println("mouse x: " + mouseX + " mouse y: " + mouseY);
}
