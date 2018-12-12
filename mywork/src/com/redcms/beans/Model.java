package com.redcms.beans;


import java.io.Serializable;


/**
 * <p>
 * 模型表
 * </p>
 *
 * @author 刘慧涛123
 * @since 2018-07-09
 */
public class Model {

    private static final long serialVersionUID = 1L;


    private Long id;
    /**
     * 名字
     */
    private String name;
    /**
     * 路径
     */
    private String path;
    /**
     * 标题 图宽
     */
 
    private Integer title_width;

    private Integer title_height;
    /**
     * 内容图宽
     */
  
    private Integer content_width;
   
    private Integer content_height;
    /**
     * 排序
     */
    private Integer priority=10;
    /**
     * 是否有内容
     */
    
    private Integer has_content=0;
    /**
     * 是否默认
     */
   
    private Integer is_def=0;
    /**
     * 模版
     */
    private String template;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Integer getTitle_width() {
		return title_width;
	}
	public void setTitle_width(Integer title_width) {
		this.title_width = title_width;
	}
	public Integer getTitle_height() {
		return title_height;
	}
	public void setTitle_height(Integer title_height) {
		this.title_height = title_height;
	}
	public Integer getContent_width() {
		return content_width;
	}
	public void setContent_width(Integer content_width) {
		this.content_width = content_width;
	}
	public Integer getContent_height() {
		return content_height;
	}
	public void setContent_height(Integer content_height) {
		this.content_height = content_height;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public Integer getHas_content() {
		return has_content;
	}
	public void setHas_content(Integer has_content) {
		this.has_content = has_content;
	}
	public Integer getIs_def() {
		return is_def;
	}
	public void setIs_def(Integer is_def) {
		this.is_def = is_def;
	}
	public String getTemplate() {
		return template;
	}
	public void setTemplate(String template) {
		this.template = template;
	}



}
