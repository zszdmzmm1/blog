package com.auefly.pojo;

import lombok.Data;

import java.util.List;

@Data
public class Page<T> {
    private List<T> t;
    private int page;
    private int count;
    private int totalPage;
}
