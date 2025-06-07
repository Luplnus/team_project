package com.bitstudy.app.service;

import com.bitstudy.app.dao.*;
import com.bitstudy.app.domain.RecentlistDto;
import com.bitstudy.app.domain.UserDto;
import com.bitstudy.app.domain.WishlistDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class MypageServiceImpl implements MypageService {
    @Autowired
    UserDao userDao;
    @Autowired
    MovieWishDao movieWishDao;
    @Autowired
    TheaterWishDao theaterWishDao;
    @Autowired
    MusicalWishDao musicalWishDao;
    @Autowired
    RecentlistDao recentlistDao;

    @Override
    public UserDto selectUser(String u_id){
        return userDao.selectUser(u_id);
    }

    @Override
    public int remove(String u_id){

        int u_seqno = userDao.selectUserSeqnoById(u_id);

        if (u_seqno == 0) {
            return 0;
        }

        movieWishDao.deleteByUserSeqno(u_seqno);
        theaterWishDao.deleteByUserSeqno(u_seqno);
        musicalWishDao.deleteByUserSeqno(u_seqno);

        return userDao.deleteUser(u_id);
    }

    @Override
    public int modify(UserDto userDto){
        return userDao.updateUser(userDto);
    }

    @Override
    public int findSeqnoByUserId(String u_id) {
        return userDao.selectUserSeqnoById(u_id);
    }

    @Override
    public List<WishlistDto> getAllWishlist(int u_seqno) {
        List<WishlistDto> arr = new ArrayList<>();

        List<WishlistDto> movieList = movieWishDao.selectWM(u_seqno);
        arr.addAll(movieList);

        List<WishlistDto> theaterList = theaterWishDao.selectWT(u_seqno);
        arr.addAll(theaterList);

        List<WishlistDto> musicalList = musicalWishDao.selectWMU(u_seqno);
        arr.addAll(musicalList);

        return arr;
    }

    @Override
    public void addWishContent(int u_seqno, String w_contentType, String w_id) {
        switch (w_contentType) {
            case "movie":
                movieWishDao.insertWM(u_seqno, w_id);
                break;
            case "theater":
                theaterWishDao.insertWT(u_seqno, w_id);
                break;
            case "musical":
                musicalWishDao.insertWMU(u_seqno, w_id);
                break;
            default:
                throw new IllegalArgumentException("지원하지 않는 w_contentType: " + w_contentType);
        }
    }

    @Transactional
    @Override
    public void removeWishContent(int u_seqno, String w_contentType, String w_id) {
        switch (w_contentType) {
            case "movie":
                movieWishDao.deleteWM(u_seqno, w_id);
                break;
            case "theater":
                theaterWishDao.deleteWT(u_seqno, w_id);
                break;
            case "musical":
                musicalWishDao.deleteWMU(u_seqno, w_id);
                break;
            default:
                throw new IllegalArgumentException("지원하지 않는 w_contentType: " + w_contentType);
        }
    }

    @Override
    public List<RecentlistDto> getRecentByUserSeqno(int u_seqno) {
        return recentlistDao.selectRecentByUserSeqno(u_seqno);
    }
}
