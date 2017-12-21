package hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/28.
 */
@Controller

public class Get {
    @RequestMapping(value = "/get",method = RequestMethod.POST)
    public @ResponseBody
    String helloWorld() throws Exception {
        return "a".toString();
    }

}

