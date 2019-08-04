package basic_class;

public class Games extends Basics {
	private int id;
	private String name;
	private int player_min;
	private int player_max;
	private String rules;
	private String description;
	private String pic;
	
	public Games(){
		
	}
	public Games(String name, int player_min, int player_max, String rules, String description, String pic) {
		this.name = name;
		this.player_min = player_min;
		this.player_max = player_max;
		this.rules = rules;
		this.description = description;
		this.pic = pic;
	}
	public Games(int id,String name, int player_min, int player_max, String rules, String description, String pic) {
		this.id =id;
		this.name = name;
		this.player_min = player_min;
		this.player_max = player_max;
		this.rules = rules;
		this.description = description;
		this.pic = pic;
	}
	
	public void set_id(int id) {
		this.id = id;
	}
	public int get_id() {
		return this.id;
	}
	
	public void set_name(String name) {
		this.name = name;
	}
	public String get_name() {
		return this.name;
	}
	
	public void set_player_min(int player_min) {
		this.player_min = player_min;
	}
	public int get_player_min() {
		return this.player_min;
	}

	public void set_player_max(int player_max) {
		this.player_max = player_max;
	}
	public int get_player_max() {
		return this.player_max;
	}
	
	public void set_rules(String rules) {
		this.rules=rules;
	}
	public String get_rules() {
		return this.rules;
	}
	
	public void set_description(String description) {
		this.description=description;
	}
	public String get_description() {
		return this.description;
	}
	
	public void set_pic(String pic) {
		this.pic=pic;
	}
	public String get_pic() {
		return this.pic;
	}
}
