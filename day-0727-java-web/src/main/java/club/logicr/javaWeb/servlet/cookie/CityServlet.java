package club.logicr.javaWeb.servlet.cookie;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Jan on 2018/7/29.
 * @version 1.0
 */
public class CityServlet extends HttpServlet {
    /*
   装省 和市 的list
    */
    private Map<String, List<String>> proCity = new HashMap<>();
    /*
    市 和 区
     */
    private Map<String, List<String>> cityDist = new HashMap<>();

    /**
     * 初始化操作，正常开发时，里面应该是重数据库取数据的
     * @throws ServletException
     */
    @Override
    public void init() throws ServletException {
        super.init();
        List<String> citys = new ArrayList<>();
        citys.add("西安");
        citys.add("宝鸡");
        citys.add("咸阳");
        proCity.put("陕西", citys);

        List<String> xianDist = new ArrayList<>();
        xianDist.add("雁塔区");
        xianDist.add("临潼区");
        xianDist.add("长安区");
        cityDist.put("西安", xianDist);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String pro = req.getParameter("pro");
        String pro = null;
        String city = req.getParameter("city");
        Cookie [] cookies = req.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("pro")) {
                pro = cookie.getName();
                break;
            }
        }
        if (pro != null && city != null){
            List<String> dist = cityDist.get(city);
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = resp.getWriter();
            writer.append("<!DOCTYPE html>\n" +
                    "<html lang=\"en\">\n" +
                    "<head>\n" +
                    "    <meta charset=\"UTF-8\">\n" +
                    "    <title>区</title>\n" +
                    " <style type=\"text/css\">\n" +
                            "        table,th,td\n" +
                            "        {\n" +
                            "            border:1px solid navajowhite;\n" +
                            "        }\n" +
                            "    </style>"+
                    "</head>\n" +
                    "<body>\n" +
                    "<table>\n" +
                    "    <thead>\n" +
                    "    <tr>\n" +
                    "        <td>编号</td>\n" +
                    "        <td>区</td>\n" +
                    "    </tr>\n" +
                    "    </thead>\n" +
                    "    <tbody>");
            int id = 1;
            for (String d : dist) {
                writer.append("<tr>")
                        .append("<td>").append(String.valueOf(id)).append("</td>")
                        .append("<td>")
                        .append(d)
                        .append("</td>")
                        .append("</tr>");
                id = id + 1;
            }
            writer.append("    </tbody>\n" +
                    "</table>\n" +
                    "</body>\n" +
                    "</html>");
        }else {
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = resp.getWriter();
            writer.append("No data");
        }

    }


}
