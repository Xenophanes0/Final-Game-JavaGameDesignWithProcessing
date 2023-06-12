/* Game Class Starter File
 * Last Edit: 6/11/2023
 * Authors: Dean Carabajo & Mikyle O.
 */

//GAME VARIABLES
private int msElapsed = 0;
Grid grid = new Grid(12,7); //Screen 
//PImage player1Torso; // BF's waist and above
//PImage player1Legs; //BF's waist and below
PImage player1;
PImage p1neutral;
PImage p1losing;

/*      Arrow Icons (Animated)      */
AnimatedSprite leftSprite;
AnimatedSprite downSprite;
AnimatedSprite upSprite;
AnimatedSprite rightSprite;

PImage endScreen;
//PImage firstBG; Intro Background

/*      ALL Backgrounds INITIALIZED     */
PImage death1BG;
PImage songBG;  //Running Banner in Space Background

String extraText = "Have a Good Day.";
String titleText = "Too Far";

AnimatedSprite exampleSprite;

// Majin Sonic Animations
AnimatedSprite majinSonicIdle;
AnimatedSprite majinSonicUP;
AnimatedSprite majinSonicDown;
AnimatedSprite majinSonicLeft;
AnimatedSprite majinSonicRight;

// Fleetway Animations
AnimatedSprite fleetwaySonicIdle;
AnimatedSprite fleetwaySonicUP;
AnimatedSprite fleetwaySonicDown;
AnimatedSprite fleetwaySonicLeft;
AnimatedSprite fleetwaySonicRight;

// EXE Animations
AnimatedSprite exeIdle;
AnimatedSprite exeUP;
AnimatedSprite exeDown;
AnimatedSprite exeLeft;
AnimatedSprite exeRight;

// Lord X Animations
AnimatedSprite lordXIdle;
AnimatedSprite lordXUP;
AnimatedSprite lordXDown;
AnimatedSprite lordXLeft;
AnimatedSprite lordXRight;

// Sunky Animations
AnimatedSprite sunkyIdle;
AnimatedSprite sunkyUP;
AnimatedSprite sunkyDown;
AnimatedSprite sunkyLeft;
AnimatedSprite sunkyRight;

// Tails' Doll Animations
AnimatedSprite tailsDollIdle;
AnimatedSprite tailsDollUP;
AnimatedSprite tailsDollDown;
AnimatedSprite tailsDollLeft;
AnimatedSprite tailsDollRight;

// Xenophanes Animations
AnimatedSprite xenophanesIdle;
AnimatedSprite xenophanesUP;
AnimatedSprite xenophanesDown;
AnimatedSprite xenophanesLeft;
AnimatedSprite xenophanesRight;

boolean doAnimation;
private int counter = 0; // 15 sections in total
private int timer = 0; //Total time within song 12:25        60 per minute

//HexGrid hGrid = new HexGrid(3);
import processing.sound.*;
SoundFile tfSong;

int player1Row = 1;
int player1Col = 3;
int health = 1;

int bottomRow = grid.getNumRows()-1;
int leftCol = 2;
int rightCol = 5;


