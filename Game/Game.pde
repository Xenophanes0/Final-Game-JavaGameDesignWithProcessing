/* Game Class Starter File
 * Last Edit: 5/22/2023
 * Authors: Dean Carabajo & Mikyle O.
 */


//GAME VARIABLES
private int msElapsed = 0;
String extraText = "Have a Good Day.";
String titleText = "Too Far";

//Screens
Screen currentScreen;
World currentWorld;
Grid currentGrid;

//Splash Screen Variables
Screen splashScreen;
String splashBgFile = "images/BackgroundFinalEscape.png";
PImage splashBg;
//PImage firstBG; //Intro Background

//Main Screen Variables
Grid mainGrid;
//Grid grid = new Grid(12,7); //Screen 
String mainBgFile = "images/BackgroundFinalEscape.png";
PImage mainBg;
//PImage songBG;  //Running Banner in Space Background


//PImage player1Torso; // BF's waist and above
//PImage player1Legs; //BF's waist and below
PImage player1;
PImage p1neutral;
PImage p1losing;
String player1File = "images/x_wood.png";
int player1Row = 1;
int player1Col = 3;
int health = 50;
int bottomRow;
int leftCol = 2;
int rightCol = 5;

//Majin
AnimatedSprite exampleSprite;
AnimatedSprite majinCharacter;
boolean doAnimation;


/*      Arrow Icons (Animated)      */
AnimatedSprite leftSprite;
AnimatedSprite downSprite;
AnimatedSprite upSprite;
AnimatedSprite rightSprite;

//EndScreen variables
World endScreen;
PImage endBg;
String endBgFile = "images/youwin.png";
//PImage endScreen;

//Sound vars
import processing.sound.*;
SoundFile tfSong;



//Required Processing method that gets run once
void setup() {

  //Match the screen size to the background image size
  size(1200, 700);

  //Set the title on the title bar
  surface.setTitle(titleText);

  //Load BG images used
  splashBg = loadImage(splashBgFile);
  splashBg.resize(1200, 700);
  mainBg = loadImage(mainBgFile);
  mainBg.resize(1200, 700);
  endBg = loadImage(endBgFile);
  endBg.resize(1200, 700);


  //setup the screens/worlds/grids in the Game
  splashScreen = new Screen("first", splashBg);
  mainGrid = new Grid("song", mainBg, 12, 7);
  endScreen = new World("end", endBg);
  currentScreen = splashScreen;

    bottomRow = mainGrid.getNumRows()-1;

  //setup Player Sprites 
  p1neutral = loadImage("images/BF_Neutral_Icon.png");
  p1neutral.resize(100,50);
  p1losing = loadImage("images/BF_Losing_Icon.png");
  p1losing.resize(100,50);
  player1= p1neutral;  

  /*      Animation & Sprite setup      */
  leftSprite = new AnimatedSprite("sprites/left_Arrow.png", "sprites/left_Arrow.json");
  leftSprite.resize(75,75);
  downSprite = new AnimatedSprite("sprites/down_Arrow.png", "sprites/down_Arrow.json");
  downSprite.resize(75, 75);
  upSprite = new AnimatedSprite("sprites/up_Arrow.png", "sprites/up_Arrow.json");
  upSprite.resize(75, 75);
  rightSprite = new AnimatedSprite("sprites/right_Arrow.png", "sprites/right_Arrow.json");
  rightSprite.resize(75, 75);
  majinCharacter = new AnimatedSprite("sprites/Majin_Sonic_Idle_Animation.png", "sprites/Majin_Sonic_Idle_Animation.json");

  // Load a soundfile from the /data folder of the sketch and play it back
  tfSong = new SoundFile(this, "sounds/TooFarClip.mp3");
  tfSong.play();


  //exampleAnimationSetup();


  imageMode(CORNER);    //Set Images to read coordinates at corners
  //fullScreen();   //only use if not using a specfic bg image
  println("Game started...");

}


