import java.util.NoSuchElementException;
//import ElementExistsException;
public class SortedSet implements OrderedSet {
	
	public class ListItem{
		int value;
	    // Reference to the next node
	    ListItem next;
	    // Reference to the prev node
	    ListItem prev;

	    public ListItem(int value) {
	        this.next = null;
	        this.value = value;
	        this.prev = null;
	    }
	    @Override
	    public String toString() {
	    	if (this==null) {return "";}
	        if (this.next!=null) {
	        	return "["+this.value+"] --> "; 
	        	}
	        else {
	        	return "["+this.value+"]";
	        }
	    }
	    
	    @Override
	    public boolean equals(Object other) {
	        if (other instanceof ListItem) {
	        	ListItem nodeTmp = (SortedSet.ListItem) other;
	        	if (nodeTmp.value == this.value) {
	        		return true;
	        	}
	        }
	        return false;
	    }
	}
	
	ListItem head,tail;
	
	public SortedSet() {
		this.head = null;
		this.tail = null;
	}

	@Override
	public void clear() {
		if (this.head == null) {return;}
		// TODO Auto-generated method stub
		ListItem li=this.head, next = li.next;
		while(next!=null) {
			next = li.next;
			li = null;
			li = next;
		}
	}

	@Override
	public int size() {
		if (this.head == null) {return 0;}
		ListItem li=this.head;
		int ctd=1;
		while(li.next!=null) {
			li = li.next;
			ctd=ctd+1;
		}
		return ctd;
	}

	@Override
	public boolean contains(int value) {
		if (this.head == null) {return false;}
		ListItem li=this.head;
		while(li.next!=null) {
			if (value == li.value) {
				return true;
			}
			li = li.next;
		}
		return false;
	}

	@Override
	public int[] toArray() {
		int size = this.size();
		if (size<=0) {
			return null;
		}
		int array[] = new int[size];
		int i = 0;
		ListItem NodeTmp = this.head;
		while(NodeTmp!=null) {
			array[i]=NodeTmp.value;
			i++;
			NodeTmp = NodeTmp.next;
		}
		NodeTmp = null;
		int tmp;
		for(i = 0; i<size-1; i++) {
			for (int j = i; j <size-i-1; j++) {
				if (array[j]>array[j+1]) {
					tmp = array[j];
					array[j] = array[j+1];
					array[j+1] = tmp;
				}
			}
		}
		return array;
	}

	@Override
	public int[] toReversedArray() {
		int size = this.size();
		if (size<=0) {
			return null;
		}
		int array[] = new int[size];
		int i = 0;
		ListItem NodeTmp = this.head;
		while(NodeTmp!=null) {
			array[i]=NodeTmp.value;
			i++;
			NodeTmp = NodeTmp.next;
		}
		NodeTmp = null;
		int tmp;
		for(i = 0; i<size-1; i++) {
			for (int j = i; j <size-i-1; j++) {
				if (array[j]<array[j+1]) {
					tmp = array[j];
					array[j] = array[j+1];
					array[j+1] = tmp;
				}
			}
		}
		return array;
	}
	
	@Override
	public void add(int value) throws ElementExistsException{
	try {
			if (this.contains(value)) {
				throw new ElementExistsException();
			}
		else {
			if (this.head==null) {
				this.tail=new ListItem(value);
			    this.head = this.tail;
			}
			else {
				ListItem nodeTmp = new ListItem(value);
				if (nodeTmp.value<this.head.value) {
					nodeTmp.next = this.head;
					nodeTmp.prev = null;
					this.head.prev = nodeTmp;
					this.head = nodeTmp;
				}
				else if (nodeTmp.value>this.tail.value) {
					nodeTmp.prev = this.tail;
					nodeTmp.next = null;
					this.tail.next = nodeTmp;
					this.tail = nodeTmp;
				}
				else {
					nodeTmp = this.head;
					while(nodeTmp.value<value) {
						nodeTmp = nodeTmp.next;
					}
					ListItem node = new ListItem(value);
					node.next = nodeTmp;node.prev = nodeTmp.prev;
					nodeTmp.prev.next = node;
					nodeTmp.prev = node;
				}
				//this.print();
			}
		}
	}
	catch (ElementExistsException e) {
			System.err.println("Ошибка: "+value + " уже в списке");
	}
	}

	@Override
	public void add(int[] values){
		int size = values.length;
		for(int i = 0; i<size; i++) {
			this.add(values[i]);
		}
	}

	@Override
	public void remove(int value) throws NoSuchElementException {
	try {
		if (!this.contains(value)) {
			throw new NoSuchElementException();
		}
		ListItem NodeTmp = this.head;
		while(NodeTmp!=null && NodeTmp.value!=value) {
			NodeTmp = NodeTmp.next;
		}
		NodeTmp.prev.next = NodeTmp.next;
		}
	catch (NoSuchElementException e) {
		System.err.println("Ошибка: "+value + " нет в списке. Удаление невозможно");
	}
	}

	@Override
	public OrderedSet clone() {
		if (this.head==null) {return null;}
		else {
			SortedSet tmpSet = new SortedSet();
			ListItem tmpNode = this.head;
			while(tmpNode!=null) {
				tmpSet.add(tmpNode.value);
				tmpNode=tmpNode.next;
			}
			return tmpSet;
		}
	}

	@Override
	public OrderedSet getSetInBetween(int from, int to) {
		// TODO Auto-generated method stub
		if (this.head == null || this.tail.value<from) {
			return null;
		}
		else {
			SortedSet tmpSet = new SortedSet();
			ListItem tmpNode = this.head;
			while(tmpNode.value<from) {
				tmpNode = tmpNode.next;
			}
			
			while(tmpNode.value<=to) {
				tmpSet.add(tmpNode.value);
				tmpNode=tmpNode.next;
			}
			return tmpSet;
		}
	}

	@Override
	public OrderedSet intersect(OrderedSet set) {
		if (this.head==null || set == null) {return null;}
		SortedSet tmpSet = new SortedSet();
		ListItem tmpNode = this.head;
		while(tmpNode!=null) {
			if (set.contains(tmpNode.value)) {
				tmpSet.add(tmpNode.value);
			}
			tmpNode=tmpNode.next;
		}
		return tmpSet;
	}

	@Override
	public OrderedSet unite(OrderedSet set) {
		if (this.head==null || set == null) {return null;}
		OrderedSet tmpSet = set.clone();
		ListItem tmpNode = this.head;
		while(tmpNode!=null) {
			if (!tmpSet.contains(tmpNode.value)) {
				tmpSet.add(tmpNode.value);
			}
			tmpNode=tmpNode.next;
		}
		return tmpSet;
	}

	@Override
	public OrderedSet subtract(OrderedSet set) {
		if (this.head==null || set == null) {return null;}
		OrderedSet tmpSet = this.clone();
		ListItem tmpNode = this.head;
		while(tmpNode!=null) {
			if (set.contains(tmpNode.value)) {
				tmpSet.remove(tmpNode.value);
			}
			tmpNode=tmpNode.next;
		}
		return tmpSet;
	}
	@Override
	public String toString() {
		String result="";
		ListItem tmpNode = this.head;
		while(tmpNode!=null) {
			result+=tmpNode.toString();
			tmpNode = tmpNode.next;
		}
		return "{"+result+"}";
	}
}
