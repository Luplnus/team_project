package com.bitstudy.app.domain;

public class TheaterDto {
    private String t_id;
    private String t_title;
    private String t_start_date;
    private String t_end_date;
    private String t_venue;
    private String t_poster;
    private String t_genre;

    public TheaterDto() {
    }

    public TheaterDto(String t_id, String t_title, String t_start_date, String t_poster, String t_genre) {
        this.t_id = t_id;
        this.t_title = t_title;
        this.t_start_date = t_start_date;
        this.t_poster = t_poster;
        this.t_genre = t_genre;
    }

    public TheaterDto(String t_id, String t_title, String t_start_date, String t_end_date, String t_venue, String t_poster, String t_genre) {
        this.t_id = t_id;
        this.t_title = t_title;
        this.t_start_date = t_start_date;
        this.t_end_date = t_end_date;
        this.t_venue = t_venue;
        this.t_poster = t_poster;
        this.t_genre = t_genre;
    }
    public String getT_id() {
        return t_id;
    }
    public void setT_id(String t_id) {
        this.t_id = t_id;
    }
    public String getT_title() {
        return t_title;
    }
    public void setT_title(String t_title) {
        this.t_title = t_title;
    }
    public String getT_start_date() {
        return t_start_date;
    }
    public void setT_start_date(String t_start_date) {
        this.t_start_date = t_start_date;
    }
    public String getT_end_date() {
        return t_end_date;
    }
    public void setT_end_date(String t_end_date) {
        this.t_end_date = t_end_date;
    }
    public String getT_venue() {
        return t_venue;
    }
    public void setT_venue(String t_venue) {
        this.t_venue = t_venue;
    }
    public String getT_poster() {
        return t_poster;
    }
    public void setT_poster(String t_poster) {
        this.t_poster = t_poster;
    }
    public String getT_genre() {
        return t_genre;
    }
    public void setT_genre(String t_genre) {
        this.t_genre = t_genre;
    }

    @Override
    public String toString() {
        return "TheaterDto{" +
                "t_id='" + t_id + '\'' +
                ", t_end_date=" + t_end_date +
                ", t_genre='" + t_genre + '\'' +
                ", t_poster='" + t_poster + '\'' +
                ", t_start_date=" + t_start_date +
                ", t_title='" + t_title + '\'' +
                ", t_venue='" + t_venue + '\'' +
                '}';
    }
}

//import com.fasterxml.jackson.annotation.JsonProperty;
//
//public class TheaterDto {
//    @JsonProperty("t_id")
//    private String tId;
//
//    @JsonProperty("t_title")
//    private String tTitle;
//
//    // LocalDate → String 으로 변경
//    @JsonProperty("t_start_date")
//    private String tStartDate;
//
//    @JsonProperty("t_end_date")
//    private String tEndDate;
//
//    @JsonProperty("t_venue")
//    private String tVenue;
//
//    @JsonProperty("t_poster")
//    private String tPoster;
//
//    @JsonProperty("t_genre")
//    private String tGenre;
//
//    public TheaterDto() {}
//
//    public String getTId() { return tId; }
//    public void setTId(String tId) { this.tId = tId; }
//
//    public String getTTitle() { return tTitle; }
//    public void setTTitle(String tTitle) { this.tTitle = tTitle; }
//
//    public String getTStartDate() { return tStartDate; }
//    public void setTStartDate(String tStartDate) { this.tStartDate = tStartDate; }
//
//    public String getTEndDate() { return tEndDate; }
//    public void setTEndDate(String tEndDate) { this.tEndDate = tEndDate; }
//
//    public String getTVenue() { return tVenue; }
//    public void setTVenue(String tVenue) { this.tVenue = tVenue; }
//
//    public String getTPoster() { return tPoster; }
//    public void setTPoster(String tPoster) { this.tPoster = tPoster; }
//
//    public String getTGenre() { return tGenre; }
//    public void setTGenre(String tGenre) { this.tGenre = tGenre; }
//}