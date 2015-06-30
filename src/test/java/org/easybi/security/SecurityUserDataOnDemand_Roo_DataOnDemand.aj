// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.easybi.security;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.easybi.security.Authority;
import org.easybi.security.SecurityUser;
import org.easybi.security.SecurityUserDataOnDemand;
import org.springframework.stereotype.Component;

privileged aspect SecurityUserDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SecurityUserDataOnDemand: @Component;
    
    private Random SecurityUserDataOnDemand.rnd = new SecureRandom();
    
    private List<SecurityUser> SecurityUserDataOnDemand.data;
    
    public SecurityUser SecurityUserDataOnDemand.getNewTransientSecurityUser(int index) {
        SecurityUser obj = new SecurityUser();
        setAuthority(obj, index);
        setEnabled(obj, index);
        setPassword(obj, index);
        setUsername(obj, index);
        return obj;
    }
    
    public void SecurityUserDataOnDemand.setAuthority(SecurityUser obj, int index) {
        Authority authority = Authority.class.getEnumConstants()[0];
        obj.setAuthority(authority);
    }
    
    public void SecurityUserDataOnDemand.setEnabled(SecurityUser obj, int index) {
        Boolean enabled = Boolean.TRUE;
        obj.setEnabled(enabled);
    }
    
    public void SecurityUserDataOnDemand.setPassword(SecurityUser obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void SecurityUserDataOnDemand.setUsername(SecurityUser obj, int index) {
        String username = "username_" + index;
        if (username.length() > 50) {
            username = username.substring(0, 50);
        }
        obj.setUsername(username);
    }
    
    public SecurityUser SecurityUserDataOnDemand.getSpecificSecurityUser(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        SecurityUser obj = data.get(index);
        Long id = obj.getId();
        return SecurityUser.findSecurityUser(id);
    }
    
    public SecurityUser SecurityUserDataOnDemand.getRandomSecurityUser() {
        init();
        SecurityUser obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return SecurityUser.findSecurityUser(id);
    }
    
    public boolean SecurityUserDataOnDemand.modifySecurityUser(SecurityUser obj) {
        return false;
    }
    
    public void SecurityUserDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = SecurityUser.findSecurityUserEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'SecurityUser' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<SecurityUser>();
        for (int i = 0; i < 10; i++) {
            SecurityUser obj = getNewTransientSecurityUser(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}