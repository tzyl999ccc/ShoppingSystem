package com.niit.pojo.vo;

/**
 * @author 86166
 */
public class ProductTypeVo {
    private Integer typeid;
    private String typename;

    private Integer page=1;

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    @Override
    public String toString() {
        return "ProductTypeVo{" +
                "typename='" + typename + '\'' +
                ", typeid=" + typeid +
                ", page=" + page +
                '}';
    }
}
