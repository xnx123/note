package hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.SQLException;

/**
 * Created by Administrator on 2017/4/28.
 */
@Controller
@RequestMapping("/hello")
public class hello {

    @RequestMapping(method = RequestMethod.GET)
    public String helloWorld() throws SQLException {

        return "hello";
    }

}

