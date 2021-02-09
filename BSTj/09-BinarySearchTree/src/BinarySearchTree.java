import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

public class BinarySearchTree implements BSTInterface{
	private TreeNode root;             // root of BST
	
    private class TreeNode {
        private int val;         // associated data
        private TreeNode parent, left, right;  // left and right subtrees + parent
        
        public TreeNode(TreeNode parent, int val) {
            this.val = val;
            this.parent = parent;
            this.left = null;
            this.right = null;
        }
    }

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public boolean exists(int value) {
		if (this.root==null) {
			return false;
		}
		else {
			TreeNode tmpNode = find(this.root, value);
			if (tmpNode==null) {
				return false;
			}
			return tmpNode.val == value;
		}
		
	}
	
	public TreeNode find(TreeNode parent,int value) {
		    if(parent == null || parent.val == value)
		    {
		      return parent;
		    }
		    else if(value <parent.val)
		    {
		      return find(parent.left,value);
		    }
		    else
		    {
		      return find(parent.right, value);
		    }
	}
	
	public void insert(TreeNode parent, int value) {
		if(value<parent.val) {
			if (parent.left==null) {
				parent.left = new TreeNode(parent, value);
			}
			else {
				parent = parent.left;
				insert(parent, value);
			}
		}
		else {
			if (parent.right==null) {
				parent.right = new TreeNode(parent, value);
			}
			else {
				parent = parent.right;
				insert(parent, value);
			}
		}
	}
	@Override
	public void insert(int value) throws ElementExistsException {
		if (this.root==null) {
			this.root = new TreeNode(null, value);
		}
		else if (this.exists(value)) {
			throw new ElementExistsException("Такой элемент уже присутствует");
		}
		else {
			TreeNode tmpNode = this.root;
			this.insert(tmpNode,value);
		}
	}
	@Override
	public void remove(int value) throws NoSuchElementException  // Удаление узла с заданным ключом
	   {
	       TreeNode currentNode = this.root;
	       TreeNode parentNode = this.root;
	       boolean isLeftChild = true;
	       while (currentNode.val != value) { // начинаем поиск узла
	           parentNode = currentNode;
	           if (value < currentNode.val) { // Определяем, нужно ли движение влево?
	               isLeftChild = true;
	               currentNode = currentNode.left;
	           }
	           else { // или движение вправо?
	               isLeftChild = false;
	               currentNode = currentNode.right;
	           }
	           if (currentNode == null)
	               throw new NoSuchElementException(); // yзел не найден
	       }

	       if (currentNode.left == null && currentNode.right == null) { // узел просто удаляется, если не имеет потомков
	           if (currentNode == this.root) // если узел - корень, то дерево очищается
	               this.root = null;
	           else if (isLeftChild)
	               parentNode.left = null; // если нет - узел отсоединяется, от родителя
	           else
	               parentNode.right = null;
	       }
	       else if (currentNode.right == null) { // узел заменяется левым поддеревом, если правого потомка нет
	           if (currentNode == this.root)
	               this.root = currentNode.left;
	           else if (isLeftChild)
	               parentNode.left = currentNode.left;
	           else
	               parentNode.right = currentNode.left;
	       }
	       else if (currentNode.left == null) { // узел заменяется правым поддеревом, если левого потомка нет
	           if (currentNode == this.root)
	               this.root = currentNode.right;
	           else if (isLeftChild)
	               parentNode.left = (currentNode.right);
	           else
	               parentNode.right = (currentNode.right);
	       }
	       else { // если есть два потомка, узел заменяется преемником
	           TreeNode heir = receiveHeir(currentNode);// поиск преемника для удаляемого узла
	           if (currentNode == this.root)
	               this.root = heir;
	           else if (isLeftChild)
	               parentNode.left = (heir);
	           else
	               parentNode.right = (heir);
	       } // элемент успешно удалён
	   }

	// метод возвращает узел со следующим значением после передаваемого аргументом.
	   // для этого он сначала переходим к правому потомку, а затем
	   // отслеживаем цепочку левых потомков этого узла.
	   private TreeNode receiveHeir(TreeNode node) {
		   TreeNode parentNode = node;
		   TreeNode heirNode = node;
		   TreeNode currentNode = node.right; // Переход к правому потомку
	       while (currentNode != null) // Пока остаются левые потомки
	       {
	           parentNode = heirNode;// потомка задаём как текущий узел
	           heirNode = currentNode;
	           currentNode = currentNode.left; // переход к левому потомку
	       }
	       // Если преемник не является
	       if (heirNode != node.right) // правым потомком,
	       { // создать связи между узлами
	           parentNode.left = (heirNode.right);
	           heirNode.right = (node.right);
	       }
	       return heirNode;// возвращаем приемника
	   }
	
	   void recPreOrder(TreeNode node, List<Integer> listResult){
	        if (node==null)return;
	        listResult.add(node.val);
	        if (node.left!=null) this.recPreOrder(node.left, listResult);
	        if (node.right!=null) this.recPreOrder(node.right, listResult);
	   }
	   void recPostOrder(TreeNode node, List<Integer> listResult){
	        if (node==null)return;
	        if (node.left!=null) this.recPreOrder(node.left, listResult);
	        if (node.right!=null) this.recPreOrder(node.right, listResult);
	        listResult.add(node.val);
	   }
	   void recInOrder(TreeNode node, List<Integer> listResult){
	        if (node==null)return;
	        if (node.left!=null) this.recPreOrder(node.left, listResult);
	        listResult.add(node.val);
	        if (node.right!=null) this.recPreOrder(node.right, listResult);
	   }
	@Override
	public List<Integer> preOrderList() {
		if (this.root == null) {return null;}
		List<Integer>tmpList = new ArrayList<Integer>();
		TreeNode tmpNode = this.root;
		recPreOrder(tmpNode, tmpList);
		return tmpList;
	}
	
	@Override
	public List<Integer> postOrderList() {
		if (this.root == null) {return null;}
		List<Integer>tmpList = new ArrayList<Integer>();
		TreeNode tmpNode = this.root;
		recPostOrder(tmpNode, tmpList);
		return tmpList;
	}
	
	@Override
	public List<Integer> inOrderList() {
		if (this.root == null) {return null;}
		List<Integer>tmpList = new ArrayList<Integer>();
		TreeNode tmpNode = this.root;
		recInOrder(tmpNode, tmpList);
		return tmpList;
	}
	
	
	public static void main(String[] args) {
		BinarySearchTree BST = new BinarySearchTree();
		BST.insert(5);
		BST.insert(1);
		BST.insert(2);
		BST.insert(3);
		BST.insert(7);
		BST.remove(1);
		BST.insert(1);
		//BST.insert(7);
		List<Integer>tmpList = BST.preOrderList();
		System.out.println("pre");
		for (Integer i : tmpList) {
			System.out.print(i + " ");
		}
		System.out.println();
		tmpList = BST.postOrderList();
		System.out.println("post");
		for (Integer i : tmpList) {
			System.out.print(i + " ");
		}
		System.out.println();
		tmpList = BST.inOrderList();
		System.out.println("in");
		for (Integer i : tmpList) {
			System.out.print(i + " ");
		}
	}
}
