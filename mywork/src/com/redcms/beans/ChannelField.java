package com.redcms.beans;


import java.io.Serializable;

/**
 * <p>
 * 模型字段项
 * </p>
 *
 * @author 刘慧涛123
 * @since 2018-07-11
 */

public class ChannelField {

    private static final long serialVersionUID = 1L;

   
    private Long id;
    /**
     * 字段名
     */
    private String field;
    /**
     * 字段描述
     */
   
    private String field_dis;
    /**
     * 排序
     */
    private Integer priority;
    /**
     * 默认值 
     */
    
    private String def_value;
    /**
     * 可选 值 
     */
 
    private String opt_value;
    /**
     * 长度
     */

    private String txt_size;
    /**
     * 帮助信息
     */

    private String help_info;
    /**
     * 数据类型 
     */
  
    private Integer data_type;
    /**
     * 单独行
     */

    private Integer is_single;
    /**
     * 是否是栏目
     */

    private Integer is_channel;
    /**
     * 自定义
     */

    private Integer is_custom;
    /**
     * 显示
     */
 
    private Integer is_display;
    /**
     * 必须
     */
   
    private Integer is_required;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getField_dis() {
		return field_dis;
	}
	public void setField_dis(String field_dis) {
		this.field_dis = field_dis;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public String getDef_value() {
		return def_value;
	}
	public void setDef_value(String def_value) {
		this.def_value = def_value;
	}
	public String getOpt_value() {
		return opt_value;
	}
	public void setOpt_value(String opt_value) {
		this.opt_value = opt_value;
	}
	public String getTxt_size() {
		return txt_size;
	}
	public void setTxt_size(String txt_size) {
		this.txt_size = txt_size;
	}
	public String getHelp_info() {
		return help_info;
	}
	public void setHelp_info(String help_info) {
		this.help_info = help_info;
	}
	public Integer getData_type() {
		return data_type;
	}
	public void setData_type(Integer data_type) {
		this.data_type = data_type;
	}
	public Integer getIs_single() {
		return is_single;
	}
	public void setIs_single(Integer is_single) {
		this.is_single = is_single;
	}
	public Integer getIs_channel() {
		return is_channel;
	}
	public void setIs_channel(Integer is_channel) {
		this.is_channel = is_channel;
	}
	public Integer getIs_custom() {
		return is_custom;
	}
	public void setIs_custom(Integer is_custom) {
		this.is_custom = is_custom;
	}
	public Integer getIs_display() {
		return is_display;
	}
	public void setIs_display(Integer is_display) {
		this.is_display = is_display;
	}
	public Integer getIs_required() {
		return is_required;
	}
	public void setIs_required(Integer is_required) {
		this.is_required = is_required;
	}


}
