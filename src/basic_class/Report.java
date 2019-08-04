package basic_class;

public class Report extends Basics {

	private int id;
	private int by_id;
	private String content;
	private String condition;
	
	public Report() {
		
	}
	
	public Report(int by_id, String content, String condition) {
		this.by_id = by_id;
		this.content = content;
		this.condition =condition;
	}
	
	public Report(int id, int by_id, String content, String condition) {
		this.id = id;
		this.by_id = by_id;
		this.content = content;
		this.condition =condition;
	}
	
	public void set_id(int id) {
		this.id = id;
	}
	public int get_id() {
		return this.id;
	}
	
	public void set_by_id(int by_id) {
		this.by_id = by_id;
	}
	public int get_by_id() {
		return this.by_id;
	}
	
	public void set_content(String content) {
		this.content = content;
	}
	public String get_content() {
		return this.content;
	}
	
	public void set_condition(String condition) {
		this.condition = condition;
	}
	public String get_condition() {
		return this.condition;
	}
}
