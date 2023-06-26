/* Game Class Starter File
 * Last Edit: 6/11/2023
 * Authors: Dean Carabajo & Mikyle O.
 */

//GAME VARIABLES
private int msElapsed = 0;
String gameStatus = "start";
boolean arrowTime = false;

PImage player1;
PImage p1neutral; 

PImage p1losing;
String extraText = "Shall we play...?";
String titleText = "Too Far";

/*Screens*/
// Screen grid;
// World currentWorld;
Grid grid;

/*Main Screen (Song Screen)*/

//Universal Background Images
String blackBackFile = "images/BlackBG.png";
PImage blackBackground;
String songBGFile = "images/BackgroundFinalEscape.png"; 
PImage songBG;
String endFile = "images/End_BG.png";
PImage endBackground;

//Opening Section of "Too Far"
String openingFile = "images/BackGrounds/Opening_Section/Beginning_BG.png";
PImage openingBackground;
String segaFile = "images/BackGrounds/Opening_Section/Sega_BG.png";
PImage segaBackground;
String sonicLogoBackFile = "images/BackGrounds/Opening_Section/Logo2.png";
PImage sonicLogoBackground;
String sonicThirdGlitchLogoBackFile = "images/BackGrounds/Opening_Section/Glitching_out_logo_3.png";
PImage sonicThirdGlitchLogoBackground;
String xenoSecondRingFile = "images/BackGrounds/Opening_Section/Xeno_ring_2.png";
PImage xenoSecondRingBackground;
String xenoThirdRingFile = "images/BackGrounds/Opening_Section/Xeno_ring_3.png";
PImage xenoThirdRingBackground;
String secondGlitchingRingFile = "images/BackGrounds/Opening_Section/Glitching_ring_2.png";
PImage secondGlitchingRingBackground;
PImage currentBg = openingBackground;

//Xenophanes Section(s) Background Images
String xenoBackFile = "images/BackGrounds/Xenophanes_Sections/xeno_BG.png";
PImage xenoBackground;

//Lord X Section Background Images
String lordXBackFile = "images/BackGrounds/Lord_X_Section/Lord_X_BG.png";
PImage lordXBackground;
String thirdGlitchingLordXBackFile = "images/BackGrounds/Lord_X_Section/Glitching_Lord_X_BG_3.png";
PImage thirdGlitchingLordXBackground;

//Majin Sonic Section Background Images
String fadeInMajinBackFile = "images/BackGrounds/Majin_Sonic_Section/Fade_In_Majin_BG.png";
PImage fadeInMajinBackground;
String majinSonicBackFile = "images/BackGrounds/Majin_Sonic_Section/Majin_Sonic_BG.png";
PImage majinSonicBackground;
String thirdGlitchingMajinBackFile = "images/BackGrounds/Majin_Sonic_Section/Glitching_Out_Majin_BG_3.png";
PImage thirdGlitchingMajinBackground;

//Fleetway Section Background Images
String fadeInFleetwayBackFile = "images/BackGrounds/Fleetway_Section/Fade_In_Fleetway_BG.png";
PImage fadeInFleetwayBackground;
String fleetwayBackFile = "images/BackGrounds/Fleetway_Section/Fleetway_BG.png";
PImage fleetwayBackground;
String thirdGlitchingFleetwayBackFile = "images/BackGrounds/Fleetway_Section/Glitching_Out_Fleetway_BG_3.png";
PImage thirdGlitchingFleetwayBackground;

//Sunky Section Background Images
String sunkyFile = "images/BackGrounds/Sunky_Section/Sunky_BG.png";
PImage sunkyBackground;

//Tails' Doll Background Image
String tailsDollFile = "images/BlackBG.png";
PImage tailsDollBackground;

//EXE Background Images
String fadeInEXEBackFile = "images/BackGrounds/EXE_Section/Fade_In_EXE_BG.png";
PImage fadeInEXEBackground;
String exeBackFile = "images/BackGrounds/EXE_Section/EXE_BG.png";
PImage exeBackground;
String thirdCloseInEXEBackFile = "images/BackGrounds/EXE_Section/Close_In_EXE_BG_3.png";
PImage thirdCloseInEXEBackground;
String fifthGlitchingOutEXEBackFile = "images/BackGrounds/EXE_Section/Glitching_Out_EXE_BG_5.png";
PImage fifthGlitchingOutEXEBackground;
String transformedEXEFile = "images/BackGrounds/EXE_Section/Transformed_EXE_BG.png";
PImage transformedEXEBackground;

