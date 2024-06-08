/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Blog {

    String id, staff, title, categoryBlog, image, updateDate, description, content, isDelete,status;

    public Blog() {
    }

    public Blog(String staff, String title, String categoryBlog, String image, String description, String content, String isDelete, String status) {
        this.staff = staff;
        this.title = title;
        this.categoryBlog = categoryBlog;
        this.image = image;
        this.description = description;
        this.content = content;
        this.isDelete = isDelete;
        this.status = status;
    }
    

    public Blog(String id, String title, String categoryBlog, String image, String description, String content, String status) {
        this.id = id;
        this.title = title;
        this.categoryBlog = categoryBlog;
        this.image = image;
        this.description = description;
        this.content = content;
        this.status = status;
    }

    public Blog(String id, String staff, String title, String categoryBlog, String image, String updateDate, String description, String content, String isDelete, String status) {
        this.id = id;
        this.staff = staff;
        this.title = title;
        this.categoryBlog = categoryBlog;
        this.image = image;
        this.updateDate = updateDate;
        this.description = description;
        this.content = content;
        this.isDelete = isDelete;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    public Blog(String id, String staff, String title, String categoryBlog, String image, String updateDate, String description, String content, String isDelete) {
        this.id = id;
        this.staff = staff;
        this.title = title;
        this.categoryBlog = categoryBlog;
        this.image = image;
        this.updateDate = updateDate;
        this.description = description;
        this.content = content;
        this.isDelete = isDelete;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategoryBlog() {
        return categoryBlog;
    }

    public void setCategoryBlog(String categoryBlog) {
        this.categoryBlog = categoryBlog;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

}
