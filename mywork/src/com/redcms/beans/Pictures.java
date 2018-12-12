package com.redcms.beans;

import java.io.Serializable;

/**
 * <p>
 * 图集
 * </p>
 *
 * @author 刘慧涛123
 * @since 2018-07-13
 */
public class Pictures {

    private static final long serialVersionUID = 1L;

    private Long id;
  
    private Long channel_id;

    private Long data_id;
 
    private String path;
  
    private String picdis;
  
    private Integer priority;
    private Integer sequ;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getChannel_id() {
		return channel_id;
	}
	public void setChannel_id(Long channel_id) {
		this.channel_id = channel_id;
	}
	public Long getData_id() {
		return data_id;
	}
	public void setData_id(Long data_id) {
		this.data_id = data_id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getPicdis() {
		return picdis;
	}
	public void setPicdis(String picdis) {
		this.picdis = picdis;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public Integer getSequ() {
		return sequ;
	}
	public void setSequ(Integer sequ) {
		this.sequ = sequ;
	}

}
