package basic_class;

import java.sql.Time;

public class Comment extends Basics {
	private int id;
	private int postby_id;
	private int game_id;
	private String content;
	private String replyto_id;
	private String time;
	
	public Comment() {
		
	}
	
	public Comment(int postby_id, int game_id, String content, String replyto_id, String time) {
		this.postby_id = postby_id;
		this.game_id = game_id;
		this.content = content;
		this.replyto_id = replyto_id;
		this.time = time;
		
	}
	
	public Comment(int id, int postby_id, int game_id, String content, String replyto_id, String time) {
		this.id = id;
		this.postby_id = postby_id;
		this.game_id = game_id;
		this.content = content;
		this.replyto_id = replyto_id;
		this.time = time;
		
	}
	
	public void set_id(int id) {
		this.id = id;
	}
	public int get_id() {
		return this.id;
	}
	
	public void set_postby_id(int postby_id) {
		this.postby_id = postby_id;
	}
	public int get_postby_id() {
		return this.postby_id;
	}
	
	public void set_game_id(int game_id) {
		this.game_id = game_id;
	}
	public int get_game_id() {
		return this.game_id;
	}
	
	public void set_content(String content) {
		this.content = content;
	}
	public String get_content() {
		return this.content;
	}
	
	public void set_replyto_id(String replyto_id) {
		this.replyto_id = replyto_id;
	}
	public String get_replyto_id() {
		return this.replyto_id;
	}
	
	public void set_time(String time) {
		this.time = time;
	}
	public String get_time() {
		return this.time;
	}
	

	
}