//Angry/Vs. Team Sonic.exe Section Background Image
String angryXenoFile = "images/BackGrounds/Vs_Team_Sonic.exe_Section/angry_Xeno_BG.png";
PImage angryXenoBackground;
String firstExeUniteFile = "images/BackGrounds/Vs_Team_Sonic.exe_Section/exeTeamUp_1.png";
PImage firstEXEUniteBackground;
String secondEXEUniteFile = "images/BackGrounds/Vs_Team_Sonic.exe_Section/exeTeamUp_2.png";
PImage secondEXEUniteBackground;
String thirdEXEUniteFile = "images/BackGrounds/Vs_Team_Sonic.exe_Section/exeTeamUp_3.png";
PImage thirdEXEUniteBackground;
String fourthEXEUniteFile = "images/BackGrounds/Vs_Team_Sonic.exe_Section/exeTeamUp_4.png";
PImage fourthEXEUNiteBackground;
String fifthEXEUniteFile = "images/BackGrounds/Vs_Team_Sonic.exe_Section/exeTeamUp_5.png";
PImage fifthEXEUniteBackground;

//Sonic Section Background Images
String sonicFile = "images/BackGrounds/Sonic_Section/sonic_Section_BG.png";
PImage sonicBackground;

//ONGOING SCREENS THROUGHOUT THE SONG
PImage startScreen;
String startScreenFile = "images/Opening_Section/Glitching_out_logo.png";

//End Screen (TONS OF END SCREENS)
PImage death1BG;
String death1BGFile = "images/GameOverBG.png";     //FInal Escape Spotlight background
PImage deathBySonicHands;
String deathBySonicHandsFile = "images/bf dead.png";
PImage endBG;
String endBGFile = "images/You_Win.png";        //"The End" Picture
//...continue later

/*      Animated Sprites Present and Initialized HERE     */
//Arrow Icons (Animated)
AnimatedSprite leftSprite;
AnimatedSprite downSprite;
AnimatedSprite upSprite;
AnimatedSprite rightSprite;

AnimatedSprite leftStaticNote; // Play During Xenophanes' Sections; Miss a note -- health -= 10;
AnimatedSprite downStaticNote;
AnimatedSprite upStaticNote;
AnimatedSprite rightStaticNote;

AnimatedSprite leftMajinNote; //Play during Majin Sonic's Section; just a color change
AnimatedSprite downMajinNote;
AnimatedSprite upMajinNote;
AnimatedSprite rightMajinNote;

AnimatedSprite leftPhantomNote;  //Play during Lord X's Sections
AnimatedSprite downPhantomNote;
AnimatedSprite upPhantomNote;
AnimatedSprite rightPhantomNote;

// Majin Sonic Animations
AnimatedSprite majinSonicIdle;
AnimatedSprite majinSonicUp;
AnimatedSprite majinSonicDown;
AnimatedSprite majinSonicLeft;
AnimatedSprite majinSonicRight;

// Fleetway Animations
AnimatedSprite fleetwaySonicIdle;
AnimatedSprite fleetwaySonicUp;
AnimatedSprite fleetwaySonicDown;
AnimatedSprite fleetwaySonicLeft;
AnimatedSprite fleetwaySonicRight;

// EXE Animations
AnimatedSprite exeIdle;
AnimatedSprite exeUp;
AnimatedSprite exeDown;
AnimatedSprite exeLeft;
AnimatedSprite exeRight;

// Lord X Animations
AnimatedSprite lordXIdle;
AnimatedSprite lordXUp;
AnimatedSprite lordXDown;
AnimatedSprite lordXLeft;
AnimatedSprite lordXRight;

// Sunky Animations
AnimatedSprite sunkyIdle;
AnimatedSprite sunkyUp;
AnimatedSprite sunkyDown;
AnimatedSprite sunkyLeft;
AnimatedSprite sunkyRight;

