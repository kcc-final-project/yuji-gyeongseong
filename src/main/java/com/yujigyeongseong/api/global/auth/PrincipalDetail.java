package com.yujigyeongseong.api.global.auth;

import com.yujigyeongseong.api.domain.member.dto.SignUpMember;
import com.yujigyeongseong.api.domain.member.dto.auth.MemRole;
import com.yujigyeongseong.api.domain.member.dto.auth.MemberLogin;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class PrincipalDetail implements UserDetails {
    private MemberLogin user;

    public PrincipalDetail(MemberLogin user) {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        List<MemRole> roles = user.getRoles();
        for (int i = 0; i < roles.size(); i++) {
            MemRole role = roles.get(i);
            authorities.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName()));
        }
        return authorities;
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public String getName(){
        return user.getName();
    }

    public Long getId(){
        return user.getMemNo();
    }

    public Long getRsrchNo(){
        return user.getRsrchNo();
    }
}
