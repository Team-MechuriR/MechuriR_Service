package com.example.exchangeDiary.vo;

public class PostVo {

	private int postId;
	private String sender;
	private String reciever;
	private String content;
	private String sendTime;
	private String recieveTime;
	private int exDiaryId;
	private String readYn;
	
	
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReciever() {
		return reciever;
	}
	public void setReciever(String reciever) {
		this.reciever = reciever;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public String getRecieveTime() {
		return recieveTime;
	}
	public void setRecieveTime(String recieveTime) {
		this.recieveTime = recieveTime;
	}
	public int getExDiaryId() {
		return exDiaryId;
	}
	public void setExDiaryId(int exDiaryId) {
		this.exDiaryId = exDiaryId;
	}
	public String getReadYn() {
		return readYn;
	}
	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}
	
	@Override
	public String toString() {
		return "PostVo [postId=" + postId + ", sender=" + sender + ", reciever=" + reciever + ", content=" + content
				+ ", sendTime=" + sendTime + ", recieveTime=" + recieveTime + ", exDiaryId=" + exDiaryId + ", readYn="
				+ readYn + "]";
	}
}
