public abstract class AuDHashTable {

    protected int capacity;

    public AuDHashTable(int capacity) {
        this.capacity = capacity;
    }

    abstract public void insert(Contact c);

    abstract public void remove(Contact c);

    abstract public Contact getContact(String email);

    // Diese Methode muss noch implementiert werden
    protected int hash(String s) {
    	int hash = 0;
    	for(int i = 0; i < s.length(); i++) {
    		   hash+=s.charAt(i);
    		}
        return hash%capacity;
    }
}