// Tails' Doll Animations
AnimatedSprite tailsDollIdle;
AnimatedSprite tailsDollUp;
AnimatedSprite tailsDollDown;
AnimatedSprite tailsDollLeft;
AnimatedSprite tailsDollRight;

// Xenophanes Animations
AnimatedSprite xenophanesIdle;
AnimatedSprite xenophanesUp;
AnimatedSprite xenophanesDown;
AnimatedSprite xenophanesLeft;
AnimatedSprite xenophanesRight;

boolean doAnimation;
private int counter = 0; // 15 sections in total
private int timer = 0; //Total time within song 12:25        60 per minute

import processing.sound.*;

//Song  INITALIZATION
SoundFile segaSection;
SoundFile openingSection;
SoundFile xenoSectionOne;
SoundFile lordXSection;
SoundFile xenoSectionTwo;
SoundFile majinSonicSection;
SoundFile xenoSectionThree;
SoundFile fleetwaySection;
SoundFile sunkySection;
SoundFile tailsDollSection;
SoundFile xenoSectionFour;
SoundFile exeSection;
SoundFile angryXenoSection;
SoundFile teamEXESection;
SoundFile sonicSection;

int[] soundTimes = {10,32,72,131,170,229,370,496,555,597,636,757,767,825,861}; //Index of 14
int[] endTimes;

String[] bgChange = {openingFile, segaFile, sonicLogoBackFile, sonicThirdGlitchLogoBackFile, xenoSecondRingFile, xenoThirdRingFile, secondGlitchingRingFile};
String[] bgChangeTime;

int player1Row = 2;
int player1Col = 3;
int health = 50;

int leftCol = 2;
int rightCol = 5;


