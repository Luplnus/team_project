package com.bitstudy.app.dao;

import java.util.List;

import com.bitstudy.app.domain.RecentlistDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecentlistDaoImpl implements RecentlistDao {

    @Autowired
    private SqlSessionTemplate session;

    String nameSpace = "com.bitstudy.app.dao.recentMapper.";

    @Override
    public List<RecentlistDto> selectRecentByUserSeqno(int u_seqno) {
        return session.selectList(nameSpace + "selectRecentByUser", u_seqno);
    }
}
