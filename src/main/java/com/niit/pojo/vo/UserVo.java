package com.niit.pojo.vo;

/**
 * @author 86166
 */
public class UserVo {
    private String username;
    private String realname;
    private String sex;
    private Integer page=1;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    @Override
    public String toString() {
        return "UserVo{" +
                "username='" + username + '\'' +
                ", realname='" + realname + '\'' +
                ", sex='" + sex + '\'' +
                ", page=" + page +
                '}';
    }
}