//Required Processing method that gets run once
void setup() {

  //Match the screen size to the background image size
  size(1200, 700);

  //Set the title on the title bar
  surface.setTitle(titleText);


  /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
  //ALL IMAGES LOCKED AND LOADED IN USE (LOTS OF SCREENS HAPPEN HERE)
  /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
  songBG = loadImage(songBGFile);
  songBG.resize(width, height);  //BG must be same dims as size()
  death1BG = loadImage(death1BGFile);
  death1BG.resize(1200,700);  
  deathBySonicHands = loadImage(deathBySonicHandsFile);
  deathBySonicHands.resize(1200,700);  
  endBG = loadImage(endBGFile);
  endBG.resize(1200, 700);

  /*Background Images Being Loaded*/
  //Sega Section
  openingBackground = loadImage(openingFile);
  openingBackground.resize(width, height);
  segaBackground = loadImage(segaFile);                                       //used for Section 0
  segaBackground.resize(width, height);

  sonicLogoBackground = loadImage(sonicLogoBackFile);
  sonicLogoBackground.resize(width, height);

  sonicThirdGlitchLogoBackground = loadImage(sonicThirdGlitchLogoBackFile);
  sonicThirdGlitchLogoBackground.resize(width, height);

  xenoSecondRingBackground = loadImage(xenoSecondRingFile);
  xenoSecondRingBackground.resize(width, height);

  //Opening Section
  xenoThirdRingBackground = loadImage(xenoThirdRingFile);                   //used for Section 1
  xenoThirdRingBackground.resize(width, height);

  secondGlitchingRingBackground = loadImage(secondGlitchingRingFile);
  secondGlitchingRingBackground.resize(width, height);

  //Xenophanes Section 1, 2, 3, 4
  xenoBackground = loadImage(xenoBackFile);
  xenoBackground.resize(width, height);

  //Lord X Section
  lordXBackground = loadImage(lordXBackFile);
  lordXBackground.resize(width, height);

  //Majin Sonic Section
  majinSonicBackground = loadImage(majinSonicBackFile);
  majinSonicBackground.resize(width, height);

  //Fleetway Section
  fleetwayBackground = loadImage(fleetwayBackFile);
  fleetwayBackground.resize(width, height);

  //Sunky Section
  sunkyBackground = loadImage(sunkyFile);
  sunkyBackground.resize(width, height);

  //Tails' Doll Section
  tailsDollBackground = loadImage(tailsDollFile);
  tailsDollBackground.resize(width, height);
  
  //EXE Section
  exeBackground = loadImage(exeBackFile);
  exeBackground.resize(width, height);

  transformedEXEBackground = loadImage(transformedEXEFile);
  transformedEXEBackground.resize(width, height);

  //VS EXE Team Section
  angryXenoBackground = loadImage(angryXenoFile);
  angryXenoBackground.resize(width, height);

  firstEXEUniteBackground = loadImage(firstExeUniteFile);
  firstEXEUniteBackground.resize(width, height);

  secondEXEUniteBackground = loadImage(secondEXEUniteFile);
  secondEXEUniteBackground.resize(width, height);

  thirdEXEUniteBackground = loadImage(thirdEXEUniteFile);
  thirdEXEUniteBackground.resize(width, height);

  fourthEXEUNiteBackground = loadImage(fourthEXEUniteFile);
  fourthEXEUNiteBackground.resize(width, height);

  fifthEXEUniteBackground = loadImage(fifthEXEUniteFile);
  fifthEXEUniteBackground.resize(width, height);

  //Sonic Section
  sonicBackground = loadImage(sonicFile);
  sonicBackground.resize(width, height);

  /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
  /*Interchanging Screens INITIALIZES HERE*/
  /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
  grid = new Grid("song", songBG, 12, 7);
  //grid = grid;
  //SoundFile[] songs = new SoundFile[2];

  /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
  /*TOO FAR REMIX FORMAT BEGINS HERE*/
  /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/  
  segaSection = new SoundFile(this, "sounds/Sega_Moment.mp3"); // 0 - 10                   10 seconds
  openingSection = new SoundFile(this, "sounds/Opening_Section.mp3"); //10 - 32             22 seconds
  xenoSectionOne = new SoundFile(this, "sounds/Xenophanes_Section_1.mp3"); //32 - 72        40 seconds
  lordXSection = new SoundFile(this, "sounds/Lord_X_Section.mp3"); //72 - 131               59 seconds
  xenoSectionTwo = new SoundFile(this, "sounds/Xenophanes_Section_2.mp3");//  131 - 170     39 seconds
  majinSonicSection = new SoundFile(this, "sounds/Majin_Sonic_Section.mp3");// 170 - 229    59 seconds
  xenoSectionThree = new SoundFile(this, "sounds/Xenophanes_Section_3.mp3"); ///229 - 370    141 seconds
  fleetwaySection = new SoundFile(this, "sounds/Fleetway_Section.mp3"); //370 - 496         126 seconds
  sunkySection = new SoundFile(this, "sounds/Sunky_Section.mp3");// 496 - 555               59 seconds
  tailsDollSection = new SoundFile(this, "sounds/Tails'_Doll_Section.mp3");// 555 - 597     42 seconds
  xenoSectionFour = new SoundFile(this, "sounds/Xenophanes_Section_4.mp3"); //597 - 636     39 seconds
  exeSection = new SoundFile(this, "sounds/EXE_Section.mp3");// 636 - 757                   121 seconds
  angryXenoSection = new SoundFile(this, "sounds/Vs._Xenophanes.mp3");// 757 - 767          10 seconds
  teamEXESection = new SoundFile(this, "sounds/Vs._Team_Sonic.exe_2.0.mp3");// 767 - 825    58 seconds
  sonicSection = new SoundFile(this, "sounds/Sonic_Section.mp3");// 825 - 861               36 seconds

  p1neutral = loadImage("images/BF_Neutral_Icon.png");
  p1neutral.resize(100,50);
  p1losing = loadImage("images/BF_Losing_Icon.png");
  p1losing.resize(100,50);
  player1= p1neutral;
  
  /*      Animation & Sprite setup      */
  leftSprite = new AnimatedSprite("sprites/Arrow_Animations/left_Arrow.png", "sprites/Arrow_Animations/left_Arrow.json");
  leftSprite.resize(75,75);
  downSprite = new AnimatedSprite("sprites/Arrow_Animations/down_Arrow.png", "sprites/Arrow_Animations/down_Arrow.json");
  downSprite.resize(75, 75);
  upSprite = new AnimatedSprite("sprites/Arrow_Animations/up_Arrow.png", "sprites/Arrow_Animations/up_Arrow.json");
  upSprite.resize(75, 75);
  rightSprite = new AnimatedSprite("sprites/Arrow_Animations/right_Arrow.png", "sprites/Arrow_Animations/right_Arrow.json");
  rightSprite.resize(75, 75);

  rightStaticNote = new AnimatedSprite("sprites/Arrow_Animations/static_Right_Note_Animation.png", "sprites/Arrow_Animations/static_Right_Note_Animation.json");
  rightStaticNote.resize(75, 75);
  downStaticNote = new AnimatedSprite("sprites/Arrow_Animations/static_Down_Note_Animation.png", "sprites/Arrow_Animations/static_Down_Note_Animation.json");
  downStaticNote.resize(75, 75);
  upStaticNote = new AnimatedSprite("sprites/Arrow_Animations/static_Up_Note_Animation.png", "sprites/Arrow_Animations/static_Up_Note_Animation.json");
  upStaticNote.resize(75, 75);
  leftStaticNote = new AnimatedSprite("sprites/Arrow_Animations/static_Left_Note_Animation.png", "sprites/Arrow_Animations/static_Left_Note_Animation.json");
  leftStaticNote.resize(75, 75);


  /*      OTHER SPRITES AND THEIR COUNTERPARTS      */

  //Xenophanes Animations

  //Lord X Animations 

  //Majin Sonic Animations
  majinSonicIdle = new AnimatedSprite("sprites/Majin_Sonic_Animations/Majin_Sonic_Idle_Animation.png", 112.0, 283.0, "sprites/Majin_Sonic_Animations/Majin_Sonic_Idle_Animation.json");
  majinSonicIdle.resize(200, 200);
  majinSonicUp = new AnimatedSprite("sprites/Majin_Sonic_Animations/Majin_Sonic_Up_Animation.png", 112.0, 283.0, "sprites/Majin_Sonic_Animations/Majin_Sonic_Up_Animation.json");
  majinSonicUp.resize(200,200);
  majinSonicDown = new AnimatedSprite("sprites/Majin_Sonic_Animations/Majin_Sonic_Down_Animation.png", 112.0, 283.0, "sprites/Majin_Sonic_Animations/Majin_Sonic_Down_Animation.json");
  majinSonicDown.resize(200,200);
  majinSonicLeft = new AnimatedSprite("sprites/Majin_Sonic_Animations/Majin_Sonic_Left_Animation.png", 112.0, 283.0, "sprites/Majin_Sonic_Animations/Majin_Sonic_Left_Animation.json");
  majinSonicLeft.resize(200,200);
  majinSonicRight = new AnimatedSprite("sprites/Majin_Sonic_Animations/Majin_Sonic_Right_Animation.png", 112.0, 283.0, "sprites/Majin_Sonic_Animations/Majin_Sonic_Right_Animation.json");
  majinSonicRight.resize(200,200);

  //Fleetway Super Sonic Animations

  //Sunky Animations

  //Tails' Doll Animations

  //EXE Animations

  //BF Animations

  //SOUND SETUP
  endTimes = new int[soundTimes.length];
  for(int i=0; i < soundTimes.length; i++)
  {
    endTimes[i] = soundTimes[i];
  }

  //IMAGE SETUP
  bgChangeTime = new String[bgChange.length];
  for (int i = 0; i < bgChange.length; i++){
    bgChangeTime[i] = bgChange[i];
  }

  System.out.println(endTimes);


  imageMode(CORNER);    //Set Images to read coordinates at corners
  //fullScreen();   //only use if not using a specfic bg image
  
  println("Game started...");

  //reset timer
  grid.resetTimer();
}


