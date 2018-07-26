package com.cqtiq.utils;

import org.springframework.http.ResponseEntity;


public class CQResult<T> {

    // 响应业务状态
    private Integer status;

    // 响应消息
    private String msg;

    // 响应中的数据
    private T data;

    public static CQResult build(Integer status, String msg, Object data) {
        return new CQResult(status, msg, data);
    }

    public static CQResult ok(Object data) {
        return new CQResult(data);
    }

    public static CQResult ok() {
        return new CQResult(null);
    }

    public CQResult() {

    }

    public static CQResult build(Integer status, String msg) {
        return new CQResult(status, msg, null);
    }

    public CQResult(Integer status, String msg, T data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public CQResult(T data) {
        this.status = 200;
        this.msg = "OK";
        this.data = data;
    }

//    public Boolean isOK() {
//        return this.status == 200;
//    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
