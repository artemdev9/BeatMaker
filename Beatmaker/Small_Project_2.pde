import processing.sound.*;

//dels
Delay[] delay = new Delay[25];

// eq
FFT[] fft = new FFT[25];

float[] spectrum1 = new float[512];
float[] spectrum2 = new float[512];
float[] spectrum3 = new float[512];
float[] spectrum4 = new float[512];
float[] spectrum5 = new float[512];

float[] spectrum6 = new float[512];
float[] spectrum7 = new float[512];
float[] spectrum8 = new float[512];
float[] spectrum9 = new float[512];
float[] spectrum10 = new float[512];

float[] spectrum11 = new float[512];
float[] spectrum12 = new float[512];
float[] spectrum13 = new float[512];
float[] spectrum14 = new float[512];
float[] spectrum15 = new float[512]; 

float[] spectrum16 = new float[512];
float[] spectrum17 = new float[512];
float[] spectrum18 = new float[512];
float[] spectrum19 = new float[512];
float[] spectrum20 = new float[512];

float[] spectrum21 = new float[512];
float[] spectrum22 = new float[512];
float[] spectrum23 = new float[512]; 
float[] spectrum24 = new float[512];
float[] spectrum25 = new float[512];
 
int border = 50;

float vol1;
float vol2;
float vol3;
float vol4;
float vol5;

float pit1;
float pit2;
float pit3;
float pit4;
float pit5;

// delay
float d1;
float d2;
float d3;
float d4;
float d5;

float f1;
float f2;
float f3;
float f4;
float f5;

// reverb
float r1;
float r2;
float r3;
float r4;
float r5;

float dw1;
float dw2;
float dw3;
float dw4;
float dw5;




//scrolbars
VScrollbar vs1;
VScrollbar vs2;
VScrollbar vs3;
VScrollbar vs4;
VScrollbar vs5;

VScrollbar vs6;
VScrollbar vs7;
VScrollbar vs8;
VScrollbar vs9;
VScrollbar vs10;

VScrollbar vs11;
VScrollbar vs12;
VScrollbar vs13;
VScrollbar vs14;
VScrollbar vs15;

VScrollbar vs16;
VScrollbar vs17;
VScrollbar vs18;
VScrollbar vs19;
VScrollbar vs20;

VScrollbar vs21;
VScrollbar vs22;
VScrollbar vs23;
VScrollbar vs24;
VScrollbar vs25;

VScrollbar vs26;
VScrollbar vs27;
VScrollbar vs28;
VScrollbar vs29;
VScrollbar vs30;




int[] samplesActive = new int[25];
SoundFile[] samples = new SoundFile[25];

int[][] padsLocation = {  
  {460, 400 + border + 10, 80, 80}, // row 1 
  {560, 400 + border + 10, 80, 80}, 
  {660, 400 + border + 10, 80, 80}, 
  {760, 400 + border + 10, 80, 80}, 
  {860, 400 + border + 10, 80, 80}, 

  {460, 400 + border + 110, 80, 80}, // row 2
  {560, 400 + border + 110, 80, 80}, 
  {660, 400 + border + 110, 80, 80}, 
  {760, 400 + border + 110, 80, 80}, 
  {860, 400 + border + 110, 80, 80}, 

  {460, 400 + border + 210, 80, 80}, // row 3
  {560, 400 + border + 210, 80, 80}, 
  {660, 400 + border + 210, 80, 80}, 
  {760, 400 + border + 210, 80, 80}, 
  {860, 400 + border + 210, 80, 80}, 

  {460, 400 + border + 310, 80, 80}, // row 4
  {560, 400 + border + 310, 80, 80}, 
  {660, 400 + border + 310, 80, 80}, 
  {760, 400 + border + 310, 80, 80}, 
  {860, 400 + border + 310, 80, 80}, 

  {460, 400 + border + 410, 80, 80}, // row 5
  {560, 400 + border + 410, 80, 80}, 
  {660, 400 + border + 410, 80, 80}, 
  {760, 400 + border + 410, 80, 80}, 
  {860, 400 + border + 410, 80, 80}, 
};



float lows;
float lowmids;
float mids;
float highmids;
float highs;


int x = 200;
int y = 400;

int count = 5;


