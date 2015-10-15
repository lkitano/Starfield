//your code here

Particle []  Particles;


void setup()
{
	//your code here
	size(600,600);
	frameRate(60);
	Particles = new Particle[150];
	for(int i = 0; i < Particles.length; i++){
		Particles[i] = new NormalParticle();
		Particles[149] = new OddballParticle();
		Particles[148] = new JumboParticle();
	}

}
void draw()
{
	//your code here
	background(0);
	
	for(int i = 0; i < Particles.length; i++){
		Particles[i].show();
		Particles[i].move();
	

		
	}
}
class NormalParticle implements Particle
{
	double x,y, speed, angle, dX;
	int iColor, iX;
	boolean grow;

	NormalParticle(){
		speed = (Math.random()*2)+3;
		angle = (Math.PI)*(Math.random()*12)+1;
		x = 300.0;
		y = 300.0;
		dX = 10.0;
		iX=1;
		iColor = (int)(Math.random()*255);
		grow = true;
		

	} 
	public void move(){
		
		x += 2*Math.cos(angle)*speed;
		y += 2*Math.sin(angle)*speed;


		if (speed > -7){
			speed -= 0.1;
			angle+= Math.PI/30;
			
		} 
		if (speed <-7){
			
				speed += 14;
				angle -=Math.PI;
			
		}
	


	}
	public void show(){
		noStroke();

		fill(iColor,50,iColor+45);
		ellipse((float)x,(float)y,10,10);
	}

	

	

	//your code here
}
interface Particle
{
	//your code here
	public void show();
	public void move();
	


}
class OddballParticle implements Particle//uses an interface
{
	//your code here
	double pX, pY, angle2, speed2;
	int size;

	OddballParticle(){
		pX = 300.0;
		pY = 130.0;
		angle2 = Math.PI/30;
		speed2 = 10.0;
		size = 10;

	}

	public void show(){
		fill(255,0,0);
		
		for(int i =0; i < 10; i++){
			

			ellipse((float)pX,(float)pY,size,size);
			

			
		}



	}
	public void move(){
		pX += Math.cos(angle2)*speed2;
		pY += Math.sin(angle2)*speed2;

		angle2 += Math.PI/60;


		
	}

		
	


}
class JumboParticle extends NormalParticle//uses inheritance
{
	//your code here
 void show(){
		noStroke();

		fill(iColor,50,iColor+45);
		ellipse((float)x,(float)y,30,30);
}
}

