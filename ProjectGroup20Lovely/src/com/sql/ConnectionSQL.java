/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Admin
 */
public class ConnectionSQL {
       private String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=books;user=sa;password=sa";
       private Connection connection;
       private Statement statement;
       public ConnectionSQL() throws SQLException{
              connection = DriverManager.getConnection(connectionURL); 
              statement = connection.createStatement();

       }
       public String query(String query) throws SQLException{
           connection = DriverManager.getConnection(connectionURL); 
             statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            StringBuilder results = new StringBuilder();
            ResultSetMetaData metaData = rs.getMetaData();
            int numOfColumns = metaData.getColumnCount();
            for (int i = 1; i <= numOfColumns; i++) {
                results.append(metaData.getColumnName(i)).append("\t");
            }
            results.append("\n");

            while (rs.next()) {
                for (int i = 1; i <= numOfColumns; i++) {
                    results.append(rs.getObject(i)).append("\t");

                }
                results.append("\n");
            }
            return results.toString();
       }
}
