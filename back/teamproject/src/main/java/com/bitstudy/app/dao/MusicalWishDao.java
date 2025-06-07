package com.bitstudy.app.dao;

import com.bitstudy.app.domain.WishlistDto;

import java.util.List;

public interface MusicalWishDao {
    List<WishlistDto> selectWMU(int u_seqno);

    int insertWMU(int u_seqno, String mu_id);

    int deleteWMU(int u_seqno, String mu_id);

    void deleteByUserSeqno(int u_seqno);
}
