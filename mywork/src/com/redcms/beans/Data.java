package com.redcms.beans;


import java.util.Date;

import java.io.Serializable;

/**
 * <p>
 * 数据
 * </p>
 *
 * @author 刘慧涛123
 * @since 2018-07-11
 */

public class Data {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */

    private Long id;
    /**
     * 栏目
     */
  
    private Integer channel_id;

    private String content_tem;
    /**
     * 标题
     */
    private String title;
    /**
     * 标签
     */
    private String tags;
    /**
     * 作者
     */
    private String author;
    /**
     * 级别
     */
    private Integer level;
    /**
     * 内容一
     */
    private String txt1;
    /**
     * 内容二
     */
    private String txt2;
    /**
     * 描述
     */
    private String dis;
    /**
     * 状态
     */
    private Integer state;
    /**
     * 创建日期
     */
    private Date createtime;
    /**
     * 图1
     */
    private String pic1;
    /**
     * 图2
     */
    private String pic2;
    /**
     * 图3
     */
    private String pic3;
    /**
     * 外链
     */
    private String links;
    /**
     * 扩展字符串字段
     */
    private String c1;
    private String c2;
    private String c3;
    private String c4;
    /**
     * 扩展数字字段
     */
    private Integer n1;
    private Integer n2;
    private Integer n3;
    /**
     * 扩展日期
     */
    private String d1;
    private String d2;
    /**
     * 附件1
     */
    private String attach1;
    /**
     * 附件2
     */
    private String attach2;
    
    private String tName;//表名
    private String channelName;//栏目名
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getChannel_id() {
		return channel_id;
	}
	public void setChannel_id(Integer channel_id) {
		this.channel_id = channel_id;
	}
	public String getContent_tem() {
		return content_tem;
	}
	public void setContent_tem(String content_tem) {
		this.content_tem = content_tem;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getTxt1() {
		return txt1;
	}
	public void setTxt1(String txt1) {
		this.txt1 = txt1;
	}
	public String getTxt2() {
		return txt2;
	}
	public void setTxt2(String txt2) {
		this.txt2 = txt2;
	}
	public String getDis() {
		return dis;
	}
	public void setDis(String dis) {
		this.dis = dis;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public String getPic1() {
		return pic1;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}
	public String getPic2() {
		return pic2;
	}
	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}
	public String getPic3() {
		return pic3;
	}
	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}
	public String getLinks() {
		return links;
	}
	public void setLinks(String links) {
		this.links = links;
	}
	public String getC1() {
		return c1;
	}
	public void setC1(String c1) {
		this.c1 = c1;
	}
	public String getC2() {
		return c2;
	}
	public void setC2(String c2) {
		this.c2 = c2;
	}
	public String getC3() {
		return c3;
	}
	public void setC3(String c3) {
		this.c3 = c3;
	}
	public String getC4() {
		return c4;
	}
	public void setC4(String c4) {
		this.c4 = c4;
	}
	public Integer getN1() {
		return n1;
	}
	public void setN1(Integer n1) {
		this.n1 = n1;
	}
	public Integer getN2() {
		return n2;
	}
	public void setN2(Integer n2) {
		this.n2 = n2;
	}
	public Integer getN3() {
		return n3;
	}
	public void setN3(Integer n3) {
		this.n3 = n3;
	}
	public String getD1() {
		return d1;
	}
	public void setD1(String d1) {
		this.d1 = d1;
	}
	public String getD2() {
		return d2;
	}
	public void setD2(String d2) {
		this.d2 = d2;
	}
	public String getAttach1() {
		return attach1;
	}
	public void setAttach1(String attach1) {
		this.attach1 = attach1;
	}
	public String getAttach2() {
		return attach2;
	}
	public void setAttach2(String attach2) {
		this.attach2 = attach2;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}


   
}
