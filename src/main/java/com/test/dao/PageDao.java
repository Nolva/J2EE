package com.test.dao;

import com.test.Page.Page;

public interface PageDao {
    public int getTotalRecord(String sql, Object... arrayParameters);
    public Page getPage(int pageNum, Class clazz, String sql, int totalRecord, Object... parameters);
}
