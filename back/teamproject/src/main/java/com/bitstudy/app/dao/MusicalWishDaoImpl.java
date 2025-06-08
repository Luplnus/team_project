package com.bitstudy.app.dao;

import com.bitstudy.app.domain.WishlistDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MusicalWishDaoImpl implements MusicalWishDao {

    String nameSpace = "com.bitstudy.app.dao.musicalWishMapper.";

    @Autowired
    private SqlSession session;

    @Override
    public List<WishlistDto> selectWMU(int u_seqno){
        return session.selectList(nameSpace+"selectWMU", u_seqno);
    }

    @Override
    public int insertWMU(int u_seqno, String mu_id){
        Map map = new HashMap();
        map.put("u_seqno",u_seqno);
        map.put("mu_id",mu_id);

        return session.insert(nameSpace+"insertWMU", map);
    }

    @Override
    public int deleteWMU(int u_seqno, String mu_id){
        Map map = new HashMap();
        map.put("u_seqno",u_seqno);
        map.put("mu_id",mu_id);

        return session.delete(nameSpace+"deleteWMU", map);
    }

    @Override
    public void deleteByUserSeqno(int u_seqno){
        session.delete(nameSpace+"deleteByUserSeqno", u_seqno);
    }

}
