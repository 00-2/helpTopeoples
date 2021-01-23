public class PaintCan extends Paint {

    public static void main(String[] args) {
        PaintCan p = new PaintCan();
    }

    public void fillBob(int x, int y) {
        while (!isFilled(x, y - 1)) {
            y = y - 1;
        }
//ищет y первого закрашенного элемента двигаясь только вниз от 0 по y, по x - куда ткнули 
        
        
        while (!isFilled(x, y)) {
            int x2 = x;
            while (!isFilled(x2, y)) {
                fillPixel(x2, y);
                x2++;
            }
            x2 = x - 1;

            while (!isFilled(x2, y)) {
                fillPixel(x2, y);
                x2--;
            }
            y++;
        }//алгоритм не работает,если ситуация: z-закр, t - точка тыка 
        /*zeeee		zzzzz
         *zeezt ->  zeezt
         *zzzzz		zzzzz
         * */
        //при возникновении препятствия  алгоритм
        // Warum funktioniert dieser Code nicht? (2 Punkte)
        //Не идет внутрь рисунка, в этом и пробема
    }

    public void fillRec(int x, int y) {
        // Wie wuerden Sie dieses Problem angehen? (2 Punkte)
    	/*базовый случай - т закрашена,
    	 * нет - проверяем x+1,y; x-1,y; x,y+1; x, y-1;
    	 * */
        // Rekursive Loesung (3 Punkte)
    	while(!isFilled(x,y)) {
    		fillPixel(x,y);
    		fillRec(x+1,y);
    		fillRec(x-1,y);
    		fillRec(x,y+1);
    		fillRec(x,y-1);
    	}
    }

    // Zusammenhang zwischen Traversierung von Graphen und dem Fuellen von Flaechen? (keine Punkte, aber interessant)
}