//Required Processing method that automatically loops
//(Anything drawn on the screen should be called from here)
void draw() {

  updateTitleBar();

  if (msElapsed % 300 == 0) {
    populateSprites();
    moveSprites();
  }

  updateScreen();
  
  if(!isGameOver().equals("keep playing")){
    endGame();
  }

  majinCharacter.show();
  majinCharacter.animate(20.0);

  //checkExampleAnimation();
  
  msElapsed +=100;
  mainGrid.pause(100);
}

//Known Processing method that automatically will run whenever a key is pressed
void keyPressed(){

  //check what key was pressed
  System.out.println("Key pressed: " + keyCode); //keyCode gives you an integer for the key

  //What to do when a key is pressed?

  //set "d" key to move left arrow 2 column
  if (keyCode == 68){
    
    //Store old GridLocation
    GridLocation oldLoc = new GridLocation(player1Row, player1Col);
    
    //Erase image from previous location
    mainGrid.clearTileImage(oldLoc);

    //change the field for player1Row
    player1Col = 2;
  }

  //set "f" key to move down column 3
  if (keyCode == 70){
    GridLocation oldLoc = new GridLocation(player1Row, player1Col);
    mainGrid.clearTileImage(oldLoc);
    player1Col = 3;
  }

  //set "j" key to move up column 4
  if (keyCode == 74){
    GridLocation oldLoc = new GridLocation(player1Row, player1Col);
    mainGrid.clearTileImage(oldLoc);
    player1Col = 4;
  }
  
  //set "k" key to move right column 5
  if(keyCode == 75){
    //shift the player1 picture up in the 2D array
    GridLocation oldLoc = new GridLocation(player1Row, player1Col);
    //eliminate the picture from the old location
    mainGrid.clearTileImage(oldLoc);
    //change the field for player1Row
    player1Col = 5;
  }
}
//Known Processing method that automatically will run when a mouse click triggers it
void mouseClicked(){
  
  //check if click was successful
  System.out.println("Mouse was clicked at (" + mouseX + "," + mouseY + ")");
  System.out.println("Grid location: " + mainGrid.getGridLocation());

  //what to do if clicked?
  GridLocation clickedLoc = mainGrid.getGridLocation();
  GridLocation player1Loc = new GridLocation(player1Row, player1Col);


  //Toggle the animation on & off
  doAnimation = !doAnimation;
  System.out.println("doAnimation: " + doAnimation);
  mainGrid.setMark("X",mainGrid.getGridLocation());
    
}



//------------------ CUSTOM  METHODS --------------------//

//method to update the Title Bar of the Game
public void updateTitleBar(){

  if(isGameOver().equals("keep playing")) {
    //set the title each loop
    surface.setTitle(titleText + "    " + extraText + health);

    //adjust the extra text as desired
  
  }

}

//method to update what is drawn on the screen each frame
public void updateScreen(){

  //Update the Background
  background(currentScreen.getBg());

  //splashScreen update
  if(splashScreen.getScreenTime() > 3000 && splashScreen.getScreenTime() < 5000){
    currentScreen = mainGrid;
  }

  //skyGrid Screen Updates
  if(currentScreen == mainGrid){
    currentGrid = mainGrid;

    //Display the Player1 image
    if(health <34){
        player1 = p1losing;
    } else {
      player1 = p1neutral;
    }

    GridLocation player1Loc = new GridLocation(player1Row,player1Col);
    mainGrid.setTileImage(player1Loc, player1);
    
    //update other screen elements
    mainGrid.showImages();
    mainGrid.showSprites();
    mainGrid.showGridSprites();
  }


}