void setup() {
  size(1000, 1000);
  frameRate(50);

  samples[0] = new SoundFile(this, "drums1.mp3");
  samples[1] = new SoundFile(this, "drums2.mp3");
  samples[2] = new SoundFile(this, "drums3.mp3");
  samples[3] = new SoundFile(this, "drums4.mp3");
  samples[4] = new SoundFile(this, "drums5.mp3");

  samples[5] = new SoundFile(this, "percs1.mp3");
  samples[6] = new SoundFile(this, "percs2.mp3");
  samples[7] = new SoundFile(this, "percs3.mp3");
  samples[8] = new SoundFile(this, "percs4.mp3");
  samples[9] = new SoundFile(this, "percs5.mp3");

  samples[10] = new SoundFile(this, "bass1.mp3");
  samples[11] = new SoundFile(this, "bass2.mp3");
  samples[12] = new SoundFile(this, "bass3.mp3");
  samples[13] = new SoundFile(this, "bass4.mp3");
  samples[14] = new SoundFile(this, "bass5.mp3");

  samples[15] = new SoundFile(this, "mel1.mp3");
  samples[16] = new SoundFile(this, "mel2.mp3");
  samples[17] = new SoundFile(this, "mel3.mp3");
  samples[18] = new SoundFile(this, "mel4.mp3");
  samples[19] = new SoundFile(this, "mel5.mp3"); 

  samples[20] = new SoundFile(this, "fx1.mp3");
  samples[21] = new SoundFile(this, "fx2.mp3");
  samples[22] = new SoundFile(this, "fx3.mp3");
  samples[23] = new SoundFile(this, "fx4.mp3");
  samples[24] = new SoundFile(this, "fx5.mp3"); 


  for (int x = 0; x <= 24; x += 1) {
    delay[x] = new Delay(this);
    delay[x].process(samples[x], 5);  
    fft[x] = new FFT(this, 512);
    fft[x].input(samples[x]);
  }


  //scrollbars
  vs1 = new VScrollbar(400, 480, 50, 70, 1, 2);
  vs2 = new VScrollbar(400, 580, 50, 70, 1, 2);
  vs3 = new VScrollbar(400, 680, 50, 70, 1, 2);
  vs4 = new VScrollbar(400, 780, 50, 70, 1, 2);
  vs5 = new VScrollbar(400, 880, 50, 70, 1, 2);

  vs6 = new VScrollbar(350, 480, 50, 70, 2, 2);
  vs7 = new VScrollbar(350, 580, 50, 70, 2, 2);
  vs8 = new VScrollbar(350, 680, 50, 70, 2, 2);
  vs9 = new VScrollbar(350, 780, 50, 70, 2, 2);
  vs10 = new VScrollbar(350, 880, 50, 70, 2, 2);

  vs11 = new VScrollbar(300, 480, 50, 70, 1, 2);
  vs12 = new VScrollbar(300, 580, 50, 70, 1, 2);
  vs13 = new VScrollbar(300, 680, 50, 70, 1, 2);
  vs14 = new VScrollbar(300, 780, 50, 70, 1, 2);
  vs15 = new VScrollbar(300, 880, 50, 70, 1, 2);

  vs16 = new VScrollbar(250, 480, 50, 70, 1, 2);
  vs17 = new VScrollbar(250, 580, 50, 70, 1, 2);
  vs18 = new VScrollbar(250, 680, 50, 70, 1, 2);
  vs19 = new VScrollbar(250, 780, 50, 70, 1, 2);
  vs20 = new VScrollbar(250, 880, 50, 70, 1, 2);

  vs21 = new VScrollbar(200, 480, 50, 70, 1, 2);
  vs22 = new VScrollbar(200, 580, 50, 70, 1, 2);
  vs23 = new VScrollbar(200, 680, 50, 70, 1, 2);
  vs24 = new VScrollbar(200, 780, 50, 70, 1, 2);
  vs25 = new VScrollbar(200, 880, 50, 70, 1, 2);

  vs26 = new VScrollbar(150, 480, 50, 70, 1, 2);
  vs27 = new VScrollbar(150, 580, 50, 70, 1, 2);
  vs28 = new VScrollbar(150, 680, 50, 70, 1, 2);
  vs29 = new VScrollbar(150, 780, 50, 70, 1, 2);
  vs30 = new VScrollbar(150, 880, 50, 70, 1, 2);

  background(123, 63, 0);
  rect(x, y - 200, 600, 200); // eq square
}


