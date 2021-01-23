import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.RenderingHints;


public class SierpinskiTriangle extends SierpinskiTriangleAbstract {
	
	
	public SierpinskiTriangle() {
		
		}

	@Override
	protected void drawTriangleRec(int ax, int ay, int bx, int by, int cx, int cy, int depth, Color color) {
		if(depth > 0) {
		int dx,dy,ex,ey,fx,fy;
		fx = (ax+(bx-ax)/2);fy = by;
		dx = (ax+(bx-ax)/4);dy = (ay+(cy-ay)/2);
		ex = (bx-(bx-ax)/4);ey = (ay+(cy-ay)/2);
		int[] xPoints = {ax,bx,cx};int[] yPoints = {ay,by,cy};
		g.fillPolygon(xPoints,yPoints,3);
		Color prev = g.getColor();
		g.setColor(color.WHITE);
		int[] xPoints1 = {fx,ex,dx};int[] yPoints1 = {fy,ey,dy};
		this.g.fillPolygon(xPoints1, yPoints1,3);
		g.setColor(prev);
		drawTriangleRec(ax,ay,fx,fy,dx,dy,depth-1,color);
		drawTriangleRec(dx,dy,ex,ey,cx,cy,depth-1,color);
		drawTriangleRec(fx,fy,bx,by,ex,ey,depth-1,color);
		}
		if (depth == 0) {
			int[] xPoints = {ax,bx,cx};int[] yPoints = {ay,by,cy};

			g.fillPolygon(xPoints,yPoints,3);
		}
	}
	@Override
	protected void handleInput(int keyCode) {
		final int MIN_DEPTH=0, MAX_DEPTH = 7;
		if((char)keyCode==',') {//в задаче стоит <<, но такого у меня нет на клавиатуре + использование констант, но совсем криво написано - сделал так
			this.depth+=1;
		}
		if((char)keyCode=='3') {//в задаче стоит #, но такого у меня нет на клавиатуре(shift+3 = #)
			this.depth-=1;
		}
		
		if (this.depth>MAX_DEPTH) {this.depth = MAX_DEPTH;}
		if (this.depth<MIN_DEPTH) {this.depth = MIN_DEPTH;}
		
		if((char)keyCode==' ') {//в задаче стоит #, но такого у меня нет на клавиатуре(shift+3 = #)
			toggleRandomColor();
		}
		paint(getGraphics());
		
		// TODO Auto-generated method stub
	}

	@Override
	protected void toggleRandomColor() {
		if (this.useRandomColor) {
			this.useRandomColor = false;
		}
		else {
			this.useRandomColor = true;
		}
	}
	
	@Override
	protected void drawTriangle() {
		if (this.useRandomColor) {
			g.setColor(color.BLUE);//должен быть random, но написано, как в пдф, в пдф - синий
			drawTriangleRec(10, getHeight()-10, getWidth()-10, getHeight()-10, getWidth()/2, 30, depth, color);
		}
		else {
			drawTriangleRec(10, getHeight()-10, getWidth()-10, getHeight()-10, getWidth()/2, 30, depth, color);
		}
	}
	
	public static void main(String[] args) {
		SierpinskiTriangle obj = new SierpinskiTriangle();	
	}
}
