package com.yujigyeongseong.api;

import com.yujigyeongseong.api.domain.work_lounge.dao.BoardMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class ApiApplicationTests {


	@Autowired
	private BoardMapper boardMapper;

	@Test
	void contextLoads() {
/*		log.info("result= {} ",boardMapper.selectBoardId(1));
		Assertions.assertNotNull(boardMapper.selectBoardId(1));*/
	}

}