int framesElapsed = 0;

void draw() {
  framesElapsed++;

  rect(border, 400 + border, 1000 - 2 * border, 100 );
  rect(border, 500 + border, 1000 - 2 * border, 100);
  rect(border, 600 + border, 1000 - 2 * border, 100);
  rect(border, 700 + border, 1000 - 2 * border, 100);
  rect(border, 800 + border, 1000 - 2 * border, 100);

  int q = 0;

  int pad = 1;

  for (int x = 1; x <= 5; x += 1) { 

    updateScreen(overRect(860, 400 + border + 10 + q, 80, 80), pad + 4);
    updateScreen(overRect(760, 400 + border + 10 + q, 80, 80), pad + 3); 
    updateScreen(overRect(660, 400 + border + 10 + q, 80, 80), pad + 2); 
    updateScreen(overRect(560, 400 + border + 10 + q, 80, 80), pad + 1); 
    updateScreen(overRect(460, 400 + border + 10 + q, 80, 80), pad); 

    pad += 5;
    
    rect(border + 200, 400 + border + q, 100, 100);
    rect(border + 300, 400 + border + q, 50, 100);
    rect(border + 350, 400 + border + q, 50, 100);

    q += 100;
  }

  padsColour();

  int launch = framesElapsed % 300; // 250 // change this value to adjust when the sample starts

  if ((framesElapsed % 50) == 0) {
    count = 6;
  }
  if ((framesElapsed % 100) == 0) {
    count = 5;
  } 
  if ((framesElapsed % 150) == 0) {
    count = 4;
  } 
  if ((framesElapsed % 200) == 0) {
    count = 3;
  } 
  if ((framesElapsed % 250) == 0) {
    count = 2;
  } 
  if ((framesElapsed % 300) == 0) {
    count = 1;
  } 
  
  
  
  fill(123, 63, 0);
  noStroke();
  rect(100, 260, 80, 100);
  fill(0);
  textSize(100);
  text(count, 100, 350);
  fill(255);
  stroke(2);
  
  if (launch == 0) {
    launchSample();
    framesElapsed = 0;
  }



  scrollBars();
  adjustSound();


  if ((frameCount % 5) == 0) {
    eq(x, y);
  }
  text();
}

