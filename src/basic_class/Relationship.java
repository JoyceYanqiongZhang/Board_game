package basic_class;

public class Relationship extends Basics {
	private String name1;
	private String name2;
	private int id1;
	private int id2;
	private String tag;
	
	public Relationship() {
		
	}
	
	public Relationship(String name1, String name2, int id1, int id2) {
		this.name1 = name1;
		this.name2 = name2;
		this.id1 = id1;
		this.id2 = id2;
		this.tag = null;
	}
	
	public Relationship(String name1, String name2, int id1, String tag) {
		this.name1 = name1;
		this.name2 = name2;
		this.id1 = id1;
		this.tag = tag;
	}
	
	public void set_name1(String name1) {
		this.name1 = name1;
	}
	public String get_name1() {
		return this.name1;
	}
	
	public void set_name2(String name2) {
		this.name2 = name2;
	}
	public String get_name2() {
		return this.name2;
	}
	
	public void set_tag(String tag) {
		this.tag = tag;
	}
	public String get_tag() {
		return this.tag;
	}
	
	public void set_id1(int id1) {
		this.id1 = id1;
	}
	public int get_id1() {
		return this.id1;
	}
	
	public void set_id2(int id2) {
		this.id2 = id2;
	}
	public int get_id2() {
		return this.id2;
	}
	

}
