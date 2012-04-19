
package beans;

public class Books {
    
    String bookid;
    String bookname;
    String author;
    String category;
    String uploaderid;
    float rating;
    int noofratings;
    String keywords;
    
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBookid() {
        return bookid;
    }

    public void setBookid(String bookid) {
        this.bookid = bookid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public int getNoofratings() {
        return noofratings;
    }

    public void setNoofratings(int noofratings) {
        this.noofratings = noofratings;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getUploaderid() {
        return uploaderid;
    }

    public void setUploaderid(String uploaderid) {
        this.uploaderid = uploaderid;
    }
    
    public String addBook(String name,String author,String cate,String keywords,String id,DAO.Dao d){
        return d.addBook(name, author, cate, keywords, id);
    }
    
    public boolean removeBook(String bid,String cat,DAO.Dao d){       
        return d.removeBook(bid, cat);       
    }    
    
    
}