//Required Processing method that automatically loops
//(Anything drawn on the screen should be called from here)
void draw() {


System.out.println(grid.getScreenTimeSeconds());
  updateTitleBar();
  updateSections();
  updateBG();


  if(!isGameOver().equals("keep playing")){
    endGame();
  }

  else{
    if (arrowTime && msElapsed % 300 == 0) {
      populateSprites();
      moveSprites();
    }

    if(arrowTime){
      updateScreen();
    }



  }

  

  //checkExampleAnimation();
  
  msElapsed +=100;
  grid.pause(100);
}

//Known Processing method that automatically will run whenever a key is pressed
void keyPressed(){


  //check what key was pressed
  System.out.println("Key pressed: " + keyCode); //keyCode gives you an integer for the key

  int left = 37;
  int up = 38;
  int right = 39;
  int down = 40;

  if (gameStatus.equals("start"))
  {

    //set LEFT key to move down column 2
    if (keyCode == left)
    {
      //Store old GridLocation
      GridLocation oldLoc = new GridLocation(player1Row, player1Col);
    
      //Check if you collided into a arrow
      GridLocation nextLoc = new GridLocation(player1Row, 2);
      if (checkCollision(oldLoc, nextLoc).equals("hit"))
      {
        System.out.println("You ran into arrow at " + nextLoc);
        grid.clearTileSprite(nextLoc);
        health+=2;
      }

      //Erase image from previous location
      grid.clearTileImage(oldLoc);

      //change the field for player1Row
      player1Col = 2;
    }

    //set UP key to move down column 3
    if (keyCode == up)
    {
      //Store old GridLocation
      GridLocation oldLoc = new GridLocation(player1Row, player1Col);
    
      //Check if you collided into a arrow
      GridLocation nextLoc = new GridLocation(player1Row, 3);
      if (checkCollision(oldLoc, nextLoc).equals("hit"))
      {
        System.out.println("You ran into arrow at " + nextLoc);
        grid.clearTileSprite(nextLoc);
        health+=2;
      }

      //Erase image from previous location
      grid.clearTileImage(oldLoc);

      //change the field for player1Row
      player1Col = 3;
    }

    //set DOWN key to move up column 4
    if (keyCode == down)
    {
      //Store old GridLocation
      GridLocation oldLoc = new GridLocation(player1Row, player1Col);
    
      //Check if you collided into a arrow
      GridLocation nextLoc = new GridLocation(player1Row, 4);
      if (checkCollision(oldLoc, nextLoc).equals("hit"))
      {
        System.out.println("You ran into arrow at " + nextLoc);
        grid.clearTileSprite(nextLoc);
        health+=2;
      }

      //Erase image from previous location
      grid.clearTileImage(oldLoc);

      //change the field for player1Row
      player1Col = 4;
    }
  
    //set RIGHT to move right column 5
    if(keyCode == right)
    {
      //Store old GridLocation
      GridLocation oldLoc = new GridLocation(player1Row, player1Col);
    
      //Check if you collided into a arrow
      GridLocation nextLoc = new GridLocation(player1Row, 5);
      if (checkCollision(oldLoc, nextLoc).equals("hit"))
      {
        System.out.println("You ran into arrow at " + nextLoc);
        grid.clearTileSprite(nextLoc);
        health+=2;
      }

      //Erase image from previous location
      grid.clearTileImage(oldLoc);

      //change the field for player1Row
      player1Col = 5;
    }
  }
}

