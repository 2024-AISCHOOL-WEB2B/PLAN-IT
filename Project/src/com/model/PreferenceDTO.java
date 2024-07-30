package com.model;

public class PreferenceDTO {
    private String questionNum;
    private String questionAw;
    private String prFk;
    
    public PreferenceDTO(String questionNum, String questionAw, String prFk) {
        this.questionNum = questionNum;
        this.questionAw = questionAw;
        this.prFk = prFk;
    }

	public String getQuestionNum() {
		return questionNum;
	}

	public void setQuestionNum(String questionNum) {
		this.questionNum = questionNum;
	}

	public String getQuestionAw() {
		return questionAw;
	}

	public void setQuestionAw(String questionAw) {
		this.questionAw = questionAw;
	}

	public String getPrFk() {
		return prFk;
	}

	public void setPrFk(String prFk) {
		this.prFk = prFk;
	}
    
    
}

