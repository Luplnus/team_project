package com.bitstudy.app.dao;

import com.bitstudy.app.domain.RecentlistDto;

import java.util.List;

public interface RecentlistDao {
    List<RecentlistDto> selectRecentByUserSeqno(int u_seqno);
}
