PImage img;

void setup(){
  img = loadImage("cloud.jpg");
  size(540, 405);
  img.loadPixels();
  
  //sort
  for(int i = 0; i < img.pixels.length; i++){
    float record = -1;
    int selectedPixel = i;
    for(int j = i; j < img.pixels.length; j++){
      color pix = img.pixels[j];
      float b = brightness(pix);
      if(b > record){
        selectedPixel = j;
        record = b;
      }
      color temp = img.pixels[i];
      img.pixels[i] = img.pixels[selectedPixel];
      img.pixels[selectedPixel] = temp;
    }
  }
  img.updatePixels();
  img.save("cloudBSorted.jpg");
}

void draw(){
  background(0);
  image(img, 0, 0);
}
