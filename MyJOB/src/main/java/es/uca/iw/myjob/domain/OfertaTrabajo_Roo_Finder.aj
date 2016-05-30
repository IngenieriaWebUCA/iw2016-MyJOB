// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.myjob.domain;

import es.uca.iw.myjob.domain.OfertaTrabajo;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect OfertaTrabajo_Roo_Finder {
    
    public static Long OfertaTrabajo.countFindOfertaTrabajoesByNombreIsNullOrTipologia_contratoIsNullOrSueldo_brutoIsNullOrFecha_aprox_inicIsNullOrNum_vacantesIsNullOrFormacionIsNullOrExperiencia_previaIsNull() {
        EntityManager em = OfertaTrabajo.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM OfertaTrabajo AS o WHERE o.nombre IS NULL  OR o.tipologia_contrato IS NULL  OR o.sueldo_bruto IS NULL  OR o.fecha_aprox_inic IS NULL  OR o.num_vacantes IS NULL  OR o.formacion IS NULL  OR o.experiencia_previa IS NULL", Long.class);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<OfertaTrabajo> OfertaTrabajo.findOfertaTrabajoesByNombreIsNullOrTipologia_contratoIsNullOrSueldo_brutoIsNullOrFecha_aprox_inicIsNullOrNum_vacantesIsNullOrFormacionIsNullOrExperiencia_previaIsNull() {
        EntityManager em = OfertaTrabajo.entityManager();
        TypedQuery<OfertaTrabajo> q = em.createQuery("SELECT o FROM OfertaTrabajo AS o WHERE o.nombre IS NULL  OR o.tipologia_contrato IS NULL  OR o.sueldo_bruto IS NULL  OR o.fecha_aprox_inic IS NULL  OR o.num_vacantes IS NULL  OR o.formacion IS NULL  OR o.experiencia_previa IS NULL", OfertaTrabajo.class);
        return q;
    }
    
    public static TypedQuery<OfertaTrabajo> OfertaTrabajo.findOfertaTrabajoesByNombreIsNullOrTipologia_contratoIsNullOrSueldo_brutoIsNullOrFecha_aprox_inicIsNullOrNum_vacantesIsNullOrFormacionIsNullOrExperiencia_previaIsNull(String sortFieldName, String sortOrder) {
        EntityManager em = OfertaTrabajo.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM OfertaTrabajo AS o WHERE o.nombre IS NULL  OR o.tipologia_contrato IS NULL  OR o.sueldo_bruto IS NULL  OR o.fecha_aprox_inic IS NULL  OR o.num_vacantes IS NULL  OR o.formacion IS NULL  OR o.experiencia_previa IS NULL");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<OfertaTrabajo> q = em.createQuery(queryBuilder.toString(), OfertaTrabajo.class);
        return q;
    }
    
}
