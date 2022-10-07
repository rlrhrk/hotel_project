package com.hotel.dto;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

@Alias("qna")
public class QnADTO {
	private String qnano;
	private String email;
	private String qnatitle;
	private String qnacontent;
	private LocalDate qnadate;
	private String qnaresponse;
	
	public QnADTO() {
		super();
	}
	
	
	public QnADTO(String qnano, String email, String qnatitle, String qnacontent, LocalDate qnadate,
			String qnaresponse) {
		super();
		this.qnano = qnano;
		this.email = email;
		this.qnatitle = qnatitle;
		this.qnacontent = qnacontent;
		this.qnadate = qnadate;
		this.qnaresponse = qnaresponse;
	}

	

	public String getQnano() {
		return qnano;
	}


	public void setQnano(String qnano) {
		this.qnano = qnano;
	}


	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQnatitle() {
		return qnatitle;
	}
	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}
	public String getQnacontent() {
		return qnacontent;
	}
	public void setQnacontent(String qnacontent) {
		this.qnacontent = qnacontent;
	}
	public LocalDate getQnadate() {
		return qnadate;
	}
	public void setQnadate(LocalDate qnadate) {
		this.qnadate = qnadate;
	}
	public String getQnaresponse() {
		return qnaresponse;
	}
	public void setQnaresponse(String qnaresponse) {
		this.qnaresponse = qnaresponse;
	}


	@Override
	public String toString() {
		return "QnADTO [qnano=" + qnano + ", email=" + email + ", qnatitle=" + qnatitle + ", qnacontent=" + qnacontent
				+ ", qnadate=" + qnadate + ", qnaresponse=" + qnaresponse + "]";
	}
	
	
	
	
}
