package com.tongdao.entity;

import java.io.Serializable;
import java.util.List;


public class Tree implements Serializable{

	private static final long serialVersionUID = 1L;
	 	private Long id;
	    private String text;
	    private String state = "open";// open,closed
	    private boolean checked = false;
	    private Object attributes;
	    private List<Tree> children;
	    private String iconCls;
	    private String pid;
	    private String value;
	    private String type;
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getText() {
			return text;
		}
		public void setText(String text) {
			this.text = text;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public boolean isChecked() {
			return checked;
		}
		public void setChecked(boolean checked) {
			this.checked = checked;
		}
		public Object getAttributes() {
			return attributes;
		}
		public void setAttributes(Object attributes) {
			this.attributes = attributes;
		}
		public List<Tree> getChildren() {
			return children;
		}
		public void setChildren(List<Tree> children) {
			this.children = children;
		}
		public String getIconCls() {
			return iconCls;
		}
		public void setIconCls(String iconCls) {
			this.iconCls = iconCls;
		}
		public String getPid() {
			return pid;
		}
		public void setPid(String pid) {
			this.pid = pid;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		@Override
		public String toString() {
			return "Tree [id=" + id + ", text=" + text + ", state=" + state + ", checked=" + checked + ", attributes="
					+ attributes + ", children=" + children + ", iconCls=" + iconCls + ", pid=" + pid + ", value="
					+ value + ", type=" + type + "]";
		}
	    
}
