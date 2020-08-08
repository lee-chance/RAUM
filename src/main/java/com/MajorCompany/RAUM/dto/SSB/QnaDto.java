package com.MajorCompany.RAUM.dto.SSB;

import java.sql.Timestamp;

public class QnaDto {
	private int seq, User_seq;
	private String  QACategory_seq, title, content, answer, writeTime;
	
	public QnaDto() {
		// TODO Auto-generated constructor stub
	}

	public QnaDto(int seq, int user_seq, String qACategory_seq, String title, String content, String answer,
			String writeTime) {
		super();
		this.seq = seq;
		User_seq = user_seq;
		QACategory_seq = qACategory_seq;
		this.title = title;
		this.content = content;
		this.answer = answer;
		this.writeTime = writeTime;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getUser_seq() {
		return User_seq;
	}

	public void setUser_seq(int user_seq) {
		User_seq = user_seq;
	}

	public String getQACategory_seq() {
		return QACategory_seq;
	}

	public void setQACategory_seq(String qACategory_seq) {
		QACategory_seq = qACategory_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getWriteTime() {
		return writeTime;
	}

	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}
	
	
	
}
