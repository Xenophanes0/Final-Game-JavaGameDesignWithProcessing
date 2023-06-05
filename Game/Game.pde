/* Game Class Starter File
 * Last Edit: 5/22/2023
 * Authors: Dean Carabajo & Mikyle O.
 */

//GAME VARIABLES
private int msElapsed = 0;
Grid grid = new Grid(12,7); //Screen 
//PImage player1Torso; // BF's waist and above
//PImage player1Legs; //BF's waist and below
PImage player1;

/*      Arrow Icons (Animated)      */
AnimatedSprite leftSprite;
AnimatedSprite downSprite;
AnimatedSprite upSprite;
AnimatedSprite rightSprite;

PImage endScreen;
PImage firstBG; //Intro Background
PImage songBG;  //Running Banner in Space Background

String extraText = "Have a Good Day.";
String titleText = "Too Far";
AnimatedSprite majinCharacter;
boolean doAnimation;

//HexGrid hGrid = new HexGrid(3);
import processing.sound.*;
SoundFile tfSong;

int player1Row = 1;
int player1Col = 3;


//Required Processing method that gets run once
void setup() {

  //Match the screen size to the background image size
  size(1200, 700);

  //Set the title on the title bar
  surface.setTitle(titleText);

  //Load images used
  songBG = loadImage("images/BackgroundFinalEscape.png");
  songBG.resize(1200,700);  //BG must be same dims as size()

  tfSong = new SoundFile(this, "sounds/Too_Far_Final_Escape_Remix.mp3");
  tfSong.play();

  
  player1 = loadImage("images/BF_Neutral_Icon.png");
  player1.resize(100,50);
  //player1.resize(grid.getTileWidthPixels(),grid.getTileHeightPixels());

  endScreen = loadImage("images/youwin.png");
  
  // Load a soundfile from the /data folder of the sketch and play it back
  
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
  
  if(isGameOver()){
    endGame();
  }

  majinCharacter.animate(6.5);

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

  if(!isGameOver()) {
    //set the title each loop
    surface.setTitle(titleText + "    " + extraText);

    //adjust the extra text as desired
  
  }

}

//method to update what is drawn on the screen each frame
public void updateScreen(){

  //update the background
  background(songBG);

  //Display the Player1 image
  GridLocation player1Loc = new GridLocation(player1Row,player1Col);
  grid.setTileImage(player1Loc, player1);
  
  //update other screen elements
  grid.showImages();
  grid.showSprites();


}

//Method to populate enemies or other sprites on the screen
public void populateSprites(){
  //What is the index for the top row ?
  int bottomRow = 7;

  //Loop through all the cols in the last column
  for(int c=2; c<6; c++){

    //Generate a random number
    double rando = Math.random();

    //10% of the time, decide to add an image to a Tile
    if(rando < 0.1){

      if (c == 2){
        grid.setTileSprite(new GridLocation(bottomRow, c), leftSprite);
      }
      else if (c == 3){
        grid.setTileSprite(new GridLocation(bottomRow, c), upSprite);
      }
      else if (c == 4){
        grid.setTileSprite(new GridLocation(bottomRow, c), downSprite);
      }
      else{
        grid.setTileSprite(new GridLocation(bottomRow, c), rightSprite);
      }
    }

  }

}

//Method to move around the enemies/sprites on the screen
public void moveSprites(){
  // Loop through all of the rows & cols in the grid
  for (int c = 0; c < grid.getNumCols(); c++){
    for (int r = 0; r < grid.getNumRows(); r++){

      //Store the 2 tile locations to move
      GridLocation loc = new GridLocation(r, c);

      // //clear enemy sprites in last row
      if (r == 0){
        grid.clearTileSprite(loc);
      }

      //only move if player's loc isn't in bottom row
      if (r != 0){
        GridLocation newLoc = new GridLocation(r-1, c);

        //Check if there is spirte in r,c
        if (grid.hasTileSprite(loc)){
          grid.setTileSprite(newLoc, grid.getTileSprite(loc));
          
          //clear sprite from old loc
          grid.clearTileSprite(loc);
        }
      }
    }
  }
}

//Method to check if there's a collision between player and sprite
public boolean checkCollision(GridLocation loc, GridLocation nextLoc){

  //Check current location
  PImage image = grid.getTileImage(loc);
  AnimatedSprite sprite = grid.getTileSprite(loc);

  if (image == null && sprite == null){
    return false;
  }

  //Check next location
  PImage imageNext = grid.getTileImage(nextLoc);
  AnimatedSprite nextSprite = grid.getTileSprite(nextLoc);
  if (imageNext == null && nextSprite == null){
    return false;
  }

  return true;

  //check if arrows hits player
  //if (arrowSprite.equals(exampleSprite))
}



//method to indicate when the main game is over
public boolean isGameOver(){
  return false; //by default, the game is never over
}

//method to describe what happens after the game is over
public void endGame(){
    System.out.println("Game Over!");

    //Update the title bar

    //Show any end imagery
    image(endScreen, 100,100);

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