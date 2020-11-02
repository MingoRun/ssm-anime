package cn.edu.hstc.core.common;

import java.io.Serializable;

/**
 * @author mingoxu
 * @ClassName: Result
 * @Description:全局返回值
 * @date 2020-10-26
 */
public class Result implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private Integer statusCode; //响应状态码 200：成功；0：失败
    private String message;    //响应提示语
    private Object data;       //响应数据

    public Result() {
    }

    public Result(Integer statusCode, String message, Object data) {
        this.statusCode = statusCode;
        this.message = message;
        this.data = data;
    }

    public Result(Object data) {
        this.statusCode = 200;
        this.message = "OK";
        this.data = data;
    }

    public static Result build(Integer statusCode, String message, Object data) {
        return new Result(statusCode, message, data);
    }

    public static Result build(Integer statusCode, String message) {
        return new Result(statusCode, message, null);
    }

    public static Result ok(Object data) {
        return new Result(data);
    }

    public static Result ok() {
        return new Result(null);
    }

    public static Result error(String message, Object data) {
        return new Result(0, message, data);
    }

    public static Result error() {
        return new Result(0, "ERROR", null);
    }

    public Integer getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(Integer statusCode) {
        this.statusCode = statusCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Result{" +
                "statusCode=" + statusCode +
                ", message='" + message + '\'' +
                ", data=" + data +
                '}';
    }
}
