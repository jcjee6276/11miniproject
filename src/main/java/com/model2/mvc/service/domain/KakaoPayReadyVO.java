package com.model2.mvc.service.domain;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReadyVO {

	 private String tid, next_redirect_pc_url;
	 public String getTid() {
		return tid;
	}
	@Override
	public String toString() {
		return "KakaoPayReadyVO [tid=" + tid + ", next_redirect_pc_url=" + next_redirect_pc_url + ", created_at="
				+ created_at + ", getTid()=" + getTid() + ", getNext_redirect_pc_url()=" + getNext_redirect_pc_url()
				+ ", getCreated_at()=" + getCreated_at() + "]";
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}
	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	private Date created_at;

}
