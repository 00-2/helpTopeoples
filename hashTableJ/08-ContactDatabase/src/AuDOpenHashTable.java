import java.util.LinkedList;
import java.util.NoSuchElementException;

public class AuDOpenHashTable extends AuDHashTable {

private LinkedList<Contact>[] table;


public AuDOpenHashTable(int capacity) {
    super(capacity);
    this.table = new LinkedList[capacity];
}

@Override
public void insert(Contact c) {
    int position = hash(c.getEmail());
    System.out.println("pos " + position);
    if (this.table[position] == null) {
        this.table[position] = new LinkedList<>();
    }
    this.table[position].add(c);
}

@Override
public void remove(Contact c) throws NoSuchElementException{
    int position = hash(c.getEmail());
    if (this.table[position]!=null) {
    	if (this.table[position].size()>1) {
    		for (Contact contact: this.table[position]) {
    			if (contact.getEmail() == c.getEmail()) {
    				this.table[position].remove(contact);
    			}
    		}
    	}
    	else {
    		this.table[position]=null;
    	}
    }
    else{
        throw new NoSuchElementException();
    }
}
 
@Override
public Contact getContact(String email)throws NoSuchElementException{
    int position = hash(email);
    if(this.table[position] != null){
    	Contact c = this.table[position].get(0);
    	Boolean flag = false;
    	for (int i = 0; i<this.table[position].size();++i) {
    		if (this.table[position].get(i).getEmail() == email) {
    			flag = true;
    			c = this.table[position].get(i);
    		}
    	}
    	if (flag)return c;
    	else {throw new NoSuchElementException();}
    }
    else{
        throw new NoSuchElementException();
    }
}

public static void main(String[] args) {

    AuDOpenHashTable hashtabelle = new AuDOpenHashTable(10);
    Contact eins = new Contact("one@g.com");
    hashtabelle.insert(eins);
    System.out.println(hashtabelle.getContact("one@g.com"));
    Contact zwei = new Contact("two@g.com");
    hashtabelle.insert(zwei);
    System.out.println(hashtabelle.getContact("two@g.com"));
    hashtabelle.remove(zwei);
    System.out.println(hashtabelle.getContact("two@g.com"));
    
    
    
    //hashtabelle.insert(eins);
//System.out.println(hashtabelle.getContact("one@g.com"));
//	*/
}

}