//Required Processing method that gets run once
void setup() {

  //Match the screen size to the background image size
  size(1200, 700);

  //Set the title on the title bar
  surface.setTitle(titleText);

  //Load images used
  songBG = loadImage("images/BackgroundFinalEscape.png");
  songBG.resize(1200,700);  //BG must be same dims as size()

  segaSection = new SoundFile(this, "sounds/Sega_Moment.mp3"); 0 - 10                     10 seconds
  //openingSection = new SoundFile(this, "sounds/Opening_Section.mp3"); 10 - 32             22 seconds
  //xenoSectionOne = new SoundFile(this, "sounds/Xenophanes_Section_1.mp3"); 32 - 72        40 seconds
  //lordXSection = new SoundFile(this, "sounds/Lord_X_Section.mp3"); 72 - 131               59 seconds
  //xenoSectionTwo = new SoundFile(this, "sounds/Xenophanes_Section_2.mp3");  131 - 170     39 seconds
  //majinSonicSection = new SoundFile(this, "sounds/Majin_Sonic_Section.mp3"); 170 - 229    59 seconds
  //xenoSectionThree = new SoundFile(this, "sounds/Xenophanes_Section_3.mp3"); 229 - 370    141 seconds
  //fleetwaySection = new SoundFile(this, "sounds/Fleetway_Section.mp3"); 370 - 496         126 seconds
  //sunkySection = new SoundFile(this, "sounds/Sunky_Section.mp3"); 496 - 555               59 seconds
  //tailsDollSection = new SoundFile(this, "sounds/Tails'_Doll_Section,mp3"); 555 - 597     42 seconds
  //xenoSectionFour = new SoundFile(this, "sounds/Xenophanes_Section_4.mp3"); 597 - 636     39 seconds
  //exeSection = new SoundFile(this, "sounds/EXE_Section.mp3"); 636 - 757                   121 seconds
  //angryXenoSection = new SoundFile(this, "sounds/Vs._Xenophanes.mp3"); 757 - 767          10 seconds
  //teamEXESection = new SoundFile(this, "sounds/Vs._Team_Sonic.exe_2.0.mp3"); 767 - 825    58 seconds
  //sonicSection = new SoundFile(this, "sounds/Sonic_Section.mp3"); 825 - 861               36 seconds

  //tfSong = new SoundFile(this, "sounds/Too_Far_Final_Escape_Remix.mp3");
  //tfSong = new SoundFile(this, "sounds/Sega_Moment.mp3");
  
  tfSong.play();

  
  p1neutral = loadImage("images/BF_Neutral_Icon.png");
  p1neutral.resize(100,50);
  p1losing = loadImage("images/BF_Losing_Icon.png");
  p1losing.resize(100,50);
  player1= p1neutral;
  //player1.resize(grid.getTileWidthPixels(),grid.getTileHeightPixels());

  //endScreen = loadImage("images/topMajins.png");
  death1BG = loadImage("images/GameOverBG.png");
  
  // Load a soundfile from the /data folder of the sketch and play it back
  
  /*      Animation & Sprite setup      */
  leftSprite = new AnimatedSprite("sprites/Arrow_Animations/left_Arrow.png", "sprites/Arrow_Animations/left_Arrow.json");
  leftSprite.resize(75,75);
  downSprite = new AnimatedSprite("sprites/Arrow_Animations/down_Arrow.png", "sprites/Arrow_Animations/down_Arrow.json");
  downSprite.resize(75, 75);
  upSprite = new AnimatedSprite("sprites/Arrow_Animations/up_Arrow.png", "sprites/Arrow_Animations/up_Arrow.json");
  upSprite.resize(75, 75);
  rightSprite = new AnimatedSprite("sprites/Arrow_Animations/right_Arrow.png", "sprites/Arrow_Animations/right_Arrow.json");
  rightSprite.resize(75, 75);

  
  majinSonicIdle = new AnimatedSprite("sprites/Majin_Sonic_Animations/Majin_Sonic_Idle_Animation.png", 112.0, 283.0, "sprites/Majin_Sonic_Animations/Majin_Sonic_Idle_Animation.json");
  majinSonicIdle.resize(200, 200);


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

  majinSonicIdle.animate(7.0);

  //checkExampleAnimation();
  
  msElapsed +=100;
  grid.pause(100);
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
    grid.clearTileImage(oldLoc);

    //change the field for player1Row
    player1Col = 2;
  }

  //set "f" key to move down column 3
  if (keyCode == 70){
    GridLocation oldLoc = new GridLocation(player1Row, player1Col);
    grid.clearTileImage(oldLoc);
    player1Col = 3;
  }

  //set "j" key to move up column 4
  if (keyCode == 74){
    GridLocation oldLoc = new GridLocation(player1Row, player1Col);
    grid.clearTileImage(oldLoc);
    player1Col = 4;
  }
  
  //set "k" key to move right column 5
  if(keyCode == 75){
    //shift the player1 picture up in the 2D array
    GridLocation oldLoc = new GridLocation(player1Row, player1Col);
    //eliminate the picture from the old location
    grid.clearTileImage(oldLoc);
    //change the field for player1Row
    player1Col = 5;
  }
}
//Known Processing method that automatically will run when a mouse click triggers it
void mouseClicked(){
  
  //check if click was successful
  System.out.println("Mouse was clicked at (" + mouseX + "," + mouseY + ")");
  System.out.println("Grid location: " + grid.getGridLocation());

  //what to do if clicked?
  GridLocation clickedLoc = grid.getGridLocation();
  GridLocation player1Loc = new GridLocation(player1Row, player1Col);


  //Toggle the animation on & off
  doAnimation = !doAnimation;
  System.out.println("doAnimation: " + doAnimation);
  grid.setMark("X",grid.getGridLocation());
    
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

  //update the background
  background(songBG);

  //Display the Player1 image
  if(health <34){
      player1 = p1losing;
  } 
  else {
    player1 = p1neutral;
  }

  GridLocation player1Loc = new GridLocation(player1Row,player1Col);
  grid.setTileImage(player1Loc, player1);
  
  //update other screen elements
  grid.showImages();
  grid.showSprites();
  grid.showGridSprites();
  textSize(50);
  text("Health: ", 490, 650);
  textSize(35);
  text(health, 660, 650);


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
      grid.setTileSprite(new GridLocation(bottomRow, c), leftSprite);
      System.out.println("Left added");
    }
    else if (c == 3){
      grid.setTileSprite(new GridLocation(bottomRow, c), upSprite);
      System.out.println("Up added" + upSprite);
    }
    else if (c == 4){
      grid.setTileSprite(new GridLocation(bottomRow, c), downSprite);
      System.out.println("Down added");
    }
    else{
      grid.setTileSprite(new GridLocation(bottomRow, c), rightSprite);
      System.out.println("Right added");
    }

  }

}

