package com.auefly.util;

import org.commonmark.Extension;
import org.commonmark.ext.heading.anchor.HeadingAnchorExtension;
import org.commonmark.node.Node;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class MarkdownFraser {
    public static String fraser(String mdString){
        List<Extension> extensions = List.of(HeadingAnchorExtension.create());
        Parser parser = Parser.builder().build();
        Node document = parser.parse(mdString);
        HtmlRenderer renderer = HtmlRenderer.builder().extensions(extensions).build();
        return renderer.render(document);
    }
}