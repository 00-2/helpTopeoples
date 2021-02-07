
public class ContactDatabase {
	
	public ContactDatabase() {
		// TODO Auto-generated constructor stub
	}
	public static void main(String[] args) {
		
		Contact eins = new Contact("one@g.com");
	    Contact zwei = new Contact("two@g.com");
	    Contact drei = new Contact("three@g.com");//eq hash
	    Contact vier = new Contact("htree@g.com");//eq hash
		
		/*AuDOpenHashTable hashtabelle = new AuDOpenHashTable(10);
		hashtabelle.insert(eins);
		System.out.println(hashtabelle.getContact("one@g.com"));
		hashtabelle.insert(zwei);
		System.out.println(hashtabelle.getContact("two@g.com"));
		hashtabelle.remove(zwei);
		System.out.println(hashtabelle.getContact("two@g.com"));*/
		    
	    /*
	    AuDClosedHashTable hashtabelle = new AuDClosedHashTable(5);
	    hashtabelle.insert(eins);
	    hashtabelle.insert(zwei);
	    hashtabelle.insert(drei);
	    hashtabelle.insert(vier);
	    System.out.println(hashtabelle.getContact("one@g.com").toString());
	    hashtabelle.remove(vier);
	    System.out.println(hashtabelle.getContact("two@g.com").toString());
	    System.out.println(hashtabelle.getContact("three@g.com").toString());
	    System.out.println(hashtabelle.getContact("htree@g.com").toString());
	    */
	}
}
