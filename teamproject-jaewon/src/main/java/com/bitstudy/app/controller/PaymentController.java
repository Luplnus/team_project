package com.bitstudy.app.controller;

import com.bitstudy.app.dao.MovieDao;
import com.bitstudy.app.dao.PaymentMovieDao;
import com.bitstudy.app.dao.PaymentMusicalDao;
import com.bitstudy.app.dao.PaymentTheaterDao;
import com.bitstudy.app.domain.MovieDto;
import com.bitstudy.app.domain.PaymentMovieDto;
import com.bitstudy.app.domain.PaymentMusicalDto;
import com.bitstudy.app.domain.PaymentTheaterDto;
import com.bitstudy.app.service.PaymentService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class PaymentController {

    @Autowired
    MovieDao movieDao;

    @Autowired
    MusicalDao musicalDao;

    @Autowired
    TheaterDao theaterDao;

    @Autowired
    UserDao userDao;

    @Autowired
    PaymentMovieDao paymentMovieDao;

    @Autowired
    PaymentMusicalDao paymentMusicalDao;

    @Autowired
    PaymentTheaterDao paymentTheaterDao;

    @Autowired
    PaymentService paymentService;

    @CrossOrigin(origins = "*")
    @GetMapping("/paymentmovie")
    public List<PaymentMovieDto> selectAllMovie() {
        return paymentService.selectAllMovie();
    }


    @CrossOrigin(origins = "*")
    @GetMapping("/paymentmusical")
    public List<PaymentMusicalDto> selectAllMusical() {
        return paymentService.selectAllMusical();
    }

    @CrossOrigin(origins = "*")
    @GetMapping("/paymenttheater")
    public List<PaymentTheaterDto> selectAllTheater() {
        return paymentService.selectAllTheater();
    }

    @ResponseBody
    @PostMapping("/paypay/movie")
    public ResponseEntity<String> paypayMovie(@RequestBody Map<String, String> map, HttpSession session) {
        UserDto userDto = userDao.selectUser(map.get("u_id")); // u_id 받아서 해당 userDto 저장
        Integer u_seqno = userDto.getU_seqno(); // 해당 u_id의 user_seqno 받아와서

        ObjectMapper mapper = new ObjectMapper(); // Json을 객체로 변환
        PaymentMovieDto paymentMovieDto = mapper.convertValue(map, PaymentMovieDto.class); // @RequestBody로 받은 JSON데이터 map을 PaymentMovieDto클래스로 리턴 - PaymentMovieDto 변수로 저장

        paymentMovieDto.setU_seqno(u_seqno); // 받아온 user_seqno paymentMovieDto에 set
        paymentMovieDto.setB_seqno(1); // b_seqno는 .then(function(result)에서 변수로 저장해서 axios 데이터에 넣는 형식으로 하면 됨

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        System.out.println(paymentMovieDto);
        try {
            int rowCount = paymentMovieDao.insert(paymentMovieDto); // insert가 성공하면 rowCount == 1
            if (rowCount == 0) { // insert 실패
                return new ResponseEntity<String>("PAYMENT_FAIL", HttpStatus.OK);
            } else { // insert 성공하면
                return new ResponseEntity<String>("PAYMENT_OK", HttpStatus.OK);
            }
        }
        catch (Exception e) { //
            e.printStackTrace();
            return new ResponseEntity<String>("PAYMENT_ERROR", HttpStatus.BAD_REQUEST);
        }
    }

    @ResponseBody
    @PostMapping("/paypay/musical")
    public ResponseEntity<String> paypayMusical(@RequestBody Map<String, String> map, HttpSession session) {
        UserDto userDto = userDao.selectUser(map.get("u_id")); // u_id 받아서 해당 userDto 저장
        Integer u_seqno = userDto.getU_seqno(); // 해당 u_id의 user_seqno 받아와서

        ObjectMapper mapper = new ObjectMapper(); // Json을 객체로 변환
        PaymentMusicalDto paymentMusicalDto = mapper.convertValue(map, PaymentMusicalDto.class); // @RequestBody로 받은 JSON데이터 map을 PaymentMusicalDto클래스로 리턴 - PaymentMusicalDto 변수로 저장

        paymentMusicalDto.setU_seqno(u_seqno); // 받아온 user_seqno paymentMusicalDto에 set
        paymentMusicalDto.setB_seqno(1); // b_seqno는 .then(function(result)에서 변수로 저장해서 axios 데이터에 넣는 형식으로 하면 됨

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        System.out.println(paymentMusicalDto);
        try {
            int rowCount = paymentMusicalDao.insert(paymentMusicalDto); // insert가 성공하면 rowCount == 1
            if (rowCount == 0) { // insert 실패
                return new ResponseEntity<String>("PAYMENT_FAIL", HttpStatus.OK);
            } else { // insert 성공하면
                return new ResponseEntity<String>("PAYMENT_OK", HttpStatus.OK);
            }
        }
        catch (Exception e) { //
            e.printStackTrace();
            return new ResponseEntity<String>("PAYMENT_ERROR", HttpStatus.BAD_REQUEST);
        }
    }

    @ResponseBody
    @PostMapping("/paypay/theater")
    public ResponseEntity<String> paypayTheater(@RequestBody Map<String, String> map, HttpSession session) {
        UserDto userDto = userDao.selectUser(map.get("u_id")); // u_id 받아서 해당 userDto 저장
        Integer u_seqno = userDto.getU_seqno(); // 해당 u_id의 user_seqno 받아와서

        ObjectMapper mapper = new ObjectMapper(); // Json을 객체로 변환
        PaymentTheaterDto paymentTheaterDto = mapper.convertValue(map, PaymentTheaterDto.class); // @RequestBody로 받은 JSON데이터 map을 PaymentTheaterDto클래스로 리턴 - PaymentTheaterDto 변수로 저장

        paymentTheaterDto.setU_seqno(u_seqno); // 받아온 user_seqno paymentTheaterDto에 set
        paymentTheaterDto.setB_seqno(1); // b_seqno는 .then(function(result)에서 변수로 저장해서 axios 데이터에 넣는 형식으로 하면 됨

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        System.out.println(paymentTheaterDto);
        try {
            int rowCount = paymentTheaterDao.insert(paymentTheaterDto); // insert가 성공하면 rowCount == 1
            if (rowCount == 0) { // insert 실패
                return new ResponseEntity<String>("PAYMENT_FAIL", HttpStatus.OK);
            } else { // insert 성공하면
                return new ResponseEntity<String>("PAYMENT_OK", HttpStatus.OK);
            }
        }
        catch (Exception e) { //
            e.printStackTrace();
            return new ResponseEntity<String>("PAYMENT_ERROR", HttpStatus.BAD_REQUEST);
        }
    }


    @ResponseBody
    @PostMapping("/payment/movie") // 받은 content_id로 movieDto 하나 select
    public ResponseEntity<String> payment_movie(@RequestBody Map<String, String> data, HttpSession session) {
        MovieDto movieDto = movieDao.selectOneMovie(data.get("content_id"));
        // session에 movieDto, 상영 시간, 극장, 좌석번호 담음
        session.setAttribute("movieDto", movieDto);
        session.setAttribute("time", data.get("time"));
        session.setAttribute("venue", data.get("venue"));
        session.setAttribute("region", data.get("region"));
        session.setAttribute("hall", data.get("hall"));
        session.setAttribute("s_label", data.get("s_label"));

        session.removeAttribute("musicalDto");
        session.removeAttribute("theaterDto");
        return new ResponseEntity<>("success", HttpStatus.OK);
    }
    @ResponseBody
    @PostMapping("/payment/musical")
    public ResponseEntity<String> payment_musical(@RequestBody Map<String, String> data, HttpSession session) {
        MusicalDto musicalDto = musicalDao.select(data.get("content_id"));

        session.setAttribute("musicalDto", musicalDto);
        session.setAttribute("time", data.get("time"));
        session.setAttribute("venue", data.get("venue"));
        session.setAttribute("s_label", data.get("s_label"));

        session.removeAttribute("movieDto");
        session.removeAttribute("theaterDto");
        return new ResponseEntity<>("success", HttpStatus.OK);
    }
    @ResponseBody
    @PostMapping("/payment/theater")
    public ResponseEntity<String> payment_theater(@RequestBody Map<String, String> data, HttpSession session) {
        TheaterDto theaterDto = theaterDao.selectOneMovie(data.get("content_id"));

        session.setAttribute("theaterDto", theaterDto);
        session.setAttribute("time", data.get("time"));
        session.setAttribute("venue", data.get("venue"));
        session.setAttribute("s_label", data.get("s_label"));

        session.removeAttribute("movieDto");
        session.removeAttribute("musicalDto");
        return new ResponseEntity<>("success", HttpStatus.OK);
    }

    @GetMapping("/payment/data/movie") // Axios(payment_movie)에서 여기로 요청
    @ResponseBody
    public Map<String, Object> getPaymentData_movie(HttpSession session) {
        if(session.getAttribute("movieDto") != null) { // 영화 예매이면
            Map<String, Object> result = new HashMap<>(); // map에 담아서 result에 put
            result.put("movieDto", session.getAttribute("movieDto"));
            result.put("time", session.getAttribute("time"));
            result.put("venue", session.getAttribute("venue"));
            result.put("region", session.getAttribute("region"));
            result.put("hall", session.getAttribute("hall"));
            result.put("s_label", session.getAttribute("s_label"));

            return result;
        }
        else {
            return null;
        }
    }
    @GetMapping("/payment/data/musical")
    @ResponseBody
    public Map<String, Object> getPaymentData_musical(HttpSession session) {
        if(session.getAttribute("musicalDto") != null) {
            Map<String, Object> result = new HashMap<>();
            result.put("musicalDto", session.getAttribute("musicalDto"));
            result.put("time", session.getAttribute("time"));
            result.put("venue", session.getAttribute("venue"));
            result.put("s_label", session.getAttribute("s_label"));
            return result;
        }
        else {
            return null;
        }

    }
    @GetMapping("/payment/data/theater")
    @ResponseBody
    public Map<String, Object> getPaymentData_theater(HttpSession session) {
        if(session.getAttribute("theaterDto") != null) {
            Map<String, Object> result = new HashMap<>();
            result.put("theaterDto", session.getAttribute("theaterDto"));
            result.put("time", session.getAttribute("time"));
            result.put("venue", session.getAttribute("venue"));
            result.put("s_label", session.getAttribute("s_label"));
            return result;
        }
        else {
            return null;
        }
    }

}
