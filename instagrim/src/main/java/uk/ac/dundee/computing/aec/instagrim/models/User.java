/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;

/**
 *
 * @author Administrator
 */
public class User {
	Cluster cluster;
	public User(){

	}

	public boolean RegisterUser(String username, String Password, String first_name, String last_name, String email){
		AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
		String EncodedPassword=null;
		try {
			EncodedPassword= sha1handler.SHA1(Password);
		}catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
			System.out.println("Can't check your password");
			return false;
		}
		Session session = cluster.connect("instagrim");
		PreparedStatement ps = session.prepare("insert into userprofiles (login,password,first_name,last_name,email) Values(?,?,?,?,?) IF NOT EXISTS;");

		BoundStatement boundStatement = new BoundStatement(ps);
		session.execute( // this is where the query is executed
				boundStatement.bind( // here you are binding the 'boundStatement'
						username,EncodedPassword,first_name,last_name, email));

		if (username != null) {
			return false;
		}
		// Transaction. If the User name already exists in the database, cancel registration.
		// Because User name is a mandatory field, it cannot be left blank, with other fields filled
		// to bypass  this check.


		return true;
	}





	public boolean IsValidUser(String username, String Password){
		AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
		String EncodedPassword=null;
		try {
			EncodedPassword= sha1handler.SHA1(Password);
		}catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
			System.out.println("Can't check your password");
			return false;
		}
		Session session = cluster.connect("instagrim");
		PreparedStatement ps = session.prepare("select password from userprofiles where login =?");
		ResultSet rs = null;
		BoundStatement boundStatement = new BoundStatement(ps);
		rs = session.execute( // this is where the query is executed
				boundStatement.bind( // here you are binding the 'boundStatement'
						username));
		if (rs.isExhausted()) {
			System.out.println("No Images returned");
			return false;
		} else {
			for (Row row : rs) {

				String StoredPass = row.getString("password");
				if (StoredPass.compareTo(EncodedPassword) == 0)
					return true;
			}
		}


		return false;  
	}
	public void setCluster(Cluster cluster) {
		this.cluster = cluster;
	}

	
	

	
	// this section pulls the details for the user page from the database - Forrest
	
	
   // update avatar from user profiles in the database
	public void Avatar(String username, String picid) {
		Session session = cluster.connect("instagrim");
		PreparedStatement ps = session.prepare
		("update userprofiles set picid=? where login=? ");
		BoundStatement boundStatement = new BoundStatement(ps);
		session.execute(boundStatement.bind(picid, username ));
		} 
	
	// Get avatar from user profiles in the database
	public String getPicid(String username) {
		String picid = "no avatar found";
 	    Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select picid from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind(username)); // here you are binding the 'boundStatement'                           
        if (rs.isExhausted()) {
            System.out.println("No last name found");
            return "";
        } else {
            for (Row row : rs) {                  
                picid = row.getString("picid");               
                }
        }   
    return picid ;  
	}
	
	
	
	
	
	

	// Gets First name from user profiles in the database
	public String getFirstName(String username){
		String firstName = "no name found";
		Session session = cluster.connect("instagrim");
		PreparedStatement ps = session.prepare("select first_name from userprofiles where login =?");
		ResultSet rs = null;
		BoundStatement boundStatement = new BoundStatement(ps);
		rs = session.execute( // this is where the query is executed
				boundStatement.bind(username)); // here you are binding the 'boundStatement'
		if (rs.isExhausted()) {
			System.out.println("No first name found");
			return "";
		} else {
			for (Row row : rs) {
				firstName = row.getString("first_name");
			}
		}
		return firstName ;
	}

	// Pulls information from the database for the user defined edits
	public void UserDetails(String username, String firstName, String lastName, String email ){
		Session session = cluster.connect("instagrim");
		PreparedStatement ps = session.prepare
		("update userprofiles set first_name=?, last_name=?, email=? where login=? ");
		BoundStatement boundStatement = new BoundStatement(ps);
		session.execute(boundStatement.bind(firstName, lastName, email, username));
		}
	
	

	// Gets Last name from user profiles in the database
	public String getLastName(String username){
		String lastName = "no name found";
		Session session = cluster.connect("instagrim");
		PreparedStatement ps = session.prepare("select last_name from userprofiles where login =?");
		ResultSet rs = null;
		BoundStatement boundStatement = new BoundStatement(ps);
		rs = session.execute( // this is where the query is executed
				boundStatement.bind(username)); // here you are binding the 'boundStatement'
		if (rs.isExhausted()) {
			System.out.println("No last name found");
			return "";
		} else {
			for (Row row : rs) {
				lastName = row.getString("last_name");
			}
		}
		return lastName ;
	}

	// Gets Email from user profiles in the database
	public String getEmail(String username){
		String email = "no email found";
		Session session = cluster.connect("instagrim");
		PreparedStatement ps = session.prepare("select email from userprofiles where login =?");
		ResultSet rs = null;
		BoundStatement boundStatement = new BoundStatement(ps);
		rs = session.execute( // this is where the query is executed
				boundStatement.bind(username)); // here you are binding the 'boundStatement'
		if (rs.isExhausted()) {
			System.out.println("No last name found");
			return "";
		} else {
			for (Row row : rs) {
				email = row.getString("email");
			}
		}
		return email ;
	}



}



