// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.easybi.model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.easybi.model.Log;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Log_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Log.entityManager;
    
    public static final List<String> Log.fieldNames4OrderClauseFilter = java.util.Arrays.asList("project", "job", "context", "priority", "type", "origin", "message", "code", "moment", "pid", "root_pid", "father_pid");
    
    public static final EntityManager Log.entityManager() {
        EntityManager em = new Log().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Log.countLogs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Log o", Long.class).getSingleResult();
    }
    
    public static List<Log> Log.findAllLogs() {
        return entityManager().createQuery("SELECT o FROM Log o", Log.class).getResultList();
    }
    
    public static List<Log> Log.findAllLogs(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Log o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Log.class).getResultList();
    }
    
    public static Log Log.findLog(Long id) {
        if (id == null) return null;
        return entityManager().find(Log.class, id);
    }
    
    public static List<Log> Log.findLogEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Log o", Log.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Log> Log.findLogEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Log o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Log.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Log.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Log.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Log attached = Log.findLog(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Log.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Log.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Log Log.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Log merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}