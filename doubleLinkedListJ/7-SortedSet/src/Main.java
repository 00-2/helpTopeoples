public class Main {
	
	public static void main(String[] args) {
		/*OrderedSet ss = new SortedSet();
		ss.add(1);
		ss.add(-1);
		ss.add(-2);
		ss.add(2);
		ss.add(5);
		ss.add(0);
		ss.add(2);
		ss.add(6);
		int [] array = {10, 12, 14};
		ss.add(array);
		ss.remove(4);
		OrderedSet ss1 = ss.clone();
		ss1.remove(10);
		System.out.println("\nКлонирование:");
		System.out.println(ss1.toString());
		System.out.println("\nКлонирование от до:");
		ss1 = ss.getSetInBetween(0, 8);
		System.out.println(ss1.toString());*/
		//a
		OrderedSet os = new SortedSet();
		OrderedSet os1 = new SortedSet();
		//b
		System.out.println(os.toString());
		System.out.println(os1.toString());
		//c
		os.add(1);os.add(6);os.add(4);os.add(2);os.add(7);os.add(5);os.add(12);
		//d
		int[]array = {5, 23, 22, 7, 9};
		os1.add(array);
		//e
		System.out.println("Начальные данные " + os.toString());
		System.out.println("Начальные данные " + os1.toString());
		//f
		os1.remove(22);os1.remove(77);
		System.out.println("Удаление 22 и 77 " + os1.toString());
		//g
		OrderedSet osInterval = os.getSetInBetween(2, 6);
		System.out.println("Интервал 2-6 " + osInterval.toString());
		
		//h
		OrderedSet intersection, unity, subtraction;
		intersection = os.intersect(os1);
		unity = os.unite(os1);
		subtraction = os.subtract(os1);
		System.out.println("Пересечение "+intersection.toString());
		System.out.println("Объединение " + unity.toString());
		System.out.println("Различие(из первого удаляются элементы второго) " + subtraction.toString());
		//f
		int[]array1 = {18,19,20};
		OrderedSet nUnity = new SortedSet();
		nUnity.add(array1);
		nUnity = os.unite(nUnity);
		System.out.println("Объединение 18, 19, 20 " +  nUnity.toString());
	}

}
