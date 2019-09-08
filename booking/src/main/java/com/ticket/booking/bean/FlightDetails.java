package com.ticket.booking.bean;

public class FlightDetails {
	
	private int id;
	private String startTime;
	private String endTime;
	private String price;
	private String airline;
	private String from;
	private String to;
	private String departure;
	private String return1;
	private String adult;
	private String child;
	public FlightDetails(String startTime, String endTime, String price, String airline) {
		super();
		this.startTime = startTime;
		this.endTime = endTime;
		this.price = price;
		this.airline = airline;
	}
	
	

	



	public FlightDetails(String startTime, String endTime, String price, String airline, String from, String to,
			String departure, String return1, String adult, String child) {
		super();
		this.startTime = startTime;
		this.endTime = endTime;
		this.price = price;
		this.airline = airline;
		this.from = from;
		this.to = to;
		this.departure = departure;
		this.return1 = return1;
		this.adult = adult;
		this.child = child;
	}







	public String getAdult() {
		return adult;
	}







	public void setAdult(String adult) {
		this.adult = adult;
	}







	public String getChild() {
		return child;
	}







	public void setChild(String child) {
		this.child = child;
	}







	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getFrom() {
		return from;
	}



	public void setFrom(String from) {
		this.from = from;
	}



	public String getTo() {
		return to;
	}



	public void setTo(String to) {
		this.to = to;
	}



	public String getDeparture() {
		return departure;
	}



	public void setDeparture(String departure) {
		this.departure = departure;
	}



	public String getReturn1() {
		return return1;
	}



	public void setReturn1(String return1) {
		this.return1 = return1;
	}
	
	
	

}
