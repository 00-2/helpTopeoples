
public class ElementExistsException extends RuntimeException {

	public ElementExistsException() {
		super();
		//конструктор стандартный
	}
	public ElementExistsException(String s) {
		super(s);
		System.out.println("Ошибка " + s);
		//конструктор с ошибкой
	}
}
