package org.easybi.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.Size;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findStatsByProjectEqualsOrJobEqualsOrJob_versionEqualsOrContextEqualsOrOriginEqualsOrMessage_typeEqualsOrMessageEqualsOrMomentBetween" })
public class Stat {

    /**
     */
    @Size(max = 50)
    private String project;

    /**
     */
    @Size(max = 255)
    private String job;

    /**
     */
    @Size(max = 255)
    private String job_version;

    /**
     */
    @Size(max = 50)
    private String context;

    /**
     */
    @Size(max = 255)
    private String origin;

    /**
     */
    @Size(max = 255)
    private String message_type;

    /**
     */
    @Size(max = 255)
    private String message;

    /**
     */
    private BigInteger duration;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss a")
    private Date moment;

    /**
     */
    @Size(max = 20)
    private String pid;

    /**
     */
    @Size(max = 20)
    private String father_pid;

    /**
     */
    @Size(max = 20)
    private String root_pid;

    /**
     */
    private BigInteger system_pid;

    /**
     */
    @Size(max = 255)
    private String job_repository_id;
}
