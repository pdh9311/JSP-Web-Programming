package jspbook;

import java.util.ArrayList;

public class ProductRepository {
	// 상품을 저장할 ArrayList 객체 생성
	private ArrayList<Product> pList = new ArrayList<>();
	
	// 상품 저장 객체 생성
	private static ProductRepository instance = new ProductRepository();
	
	// 상품 저장 객체를 가져온다.
	public static ProductRepository getInstance() {
		return instance;
	}
	
	// 상품 기본 생성자
	public ProductRepository() {
		Product phone = new Product("P1234","iPhone 6s", 800000.0);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		phone.setManufacturer("Apple");
		phone.setCategory("Smart Phone");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFileName("P1234.jpg");
		
		Product notebook = new Product("P1235","LG PC 그램",1500000.0);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core precessors");
		notebook.setManufacturer("LG");
		notebook.setCategory("Notebook");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFileName("P1235.jpg");
		
		Product tablet = new Product("P1236","Galaxy Tab S", 900000.0);
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor");
		tablet.setManufacturer("Samsung");
		tablet.setCategory("Tablet");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFileName("P1236.jpg");
		
		pList.add(phone);
		pList.add(notebook);
		pList.add(tablet);
	}

	// 상품을 저장할 ArrayList 객체를 가져온다.
	public ArrayList<Product> getpList() {
		return pList;
	}
	
	// 상품 코드를 매개값으로 받아서 ArrayList로 부터 같은 상품코드를 가진 상품 객체를 가져온다.    
	public Product getProductById(String id) {
		Product productById = null;
		
		for(int i=0; i<pList.size(); i++) {
			Product product = pList.get(i);
			if(product != null && product.getProductId() != null && product.getProductId().equals(id)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	// 상품 객체를 매개값으로 받아서 ArrayList에 추가 한다.
	public void addProduct(Product product) {
		pList.add(product);
	}
}
