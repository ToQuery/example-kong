package io.github.toquery.example.kong.upstream.app1.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/test")
public class TestRest {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpServletResponse response;

    @Value("${spring.application.name:example-kong-upstream-app-1}")
    private String appName;

    private Map<String, String> getRequestHeaders() {
        Map<String, String> headersMap = new HashMap<>();
        Enumeration<String> enumeration = request.getHeaderNames();
        while (enumeration.hasMoreElements()) {
            String name = enumeration.nextElement();
            headersMap.put(name, request.getHeader(name));
        }
        return headersMap;
    }

    private Map<String, Object> getRequests() {
        Map<String, Object> requestsMap = new HashMap<>();
        requestsMap.put("headers", this.getRequestHeaders());
        requestsMap.put("uri", request.getRequestURI());
        requestsMap.put("url", request.getRequestURL().toString());
        requestsMap.put("method", request.getMethod());
        return requestsMap;
    }

    private Map<String, Object> getHttpServlets(Map<String, Object> map) {
        if (map == null) {
            map = new HashMap<>();
        }
        map.put("requests", this.getRequests());
        Map<String, String> responseMap = response.getHeaderNames().stream().collect(Collectors.toMap(item -> item, item -> response.getHeader(item)));
        map.put("response.headers", responseMap);
        return map;
    }

    private Map<String, Object> getHttpServlets() {
        return this.getHttpServlets(null);
    }

    @GetMapping(value = {"/index"})
    public Map<String, Object> getIndex() {
        Map<String, Object> map = this.getHttpServlets();
        map.put("app.name", appName);
        return map;
    }


    @GetMapping(value = {"/acl-1"})
    public Map<String, Object> getAcl() {
        Map<String, Object> map = this.getHttpServlets();
        map.put("app.name", appName);
        return map;
    }
}
