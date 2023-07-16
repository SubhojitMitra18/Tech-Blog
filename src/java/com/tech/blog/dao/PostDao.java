/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.Catagory;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author dell
 */
public class PostDao {
    
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Catagory> getAllCatagories()
    {
        ArrayList<Catagory> list=new ArrayList<>();
        
        try {
            String q="select * from catagories";
            Statement st=con.createStatement();
            ResultSet set=st.executeQuery(q);
            while(set.next())
            {
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Catagory c=new Catagory(cid,name,description);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return list;
    }
    
    public boolean savePost(Post p)
        {
            boolean f=false;
            try {
                String q="insert into post(pTitle,pContent,pCode,pPic,cat_id,userid) values(?,?,?,?,?,?)";
                PreparedStatement pstmt=con.prepareStatement(q);
                pstmt.setString(1, p.getpTitle());
                pstmt.setString(2,p.getpContent());
                pstmt.setString(3, p.getpCode());
                pstmt.setString(4,p.getpPic());
                pstmt.setInt(5,p.getCat_id());
                pstmt.setInt(6,p.getUserId());
                
                pstmt.executeUpdate();
                
                f=true;
            } catch (Exception e) {
            e.printStackTrace();
            }
            return f;
        }
    
    public List<Post> getsAllPosts()
    {
        List<Post> list=new ArrayList<>();
        
        try {
            PreparedStatement p=con.prepareStatement("select * from post order by pid desc");
            ResultSet set=p.executeQuery();
            while(set.next())
            {
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pCode=set.getString("pCode");
                String pContent=set.getString("pContent");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int userId=set.getInt("userid");
                int catId=set.getInt("cat_id");
                
                Post post=new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
            
        } catch (Exception e) {
        
        e.printStackTrace();
        }
        
        return list;
    }
    
    public List<Post> getPostbyCatID(int catId)
    {
        List<Post> list=new ArrayList<>();
       try {
            PreparedStatement p=con.prepareStatement("select * from post where cat_id=?");
            
            p.setInt(1, catId);
            ResultSet set=p.executeQuery();
            while(set.next())
            {
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pCode=set.getString("pCode");
                String pContent=set.getString("pContent");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int userId=set.getInt("userid");
                
                Post post=new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
            
        } catch (Exception e) {
        
        e.printStackTrace();
        }
        
        return list;
    }
    
    public Post getPostByPostId(int postId)
    {
        Post post=null;
        String q="select * from post where pid=?";
        try {
        PreparedStatement p=this.con.prepareStatement(q);
        p.setInt(1, postId);    
        ResultSet set=p.executeQuery();
        if(set.next())
        {
            int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pCode=set.getString("pCode");
                String pContent=set.getString("pContent");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int userId=set.getInt("userid");
                int cid=set.getInt("cat_id");
                post=new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
        
        
        } 
    }
        catch (Exception e) {
        e.printStackTrace();
        }
    return post;
    }
}
