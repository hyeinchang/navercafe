package com.itbank.navercafe.common;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

//@Component
//@Aspect
//@EnableAspectJAutoProxy
public class AOPConfig {
	
//	@Around("execution(* com.care.root.board.service.BoardServiceImpl.boardAllList(..))")
//	public void commonAop(ProceedingJoinPoint jp) {
//		System.out.println("보드리스트 실행전..");
//		try {
//			jp.proceed();
//		} catch (Throwable e) {
//			e.printStackTrace();
//		}
//		System.out.println("..보드리스트 실행후");
//	}
	
	/*@Before("execution(* com.care.root.board.controller.BoardController.writeForm())")
	public void testb4() {
		System.out.println("b4 test writeform");
	}*/
	
	@Before("execution(* com.itbank.navercafe..*(..))")
	public void test() {
		//System.out.println("b4 test writeform");
		//model.addAttribute("test", "안녕!!");
	}
	
//	@After
	
	Logger LOG = Logger.getGlobal();
	
	/*@Around("execution(* com.care.root.board.controller.*.*(..))")
	public Object aop02(ProceedingJoinPoint jp) {
		Object[] params = jp.getArgs();
		for( Object o : params) {
			LOG.log(Level.INFO, "동아온 파라미터 값 : " +o);
		}
		Object obj = null;
		try {
			obj = jp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		LOG.log(Level.INFO, "실행된 메소드 : " + obj);
		return obj;
	}*/
	

	@Around("execution(* com.itbank.navercafe.*.*.controller.*.*(..))")
	public Object aop02(ProceedingJoinPoint jp) {
		Object[] params = jp.getArgs();
		System.out.println("안녕~~~~~~~~~~~~");
		for( Object o : params) {
			LOG.log(Level.INFO, "동아온 파라미터 값 : " +o);
		}
		Object obj = null;
		try {
			obj = jp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		LOG.log(Level.INFO, "실행된 메소드 : " + obj);
		return obj;
	}
}
