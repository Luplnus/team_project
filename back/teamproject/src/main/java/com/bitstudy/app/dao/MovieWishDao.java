package com.bitstudy.app.dao;

import com.bitstudy.app.domain.WishlistDto;

import java.util.List;

public interface MovieWishDao {
    List<WishlistDto> selectWM(int u_seqno);

    int insertWM(int u_seqno, String m_seqno);

    int deleteWM(int u_seqno, String m_seqno);

    void deleteByUserSeqno(int u_seqno);
}
