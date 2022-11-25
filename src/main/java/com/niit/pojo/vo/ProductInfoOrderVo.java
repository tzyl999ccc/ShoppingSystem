package com.niit.pojo.vo;

/**
 * @author 86166
 */
public class ProductInfoOrderVo {
    private String code;

    private Integer page=1;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    @Override
    public String toString() {
        return "ProductInfoOrderVo{" +
                "code='" + code + '\'' +
                ", page=" + page +
                '}';
    }
}
