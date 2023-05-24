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

PImage player1example;

PImage endScreen;
PImage firstBG; //Intro Background
PImage songBG;  //Running Banner in Space Background
String extraText = "Have a Good Day.";
//PImage sonicEXE;
String titleText = "Too Far";
AnimatedSprite exampleSprite;
boolean doAnimation;

//HexGrid hGrid = new HexGrid(3);
import processing.sound.*;
SoundFile tfSong;

int player1Row = 3;
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
  player1.resize(200,150);
  //player1.resize(grid.getTileWidthPixels(),grid.getTileHeightPixels());

  endScreen = loadImage("images/youwin.png");
  
  // Load a soundfile from the /data folder of the sketch and play it back
  // song = new SoundFile(this, "sounds/Lenny_Kravitz_Fly_Away.mp3");
  // song.play();

  
  //Animation & Sprite setup
  exampleAnimationSetup();

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

  checkExampleAnimation();
  
  msElapsed +=100;
  grid.pause(100);
}

//Known Processing method that automatically will run whenever a key is pressed
void keyPressed(){

  //check what key was pressed
  System.out.println("Key pressed: " + keyCode); //keyCode gives you an integer for the key

  //What to do when a key is pressed?

  //set "w" key to move player1 up
  if (player1Row != 0 && keyCode == 87){
    
    //Store old GridLocation
    GridLocation oldLoc = new GridLocation(player1Row, player1Col);
    
    //Erase image from previous location
    grid.clearTileImage(oldLoc);

    //change the field for player1Row
    player1Row--;
  }

  //set "s" key
  if (player1Row != grid.getNumRows() - 1 && keyCode == 83){
    player1Row++;

    GridLocation loc = new GridLocation(player1Row, player1Col);
    grid.clearTileImage(loc);
  }

  //set "a" key
  if (player1Col != 0 && keyCode == 65){
    player1Col--;

    GridLocation loc = new GridLocation(player1Row, player1Col);
    grid.clearTileImage(loc);
  }
  
  //set "d" key to move the player1 right
  if(player1Col != grid.getNumCols() - 1 && keyCode == 68){
    //check case where out of bounds
    
    //change the field for player1Row
    player1Col++;

    //shift the player1 picture up in the 2D array
    GridLocation loc = new GridLocation(player1Row, player1Col);

    //eliminate the picture from the old location
    grid.clearTileImage(loc);

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
  
  //Loop through all the Tiles and display its images/sprites
  

      //Store temporary GridLocation
      
      //Check if the tile has an image/sprite 
      //--> Display the tile's image/sprite



  //Update other screen elements


}

//Method to populate enemies or other sprites on the screen
public void populateSprites(){
  
  //What is the index for the last column?
  

  //Loop through all the rows in the last column
  
    //Generate a random number
    

    //10% of the time, decide to add an enemy image to a Tile
    

}

//Method to move around the enemies/sprites on the screen
public void moveSprites(){
  //Loop through all of the rows & cols in the grid
  for (int r = 0; r < grid.getNumRows(); r++){
    for (int c = 0; c < grid.getNumCols(); c++){

      //Store the 2 tile locations to move
      GridLocation loc = new GridLocation(r, c);

      //Don't move if player's loc isn't in first column
      if (c != 0){
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
  
      //Store the 2 tile locations to move

      //Check if the current tile has an image that is not player1      


        //Get image/sprite from current location


        //CASE 1: Collision with player1


        //CASE 2: Move enemy over to new location

        
        //Erase image/sprite from old location
        
        //System.out.println(loc + " " + grid.hasTileImage(loc));


      //CASE 3: Enemy leaves screen at first column

}

//Method to handle the collisions between Sprites on the Screen
public void handleCollisions(){


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

//example method that creates 5 horses along the screen
public void exampleAnimationSetup(){  
  int i = 2;
  exampleSprite = new AnimatedSprite("sprites/Majin_Sonic_Idle_Animation.png", 50.0, i*75.0, "sprites/Majin_Sonic_Idle_Animation.json");
} 

//example method that animates the horse Sprites
public void checkExampleAnimation(){
  if(doAnimation){
    exampleSprite.animateVertical(5.0, 1.0, true);
  }
}