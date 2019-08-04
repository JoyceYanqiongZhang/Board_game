package basic_class;

public class Room extends Basics {
	private int id;
	private int game_id;
	private int size;
	private int is_blocked;
	private int host_id;
	private int is_public;
	private String room_log;
	
	public Room() {
		
	}
	
	public Room(int game_id, int size, int host_id) {
		this.game_id = game_id;
		this.size = size;
		this.is_blocked = 0;
		this.host_id = host_id;
		this.is_public = 0;
		this.room_log = "";
	}
	
	public Room(int id, int game_id, int size, int is_blocked, int host_id, int is_public, String room_log) {
		this.id = id;
		this.game_id = game_id;
		this.size = size;
		this.is_blocked = is_blocked;
		this.host_id = host_id;
		this.is_public = is_public;
		this.room_log = room_log;
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
	
	public void set_size(int size) {
		this.size = size;
	}
	public int get_size() {
		return this.size;
	}
	
	public void set_is_blocked(int is_blocked) {
		this.is_blocked = is_blocked;
	}
	public int get_is_blocked() {
		return this.is_blocked;
	}
	
	public void set_host_id(int host_id) {
		this.host_id = host_id;
	}
	public int get_host_id() {
		return this.host_id;
	}
	
	public void set_is_public(int is_public) {
		this.is_public = is_public;
	}
	public int get_is_public() {
		return this.is_public;
	}
	
	public void set_room_log(String room_log) {
		this.room_log = room_log;
	}
	public String get_room_log() {
		return this.room_log;
	}

}
