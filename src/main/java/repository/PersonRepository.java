package repository;

import model.Person;
import util.DbUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class PersonRepository {

    private EntityManager em;

    public PersonRepository() {
        em = DbUtil.getEntityManager();
    }

    public void save (Person person) {
        try {
            em.getTransaction().begin();
            em.persist(person);
            em.getTransaction().commit();
        } catch (Exception ex) {
            em.getTransaction().rollback();
        }
    }
    public List<Person> listAll() {
        String sql ="FROM Person p";
        return em.createQuery(sql).getResultList();
    }


}
