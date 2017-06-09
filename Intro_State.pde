boolean isHoverOnPlay = false;

void introState() {
  clear();
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(255);
  text("Pong", width/2, height/3);

  rectMode(CENTER);

  if (isHoverOnPlay) 
    fill(134, 134, 134); 
  else 
  fill(255);
  rect(width/2, height/2+5, 100, 50);

  fill(0);
  text("Play", width/2, height/2);
}

void touchStarted() {
  mouseMoved();
}
void mouseMoved() {
  if (STATE == 0)
    isHoverOnPlay = 
      mouseX >= width/2 - 50 && mouseX <= width/2+50 &&
      mouseY >= height/2-25 && mouseY <= height/2+30;
  //else if (STATE == 4)
  //  isHoverOnPlay = 
  //    mouseX >= width/2 - 100 && mouseX <= width/2+100 &&
  //    mouseY >= height/2-25 && mouseY <= height/2+30;
  else
    isHoverOnPlay = false;
}

void mouseClicked() {
  if (STATE == 0)  
    if (isHoverOnPlay) {
      STATE = 1;
    }
}