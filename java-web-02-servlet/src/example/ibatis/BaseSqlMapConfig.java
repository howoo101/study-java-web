package example.ibatis;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;


public class BaseSqlMapConfig {
	private static final SqlMapClient sqlMapClient;
	
	static {
		System.out.println("BASESqlMapConfig 설정 시작");
		try {
			String resource = "./config/ibatis/sql-map-config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapClient = SqlMapClientBuilder.buildSqlMapClient(reader);
			System.out.println("SQL_MAP_CONFIG" + sqlMapClient);
		}catch (Exception e) {	
			e.printStackTrace();
			throw new RuntimeException("ibatis config error");
		}
	}
	
	public static SqlMapClient getInstance() {
		return sqlMapClient;
	}
}
