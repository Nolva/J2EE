package com.test.dao;

import com.test.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ProductDao {
    private JdbcTemplate jdbcTemplate;

    private static final String INSERT = "INSERT INTO Product(productId,productName,productModel," +
            "productNum,productPrice,productCategory,productContract)VALUES(?,?,?,?,?,?,?)";
    private static final String DELETE = "DELETE FROM Product WHERE productId = ?";
    private static final String UPDATE = "UPDATE Product SET productName=?,productModel=?,productNum=?," +
            "productPrice=?, productCategory=? WHERE productId=?";
    private static final String GET = "SELECT * FROM Product WHERE productId = ?";
    private static final String SELECT ="SELECT * FROM Product ORDER BY productId";
    private static final String SELECT_BY_NAME = "SELECT * FROM product WHERE productCategory=?";
    private static final String SELECT_BY_PAGE ="SELECT * FROM Product ORDER BY productId LIMIT ?,?";
    private static final String SELECT_BY_PAGE_AND_NAME = "SELECT * FROM Product WHERE productCategory=? ORDER BY productId LIMIT ?,?";
    private static final String EXIST_PRODUCT = "SELECT COUNT(*) FROM Product WHERE productId=?";
    private static final String PRODUCT_SPECIES = "SELECT COUNT(*) FROM Product";
    private static final String PRODUCT_SPECIES_BY_NAME = "SELECT COUNT(*) FROM Product WHERE productCategory=?";
    private static final String EXIST_PRODUCT_NAME = "SELECT COUNT(*) FROM Product WHERE productName=?";
    private static final String EXIST_PRODUCT_MODEL = "SELECT COUNT(*) FROM Product WHERE productModel=? AND " +
            "productModel!= (SELECT productModel FROM Product WHERE productId=?)";
    private static final String UPDATE_CONTRACT = "UPDATE Product SET productContract=? WHERE productId=?";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    //增加产品
    public int addProduct(Product product){ return jdbcTemplate.update(INSERT, new Object[]{product.getProductId(),
            product.getProductName(),product.getProductModel(),product.getProductNum(),product.getProductPrice(),
            product.getProductCategory(),""}); }

    //删除产品
    public int deleteProduct(String productId){ return jdbcTemplate.update(DELETE, new Object[]{productId});}

    //修改产品
    public void updateProduct(Product product){
        int count = jdbcTemplate.update(UPDATE, new Object[]{product.getProductName(),
            product.getProductModel(),product.getProductNum(),
                product.getProductPrice(),product.getProductCategory(),product.getProductId()});
//        if(count > 0){
//            System.out.println("更新成功!");
//        }
    }

    //查询单个产品的信息
    public List<Product> getProductById(Integer productId){
        return jdbcTemplate.query(GET, new Object[]{productId}, new RowMapper<Product>() {
            @Override
            public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
                Product product = new Product();
                product.setProductId(rs.getString("ProductId"));
                product.setProductName(rs.getString("productName"));
                product.setProductModel(rs.getString("ProductModel"));
                product.setProductNum(rs.getInt("ProductNum"));
                product.setProductPrice(rs.getDouble("ProductPrice"));
                return product;
            }
        });
    }

    //查询所有产品的集合--确定页数
    public List<Product> ListProduct(){
        RowMapper<Product> rowMapper = new BeanPropertyRowMapper<>(Product.class);
        List<Product> products = jdbcTemplate.query(SELECT, rowMapper);
        return products;
    }

    public List<Product> ListProductByName(String category){
        RowMapper<Product> rowMapper = new BeanPropertyRowMapper<>(Product.class);
        return jdbcTemplate.query(SELECT_BY_NAME, new Object[]{category}, rowMapper);
    }

    public List<Product> ListProductByPageAndName(String category, int startIndex, int pageSize){
        return jdbcTemplate.query(SELECT_BY_PAGE_AND_NAME,new Object[]{category,startIndex,pageSize},new BeanPropertyRowMapper<>(Product.class));

    }

    //当前页的集合
    public List<Product> ListProductByPage(int startIndex, int pageSize){
        return jdbcTemplate.query(SELECT_BY_PAGE,new Object[]{startIndex,pageSize},new BeanPropertyRowMapper<>(Product.class));
    }

    //是否已存在productId
    public int ExistProductId(String productId){
        return jdbcTemplate.queryForObject(EXIST_PRODUCT,new Object[] {productId},Integer.class);
    }
    //查询产品种类的数量
    public int ProductSpecies(){
        return jdbcTemplate.queryForObject(PRODUCT_SPECIES,Integer.class);
    }

    public int ProductSpeciesByName(String category){
        return jdbcTemplate.queryForObject(PRODUCT_SPECIES_BY_NAME,new Object[]{category}, Integer.class);
    }

    //批量操作(增删改)
    public int[] batchUpdate(final List products) {

        int[] updateCounts = jdbcTemplate.batchUpdate(
                "UPDATE Product SET productName=?,productModel=?,productNum=?,productPrice=? WHERE productId=?",
                new BatchPreparedStatementSetter() {

                    @Override
                    public void setValues(PreparedStatement ps, int i) throws SQLException {
                        ps.setString(1, ((Product)products.get(i)).getProductName());
                        ps.setString(2, ((Product)products.get(i)).getProductModel());
                        ps.setInt(3, ((Product)products.get(i)).getProductNum());
                        ps.setDouble(4, ((Product)products.get(i)).getProductPrice());
                        ps.setString(5, ((Product)products.get(i)).getProductId());
                    }
                    @Override
                    public int getBatchSize() {
                        return products.size();
                    }
                }
        );
        return updateCounts;
    }

    //判断产品名是否存在
    public int searchProductName(String productName){
        return jdbcTemplate.queryForObject(EXIST_PRODUCT_NAME,new Object[] {productName},Integer.class);

    }

    //判断产品型号是否存在
    public int searchProductModel(String productModel, String productId){
        return jdbcTemplate.queryForObject(EXIST_PRODUCT_MODEL,new Object[] {productModel, productId},Integer.class);

    }

    //修改产品涉及合同内容
    public void updateContract(String contract, String productId){
        jdbcTemplate.update(UPDATE_CONTRACT, new Object[]{contract, productId});
    }

}
