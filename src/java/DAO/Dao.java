
package DAO;


import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Dao {
    
    Connection con;
    Statement stmt;
    
    public Dao() {
        
        try {
            Class.forName("org.postgresql.Driver");
            con=DriverManager.getConnection("jdbc:postgresql:Elibrary", "postgres", "434394");
            stmt=con.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            System.out.println("class not found");
        }
    }
    
    public ResultSet findUser(String usr,String pwd){
        
        ResultSet rs=null;
        String query="select * from users where loginid='"+usr+"' and psswrd='"+pwd+"';";
        try {
            rs=stmt.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return rs;
    }
    
    public boolean registerUser(String name,String email,String password,String city,long contact){
        
        int rows=0;
        try {
            String query="insert into users values('"+email+"','"+password+"','f','"+name+"','"+city+"','"+contact+"');";
            rows=stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
            if(rows==1)
                return true;
            else
                return false;
    }
    
    public ResultSet findBooksByUser(String id){
        String query="select * from books where uploaderid='"+id+"';";
        ResultSet rs;
        try{
            rs=stmt.executeQuery(query);
        }
        catch(SQLException e){
            rs=null;
        }
        return rs;
    }
    
    public int updateUserInfo(String name,String password,String city,long phno,String id){
        String q=null;
        int up=0;
        if(!name.equals(""))
            q="username='"+name+"'";
        if(!password.equals("")){
            if(q!=null)
                q+=",";
            q+="psswrd='"+password+"'";
        }
        if(!city.equals("")){
            if(q!=null)
                q+=",";
            q+="city='"+city+"'";
        }
        if(phno!=0){
            if(q!=null)
                q+=",";
            q+="contactno='"+phno+"'";
        }
        String query="update users set "+q+" where loginid='"+id+"'";
        try{
            up=stmt.executeUpdate(query);
        }
        catch(SQLException e){
            up=-1;
        }
        return up;                   
    }
    
    public boolean findCategory(String cat){
        
        String q="select * from categories where catname='"+cat+"';";
        ResultSet rs=null;
        try {
            rs=stmt.executeQuery(q);
            if(rs.next())
                return true;
            else
                return false;
        } catch (SQLException ex) {
            return false;
        }
    }
    
    public String addBook(String name,String author,String cate,String keywords,String id){
        
        String bid=null;
        try{
        ResultSet rs=stmt.executeQuery("select noofbooks from categories where catname='"+cate+"';");
        int n=0;
        if(rs.next())
            n=rs.getInt("noofbooks");
        n++;
        bid=author.substring(0, 3)+"_"+cate.substring(0, 3)+"_"+n;
        String q="insert into books values('"+bid+"','"+name+"','"+author+"','"+cate+"','"+id+"',0,0,'"+keywords+"')";
        stmt.executeUpdate(q);
        stmt.executeUpdate("update categories set noofbooks="+n+" where catname='"+cate+"'");
        }
        catch(SQLException e){
            //return 0;
        }
        return bid;
    }
    
    public ResultSet findBook(String name,String author,String category,String bookid){
        
        String q=null;
        ResultSet rs=null;
        if(!bookid.equals(""))
            q="bookid='"+bookid+"'";
        else{
            if(!name.equals(""))
                q="book_name like '%"+name+"%'";
            if(!author.equals(""))
                if(name.equals(""))
                    q="author like '%"+author+"%'";
                else
                    q+=" and author like '%"+author+"%'";
            
            if(!category.equals(""))
                if(author.equals(""))
                    q="category='"+category+"'";
                else
                    q+=" and category='"+category+"'";
        }
        String query="select * from books where "+q;
        try{
            rs=stmt.executeQuery(query);
        }
        catch(SQLException e){
            rs=null;
        }
        return rs;
    }
    
    public boolean removeBook(String bid,String cat){
        
        int ra1,ra2;
        try{
            ra1=stmt.executeUpdate("delete from books where bookid='"+bid+"'");
            ra2=stmt.executeUpdate("update categories set noofbooks=noofbooks-1 where catname='"+cat+"'");
        }
        catch (SQLException ex) {
            return false;
        }
        if(ra1==0||ra2==0)
            return false;
        else
            return true;
    }
    
    public String[] getCategories(){
        ResultSet rs=null;
        String cat[];
        int size=0;
        try{
            rs=stmt.executeQuery("select * from categories");
            while(rs.next())
                size++;
            cat=new String[size];
            rs=stmt.executeQuery("select * from categories");
            for(int i=0;rs.next();i++){
                cat[i]=rs.getString(1);
            }
        } catch (SQLException ex) {
            cat=null;                
        }
        return cat;
    }
    
    public ResultSet getRegularUsers(){
        ResultSet rs=null;
        try{
            String q="select * from users where isadmin='f'";
            rs=stmt.executeQuery(q);
        } catch (SQLException ex) {
            rs=null;
        }
        return rs;
    }
    
    public boolean grantAdmin(String loginid){
        
        String q="update users set isadmin='t' where loginid='"+loginid+"'";
        int n;
        try{
            n=stmt.executeUpdate(q);
        } catch (SQLException ex) {
            n=0;
        }
        if(n==0)
            return false;
        else 
            return true;
    }
    
    public ResultSet findBooksByCategory(String cat){
        String query="select * from books where category='"+cat+"';";
        ResultSet rs;
        try{
            rs=stmt.executeQuery(query);
        }
        catch(SQLException e){
            rs=null;
        }
        return rs;
    }
    
    public boolean rateBook(String bid,int rate){
        
        String q="select * from books where bookid='"+bid+"'";
        ResultSet rs=null;
        try{
            rs=stmt.executeQuery(q);
            rs.next();
            int noofratings=rs.getInt(7);
            float rating=rs.getFloat(6);
            float finrating=noofratings*rating+rate;
            noofratings++;
            finrating=finrating/noofratings;
            q="update books set noofratings="+noofratings+",rating="+finrating+" where bookid='"+bid+"'";
            int n=stmt.executeUpdate(q);
            if(n==1)
                return true;
            else 
                return false;
        }
        catch (SQLException ex) {
            return false;
        }
    }
    
    public boolean addCat(String cat){
        try{
            int n=stmt.executeUpdate("insert into categories values('"+cat+"')");
            if(n==1)
                return true;
            else
                return false;
        }
        catch (SQLException ex) {
            return false;
        }
            
    }
    public boolean removeCat(String cat){
        
        int ra1,ra2;
        try{
            ra2=stmt.executeUpdate("update books set category='other' where category='"+cat+"'");
            ra1=stmt.executeUpdate("delete from categories where catname='"+cat+"'");
            stmt.executeUpdate("update categories set noofbooks=noofbooks+"+ra2+" where catname='other'");
        }
        catch (SQLException ex) {
            return false;
        }
        if(ra1==0||ra2==0)
            return false;
        else
            return true;
    }
    
    public boolean renameCategory(String ocn,String ncn){
        
         try{
             ResultSet rs=stmt.executeQuery("select * from categories where catname='"+ocn+"'");
             rs.next();
             int noofbooks=rs.getInt(2);
             stmt.executeUpdate("insert into categories values('"+ncn+"',"+noofbooks+")");
             stmt.executeUpdate("update books set category='"+ncn+"' where category='"+ocn+"'");
             stmt.executeUpdate("delete from categories where catname='"+ocn+"'");
             return true;
         }
         catch (SQLException ex) {
            return false;
        }
    }
    
    public boolean changeCategory(String bid,String newcat){
        try{
            ResultSet rs=stmt.executeQuery("select * from books where bookid='"+bid+"'");
            rs.next();
            String oldcat=rs.getString(4);
            int n=stmt.executeUpdate("update books set category='"+newcat+"' where bookid='"+bid+"'");
            stmt.executeUpdate("update categories set noofbooks=noofbooks-1 where catname='"+oldcat+"'");
            stmt.executeUpdate("update categories set noofbooks=noofbooks+1 where catname='"+newcat+"'");            
            if(n==1)
                return true;
            else
                return false;
        }
        catch (SQLException ex) {
            return false;
        }
    }
    
    public boolean specialTicket(String t){
        try {
            stmt.executeUpdate(t);
            return true;
        } catch (SQLException ex) {
            System.out.println("error");
            return false;
        }        
    }
}