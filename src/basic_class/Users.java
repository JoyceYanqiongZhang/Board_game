package basic_class;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;

public class Users extends Basics {
	private int id;
	private String username;
	private String password;
	private String email;
	private String gender;
	private String location;
	private Date date_of_birth;
	private int is_manager;
	private String pic;
	private int is_blocked;
	private int wins;
	private int played;
	private String recover_question;
	private String recover_answer;
	private int is_online;
	
	public Users() {
		
	}
	
	public Users(String username, String password, String email, String recover_question, String recover_answer, int is_online) {
		this.username = username;
		String en_password = this.Encode( password);
		this.password = en_password;
		this.email = email;
		this.gender = "";
		this.location = "";
		this.date_of_birth = null;
		this.is_manager = 0;
		this.pic = "";
		this.is_blocked = 0;
		this.wins = 0;
		this.played = 0;
		this.recover_question = recover_question;
		this.recover_answer = recover_answer;
		this.is_online = is_online;
	}
	
	public Users(String username, String password, String email, String gender, String location, Date date_of_birth, int is_manager,String pic, int is_blocked, int wins, int played,String recover_question,String recover_answer, int is_online) {
		this.username = username;
		String en_password = this.Encode( password);
		this.password = en_password;
		this.email = email;
		this.gender = gender;
		this.location = location;
		this.date_of_birth = date_of_birth;
		this.is_manager = is_manager;
		this.pic = pic;
		this.is_blocked = is_blocked;
		this.wins = wins;
		this.played = played;
		this.recover_question = recover_question;
		this.recover_answer = recover_answer;
		this.is_online = is_online;
	}
	
	public Users(int id, String username, String password, String email, String gender, String location, Date date_of_birth, int is_manager,String pic, int is_blocked, int wins, int played,String recover_question,String recover_answer,int is_online) {
		this.id = id;
		this.username = username;
		String en_password = this.Encode( password);
		this.password = en_password;
		this.email = email;
		this.gender = gender;
		this.location = location;
		this.date_of_birth = date_of_birth;
		this.is_manager = is_manager;
		this.pic = pic;
		this.is_blocked = is_blocked;
		this.wins = wins;
		this.played = played;
		this.recover_question = recover_question;
		this.recover_answer = recover_answer;
		this.is_online = is_online;
	}
	
	public void set_id(int id) {
		this.id = id;
	}
	public int get_id() {
		return this.id;
	}
	
	public String get_username () {
		return this.username;
	}
	
	public void set_username (String username) {
		this.username = username;
	}
	
	public String get_password() {
		return this.password;
	}
	
	public void set_password(String password) {
		String en_password = this.Encode( password);
		this.password = en_password;
	}
	
	public String get_email () {
		return this.email;
	}
	
	public void set_email (String email) {
		this.email = email;
	}
	
	public String get_gender () {
		return this.gender;
	}
	
	public void set_gender (String gender) {
		this.gender = gender;
	}
	
	public String get_location () {
		return this.location;
	}
	
	public void set_location (String location) {
		this.location = location;
	}
	
	public Date get_date_of_birth () {
		return this.date_of_birth;
	}
	
	public void set_date_of_birth (Date date_of_birth) {
		this.date_of_birth = date_of_birth;
	
	}
	
	public int get_is_manager () {
		return this.is_manager;
	}
	
	public void set_is_manager (int is_manager) {
		this.is_manager = is_manager;
	}
	
	public String get_pic () {
		return this.pic;
	}
	
	public void set_pic (String pic) {
		this.pic= pic;
		
	}
	
	public int get_is_blocked () {
		return this.is_blocked;
	}
	
	public void set_is_blocked (int is_blocked) {
		this.is_blocked = is_blocked;
	}
	
	public int get_wins () {
		return this.wins;
	}
	
	public void set_wins (int wins) {
		this.wins = wins;
	}
	
	public int get_played () {
		return this.played;
	}
	
	public void set_played (int played) {
		this.played = played;
	}
	
	public String get_recover_question () {
		return this.recover_question;
	}
	
	public void set_recover_question (String recover_question) {
		this.recover_question = recover_question;
	}
		
	public String get_recover_answer () {
		return this.recover_answer;
	}
	
	public void set_recover_answer (String recover_answer) {
		this.recover_answer = recover_answer;
	}
	
    public int get_is_online() {
    	return this.is_online;
    } 
    
    public void set_is_online(int is_online) {
    	this.is_online = is_online;
    }
	
	public String Encode(String message){  
	    MessageDigest md;  
	    String encode = null;  
	    try {  
	        md = MessageDigest.getInstance("SHA");  
	        encode = bytesToHexString(md.digest(message  
	                .getBytes()));  
	    } catch (NoSuchAlgorithmException e) {  
	        e.printStackTrace();  
	    }  
	    return encode;  
	} 
	
	private String bytesToHexString(byte[] bArr) {
	    StringBuffer sb = new StringBuffer(bArr.length);
	    String sTmp;

	    for (int i = 0; i < bArr.length; i++) {
	        sTmp = Integer.toHexString(0xFF & bArr[i]);
	        if (sTmp.length() < 2)
	            sb.append(0);
	        sb.append(sTmp.toUpperCase());
	    }

	    return sb.toString();
	}
}