void eq(int x, int y) {
  strokeWeight(4); 
  stroke(0);
  rect(x, y - 200, 600, 200);

  fft[0].analyze(spectrum1);
  fft[1].analyze(spectrum2);
  fft[2].analyze(spectrum3);
  fft[3].analyze(spectrum4);
  fft[4].analyze(spectrum5);

  fft[5].analyze(spectrum6);
  fft[6].analyze(spectrum7);
  fft[7].analyze(spectrum8);
  fft[8].analyze(spectrum9);
  fft[9].analyze(spectrum10);

  fft[10].analyze(spectrum11);
  fft[11].analyze(spectrum12);
  fft[12].analyze(spectrum13);
  fft[13].analyze(spectrum14);
  fft[14].analyze(spectrum15);

  fft[15].analyze(spectrum16);
  fft[16].analyze(spectrum17);
  fft[17].analyze(spectrum18);
  fft[18].analyze(spectrum19);
  fft[19].analyze(spectrum20);

  fft[20].analyze(spectrum21);
  fft[21].analyze(spectrum22);
  fft[22].analyze(spectrum23);
  fft[23].analyze(spectrum24);
  fft[24].analyze(spectrum25);

  for (int i = 0; i < 512; i++) {

    if (i <= 103) {
      lows = lows + spectrum1[i] +
        spectrum2[i] + 
        spectrum3[i] + 
        spectrum4[i] + 
        spectrum5[i] + 
        spectrum6[i] +
        spectrum7[i] +
        spectrum8[i] +
        spectrum9[i] +
        spectrum10[i] +
        spectrum11[i] +
        spectrum12[i] +
        spectrum13[i] +
        spectrum14[i] +
        spectrum15[i] +
        spectrum16[i] +
        spectrum17[i] +
        spectrum18[i] +
        spectrum19[i] +
        spectrum20[i] +
        spectrum21[i] +
        spectrum22[i] +
        spectrum23[i] +
        spectrum24[i] +
        spectrum25[i];
    } else if ((i > 103) && (i <= 206)) {
      lowmids = lowmids + spectrum1[i] +
        spectrum2[i] + 
        spectrum3[i] + 
        spectrum4[i] + 
        spectrum5[i] + 
        spectrum6[i] +
        spectrum7[i] +
        spectrum8[i] +
        spectrum9[i] +
        spectrum10[i] +
        spectrum11[i] +
        spectrum12[i] +
        spectrum13[i] +
        spectrum14[i] +
        spectrum15[i] +
        spectrum16[i] +
        spectrum17[i] +
        spectrum18[i] +
        spectrum19[i] +
        spectrum20[i] +
        spectrum21[i] +
        spectrum22[i] +
        spectrum23[i] +
        spectrum24[i] +
        spectrum25[i];
    } else if ((i > 206) && (i <= 309)) {
      mids = mids + spectrum1[i] +
        spectrum2[i] + 
        spectrum3[i] + 
        spectrum4[i] + 
        spectrum5[i] + 
        spectrum6[i] +
        spectrum7[i] +
        spectrum8[i] +
        spectrum9[i] +
        spectrum10[i] +
        spectrum11[i] +
        spectrum12[i] +
        spectrum13[i] +
        spectrum14[i] +
        spectrum15[i] +
        spectrum16[i] +
        spectrum17[i] +
        spectrum18[i] +
        spectrum19[i] +
        spectrum20[i] +
        spectrum21[i] +
        spectrum22[i] +
        spectrum23[i] +
        spectrum24[i] +
        spectrum25[i];
    } else if ((i > 209) && (i <= 412)) {
      highmids = highmids + spectrum1[i] +
        spectrum2[i] + 
        spectrum3[i] + 
        spectrum4[i] + 
        spectrum5[i] + 
        spectrum6[i] +
        spectrum7[i] +
        spectrum8[i] +
        spectrum9[i] +
        spectrum10[i] +
        spectrum11[i] +
        spectrum12[i] +
        spectrum13[i] +
        spectrum14[i] +
        spectrum15[i] +
        spectrum16[i] +
        spectrum17[i] +
        spectrum18[i] +
        spectrum19[i] +
        spectrum20[i] +
        spectrum21[i] +
        spectrum22[i] +
        spectrum23[i] +
        spectrum24[i] +
        spectrum25[i];
    } else if ((i > 412) && (i <= 512)) {
      highs = highs + spectrum1[i] +
        spectrum2[i] + 
        spectrum3[i] + 
        spectrum4[i] + 
        spectrum5[i] + 
        spectrum6[i] +
        spectrum7[i] +
        spectrum8[i] +
        spectrum9[i] +
        spectrum10[i] +
        spectrum11[i] +
        spectrum12[i] +
        spectrum13[i] +
        spectrum14[i] +
        spectrum15[i] +
        spectrum16[i] +
        spectrum17[i] +
        spectrum18[i] +
        spectrum19[i] +
        spectrum20[i] +
        spectrum21[i] +
        spectrum22[i] +
        spectrum23[i] +
        spectrum24[i] +
        spectrum25[i];
    }

    strokeWeight(4); 
    stroke(255);

    //draw the eq 
    pushMatrix();
    fill(0);
    translate(x + 120, y);
    rotate(PI); 
    rect(0, 0, 120, constrain(map(lows, 0, 10, 0, 200), 0, 195));   
    popMatrix();

    pushMatrix();
    fill(0);
    translate(x + 240, y);
    rotate(PI); 
    rect(0, 0, 120, constrain(map(lowmids, 0, 1, 0, 200), 0, 195));
    popMatrix();

    pushMatrix();
    fill(0);
    translate(x + 360, y);
    rotate(PI); 
    rect(0, 0, 120, constrain(map(mids, 0, 1, 0, 200), 0, 195)); 
    popMatrix();

    pushMatrix();
    fill(0);
    translate(x + 480, y);
    rotate(PI); 
    rect(0, 0, 120, constrain(map(highmids, 0, 1, 0, 200), 0, 195)); 
    popMatrix();

    pushMatrix();
    fill(0);
    translate(x + 600, y);
    rotate(PI); 
    rect(0, 0, 120, constrain(map(highs, 0, 1, 0, 200), 0, 195)); 
    popMatrix();

    strokeWeight(2); 
    stroke(0);
  } 

  lows = 0;
  lowmids = 0;
  mids = 0;
  highmids = 0;
  highs = 0;
  fill(255);
}


