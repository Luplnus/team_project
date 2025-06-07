package com.bitstudy.app.dao;

import com.bitstudy.app.domain.WishlistDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class TheaterWishDaoImpl implements TheaterWishDao {

    String nameSpace = "com.bitstudy.app.dao.theaterWishMapper.";

    @Autowired
    private SqlSession session;

    @Override
    public List<WishlistDto> selectWT(int u_seqno){
        return session.selectList(nameSpace+"selectWT", u_seqno);
    }

    @Override
    public int insertWT(int u_seqno, String t_id){
        Map map = new HashMap();
        map.put("u_seqno",u_seqno);
        map.put("t_id",t_id);

        return session.insert(nameSpace+"insertWT", map);
    }

    @Override
    public int deleteWT(int u_seqno, String t_id){
        Map map = new HashMap();
        map.put("u_seqno",u_seqno);
        map.put("t_id",t_id);

        return session.delete(nameSpace+"deleteWT", map);
    }

    @Override
    public void deleteByUserSeqno(int u_seqno){
        session.delete(nameSpace+"deleteByUserSeqno", u_seqno);
    }
}
