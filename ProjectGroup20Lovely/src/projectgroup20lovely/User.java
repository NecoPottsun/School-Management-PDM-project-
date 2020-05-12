/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projectgroup20lovely;

/**
 *
 * @author TripleB
 */
class User {
    private int ID;
    private String firstName,lastName;
    
    public User(int ID , String firstName ,String lastName){
        this.ID=ID;
        this.firstName=firstName;
        this.lastName=lastName;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
}
