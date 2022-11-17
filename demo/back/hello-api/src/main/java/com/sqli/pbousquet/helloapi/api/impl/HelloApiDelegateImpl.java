package com.sqli.pbousquet.helloapi.api.impl;

import com.sqli.pbousquet.helloapi.generated.api.model.HelloDto;
import com.sqli.pbousquet.helloapi.generated.api.server.HelloApiDelegate;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;

@Component
@CrossOrigin(origins = "*")
public class HelloApiDelegateImpl implements HelloApiDelegate {

    @Override
    public ResponseEntity<HelloDto> helloUsingGET1() {
        HelloDto result = new HelloDto();
        result.setMessage("Hello World");
        return ResponseEntity.ok(result);
    }

    @Override
    public ResponseEntity<HelloDto> helloUsingGET(String name) {
        HelloDto result = new HelloDto();
        result.setMessage("Hello "+name);
        return ResponseEntity.ok(result);
    }
}
