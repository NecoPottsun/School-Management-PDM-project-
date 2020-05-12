/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projectgroup20lovely;

import com.sql.ConnectionSQL;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class Main {
     public static void main(String[] args) throws SQLException {
        // TODO code application logic here
   //     Frame frame = new Frame();
     //   frame.setVisible(true);
        ConnectionSQL sql = new ConnectionSQL();
        System.out.println(sql.query("SELECT * FROM titles"));
        
    }
}
