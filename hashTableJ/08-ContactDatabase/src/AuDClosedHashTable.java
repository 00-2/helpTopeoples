import java.util.NoSuchElementException;

public class AuDClosedHashTable extends AuDHashTable {
	Contact [] table;
	boolean [] deleted;
	int counter;
	
	public AuDClosedHashTable(int capacity) {
		super(capacity);
		this.table = new Contact [capacity];
		this.deleted = new boolean [capacity];
		this.counter = 0;
	}

	@Override
	public void insert(Contact c) throws UnsupportedOperationException {
		if (this.isFull()) {
			throw new UnsupportedOperationException();
		}
		String email = c.getEmail();
		int index = hash(email);
		int i = 0;
		while  ( this.deleted[index] && this.table[index].getEmail() != email) {
		    index = hash(email, i);
		    i++;
		}
		if ( !this.deleted[index] ) {
			this.deleted[index] = true;
			this.table[index] = c;
			this.counter ++;
		}
	}

	@Override
	public void remove(Contact c) throws NoSuchElementException {
		// TODO Auto-generated method stub
		int index = getIndexOf(c.getEmail());
		this.table[index] = null;
		this.deleted[index] = false;
		this.counter--;
	}

	@Override
	public Contact getContact(String email) throws NoSuchElementException {
		int index = getIndexOf(email);
		return this.table[index];
	}
	
	public boolean isFull() {
		for (int i=0; i<this.capacity; ++i){
			if (this.table[i]==null) return false;
		}
		return true;
	}
	
	protected int hash(String s,int i ) {
		if (i%2==0) {
			return Math.floorMod((hash(s)+i/2-1),capacity);
		}
		else {
			return Math.floorMod((hash(s)+i/2),capacity);
		}
	}
	
	private int getIndexOf(String email) throws NoSuchElementException{
		int pos = -1;
		for (int i = 0; i<this.capacity; ++i){
			if (this.table[i]!=null) {
				if (this.table[i].getEmail()==email) {
					pos = i;
				}
			}
		}
		if (pos == -1) throw new NoSuchElementException();
		return pos;
	}

	
	/*public static void main(String[] args) {

	    AuDClosedHashTable hashtabelle = new AuDClosedHashTable(5);
	    Contact eins = new Contact("one@g.com");
	    Contact zwei = new Contact("two@g.com");
	    Contact drei = new Contact("three@g.com");//eq hash
	    Contact vier = new Contact("htree@g.com");//eq hash
	    hashtabelle.insert(eins);
	    hashtabelle.insert(zwei);
	    hashtabelle.insert(drei);
	    hashtabelle.insert(vier);
	    System.out.println(hashtabelle.getContact("one@g.com").toString());
	    hashtabelle.remove(vier);
	    System.out.println(hashtabelle.getContact("two@g.com").toString());
	    System.out.println(hashtabelle.getContact("three@g.com").toString());
	}*/
}