void text() {
  fill(0);
  textSize(130);
  text("BEAT MAKER", 80, 120); 

  fill(211, 211, 211);
  textSize(150);
  text("E Q", 370, 340); 
  fill(0);

  textSize(40);
  text("DRUMS", 60, 515);
  text("PERCS", 60, 615);
  text("BASS", 60, 715);
  text("MELODIE", 60, 815); 
  text("FX/VOX", 60, 915);

  textSize(20);
  text("VOL", 405, 474);
  text("VOL", 405, 574);
  text("VOL", 405, 674);
  text("VOL", 405, 774);
  text("VOL", 405, 874);

  textSize(18);
  text("FREQ", 352, 472);
  text("FREQ", 352, 572);
  text("FREQ", 352, 672);
  text("FREQ", 352, 772);
  text("FREQ", 352, 872);

  textSize(15);
  text("DEL.T", 304, 472);
  text("DEL.T", 304, 572);
  text("DEL.T", 304, 672);
  text("DEL.T", 304, 772);
  text("DEL.T", 304, 872);

  textSize(15);
  text("DEL.F", 254, 472);
  text("DEL.F", 254, 572);
  text("DEL.F", 254, 672);
  text("DEL.F", 254, 772);
  text("DEL.F", 254, 872);

  fill(255);
}


void scrollBars() {

  vol1 = vs1.update();
  vol2 = vs2.update();
  vol3 = vs3.update();
  vol4 = vs4.update();
  vol5 = vs5.update();

  pit1 = vs6.update();
  pit2 = vs7.update();
  pit3 = vs8.update();
  pit4 = vs9.update();
  pit5 = vs10.update();

  d1 = vs11.update();
  d2 = vs12.update();
  d3 = vs13.update();
  d4 = vs14.update();
  d5 = vs15.update();

  f1 = vs16.update();
  f2 = vs17.update();
  f3 = vs18.update();
  f4 = vs19.update();
  f5 = vs20.update();
}





void adjustSound() {

  for (int x = 0; x <= 4; x += 1) {
    samples[x].amp(vol1);
    samples[x].rate(pit1);
    delay[x].time(d1);
    delay[x].feedback(f1);
  }

  for (int x = 5; x <= 9; x += 1) {
    samples[x].amp(vol2);
    samples[x].rate(pit2);
    delay[x].time(d2);
    delay[x].feedback(f2);
  }

  for (int x = 10; x <= 14; x += 1) {
    samples[x].amp(vol3);
    samples[x].rate(pit3);
    delay[x].time(d3);
    delay[x].feedback(f3);
  }

  for (int x = 15; x <= 19; x += 1) {

    samples[x].amp(vol4);
    samples[x].rate(pit4);
    delay[x].time(d4);
    delay[x].feedback(f4);
  }

  for (int x = 20; x <= 24; x += 1) {

    samples[x].amp(vol5);
    samples[x].rate(pit5);
    delay[x].time(d5);
    delay[x].feedback(f5);
  }
}




void padsColour() {
  for (int x = 0; x <= 24; x += 1) {  
    print(samplesActive[x] + " ");
    if (samplesActive[x] == 1) {
      fill(0);
      rect(padsLocation[x][0], padsLocation[x][1], padsLocation[x][2], padsLocation[x][3]);
      fill(255);
    } else if (samplesActive[x] == 0) {
      fill(255);
      rect(padsLocation[x][0], padsLocation[x][1], padsLocation[x][2], padsLocation[x][3]);
    }
  }
  print("    ");
}


void launchSample() {



  for (int x = 0; x <= 24; x += 1) {  
    clearCashe();
    print(samplesActive[x] + " ");
    if (samplesActive[x] == 1) {
      samples[x].stop();
      samples[x].play();
    } else if (samplesActive[x] == 0) {
      try {
        samples[x].stop();
      }
      catch (Exception e) {
      }
    }
  }
  print("    ");
}

void clearCashe() {

  for (int x = 0; x <= 24; x += 1) { 
    try {
      samples[x].removeFromCache();
    }
    catch (Exception e) {
    }
  }
}


void isSampleActive(int index) {
  if (samplesActive[index] == 0) {
    samplesActive[index] = 1;
  } else if (samplesActive[index] == 1) {
    samplesActive[index] = 0;
  }
}





