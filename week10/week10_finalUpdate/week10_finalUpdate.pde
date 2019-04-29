
import processing.sound.*;

FFT fft;
AudioIn in;
SoundFile file;
int bands = 512;
float[] spectrum = new float[bands];

void setup() {
  size(500, 500);
  background(255);

  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  file = new SoundFile(this, "ODESZA - Meridian.mp3");
  file.play();
  // start the Audio Input
  //in.start();

  // patch the AudioIn
  fft.input(file);
}      

void draw() { 
  background(255);

  fft.analyze(spectrum);

  for (int i = 0; i < bands; i++) {
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by 5 to get more amplitude.
    line( i, height, i, height - spectrum[i]*height*5 );
  }

  int max = floor(map(spectrum[20], 0, 0.1, 20, 15));
  myFunction(max, max);
}

void myFunction (int maximum, int maximum1) {
  for (int j = 0; j < maximum1; j++) {
    for (int i = 0; i < maximum; i++) {
      //println(i);
      float x = i*width/maximum;
      float y = j*height/maximum1;
      int r = int (map(i, 0, maximum, 0, 255));
      int g = int (map(j, 0, maximum1, 0, 255));
      colorMode(HSB);
      fill(r, g, 220);
      strokeWeight(5);
      colorMode(RGB);
      stroke(g, r, 255);
      rect(x, y, width/maximum, height/maximum1);
    }
  }
}
