package com.base;

import junit.framework.Test;
import junit.framework.TestResult;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "/ApplicationContext.xml" })
public abstract class BasicTest implements Test {
	@Override
	public int countTestCases() {
		return 0;
	}

	@Override
	public void run(TestResult arg0) {
	}
}
