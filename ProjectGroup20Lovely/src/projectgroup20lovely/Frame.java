/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projectgroup20lovely;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;


public class Frame extends JFrame {
    
    JButton _search,_schedule,_salary,_tuitionFee,_reset,_select;
    
    JComboBox _job,_sex,_session,_classInfo;
    JTextField _fillInfo,_selectInfo;
    JTabbedPane tb;
    JPanel p1,p2;
    JTable _timeTable;
    JScrollPane _jscroll;
    JLabel l1,l2;
    JTextArea _a1;
    
    public Connection getConnection(){
        Connection con;
        try{
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:1434;databaseName=books;user=sa;password=hancg0257");
            return con;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public ArrayList<User> getUserList() throws SQLException{
        ArrayList<User> userList = new ArrayList<>();
        Connection con = getConnection();
        String query = "Select * from authors";
        java.sql.Statement st;
        ResultSet rs;
        try{
            st = con.createStatement();
            rs= st.executeQuery(query);
            User user;
            while(rs.next()){
                user = new User(rs.getInt("authorID"),rs.getString("fistname"),rs.getString("lastName"));
                userList.add(user);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return userList;
    }

    //Display Data in table
    public void show_user_in_jtable() throws SQLException{
        ArrayList<User> list = getUserList();
        DefaultTableModel model = (DefaultTableModel) _timeTable.getModel();
        Object[] row = new Object[3];
        for(int i=0;i<list.size();i++){
            row[0] = list.get(i).getID();
            row[1]=list.get(i).getFirstName();
            row[2]=list.get(i).getLastName();
            
            model.addRow(row);
        }
    }

    public boolean fee = true;
    public Frame(){
        l1=new JLabel("Name:");
        l1.setBounds(100,40,100,50);
        l2=new JLabel("ID:");
        l2.setBounds(100,120,100,50);
        
        
        
        _a1 = new JTextArea();
        _a1.setBounds(50,125,750,250);
        _a1.setEditable(true);
        
        
        String data[][]={
            {"Tiet 1","","","","","","",""},
            {"Tiet 2","","","","","","",""},
            {"Tiet 3","","","","","","",""},
            {"Tiet 4","","","","","","",""},
            {"Tiet 5","","","","","","",""},
            {"Tiet 6","","","","","","",""},
            {"Tiet 7","","","","","","",""},
            {"Tiet 8","","","","","","",""},
            {"Tiet 9","","","","","","",""},
            {"Tiet 10","","","","","","",""},
            {"Tiet 11","","","","","","",""}};
        
        String columm[]={"","MONDAY","TUESDAY","WEDNESDAY","THURSDAY","FRIDAY","SATURDAY","SUNDAY"};
        
        _timeTable = new JTable();
        _timeTable.setBounds(50,250,600,300);
        _jscroll= new JScrollPane(_timeTable);
        _jscroll.setBounds(0,200,880,550);
        
        
        p1=new JPanel();
        p2=new JPanel();
        
        
        String jobs[]={"Student","Teacher","None"};
        _job= new JComboBox(jobs);
        _job.setBounds(50,50,150,50);
        
        String sex[]={"Male","Female","None"};
        _sex= new JComboBox(sex);
        _sex.setBounds(250,50,150,50);
        
        String classInfo[]={"ID","Name","None"};
        _classInfo= new JComboBox(classInfo);
        _classInfo.setBounds(450,50,150,50);
        
        String session[]={"K15","K16","K17","K18","K19","K20","None"};
        _session= new JComboBox(session);
        _session.setBounds(650,50,150,50);
        
        
        _search = new JButton("Search");
        _search.setBounds(775,0,100,30);
        _select=new JButton("Select");
        _select.setBounds(700,400,150,30);
        _reset = new JButton("Clear");
        _reset.setBounds(665,0,100,30);
        _schedule=new JButton("Schedule");
        _schedule.setBounds(0,450,200,100);
        _salary = new JButton("Salary");
        _salary.setBounds(340,450,200,100);
        _tuitionFee=new JButton("Tuition Fee");
        _tuitionFee.setBounds(680,450,200,100);
        
        
        _fillInfo = new JTextField();
        _fillInfo.setBounds(50,0, 600, 30);
        _selectInfo=new JTextField();
        _selectInfo.setBounds(50,400, 600, 30);
        
        
        
         _search.addActionListener(new ActionListener(){  
             public void actionPerformed(ActionEvent e){  
                    String sex = _sex.getItemAt(_sex.getSelectedIndex())+"";
                    System.out.println(sex);
                    
                    String classInfo = _classInfo.getItemAt(_classInfo.getSelectedIndex())+"";
                    System.out.println(classInfo);
                    
                    String session = _session.getItemAt(_session.getSelectedIndex())+"";
                    System.out.println(session);
                    
                    String job = _job.getItemAt(_job.getSelectedIndex())+"";
                    System.out.println(job);
        }
       }); 
        _reset.addActionListener(new ActionListener(){  
             public void actionPerformed(ActionEvent e){  
                    _sex.setSelectedIndex(2);
                    _classInfo.setSelectedIndex(2);
                    _job.setSelectedIndex(2);
                    _session.setSelectedIndex(6);
                    
        }
       }); 
         _schedule.addActionListener(new ActionListener(){  
             public void actionPerformed(ActionEvent e){  
                    if (_fillInfo.getText().length() == 0) {
            JOptionPane.showMessageDialog(null, "Please input query string!", "Message", JOptionPane.WARNING_MESSAGE);
            return;
        }
        _a1.selectAll();
        _a1.replaceSelection("");
        String connectionUrl = "jdbc:sqlserver://localhost:1434;databaseName=books;user=sa;password=hancg0257";

        try (Connection con = DriverManager.getConnection(connectionUrl); java.sql.Statement stmt = con.createStatement();) {
            String SQL = _fillInfo.getText();
            ResultSet rs = stmt.executeQuery(SQL);

            // Iterate through the data in the result set and display it.
            // process query results
            StringBuilder results = new StringBuilder();
            ResultSetMetaData metaData = rs.getMetaData();
            System.out.println(rs);
            int numberOfColumns = metaData.getColumnCount();
            for (int i = 1; i <= numberOfColumns; i++) {
                results.append(metaData.getColumnName(i)).append("\t");
                System.out.println(results);
            }
            results.append("\n");
            //  Metadata
            ArrayList<User> list = new ArrayList<>();
            while (rs.next()) {
                for (int i = 1; i <= numberOfColumns; i++) {
                    User user = new User(rs.getInt("authorID"),rs.getString("firstName"),rs.getString("lastName"));
                    list.add(user);
                    results.append(rs.getObject(i)).append("\t");
                    System.out.println(results);
                }
                results.append("\n");
            }
        DefaultTableModel model = (DefaultTableModel) _timeTable.getModel();
        Object[] row = new Object[3];
        for(int i=0;i<list.size();i++){
            row[0] = list.get(i).getID();
            row[1]=list.get(i).getFirstName();
            row[2]=list.get(i).getLastName();
            
           model.addRow(row);
        }
            _a1.setText(results.toString());
        } // Handle any errors that may have occurred.
        catch (SQLException ex) {            
            _a1.setText(ex.getMessage());
        }
        }
       }); 
         _salary.addActionListener(new ActionListener(){  
             public void actionPerformed(ActionEvent e){  
                 try {
                     show_user_in_jtable();
                 } catch (SQLException ex) {
                     Logger.getLogger(ProjectGroup20Lovely.class.getName()).log(Level.SEVERE, null, ex);
                 }
                    
<<<<<<< HEAD:ProjectGroup20Lovely/src/projectgroup20lovely/Frame.java
                    JOptionPane.showMessageDialog(new Frame(),info,"TUITION FEE",JOptionPane.INFORMATION_MESSAGE);
=======
>>>>>>> 1591192b72147e17aa551e848d6f16fe587ef76f:ProjectGroup20Lovely/src/projectgroup20lovely/ProjectGroup20Lovely.java
                    
        }
       }); 
         _tuitionFee.addActionListener(new ActionListener(){  
             public void actionPerformed(ActionEvent e){  
                    if(false){
                    String name = "Name: cho Thanh bi gay";
                    String Id = "ID: ITITIU17070";
                    String cutInfo = "......................";
                    String credit = "CREDIT: 135 ";
                    String fee = "10.000 Dollars";
                    
                    String info= name + "\n" + Id + "\n" + cutInfo + "\n" + credit +"\n"+ fee;
                    
                    JOptionPane.showMessageDialog(new Frame(),info,"TUITION FEE",JOptionPane.INFORMATION_MESSAGE);
                    }else{
                        String info="YOU ARE NOT ALLOWED TO SEE\nTHE SCHEDULE!\nPLEASE PAY THE TUITION FEE AND\nTRY AGAIN!";
                      
                      JOptionPane.showMessageDialog(new Frame(),info,"UNPAID",JOptionPane.ERROR_MESSAGE);
                    }
                    
        }
       }); 
        
        
        
        p1.add(_search);p1.add(_salary);p1.add(_tuitionFee);p1.add(_schedule);p1.add(_reset);;p1.add(_select);
        p1.add(_fillInfo);p1.add(_selectInfo);
        p1.add(_a1);
        p1.add(_job);p1.add(_session);p1.add(_sex);p1.add(_classInfo);
        p1.setLayout(null);
        
        p2.add(l1);p2.add(l2);
        p2.add(_jscroll);
        p2.setLayout(null);
        
        tb = new JTabbedPane();
        tb.setBounds(50,50,880,550);
        tb.add("Find Info",p1);
        tb.add("Time Table",p2);
        
        
        this.add(tb);
        this.setSize(1000,700);
        this.setLocation(500, 200);
        this.setLayout(null);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setVisible(true);
    }
    
    public static void main(String[] args) {
         Frame f =new Frame();
    }
    
}
