var setting=function(){
    background (0, 98, 255);
    fill(255, 77, 0);
    ellipse(226,207,148,153);//Sun
    fill(13, 143, 35);
    rect(-5,201,408,212);//Ground
};
    setting();

var xPos=100;
var yPos=-8;
var myHeight=101;


var drawLegs=function(){
    fill(130, 130, 130);
    rect(xPos+(myHeight/100*114),yPos+(myHeight/100*202),myHeight/100*17,myHeight/100*35,myHeight/100*50);//leg 1
    rect(xPos+(myHeight/100*97),yPos+(myHeight/100*197),myHeight/100*17,myHeight/100*35,myHeight/100*50);//leg 2
    rect(xPos+(myHeight/100*51),yPos+(myHeight/100*201),myHeight/100*17,myHeight/100*35,myHeight/100*50);//leg 3
    rect(xPos+(myHeight/100*34),yPos+(myHeight/100*196),myHeight/100*17,myHeight/100*35,myHeight/100*50);//leg 4
};
    drawLegs();

var drawHead=function(){
    fill(130, 130, 130);
    rect(xPos+(myHeight/100*17),yPos+(myHeight/100*150),myHeight/100*130,myHeight/100*63,myHeight/100*50);
    fill(135, 135, 135);//head
    ellipse(xPos+(myHeight/100*23),yPos+(myHeight/100*147),myHeight/100*58,myHeight/100*58);
    fill(0, 0, 0);
    ellipse(xPos+(myHeight/100*4),yPos+(myHeight/100*142),myHeight/100*10,myHeight/100*15);//eye socket
    fill(255,255,255);
    ellipse(xPos+(myHeight/100*4),yPos+(myHeight/100*141),myHeight/100*5,myHeight/100*7);//pupil
    fill(135, 135, 135);
    arc(xPos+(myHeight/100*42),yPos+(myHeight/100*145),myHeight/100*35,myHeight/100*58,myHeight/100*-160    ,myHeight/100*144);//ear 
};
    drawHead();
    
var drawToes=function(){
fill(255, 255, 255);
ellipse(xPos+(myHeight/100*43),yPos+(myHeight/100*227),myHeight/100*10,myHeight/100*12);//toe 1
ellipse(xPos+(myHeight/100*60),yPos+(myHeight/100*231),myHeight/100*10,myHeight/100*12);//toe 2
ellipse(xPos+(myHeight/100*107),yPos+(myHeight/100*228),myHeight/100*10,myHeight/100*12);//toe 3
ellipse(xPos+(myHeight/100*124),yPos+(myHeight/100*232),myHeight/100*10,myHeight/100*12);//toe 4
strokeWeight(2);
line(xPos+(myHeight/100*60),yPos+(myHeight/100*235),xPos+(myHeight/100*60),yPos+(myHeight/100*227));//toenail 1
line(xPos+(myHeight/100*42),yPos+(myHeight/100*231),xPos+(myHeight/100*42),yPos+(myHeight/100*222));//toenail 2
line(xPos+(myHeight/100*107),yPos+(myHeight/100*233),xPos+(myHeight/100*107),yPos+(myHeight/100*223));//toenail 3
line(xPos+(myHeight/100*124),yPos+(myHeight/100*228),xPos+(myHeight/100*124),yPos+(myHeight/100*235));//toenail 4
};
    drawToes();

var drawTrunk=function(){
fill(130,130,130);
strokeWeight(1);
beginShape();
curveVertex(xPos+(myHeight/100*145),yPos+(myHeight/100*77));//trunk
curveVertex(xPos-(myHeight/100*5),yPos+(myHeight/100*150));//point 4
curveVertex(xPos-(myHeight/100*63),yPos+(myHeight/100*115));//point 3
curveVertex(xPos-(myHeight/100*71),yPos+(myHeight/100*135));//point 2
curveVertex(xPos+(myHeight/100*1),yPos+(myHeight/100*164));//point 1
curveVertex(xPos+(myHeight/100*174),yPos+(myHeight/100*21));
endShape();
};
    drawTrunk();


var drawAnimal=function(xPos,yPos,myHeight){
    drawLegs(xPos,yPos,myHeight);
    drawHead(xPos,yPos,myHeight);
    drawToes(xPos,yPos,myHeight);
    drawTrunk(xPos,yPos,myHeight);
    };