//Method to populate enemies or other sprites on the screen
public void populateSprites(){

  //Loop through all the cols in the bottom row
  int c = (int) (Math.random() * (rightCol-leftCol+1))+leftCol;

  //Generate a random number
  double rando = Math.random();

  //10% of the time, decide to add an image to a Tile
  if(rando < 0.1){

    if (c == 2){
      mainGrid.setTileSprite(new GridLocation(bottomRow, c), leftSprite);
      System.out.println("Left added");
    }
    else if (c == 3){
      mainGrid.setTileSprite(new GridLocation(bottomRow, c), upSprite);
      System.out.println("Up added" + upSprite);
    }
    else if (c == 4){
      mainGrid.setTileSprite(new GridLocation(bottomRow, c), downSprite);
      System.out.println("Down added");
    }
    else{
      mainGrid.setTileSprite(new GridLocation(bottomRow, c), rightSprite);
      System.out.println("Right added");
    }

  }

}

//Method to move around the enemies/sprites on the screen
public void moveSprites(){

  // Loop through all of the rows & cols in the grid
  for (int c = leftCol; c <= rightCol; c++){
    for (int r = 0; r < mainGrid.getNumRows(); r++){

      //Store the 2 tile locations to move
      GridLocation loc = new GridLocation(r, c);

      // //clear enemy sprites in top row
      if (r == 0){
        mainGrid.clearTileSprite(loc);
      }

      //only move if player's loc isn't in top row
      if (r != 0){
        GridLocation newLoc = new GridLocation(r-1, c);
        
        //if there is a collusion
        if (checkCollision(loc, newLoc).equals("hit")){
          System.out.println("Collision at " + loc);

          //clear the arrow
          mainGrid.clearTileSprite(loc);

          health += 3;
          //"hit" song effect plays
          //hit.play();
        }

        //No collision, but a move
        else if(checkCollision(loc, newLoc).equals("move")){
          System.out.println("NO Collision at " + loc);

          //Check if there is spirte in r,c
          if (mainGrid.hasTileSprite(loc)){
          mainGrid.setTileSprite(newLoc, mainGrid.getTileSprite(loc));
          
          //clear sprite from old loc
          mainGrid.clearTileSprite(loc);
          }

          //If no collision when expected = miss
          if (r == player1Row + 1){
            health -= 3;

          }
          
        }

        //No move situation
        else{

        }


      }
    }
  }
}

//Method to check if there's a collision between player and sprite
public String checkCollision(GridLocation loc, GridLocation nextLoc){

  //Check current location
  //PImage image = mainGrid.getTileImage(loc);
  AnimatedSprite arrow = mainGrid.getTileSprite(loc);

  if (arrow == null){
    return "no move";
  }

  //Check next location
  PImage imageNext = mainGrid.getTileImage(nextLoc);
  //AnimatedSprite nextSprite = mainGrid.getTileSprite(nextLoc);
  if (imageNext == null){
    return "move";
  }

  //check if arrows hits player
  //if (arrow.equals(exampleSprite))

  return "hit";

}



//method to indicate when the main game is over
public String isGameOver(){
  //when health is under 0
  if(health <=0){
    return "lose";
  }

  //when 4 minutes pass
  if(mainGrid.getScreenTimeSeconds() > 240){
    return "win";
  }

  return "keep playing"; //by default, the game is never over
}

//method to describe what happens after the game is over
public void endGame(){
    System.out.println("Game Over!");

    //if lose...
    if(isGameOver().equals("lose")){

      //Update the title bar

      //Show any end imagery

      //Xenophane
      currentScreen = endScreen;
      //image(endScreen, 100,100);

    }
        
    //if win...
    else{

      //Update the title bar

      //Show any end imagery

      //Xenophane
      currentScreen = endScreen;
      //image(endScreen, 100,100);



    }




}

// //example method that creates 5 horses along the screen
// public void exampleAnimationSetup()
// {  
//   int i = 2;
//   exampleSprite = new AnimatedSprite("sprites/Majin_Sonic_Idle_Animation.png", 50.0, i*75.0, "sprites/Majin_Sonic_Idle_Animation.json");
// } 

// //example method that animates the horse Sprites
// public void checkExampleAnimation(){
//   if(doAnimation){
//     exampleSprite.animate(1.0);
//   }
// }