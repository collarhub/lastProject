package com.book.service;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
 
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.book.vo.BookVO;
 
public class NaverBookService {
    private static String clientID = "wla82tmYgxtmxGQuvyrO"; //api ��� ��û�� �����Ǵ� ���̵�
    private static String clientSecret = "ZTMk48WHjf"; //�н�����
    
    public List<BookVO> searchBookbyTitle(String keyword, int display, int start) {
        URL url;
        List<BookVO> list = null;
        try {
            url = new URL("https://openapi.naver.com/v1/search/book_adv.xml?d_titl=" + URLEncoder.encode(keyword, "UTF-8")
                    + (display != 0 ? "&display=" + display : "") + (start != 0 ? "&start=" + start : ""));
            URLConnection urlConn;
 
            //url ����
            urlConn = url.openConnection();
            urlConn.setRequestProperty("X-naver-Client-Id", clientID);
            urlConn.setRequestProperty("X-naver-Client-Secret", clientSecret);
 
            //�Ľ� - ���丮 ����� ���丮�� �ļ� ���� (Ǯ �ļ� ���)
            XmlPullParserFactory factory; 
 
            factory = XmlPullParserFactory.newInstance();
            XmlPullParser parser = factory.newPullParser();
            parser.setInput((new InputStreamReader(urlConn.getInputStream(), "UTF-8")));
 
            
            int eventType = parser.getEventType();
            BookVO b = null;
            while (eventType != XmlPullParser.END_DOCUMENT) {
                switch (eventType) {
                case XmlPullParser.END_DOCUMENT: // ������ ��
                    break;
                case XmlPullParser.START_DOCUMENT:
                    list = new ArrayList<BookVO>();
                    break;
                case XmlPullParser.START_TAG: {
                    String tag = parser.getName();
                    switch (tag) {
                    case "item":
                        b = new BookVO();
                        break;
                    case "title":
                        if (b != null)
                            b.setTitle(parser.nextText());
                        break;
                    case "link":
                        if (b != null)
                            b.setLink(parser.nextText());
                        break;
                    case "image":
                        if (b != null)
                            b.setImage(parser.nextText());
                        break;
                    case "author":
                        if (b != null)
                            b.setAuthor(parser.nextText());
                        break;
                    case "discount":
                        if (b != null)
                            b.setDiscount(parser.nextText());
                        break;
                    case "publisher":
                        if (b != null)
                            b.setPublisher(parser.nextText());
                        break;
                    case "pubdate":
                        if (b != null)
                            b.setPubdate(parser.nextText());
                        break;
                    case "isbn":
                        if (b != null)
                            b.setIsbn(parser.nextText());
                        break;
                    case "description":
                        if (b != null)
                            b.setDescription(parser.nextText());
                        break;
                    }
                    break;
                }
 
                case XmlPullParser.END_TAG: {
                    String tag = parser.getName();
                    if (tag.equals("item")) {
                        list.add(b);
                        b = null;
                    }
 
                }
 
                }
                eventType = parser.next();
            }
 
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (XmlPullParserException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookVO> searchBookbyAuthor(String keyword, int display, int start) {
        URL url;
        List<BookVO> list = null;
        try {
            url = new URL("https://openapi.naver.com/v1/search/book_adv.xml?d_auth=" + URLEncoder.encode(keyword, "UTF-8")
                    + (display != 0 ? "&display=" + display : "") + (start != 0 ? "&start=" + start : ""));
            URLConnection urlConn;
 
            //url ����
            urlConn = url.openConnection();
            urlConn.setRequestProperty("X-naver-Client-Id", clientID);
            urlConn.setRequestProperty("X-naver-Client-Secret", clientSecret);
 
            //�Ľ� - ���丮 ����� ���丮�� �ļ� ���� (Ǯ �ļ� ���)
            XmlPullParserFactory factory; 
 
            factory = XmlPullParserFactory.newInstance();
            XmlPullParser parser = factory.newPullParser();
            parser.setInput((new InputStreamReader(urlConn.getInputStream(), "UTF-8")));
 
            
            int eventType = parser.getEventType();
            BookVO b = null;
            while (eventType != XmlPullParser.END_DOCUMENT) {
                switch (eventType) {
                case XmlPullParser.END_DOCUMENT: // ������ ��
                    break;
                case XmlPullParser.START_DOCUMENT:
                    list = new ArrayList<BookVO>();
                    break;
                case XmlPullParser.START_TAG: {
                    String tag = parser.getName();
                    switch (tag) {
                    case "item":
                        b = new BookVO();
                        break;
                    case "title":
                        if (b != null)
                            b.setTitle(parser.nextText());
                        break;
                    case "link":
                        if (b != null)
                            b.setLink(parser.nextText());
                        break;
                    case "image":
                        if (b != null)
                            b.setImage(parser.nextText());
                        break;
                    case "author":
                        if (b != null)
                            b.setAuthor(parser.nextText());
                        break;
                    case "discount":
                        if (b != null)
                            b.setDiscount(parser.nextText());
                        break;
                    case "publisher":
                        if (b != null)
                            b.setPublisher(parser.nextText());
                        break;
                    case "pubdate":
                        if (b != null)
                            b.setPubdate(parser.nextText());
                        break;
                    case "isbn":
                        if (b != null)
                            b.setIsbn(parser.nextText());
                        break;
                    case "description":
                        if (b != null)
                            b.setDescription(parser.nextText());
                        break;
                    }
                    break;
                }
 
                case XmlPullParser.END_TAG: {
                    String tag = parser.getName();
                    if (tag.equals("item")) {
                        list.add(b);
                        b = null;
                    }
 
                }
 
                }
                eventType = parser.next();
            }
 
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (XmlPullParserException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookVO> searchBookbyPublisher(String keyword, int display, int start) {
        URL url;
        List<BookVO> list = null;
        try {
            url = new URL("https://openapi.naver.com/v1/search/book_adv.xml?d_publ=" + URLEncoder.encode(keyword, "UTF-8")
                    + (display != 0 ? "&display=" + display : "") + (start != 0 ? "&start=" + start : ""));
            URLConnection urlConn;
 
            //url ����
            urlConn = url.openConnection();
            urlConn.setRequestProperty("X-naver-Client-Id", clientID);
            urlConn.setRequestProperty("X-naver-Client-Secret", clientSecret);
 
            //�Ľ� - ���丮 ����� ���丮�� �ļ� ���� (Ǯ �ļ� ���)
            XmlPullParserFactory factory; 
 
            factory = XmlPullParserFactory.newInstance();
            XmlPullParser parser = factory.newPullParser();
            parser.setInput((new InputStreamReader(urlConn.getInputStream(), "UTF-8")));
 
            
            int eventType = parser.getEventType();
            BookVO b = null;
            while (eventType != XmlPullParser.END_DOCUMENT) {
                switch (eventType) {
                case XmlPullParser.END_DOCUMENT: // ������ ��
                    break;
                case XmlPullParser.START_DOCUMENT:
                    list = new ArrayList<BookVO>();
                    break;
                case XmlPullParser.START_TAG: {
                    String tag = parser.getName();
                    switch (tag) {
                    case "item":
                        b = new BookVO();
                        break;
                    case "title":
                        if (b != null)
                            b.setTitle(parser.nextText());
                        break;
                    case "link":
                        if (b != null)
                            b.setLink(parser.nextText());
                        break;
                    case "image":
                        if (b != null)
                            b.setImage(parser.nextText());
                        break;
                    case "author":
                        if (b != null)
                            b.setAuthor(parser.nextText());
                        break;
                    case "discount":
                        if (b != null)
                            b.setDiscount(parser.nextText());
                        break;
                    case "publisher":
                        if (b != null)
                            b.setPublisher(parser.nextText());
                        break;
                    case "pubdate":
                        if (b != null)
                            b.setPubdate(parser.nextText());
                        break;
                    case "isbn":
                        if (b != null)
                            b.setIsbn(parser.nextText());
                        break;
                    case "description":
                        if (b != null)
                            b.setDescription(parser.nextText());
                        break;
                    }
                    break;
                }
 
                case XmlPullParser.END_TAG: {
                    String tag = parser.getName();
                    if (tag.equals("item")) {
                        list.add(b);
                        b = null;
                    }
 
                }
 
                }
                eventType = parser.next();
            }
 
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (XmlPullParserException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookVO> searchBookbyIsbn(String keyword, int display, int start) {
        URL url;
        List<BookVO> list = null;
        try {
            url = new URL("https://openapi.naver.com/v1/search/book_adv.xml?d_isbn=" + URLEncoder.encode(keyword, "UTF-8")
                    + (display != 0 ? "&display=" + display : "") + (start != 0 ? "&start=" + start : ""));
            URLConnection urlConn;
 
            //url ����
            urlConn = url.openConnection();
            urlConn.setRequestProperty("X-naver-Client-Id", clientID);
            urlConn.setRequestProperty("X-naver-Client-Secret", clientSecret);
 
            //�Ľ� - ���丮 ����� ���丮�� �ļ� ���� (Ǯ �ļ� ���)
            XmlPullParserFactory factory; 
 
            factory = XmlPullParserFactory.newInstance();
            XmlPullParser parser = factory.newPullParser();
            parser.setInput((new InputStreamReader(urlConn.getInputStream(), "UTF-8")));
 
            
            int eventType = parser.getEventType();
            BookVO b = null;
            while (eventType != XmlPullParser.END_DOCUMENT) {
                switch (eventType) {
                case XmlPullParser.END_DOCUMENT: // ������ ��
                    break;
                case XmlPullParser.START_DOCUMENT:
                    list = new ArrayList<BookVO>();
                    break;
                case XmlPullParser.START_TAG: {
                    String tag = parser.getName();
                    switch (tag) {
                    case "item":
                        b = new BookVO();
                        break;
                    case "title":
                        if (b != null)
                            b.setTitle(parser.nextText());
                        break;
                    case "link":
                        if (b != null)
                            b.setLink(parser.nextText());
                        break;
                    case "image":
                        if (b != null)
                            b.setImage(parser.nextText());
                        break;
                    case "author":
                        if (b != null)
                            b.setAuthor(parser.nextText());
                        break;
                    case "discount":
                        if (b != null)
                            b.setDiscount(parser.nextText());
                        break;
                    case "publisher":
                        if (b != null)
                            b.setPublisher(parser.nextText());
                        break;
                    case "pubdate":
                        if (b != null)
                            b.setPubdate(parser.nextText());
                        break;
                    case "isbn":
                        if (b != null)
                            b.setIsbn(parser.nextText());
                        break;
                    case "description":
                        if (b != null)
                            b.setDescription(parser.nextText());
                        break;
                    }
                    break;
                }
 
                case XmlPullParser.END_TAG: {
                    String tag = parser.getName();
                    if (tag.equals("item")) {
                        list.add(b);
                        b = null;
                    }
 
                }
 
                }
                eventType = parser.next();
            }
 
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (XmlPullParserException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
    
    
    public List<BookVO> searchBookbyContent(String keyword, int display, int start) {
        URL url;
        List<BookVO> list = null;
        try {
            url = new URL("https://openapi.naver.com/v1/search/book_adv.xml?d_cont=" + URLEncoder.encode(keyword, "UTF-8")
                    + (display != 0 ? "&display=" + display : "") + (start != 0 ? "&start=" + start : ""));
            URLConnection urlConn;
 
            //url ����
            urlConn = url.openConnection();
            urlConn.setRequestProperty("X-naver-Client-Id", clientID);
            urlConn.setRequestProperty("X-naver-Client-Secret", clientSecret);
 
            //�Ľ� - ���丮 ����� ���丮�� �ļ� ���� (Ǯ �ļ� ���)
            XmlPullParserFactory factory; 
 
            factory = XmlPullParserFactory.newInstance();
            XmlPullParser parser = factory.newPullParser();
            parser.setInput((new InputStreamReader(urlConn.getInputStream(), "UTF-8")));
 
            
            int eventType = parser.getEventType();
            BookVO b = null;
            while (eventType != XmlPullParser.END_DOCUMENT) {
                switch (eventType) {
                case XmlPullParser.END_DOCUMENT: // ������ ��
                    break;
                case XmlPullParser.START_DOCUMENT:
                    list = new ArrayList<BookVO>();
                    break;
                case XmlPullParser.START_TAG: {
                    String tag = parser.getName();
                    switch (tag) {
                    case "item":
                        b = new BookVO();
                        break;
                    case "title":
                        if (b != null)
                            b.setTitle(parser.nextText());
                        break;
                    case "link":
                        if (b != null)
                            b.setLink(parser.nextText());
                        break;
                    case "image":
                        if (b != null)
                            b.setImage(parser.nextText());
                        break;
                    case "author":
                        if (b != null)
                            b.setAuthor(parser.nextText());
                        break;
                    case "discount":
                        if (b != null)
                            b.setDiscount(parser.nextText());
                        break;
                    case "publisher":
                        if (b != null)
                            b.setPublisher(parser.nextText());
                        break;
                    case "pubdate":
                        if (b != null)
                            b.setPubdate(parser.nextText());
                        break;
                    case "isbn":
                        if (b != null)
                            b.setIsbn(parser.nextText());
                        break;
                    case "description":
                        if (b != null)
                            b.setDescription(parser.nextText());
                        break;
                    }
                    break;
                }
 
                case XmlPullParser.END_TAG: {
                    String tag = parser.getName();
                    if (tag.equals("item")) {
                        list.add(b);
                        b = null;
                    }
 
                }
 
                }
                eventType = parser.next();
            }
 
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (XmlPullParserException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
    
}