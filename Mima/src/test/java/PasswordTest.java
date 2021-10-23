import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class PasswordTest {

   @Test
   public void test() {
      BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
      String result = encoder.encode("123");
      String result2 = encoder.encode("123");
      String result3 = encoder.encode("123");
      String result4 = encoder.encode("123");
      String result5 = encoder.encode("123");
      String result6 = encoder.encode("123");
      String result7 = encoder.encode("123");
      String result8 = encoder.encode("123");
      String result9 = encoder.encode("123");
      String result1 = encoder.encode("123");
      
      assertTrue(encoder.matches("123", result));
      
      log.info(result);
      log.info(result2);
      log.info(result3);
      log.info(result4);
      log.info(result5);
      log.info(result6);
      log.info(result7);
      log.info(result8);
      log.info(result9);
      log.info(result1);
   }
}