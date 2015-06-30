package org.easybi.security;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.Enumerated;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class SecurityUser {

    /**
     */
    @NotNull
    @Size(min = 3, max = 50)
    private String username;

    /**
     */
    @NotNull
    @Size(min = 3)
    private String password;

    /**
     */
    @Enumerated
    private Authority authority;

    /**
     */
    private Boolean enabled;
}
