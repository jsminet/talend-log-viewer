// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.easybi.model;

import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.easybi.model.Flow;

privileged aspect Flow_Roo_Finder {
    
    public static Long Flow.countFindFlowsByProjectEqualsOrJobEqualsOrJob_versionEqualsOrContextEqualsOrOriginEqualsOrLabelLikeOrMomentBetween(String project, String job, String job_version, String context, String origin, String label, Date minMoment, Date maxMoment) {
        if (project == null || project.length() == 0) throw new IllegalArgumentException("The project argument is required");
        if (job == null || job.length() == 0) throw new IllegalArgumentException("The job argument is required");
        if (job_version == null || job_version.length() == 0) throw new IllegalArgumentException("The job_version argument is required");
        if (context == null || context.length() == 0) throw new IllegalArgumentException("The context argument is required");
        if (origin == null || origin.length() == 0) throw new IllegalArgumentException("The origin argument is required");
        if (label == null || label.length() == 0) throw new IllegalArgumentException("The label argument is required");
        label = label.replace('*', '%');
        if (label.charAt(0) != '%') {
            label = "%" + label;
        }
        if (label.charAt(label.length() - 1) != '%') {
            label = label + "%";
        }
        if (minMoment == null) throw new IllegalArgumentException("The minMoment argument is required");
        if (maxMoment == null) throw new IllegalArgumentException("The maxMoment argument is required");
        EntityManager em = Flow.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Flow AS o WHERE o.project = :project  OR o.job = :job  OR o.job_version = :job_version  OR o.context = :context  OR o.origin = :origin  OR LOWER(o.label) LIKE LOWER(:label)  OR o.moment BETWEEN :minMoment AND :maxMoment", Long.class);
        q.setParameter("project", project);
        q.setParameter("job", job);
        q.setParameter("job_version", job_version);
        q.setParameter("context", context);
        q.setParameter("origin", origin);
        q.setParameter("label", label);
        q.setParameter("minMoment", minMoment);
        q.setParameter("maxMoment", maxMoment);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<Flow> Flow.findFlowsByProjectEqualsOrJobEqualsOrJob_versionEqualsOrContextEqualsOrOriginEqualsOrLabelLikeOrMomentBetween(String project, String job, String job_version, String context, String origin, String label, Date minMoment, Date maxMoment) {
        if (project == null || project.length() == 0) throw new IllegalArgumentException("The project argument is required");
        if (job == null || job.length() == 0) throw new IllegalArgumentException("The job argument is required");
        if (job_version == null || job_version.length() == 0) throw new IllegalArgumentException("The job_version argument is required");
        if (context == null || context.length() == 0) throw new IllegalArgumentException("The context argument is required");
        if (origin == null || origin.length() == 0) throw new IllegalArgumentException("The origin argument is required");
        if (label == null || label.length() == 0) throw new IllegalArgumentException("The label argument is required");
        label = label.replace('*', '%');
        if (label.charAt(0) != '%') {
            label = "%" + label;
        }
        if (label.charAt(label.length() - 1) != '%') {
            label = label + "%";
        }
        if (minMoment == null) throw new IllegalArgumentException("The minMoment argument is required");
        if (maxMoment == null) throw new IllegalArgumentException("The maxMoment argument is required");
        EntityManager em = Flow.entityManager();
        TypedQuery<Flow> q = em.createQuery("SELECT o FROM Flow AS o WHERE o.project = :project  OR o.job = :job  OR o.job_version = :job_version  OR o.context = :context  OR o.origin = :origin  OR LOWER(o.label) LIKE LOWER(:label)  OR o.moment BETWEEN :minMoment AND :maxMoment", Flow.class);
        q.setParameter("project", project);
        q.setParameter("job", job);
        q.setParameter("job_version", job_version);
        q.setParameter("context", context);
        q.setParameter("origin", origin);
        q.setParameter("label", label);
        q.setParameter("minMoment", minMoment);
        q.setParameter("maxMoment", maxMoment);
        return q;
    }
    
    public static TypedQuery<Flow> Flow.findFlowsByProjectEqualsOrJobEqualsOrJob_versionEqualsOrContextEqualsOrOriginEqualsOrLabelLikeOrMomentBetween(String project, String job, String job_version, String context, String origin, String label, Date minMoment, Date maxMoment, String sortFieldName, String sortOrder) {
        if (project == null || project.length() == 0) throw new IllegalArgumentException("The project argument is required");
        if (job == null || job.length() == 0) throw new IllegalArgumentException("The job argument is required");
        if (job_version == null || job_version.length() == 0) throw new IllegalArgumentException("The job_version argument is required");
        if (context == null || context.length() == 0) throw new IllegalArgumentException("The context argument is required");
        if (origin == null || origin.length() == 0) throw new IllegalArgumentException("The origin argument is required");
        if (label == null || label.length() == 0) throw new IllegalArgumentException("The label argument is required");
        label = label.replace('*', '%');
        if (label.charAt(0) != '%') {
            label = "%" + label;
        }
        if (label.charAt(label.length() - 1) != '%') {
            label = label + "%";
        }
        if (minMoment == null) throw new IllegalArgumentException("The minMoment argument is required");
        if (maxMoment == null) throw new IllegalArgumentException("The maxMoment argument is required");
        EntityManager em = Flow.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM Flow AS o WHERE o.project = :project  OR o.job = :job  OR o.job_version = :job_version  OR o.context = :context  OR o.origin = :origin  OR LOWER(o.label) LIKE LOWER(:label)  OR o.moment BETWEEN :minMoment AND :maxMoment");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<Flow> q = em.createQuery(queryBuilder.toString(), Flow.class);
        q.setParameter("project", project);
        q.setParameter("job", job);
        q.setParameter("job_version", job_version);
        q.setParameter("context", context);
        q.setParameter("origin", origin);
        q.setParameter("label", label);
        q.setParameter("minMoment", minMoment);
        q.setParameter("maxMoment", maxMoment);
        return q;
    }
    
}
