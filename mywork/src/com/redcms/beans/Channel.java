package com.redcms.beans;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 栏目
 * </p>
 *
 * @author 刘慧涛123
 * @since 2018-07-11
 */
public class Channel {

    private static final long serialVersionUID = 1L;
  
    private Long id;
    /**
     * '模型id'
     */
  
    private Long model_id;
    /**
     * '栏目名字'
     */
    private String name;
    /**
     * 'meta标题'
     */
    private String title;
    /**
     * 'meta关键词'
     */
    private String keywords;
    /**
     * 'meta描述'
     */
    private String description;
    /**
     * '父id'
     */

    private Long parent_id;
    /**
     * 图1
     */
    private String pic01;
    /**
     * 图2
     */
    private String pic02;
    /**
     * 排序
     */
    private Integer priority;
    /**
     * 外链
     */
    private String links;
    /**
     * 分表名
     */
    
    private String t_name="data1";
    /**
     * pc首页模版
     */

    private String index_tem;

    /**
     * pc列表页模版
     */
 
    private String list_tem;
   
    /**
     * pc内容页
     */

    private String content_tem;

    /**
     * 增加时间
     */

    private Date create_time;
    /**
     * 内容
     */
    private String txt;
    /**
     * 扩展
     */
    private String txt1;
    /**
     * 扩展
     */
    private String txt2;
    /**
     * 扩展01
     */
    private Integer num01;
    /**
     * 扩展01
     */
    private Integer num02;
    /**
     * 扩展01
     */
    private String date1;
    /**
     * 扩展01
     */
    private String date2;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getModel_id() {
		return model_id;
	}
	public void setModel_id(Long model_id) {
		this.model_id = model_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Long getParent_id() {
		return parent_id;
	}
	public void setParent_id(Long parent_id) {
		this.parent_id = parent_id;
	}
	public String getPic01() {
		return pic01;
	}
	public void setPic01(String pic01) {
		this.pic01 = pic01;
	}
	public String getPic02() {
		return pic02;
	}
	public void setPic02(String pic02) {
		this.pic02 = pic02;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public String getLinks() {
		return links;
	}
	public void setLinks(String links) {
		this.links = links;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getIndex_tem() {
		return index_tem;
	}
	public void setIndex_tem(String index_tem) {
		this.index_tem = index_tem;
	}
	public String getList_tem() {
		return list_tem;
	}
	public void setList_tem(String list_tem) {
		this.list_tem = list_tem;
	}
	public String getContent_tem() {
		return content_tem;
	}
	public void setContent_tem(String content_tem) {
		this.content_tem = content_tem;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getTxt() {
		return txt;
	}
	public void setTxt(String txt) {
		this.txt = txt;
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
	public Integer getNum01() {
		return num01;
	}
	public void setNum01(Integer num01) {
		this.num01 = num01;
	}
	public Integer getNum02() {
		return num02;
	}
	public void setNum02(Integer num02) {
		this.num02 = num02;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
    
    

	
}
