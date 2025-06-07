package com.bitstudy.app.service;

import com.bitstudy.app.domain.RecentlistDto;
import com.bitstudy.app.domain.UserDto;
import com.bitstudy.app.domain.WishlistDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface MypageService {
    UserDto selectUser(String u_id);

    int remove(String u_id);

    int modify(UserDto userDto);

    int findSeqnoByUserId(String u_id);

    List<WishlistDto> getAllWishlist(int u_seqno);

    void addWishContent(int u_seqno, String w_contentType, String w_id);

    void removeWishContent(int u_seqno, String w_contentType, String w_id);

    List<RecentlistDto> getRecentByUserSeqno(int u_seqno);
}
