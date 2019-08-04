package basic_class;

import java.sql.Time;

public class Messege extends Basics {
	
	private int id;
	private int postby_id;
	private int room_id;
	private Time time;
	
	public Messege() {
		
	}
	
	public Messege(int postby_id, int room_id, Time time) {
		this.postby_id = postby_id;
		this.room_id = room_id;
		this.time = time;
	}

	public Messege(int id, int postby_id, int room_id, Time time) {
		this.id = id;
		this.postby_id = postby_id;
		this.room_id = room_id;
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
	
	public void set_room_id(int room_id) {
		this.room_id = room_id;
	}
	public int get_room_id() {
		return this.room_id;
	}
	
	public void set_time(Time time) {
		this.time = time;
	}
	public Time get_time() {
		return this.time;
	}
	
	
	
}
