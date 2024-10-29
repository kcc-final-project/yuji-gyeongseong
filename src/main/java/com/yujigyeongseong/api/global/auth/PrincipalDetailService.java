package com.yujigyeongseong.api.global.auth;

import com.yujigyeongseong.api.domain.member.dao.MemberMapper;
import com.yujigyeongseong.api.domain.member.dto.SignUpMember;
import com.yujigyeongseong.api.domain.member.dto.auth.MemRole;
import com.yujigyeongseong.api.domain.member.dto.auth.MemberLogin;
import com.yujigyeongseong.api.domain.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PrincipalDetailService implements UserDetailsService {

    private final MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        MemberLogin member = memberMapper.findByUsername(username);

        if (member == null) {
            throw new UsernameNotFoundException("존재하지 않는 회원 : : " + username);
        }
        PrincipalDetail principalDetail = new PrincipalDetail(member);
        return principalDetail;

    }
}
