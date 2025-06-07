package com.bitstudy.app.dao;

import com.bitstudy.app.domain.WishlistDto;

import java.util.List;

public interface TheaterWishDao {
    List<WishlistDto> selectWT(int u_seqno);

    int insertWT(int u_seqno, String t_id);

    int deleteWT(int u_seqno, String t_id);

    void deleteByUserSeqno(int u_seqno);
}
