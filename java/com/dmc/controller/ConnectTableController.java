package com.dmc.controller;

import lombok.extern.slf4j.Slf4j;import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;

@RestController
@RequestMapping("/general")
@Slf4j
public class ConnectTableController {
    @RequestMapping(value="/{table}")
    public Object ret(@PathVariable("table") String table, @RequestParam(value = "page", required=false,defaultValue="0") Integer page, @RequestParam(value = "size",required=false,defaultValue="1000000") Integer size) throws UnsupportedEncodingException, SQLException, ClassNotFoundException, JSONException {
        Object result = retSearch("dmc",table,page,size);
        return result;
    }


    public static Object retSearch(String database,String table,int page,int size) throws UnsupportedEncodingException, SQLException, ClassNotFoundException, JSONException {
        int start = page * 20;
        StringBuilder sb = new StringBuilder();
        sb.append("select * from " + database + "." + table);
        sb.append(" limit " + start + "," + size);
        String sql = sb.toString();
        return execSql(database,sql);
    }

    public static JSONArray execSql(String database, String sql) throws ClassNotFoundException, SQLException, JSONException, UnsupportedEncodingException {

        Class.forName("com.mysql.jdbc.Driver");
//		DriverManager.registerDrive("")
        String url = "jdbc:mysql://localhost:3306/" + database;
        String user = "root";
        String password = "123456";
        Connection connection = DriverManager.getConnection(url,user,password);
        Statement st = connection.createStatement();
        ResultSet result = st.executeQuery(sql);
        JSONArray ret = retJson(result);
        result.close();
        st.close();
        connection.close();
        return ret;
    }

    public static JSONArray retJson(ResultSet resultSet) throws SQLException,JSONException, UnsupportedEncodingException {
        //json数组
        JSONArray result = new JSONArray();
        //获取列数
        ResultSetMetaData metaData = resultSet.getMetaData();
        int columnCount = metaData.getColumnCount();
        //遍历ResultSet中的每条数据
        while(resultSet.next()) {
            JSONObject item = new JSONObject();
            for (int i = 1;i <= columnCount; i++ ) {
                String value = null;
                String columnName = metaData.getColumnLabel(i);
                if (resultSet.getString(columnName) != null && !resultSet.getString(columnName).contentEquals("")) {
                    value = new String(resultSet.getBytes(columnName),"UTF-8");
                } else {
                    value = "";//列的值，为空，直接取出去
                }
                item.put(columnName, value);
            }
            result.add(item);
        }
        return result;
    }
}
