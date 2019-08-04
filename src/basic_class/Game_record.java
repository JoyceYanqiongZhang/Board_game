package basic_class;

import java.sql.Date;

public class Game_record extends Basics {
	
	private int id;
	private int game_id;
	private int win_id;
	private Date date;
	
	public Game_record() {
		
	}
	
	public Game_record(int game_id, int win_id, Date date) {
		this.game_id = game_id;
		this.win_id = win_id;
		this.date = date;
	}
	
	public Game_record(int id, int game_id, int win_id, Date date) {
		this.id = id;
		this.game_id = game_id;
		this.win_id = win_id;
		this.date = date;
	}
	
	public void set_id(int id) {
		this.id = id;
	}
	public int get_id() {
		return this.id;
	}

	
	public void set_game_id(int game_id) {
		this.game_id = game_id;
	}
	public int get_game_id() {
		return this.game_id;
	}
	
	public void set_win_id(int win_id) {
		this.win_id = win_id;
	}
	public int get_win_id() {
		return this.win_id;
	}
	
	public void set_date(Date date) {
		this.date = date;
	}
	public Date get_date() {
		return this.date;
	}

}
