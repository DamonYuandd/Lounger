<?php
class CategoryTplModel extends Model {
	
	protected $connection = "mysql://C('DB_USER'):C('DB_PWD')@C('DB_HOST'):3306/C('DB_NAME')";
	
	protected $dbName = "C('DB_NAME')";
	
	protected $tableName = 'ccategory';
}