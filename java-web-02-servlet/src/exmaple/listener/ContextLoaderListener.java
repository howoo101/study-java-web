package exmaple.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextLoaderListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
	System.out.println("contextInitialized 서버 종료 시 호출");
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("contextInitialized 서버 실행 시 호출");
		
	}
	
}
