package com.itbank.navercafe.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateInformation {
	private Date today = new Date();
	private Date targetDate;
	private String pattern;
	private SimpleDateFormat dateFormat;
	private String todayText;
	private String targetDateText;
	private int lastDate;
	private int year;
	private int month;
	private int date;
	
	private String mondayText;
	private String tuesdayText;
	private String wednesdayText;
	private String thursdayText;
	private String fridayText;
	private String saturdayText;
	private String sundayText;
	
	private String firstDateOfMonthText;
	private String lastDateOfMonthText;
	private String firstDateOfYearText;
	private String lastDateOfYearText;
	
	private Date monday;
	private Date tuesday;
	private Date wednesday;
	private Date thursday;
	private Date friday;
	private Date saturday;
	private Date sunday;
	
	private Date firstDateOfMonth;
	private Date lastDateOfMonth;
	private Date firstDateOfYear;
	private Date lastDateOfYear;
	
	private String prevWeekText;
	private String nextWeekText;
	private String prevMonthText;
	private String nextMonthText;
	private String prevYearText;
	private String nextYearText;
	
	private Date prevWeek;
	private Date nextWeek;
	private Date prevMonth;
	private Date nextMonth;
	private Date prevYear;
	private Date nextYear;
	
	public DateInformation() throws Exception {
		this.pattern = "yyyy-MM-dd";
		this.dateFormat= new SimpleDateFormat(pattern);
		this.targetDate = today;
		this.setDateInformation();
	}
	/** -----------------------------------------------------------------------------------------*/
	public DateInformation(Date targetDate) throws Exception {
		this.pattern = "yyyy-MM-dd";
		this.dateFormat= new SimpleDateFormat(pattern);
		this.targetDate = targetDate;
		this.setDateInformation();
	}
	
	public DateInformation(Date targetDate, String pattern) throws Exception {
		this.pattern = pattern;
		this.dateFormat= new SimpleDateFormat(pattern);
		this.targetDate = targetDate;
		this.setDateInformation();
	}
	/** -----------------------------------------------------------------------------------------*/
	public DateInformation(String targetDateText) throws Exception {
		this.pattern = "yyyy-MM-dd";
		this.dateFormat= new SimpleDateFormat(pattern);
		this.targetDate = dateFormat.parse(targetDateText);
		this.setDateInformation();
	}
	public DateInformation(String targetDateText, String pattern) throws Exception {
		this.pattern = pattern;
		this.dateFormat= new SimpleDateFormat(pattern);
		this.targetDate = dateFormat.parse(targetDateText);
		this.setDateInformation();
	}
	
	public void setDateInformation() throws Exception {
		Calendar cal = Calendar.getInstance();
		String[] dateArray;
		
		// 날짜 문자열
		this.targetDateText = dateFormat.format(targetDate);
		this.todayText = dateFormat.format(today);
		/** -----------------------------------------------------------------------------------------*/
		SimpleDateFormat tempFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateArray = tempFormat.format(targetDate).split("-");
		
		this.year = Integer.parseInt(dateArray[0]);
		this.month = Integer.parseInt(dateArray[1]);
		this.date = Integer.parseInt(dateArray[2]);
		/** -----------------------------------------------------------------------------------------*/
		
		cal.setTime(targetDate);
		
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH);
		int date = cal.get(cal.DATE);
		
		// 달의 마직말 일
		this.lastDate = cal.getActualMaximum(cal.DATE);
		
		// 년 첫번째 날짜
		cal.set(year-1, 12, 1);
		this.firstDateOfYear = cal.getTime();
		this.firstDateOfYearText = dateFormat.format(firstDateOfYear);
		
		// 년 마지막 날짜
		cal.set(year, 11, 31);
		this.lastDateOfYear = cal.getTime();
		this.lastDateOfYearText = dateFormat.format(lastDateOfYear);
		
		// 월 첫번째 날짜
		cal.set(year, month, 1);
		this.firstDateOfMonth = cal.getTime();
		this.firstDateOfMonthText = dateFormat.format(firstDateOfMonth);
	
		// 월 마지막 날짜
		cal.set(year, month, lastDate);
		this.lastDateOfMonth = cal.getTime();
		this.lastDateOfMonthText = dateFormat.format(lastDateOfMonth);
		
		// 월요일 날짜
		cal.setTime(targetDate);
		cal.set(cal.DAY_OF_WEEK, cal.MONDAY);
		
		this.monday = cal.getTime();
		this.mondayText = dateFormat.format(monday);
		
		// 화요일 날짜
		cal.setTime(targetDate);
		cal.set(cal.DAY_OF_WEEK, cal.TUESDAY);
		
		this.tuesday = cal.getTime();
		this.tuesdayText = dateFormat.format(tuesday);
		
		// 수요일 날짜
		cal.setTime(targetDate);
		cal.set(cal.DAY_OF_WEEK, cal.WEDNESDAY);
		
		this.wednesday = cal.getTime();
		this.wednesdayText = dateFormat.format(wednesday);
		
		// 목요일 날짜
		cal.setTime(targetDate);
		cal.set(cal.DAY_OF_WEEK, cal.THURSDAY);
		
		this.thursday = cal.getTime();
		this.thursdayText = dateFormat.format(thursday);
		
		// 금요일 날짜
		cal.setTime(targetDate);
		cal.set(cal.DAY_OF_WEEK, cal.FRIDAY);
		
		this.friday = cal.getTime();
		this.fridayText = dateFormat.format(friday);
		
		// 토요일 날짜
		cal.setTime(targetDate);
		cal.set(cal.DAY_OF_WEEK, cal.SATURDAY);
		
		this.saturday = cal.getTime();
		this.mondayText = dateFormat.format(saturday);
		
		// 일요일 날짜
		cal.setTime(targetDate);
		cal.add(cal.DAY_OF_WEEK, 7);
		cal.set(cal.DAY_OF_WEEK, cal.SUNDAY);
		
		this.sunday = cal.getTime();
		this.sundayText = dateFormat.format(sunday);
		
		// 1주 전 날짜
		cal.setTime(targetDate);
		cal.add(cal.DAY_OF_WEEK, -7);
		
		this.prevWeek = cal.getTime();
		this.prevWeekText = dateFormat.format(prevWeek);
		
		// 1주 후 날짜
		cal.setTime(targetDate);
		cal.add(cal.DAY_OF_WEEK, 7);
		
		this.nextWeek = cal.getTime();
		this.nextWeekText = dateFormat.format(nextWeek);
		
		// 1달 전 날짜
		cal.setTime(targetDate);
		cal.add(cal.MONTH, -1);
		
		this.prevMonth = cal.getTime();
		this.prevMonthText = dateFormat.format(prevMonth);
		
		// 1달 후 날짜
		cal.setTime(targetDate);
		cal.add(cal.MONTH, 1);
		
		this.nextMonth = cal.getTime();
		this.nextMonthText = dateFormat.format(nextMonth);
		
		// 1년 전 날짜
		cal.setTime(targetDate);
		cal.add(cal.YEAR, -1);
		
		this.prevYear = cal.getTime();
		this.prevYearText = dateFormat.format(prevYear);
		
		// 1년 후 날짜
		cal.setTime(targetDate);
		cal.add(cal.YEAR, 1);
		
		this.nextYear = cal.getTime();
		this.nextYearText = dateFormat.format(nextYear);
	}
	
	public boolean isBefore(String target, String compare) throws Exception {
		boolean result = false;
		
		if(target != null && compare != null) {
			target = target.replaceAll("\\D", "");
			compare = compare.replaceAll("\\D", "");
			
			if(target.length() > 0 && compare.length() > 0) {
				Long targetLong = Long.parseLong(target);
				Long compareLong = Long.parseLong(compare);
				
				result = targetLong < compareLong;
			}
		}
		
		return result;
	}
	
	public boolean isEquals(String target, String compare) throws Exception {
		boolean result = false;
		
		if(target != null && compare != null) {
			target = target.replaceAll("\\D", "");
			compare = compare.replaceAll("\\D", "");
			
			if(target.length() > 0 && compare.length() > 0) {
				Long targetLong = Long.parseLong(target);
				Long compareLong = Long.parseLong(compare);

				result = targetLong.equals(compareLong);
			}
		}
		
		return result;
	}
	
	public boolean isAfter(String target, String compare) throws Exception {
		boolean result = false;
		
		if(target != null && compare != null) {
			target = target.replaceAll("\\D", "");
			compare = compare.replaceAll("\\D", "");
			
			if(target.length() > 0 && compare.length() > 0) {
				Long targetLong = Long.parseLong(target);
				Long compareLong = Long.parseLong(compare);
				
				result = targetLong > compareLong;
			}
		}
		
		return result;
	}
	
	public Date getToday() {
		return today;
	}
	public void setToday(Date today) {
		this.today = today;
	}
	public Date getTargetDate() {
		return targetDate;
	}
	public void setTargetDate(Date targetDate) {
		this.targetDate = targetDate;
	}
	public String getPattern() {
		return pattern;
	}
	public void setPattern(String pattern) {
		this.pattern = pattern;
	}
	public SimpleDateFormat getDateFormat() {
		return dateFormat;
	}
	public void setDateFormat(SimpleDateFormat dateFormat) {
		this.dateFormat = dateFormat;
	}
	public String getTodayText() {
		return todayText;
	}
	public void setTodayText(String todayText) {
		this.todayText = todayText;
	}
	public String getTargetDateText() {
		return targetDateText;
	}
	public void setTargetDateText(String targetDateText) {
		this.targetDateText = targetDateText;
	}
	public int getLastDate() {
		return lastDate;
	}
	public void setLastDate(int lastDate) {
		this.lastDate = lastDate;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}
	public String getMondayText() {
		return mondayText;
	}
	public void setMondayText(String mondayText) {
		this.mondayText = mondayText;
	}
	public String getTuesdayText() {
		return tuesdayText;
	}
	public void setTuesdayText(String tuesdayText) {
		this.tuesdayText = tuesdayText;
	}
	public String getWednesdayText() {
		return wednesdayText;
	}
	public void setWednesdayText(String wednesdayText) {
		this.wednesdayText = wednesdayText;
	}
	public String getThursdayText() {
		return thursdayText;
	}
	public void setThursdayText(String thursdayText) {
		this.thursdayText = thursdayText;
	}
	public String getFridayText() {
		return fridayText;
	}
	public void setFridayText(String fridayText) {
		this.fridayText = fridayText;
	}
	public String getSaturdayText() {
		return saturdayText;
	}
	public void setSaturdayText(String saturdayText) {
		this.saturdayText = saturdayText;
	}
	public String getSundayText() {
		return sundayText;
	}
	public void setSundayText(String sundayText) {
		this.sundayText = sundayText;
	}
	public String getFirstDateOfMonthText() {
		return firstDateOfMonthText;
	}
	public void setFirstDateOfMonthText(String firstDateOfMonthText) {
		this.firstDateOfMonthText = firstDateOfMonthText;
	}
	public String getLastDateOfMonthText() {
		return lastDateOfMonthText;
	}
	public void setLastDateOfMonthText(String lastDateOfMonthText) {
		this.lastDateOfMonthText = lastDateOfMonthText;
	}
	public String getFirstDateOfYearText() {
		return firstDateOfYearText;
	}
	public void setFirstDateOfYearText(String firstDateOfYearText) {
		this.firstDateOfYearText = firstDateOfYearText;
	}
	public String getLastDateOfYearText() {
		return lastDateOfYearText;
	}
	public void setLastDateOfYearText(String lastDateOfYearText) {
		this.lastDateOfYearText = lastDateOfYearText;
	}
	public Date getMonday() {
		return monday;
	}
	public void setMonday(Date monday) {
		this.monday = monday;
	}
	public Date getTuesday() {
		return tuesday;
	}
	public void setTuesday(Date tuesday) {
		this.tuesday = tuesday;
	}
	public Date getWednesday() {
		return wednesday;
	}
	public void setWednesday(Date wednesday) {
		this.wednesday = wednesday;
	}
	public Date getThursday() {
		return thursday;
	}
	public void setThursday(Date thursday) {
		this.thursday = thursday;
	}
	public Date getFriday() {
		return friday;
	}
	public void setFriday(Date friday) {
		this.friday = friday;
	}
	public Date getSaturday() {
		return saturday;
	}
	public void setSaturday(Date saturday) {
		this.saturday = saturday;
	}
	public Date getSunday() {
		return sunday;
	}
	public void setSunday(Date sunday) {
		this.sunday = sunday;
	}
	public Date getFirstDateOfMonth() {
		return firstDateOfMonth;
	}
	public void setFirstDateOfMonth(Date firstDateOfMonth) {
		this.firstDateOfMonth = firstDateOfMonth;
	}
	public Date getLastDateOfMonth() {
		return lastDateOfMonth;
	}
	public void setLastDateOfMonth(Date lastDateOfMonth) {
		this.lastDateOfMonth = lastDateOfMonth;
	}
	public Date getFirstDateOfYear() {
		return firstDateOfYear;
	}
	public void setFirstDateOfYear(Date firstDateOfYear) {
		this.firstDateOfYear = firstDateOfYear;
	}
	public Date getLastDateOfYear() {
		return lastDateOfYear;
	}
	public void setLastDateOfYear(Date lastDateOfYear) {
		this.lastDateOfYear = lastDateOfYear;
	}
	public String getPrevWeekText() {
		return prevWeekText;
	}
	public void setPrevWeekText(String prevWeekText) {
		this.prevWeekText = prevWeekText;
	}
	public String getNextWeekText() {
		return nextWeekText;
	}
	public void setNextWeekText(String nextWeekText) {
		this.nextWeekText = nextWeekText;
	}
	public String getPrevMonthText() {
		return prevMonthText;
	}
	public void setPrevMonthText(String prevMonthText) {
		this.prevMonthText = prevMonthText;
	}
	public String getNextMonthText() {
		return nextMonthText;
	}
	public void setNextMonthText(String nextMonthText) {
		this.nextMonthText = nextMonthText;
	}
	public String getPrevYearText() {
		return prevYearText;
	}
	public void setPrevYearText(String prevYearText) {
		this.prevYearText = prevYearText;
	}
	public String getNextYearText() {
		return nextYearText;
	}
	public void setNextYearText(String nextYearText) {
		this.nextYearText = nextYearText;
	}
	public Date getPrevWeek() {
		return prevWeek;
	}
	public void setPrevWeek(Date prevWeek) {
		this.prevWeek = prevWeek;
	}
	public Date getNextWeek() {
		return nextWeek;
	}
	public void setNextWeek(Date nextWeek) {
		this.nextWeek = nextWeek;
	}
	public Date getPrevMonth() {
		return prevMonth;
	}
	public void setPrevMonth(Date prevMonth) {
		this.prevMonth = prevMonth;
	}
	public Date getNextMonth() {
		return nextMonth;
	}
	public void setNextMonth(Date nextMonth) {
		this.nextMonth = nextMonth;
	}
	public Date getPrevYear() {
		return prevYear;
	}
	public void setPrevYear(Date prevYear) {
		this.prevYear = prevYear;
	}
	public Date getNextYear() {
		return nextYear;
	}
	public void setNextYear(Date nextYear) {
		this.nextYear = nextYear;
	}
}