//Method to move around the enemies/sprites on the screen
public void moveSprites(){

  // Loop through all of the rows & cols in the grid
  for (int c = leftCol; c <= rightCol; c++){
    for (int r = 0; r < grid.getNumRows(); r++){

      //Store the 2 tile locations to move
      GridLocation loc = new GridLocation(r, c);

      // //clear enemy sprites in top row
      if (r == 0){
        grid.clearTileSprite(loc);
      }

      //only move if player's loc isn't in top row
      if (r != 0){
        GridLocation newLoc = new GridLocation(r-1, c);
        
        //if there is a collusion
        if (checkCollision(loc, newLoc).equals("hit")){
          System.out.println("Collision at " + loc);

          //clear the arrow
          grid.clearTileSprite(loc);

          if (health + 3 >= 100){
            health = 100;
          }
          else{
            health += 3;
          }
          //"hit" song effect plays
          //hit.play();
        }

        //No collision, but a move
        else if(checkCollision(loc, newLoc).equals("move")){
          System.out.println("NO Collision at " + loc);

          //Check if there is spirte in r,c
          if (grid.hasTileSprite(loc)){
          grid.setTileSprite(newLoc, grid.getTileSprite(loc));
          
          //clear sprite from old loc
          grid.clearTileSprite(loc);
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
  //PImage image = grid.getTileImage(loc);
  AnimatedSprite arrow = grid.getTileSprite(loc);

  if (arrow == null){
    return "no move";
  }

  //Check next location
  PImage imageNext = grid.getTileImage(nextLoc);
  //AnimatedSprite nextSprite = grid.getTileSprite(nextLoc);
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

  //when 4 minutes pass = 240
  //Total time within song 12:25        60 per minute;   745 + 5 seconds = 750 for endgame portion 
  if(grid.getScreenTimeSeconds() > 240){
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
      image(death1BG, 100, 100);

      //Xenophane
      //image(endScreen, 100,100);

    }
        
    //if win...
    else{

      //Update the title bar

      //Show any end imagery

      //Xenophane
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