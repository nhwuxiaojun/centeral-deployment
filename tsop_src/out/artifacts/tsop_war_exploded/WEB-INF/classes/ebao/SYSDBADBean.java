package ebao;

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class SYSDBADBean
{
  Connection Conn = null;
  ResultSet rs = null;
  Statement stmt = null;

  public SYSDBADBean(String url_dba, String user_dba, String password_dba)
  {
    try
    {
      String url = new String();
      String user = new String();
      String password = new String();
      Properties conProps = new Properties();
      conProps.put("user", user_dba);
      conProps.put("password", password_dba);
      conProps.put("defaultRowPrefetch", "15");
      conProps.put("internal_logon", "sysdba");

      String driverClass = new String();
      driverClass = "oracle.jdbc.driver.OracleDriver";
      System.out.print("Loading jdbc Driver  -> " + driverClass + "\n");
      Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();

      url = url_dba;
      user = user_dba;
      password = password_dba;

      System.out.print("Connecting to        -> " + url + " as "+user_dba+":"+password_dba+"\n");
      this.Conn = DriverManager.getConnection(url, conProps);

      System.out.print("Connected as         -> " + user_dba + "\n");
    }
    catch (Exception e) {
      this.Conn = null;
      System.out.print("Error To Create Connection");
    }
  }

  public SYSDBADBean()
  {
    try
    {
      Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
      String url = "jdbc:oracle:thin:@172.16.7.122:1521:ora122";
      String user = "TSOPQUERYDEV";
      String password = "TSOPQUERYDEV_ONLY";
      this.Conn = DriverManager.getConnection(url, user, password);
    }
    catch (Exception e) {
      this.Conn = null;
      System.out.print("Error To Create Connection");
    }
  }

  public void close()
    throws SQLException
  {
    try
    {
      if (this.Conn != null)
        this.Conn.close();

      if (this.stmt != null)
        this.stmt.close();

      if (this.rs != null)
        this.rs.close();
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }

  public static void closeResultSet(ResultSet rs)
  {
    if (rs != null)
      try {
        rs.close();
      }
      catch (SQLException ex)
      {
      }
      catch (RuntimeException ex)
      {
      }
  }

  public ResultSet execSQL(String sql)
  {
    this.rs = null;
    try {
      Statement stmt = null;
      stmt = this.Conn.createStatement();
      this.rs = stmt.executeQuery(sql);
      stmt.close();
    }
    catch (SQLException ex) {
      this.Conn = null;
      this.rs = null;
      System.err.println("aq.execute-Query: " + ex.getMessage());
    }
    return this.rs;
  }

  public int execUpdate(String sql)
    throws SQLException
  {
    if (this.stmt == null) {
      this.stmt = this.Conn.createStatement();
      this.stmt.setQueryTimeout(15);
    }
    int i = this.stmt.executeUpdate(sql);
    return i;
  }

  public Connection getConnection()
  {
    return this.Conn;
  }
}
