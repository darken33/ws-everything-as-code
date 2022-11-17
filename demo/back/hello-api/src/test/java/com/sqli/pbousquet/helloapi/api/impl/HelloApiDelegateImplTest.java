package com.sqli.pbousquet.helloapi.api.impl;

import com.sqli.pbousquet.helloapi.generated.api.model.HelloDto;
import com.sqli.pbousquet.helloapi.generated.api.server.HelloApiDelegate;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class HelloApiDelegateImplTest {

    private final HelloApiDelegate helloApi = new HelloApiDelegateImpl();

    @Test
    public void getHello_must_return_Hello_World() {
        ResponseEntity<HelloDto> result = helloApi.helloUsingGET1();
        Assert.assertTrue(HttpStatus.OK.equals(result.getStatusCode()));
        Assert.assertTrue("Hello World".equals(result.getBody().getMessage()));
    }

    @Test
    public void getHello_Philippe_must_return_Hello_Philippe() {
        ResponseEntity<HelloDto> result = helloApi.helloUsingGET("Philippe");
        Assert.assertTrue(HttpStatus.OK.equals(result.getStatusCode()));
        Assert.assertTrue("Hello Philippe".equals(result.getBody().getMessage()));
    }
}
