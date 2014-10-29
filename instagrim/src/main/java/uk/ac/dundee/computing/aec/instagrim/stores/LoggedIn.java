/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.stores;

/**
 *
 * @author Administrator
 */
public class LoggedIn {
    boolean logedin=false;
    
    //added some new String variables to the logged in store
    String Username=null;
    String first_name = null;
    String last_name = null;
    String email = null;
    String picid = null;


    public void LogedIn(){

    }

    public void setUsername(String name){
    	this.Username=name;
    }

    public String getUsername(){
    	return Username;
    }

    
  
    
    public void setPicid(String picid) {
    	this.picid = picid;
    }
    public String getPicid() {
    	return picid;
    }
    
    
    public void setEmail(String email){
    	this.email=email;
    }
    
    public String getEmail(){
    	return email;
    }
    
    public void setFirstName(String firstName){
    	this.first_name=firstName;
    }
    public String getFirstName(){
    	return first_name;
    }
    
    public void setLastName(String lastName){
    	this.last_name=lastName;
    }
    
    public String getLastName(){
    	return last_name;
    }
    public void setLogedin(){
        logedin=true;
    }
    public void setLogedout(){
        logedin=false;
    }
    
    public void setLoginState(boolean logedin){
        this.logedin=logedin;
    }
    public boolean getlogedin(){
        return logedin;
    }
}
