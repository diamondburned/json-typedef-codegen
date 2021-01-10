package com.example;


import com.fasterxml.jackson.annotation.JsonCreator;

import com.fasterxml.jackson.annotation.JsonValue;

import java.time.OffsetDateTime;

/**

 */

public class Root {
    @JsonValue
    private OffsetDateTime value;

    public Root() {
    }

    @JsonCreator
    public Root(OffsetDateTime value) {
        this.value = value;
    }

    public OffsetDateTime getValue() {
        return value;
    }

    public void setValue(OffsetDateTime value) {
        this.value = value;
    }
}