package dto;

public class Categori {
	
	private String categoriName;
	private int categoriNumber;
	public Categori() {
	
	}
	public Categori(String categoriName, int categoriNumber) {
		super();
		this.categoriName = categoriName;
		this.categoriNumber = categoriNumber;
	}
	public String getCategoriName() {
		return categoriName;
	}
	public void setCategoriName(String categoriName) {
		this.categoriName = categoriName;
	}
	public int getCategoriNumber() {
		return categoriNumber;
	}
	public void setCategoriNumber(int categoriNumber) {
		this.categoriNumber = categoriNumber;
	}
	@Override
	public String toString() {
		return "Categori [categoriName=" + categoriName + ", categoriNumber=" + categoriNumber + "]";
	}
	
	
}
