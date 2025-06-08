package com.bitstudy.app.dao;

import com.bitstudy.app.domain.WishlistDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MovieWishDaoImpl implements MovieWishDao {

    String nameSpace = "com.bitstudy.app.dao.movieWishMapper.";

    @Autowired
    private SqlSession session;

    @Override
    public List<WishlistDto> selectWM(int u_seqno){
        return session.selectList(nameSpace+"selectWM", u_seqno);
    }

    @Override
    public int insertWM(int u_seqno, String m_seqno){
        Map map = new HashMap();
        map.put("u_seqno",u_seqno);
        map.put("m_seqno",m_seqno);

        return session.insert(nameSpace+"insertWM", map);
    }

    @Override
    public int deleteWM(int u_seqno, String m_seqno){
        Map map = new HashMap();
        map.put("u_seqno",u_seqno);
        map.put("m_seqno",m_seqno);

        return session.delete(nameSpace+"deleteWM", map);
    }

    @Override
    public void deleteByUserSeqno(int u_seqno){
        session.delete(nameSpace+"deleteByUserSeqno", u_seqno);
    }
}