void updateScreen( boolean overR, int pad) {
  if (overR) {


    if (pad == 1) {
      isSampleActive(0);
    } else if (pad == 2) {
      isSampleActive(1);
    } else if (pad == 3) {
      isSampleActive(2);
    } else if (pad == 4) {
      isSampleActive(3);
    } else if (pad == 5) {
      isSampleActive(4);
    } else if (pad == 6) {
      isSampleActive(5);
    } else if (pad == 7) {
      isSampleActive(6);
    } else if (pad == 8) {
      isSampleActive(7);
    } else if (pad == 9) {
      isSampleActive(8);
    } else if (pad == 10) {
      isSampleActive(9);
    } else if (pad == 11) {
      isSampleActive(10);
    } else if (pad == 12) {
      isSampleActive(11);
    } else if (pad == 13) {
      isSampleActive(12);
    } else if (pad == 14) {
      isSampleActive(13);
    } else if (pad == 15) {
      isSampleActive(14);
    } else if (pad == 16) {
      isSampleActive(15);
    } else if (pad == 17) {
      isSampleActive(16);
    } else if (pad == 18) {
      isSampleActive(17);
    } else if (pad == 19) {
      isSampleActive(18);
    } else if (pad == 20) {
      isSampleActive(19);
    } else if (pad == 21) {
      isSampleActive(20);
    } else if (pad == 22) {
      isSampleActive(21);
    } else if (pad == 23) {
      isSampleActive(22);
    } else if (pad == 24) {
      isSampleActive(23);
    } else if (pad == 25) {
      isSampleActive(24);
    }
  }
} 


void gradient() {
  loadPixels();
  for (int i = 0; i < pixels.length; i++) { 
    int x = i % width; 
    int y = i / width; 
    float shadeY = map(y, 0, height, 0, 255);
    float shadeX = map(x, 0, width, 0, 255);
    color col = color(shadeX, shadeY, (shadeY + shadeX)/2);
    pixels[i] = col;
  }

  updatePixels();
}




boolean overRect(int x, int y, int width, int height) {
  if ((mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) && (mousePressed == true)) {
    mousePressed = false;
    return true;
  } else {
    return false;
  }
}

// scrollbars
class VScrollbar {
  float easing = 0.5;

  int middleX;
  int middleY;

  int topX;
  int botX;

  int rectY;

  int xCl;
  int yCl;

  int widthCl;
  int heightCl;

  int sliderOutput;
  float result;

  int modeCl;

  VScrollbar(int x, int y, int width, int height, int output, int mode) { 
    middleX = x + width / 2;
    middleY = y + height / 2;

    topX = y;
    botX = y + height;

    xCl = x;
    yCl = y;

    widthCl = width;
    heightCl = height;

    sliderOutput = output;

    modeCl = mode;
    if (modeCl == 1) {
      rectY =  (topX + 10 + botX - 20) / 2;
    } else if ( modeCl == 2) {
      rectY =  botX - 20;
    }
  }

  float update() {

    rect(xCl, yCl, widthCl, heightCl);
    line(middleX, yCl + 10, middleX, botX - 10);

    mouseControl();
    keyControl();

    rect(middleX - 5, constrain(rectY, topX + 10, botX - 20), 10, 10);
    result = constrain(rectY, topX + 10, botX - 20);

    if ( modeCl == 1) {
      result = ((topX + 10 + botX - 20)/2) - result;
      result = (result / 20) * sliderOutput;
    } else if ( modeCl == 2) {
      result = (botX - 20) - result;  
      result = (result / 40) * sliderOutput;
    }   

    return result;
  }

  void keyControl() {
    if ((keyPressed == true) && (mouseX>xCl) && (mouseX<xCl+widthCl) && (mouseY>yCl)&&(mouseY<yCl+heightCl)) {  
      if (key == 'w' || key == 'W') {
        rectY -= 1;
      } 
      if (key == 's' || key == 'S') {
        rectY += 1;
      }
    }
  }

  void mouseControl() {
    if ((mousePressed == true) && (mouseX>xCl) && (mouseX<xCl+widthCl) && (mouseY>yCl)&&(mouseY<yCl+heightCl)) {  
      float targetY = mouseY - 5;
      float dy = targetY - rectY;
      rectY += dy * easing;
    }
  }
}