//Known Processing method that automatically will run when a mouse click triggers it
void mouseClicked(){
  //check location (DEVELOPER ONLY)
  System.out.println("Mouse was clicked at (" + mouseX + "," + mouseY + ")"); 
}

//------------------ CUSTOM  METHODS --------------------//

//method to update the Title Bar of the Game
public void updateTitleBar()
{
  if(isGameOver().equals("keep playing")) {
    //set the title each loop
    surface.setTitle(titleText + "    " + extraText);

    //adjust the extra text as desired
  }
}

/*      CRUICAL:    BACKGROUND CHANGE HAPPENS HERE      */
//method to update what is drawn on the screen each frame
public void updateScreen(){

  // if (grid == grid){
  //   currentWorld = grid;
  // }


  //Display the Player1 (BF's) image
  if(health < 34){
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

public void updateSections()
{
  //Sega Section
  if (grid.getScreenTimeSeconds() <= endTimes[0])
  {
    if(!segaSection.isPlaying())
    {
      System.out.println("Section 0");
      currentBg = segaBackground;
      segaSection.play();
    }
  }

  //Opening Section
  else if (grid.getScreenTimeSeconds() <= endTimes[1]) 
  {
    if(!openingSection.isPlaying())
    {
      System.out.println("Section 1");
      arrowTime = true;
      currentBg = xenoThirdRingBackground;
      openingSection.play();
    }
  }

  //Xenophanes Section 1
  else if(grid.getScreenTimeSeconds() <= endTimes[2])
  {
    //majinSonicIdle.animate(7.0);
    if(!xenoSectionOne.isPlaying())
    {
      System.out.println("Section 2");
      currentBg = xenoBackground;
      xenoSectionOne.play();
    }
  }

  //Lord X Section
  else if(grid.getScreenTimeSeconds() <= endTimes[3]) //add "-3" at the end of the endTimes
  {
    //majinSonicIdle.animate(7.0);
    if(!lordXSection.isPlaying())
    {
      System.out.println("Section 3");
      currentBg = lordXBackground;
      lordXSection.play();
    }
  }

  //else if(grid.getScreenTimeSeconds() <= endTimes[3])
  //{
  //    currentBg = thirdGlitchingLordXBackground;
  //}

  //Xenophanes Section 2
  else if(grid.getScreenTimeSeconds() <= endTimes[4])
  {
    //majinSonicIdle.animate(7.0);
    if(!xenoSectionTwo.isPlaying())
    {
      System.out.println("Section 4");
      currentBg = xenoBackground;
      xenoSectionTwo.play();
    }
  }

  //Majin Sonic Section
  else if(grid.getScreenTimeSeconds() <= endTimes[5])
  {
    

    if(!majinSonicSection.isPlaying())
    {
      System.out.println("Section 5");
      currentBg = majinSonicBackground;
      majinSonicIdle.animate(7.0);
      majinSonicSection.play();
    }
  }

  //Xenophanes Section 3
  else if(grid.getScreenTimeSeconds() <= endTimes[6])
  {
    //majinSonicIdle.animate(7.0);
    if(!xenoSectionThree.isPlaying())
    {
      System.out.println("Section 6");
      currentBg = xenoBackground;
      xenoSectionThree.play();
    }
  }

  //Fleetway Section
  else if(grid.getScreenTimeSeconds() <= endTimes[7])
  {
    //majinSonicIdle.animate(7.0);
    if(!fleetwaySection.isPlaying())
    {
      System.out.println("Section 7");
      currentBg = fleetwayBackground;
      fleetwaySection.play();
    }
  }
  
  //Sunky Section
  else if(grid.getScreenTimeSeconds() <= endTimes[8])
  {
    //majinSonicIdle.animate(7.0);
    if(!sunkySection.isPlaying())
    {
      System.out.println("Section 8");
      currentBg = sunkyBackground;
      sunkySection.play();       
    }
  }

  //Tails' Doll Section
  else if(grid.getScreenTimeSeconds() <= endTimes[9])
  {
    //majinSonicIdle.animate(7.0);
    if(!tailsDollSection.isPlaying())
    {
      System.out.println("Section 9");
      currentBg = tailsDollBackground;
      tailsDollSection.play();
    }
  }

  //Xenophanes Section 4
  else if(grid.getScreenTimeSeconds() <= endTimes[10])
  {
    //majinSonicIdle.animate(7.0);
    if(!xenoSectionFour.isPlaying())
    {
      System.out.println("Section 10");
      currentBg = xenoBackground;
      xenoSectionFour.play();
    }
  }

  //EXE Section
  else if(grid.getScreenTimeSeconds() <= endTimes[11])
  {
    //majinSonicIdle.animate(7.0);
    if(!exeSection.isPlaying())
    {
      System.out.println("Section 11");
      currentBg = exeBackground;
      exeSection.play();
    }
  }

  //Angry Xenophanes Section
  else if(grid.getScreenTimeSeconds() <= endTimes[12])
  {
    //majinSonicIdle.animate(7.0);
    if(!angryXenoSection.isPlaying())
    {
      System.out.println("Section 12");
      currentBg = angryXenoBackground;
      angryXenoSection.play();
    }
  }

  //Vs. Team Sonic.exe 2.0
  else if(grid.getScreenTimeSeconds() <= endTimes[13])
  {
    majinSonicIdle.animate(7.0);
    if(!teamEXESection.isPlaying())
    {
      System.out.println("Section 13");
      currentBg = fifthEXEUniteBackground;
      teamEXESection.play();
    }
  }

  //Sonic Section
  else if(grid.getScreenTimeSeconds() <= endTimes[14])
  {
    //majinSonicIdle.animate(7.0);
    if(!sonicSection.isPlaying())
    {
      System.out.println("Section 14");
      currentBg = sonicBackground;
      sonicSection.play();
    }
  }
}

public void updateBG(){
  grid.setBg(currentBg);
  grid.showBg();
}

//Method to populate enemies or other sprites on the screen
public void populateSprites(){
  int bottomRow = grid.getNumRows()-1;

  //Loop through all the cols in the bottom row
  int c = (int) (Math.random() * (rightCol-leftCol+1))+leftCol;

  //Generate a random number
  double rando = Math.random();

  //10% of the time, decide to add an image to a Tile
  if(rando < 0.2 && gameStatus.equals("start"))
  {
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
  else{
    //CLEAR ALL SPRITES PRESENT IN THE GRID, TBH HOW DO I DO THAT?
  }

}

//Method to move around the enemies/sprites on the screen
public void moveSprites(){

  //Generate random arrow speeds
  double rando = Math.random();

  // Loop through all of the rows & cols in the grid
  if (gameStatus.equals("start")){
    for (int c = leftCol; c <= rightCol; c++){
      for (int r = 0; r < grid.getNumRows(); r++){

        //Testing Random Speed Variable
        int moveRowUp = r-1;

        //Store the 2 tile locations to move
        GridLocation loc = new GridLocation(r, c);

        // //clear enemy sprites in top row
        if (r == 0){
          grid.clearTileSprite(loc);
        }

        if (r - 2 > 1 && rando < 0.1){
          moveRowUp -= 1;
        }

        //only move if player's loc isn't in top row
        if (r != 0){

          GridLocation newLoc = new GridLocation(moveRowUp,c);
           
        
          //if there is a collusion
          if (checkCollision(loc, newLoc).equals("hit"))
          {
            System.out.println("Collision at " + loc);

            //clear the arrow
            grid.clearTileSprite(loc);

            if (health + 3 >= 100){
              health = 100;
            }
            else
            {
              health += 2;
            }
            //"hit" song effect plays
            //hit.play();
          }

          //No collision, but a move
          else if(checkCollision(loc, newLoc).equals("move")){
            //System.out.println("NO Collision at " + loc);

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
}

//Method to check if there's a collision between player and sprite
public String checkCollision(GridLocation loc, GridLocation nextLoc){

  //Check current location
  PImage imageOld = grid.getTileImage(loc);
  AnimatedSprite spriteOld = grid.getTileSprite(loc);

  if (imageOld == null && spriteOld==null){
    return "no move";
  }

  //Check next location
  PImage imageNext = grid.getTileImage(nextLoc);
  AnimatedSprite spriteNext = grid.getTileSprite(nextLoc);
  if (imageNext == null && spriteNext == null){
    return "move";
  }

  return "hit";

}


//method to indicate when the main game is over
public String isGameOver()
{
  //when health is under 0
  if(health <=0){
    return "lose";
  }

  //when 4 minutes pass = 240
  //Total time within song 12:25        60 per minute;   745 + 5 seconds = 750 for endgame portion 
  if(grid.getScreenTimeSeconds() > 865){
    return "win";
  }

  return "keep playing"; //by default, the game is never over
}

//method to describe what happens after the game is over
public void endGame()
{
  System.out.println("Game Over!");
  
  //Stop the arrows
  arrowTime = false;

  //Kill all Sprites
  exterminate();

  //if lose...
  if(isGameOver().equals("lose"))
  {
    //Show any end imagery
    grid.setBg(death1BG); //Updating the Backgrounds

    //Dead BF 
    image(deathBySonicHands, 0,0);

    //No PLAY function (Gameplay STOP)
    gameStatus = "stop";
  }
        
  //if win...
  else{

    //Update the title bar

    //Show any end imagery
    grid.setBg(endBG);

    //Xenophanes
    //image(youWin, 50,50);



  }
}

public void exterminate(){
  
  //Remove ALL Arrow Icons on Grid
  for (int r = 0; r < grid.getNumRows(); r++){
    for (int c = 0; c < grid.getNumCols(); c++){

      GridLocation remove = new GridLocation(r, c);

      grid.clearTileSprite(remove);
    }
  }
}