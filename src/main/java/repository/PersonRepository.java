package repository;

import model.Person;
import util.DbUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class PersonRepository implements Repository<Person>{

    private EntityManager em;

    public PersonRepository() {
        em = DbUtil.getEntityManager();
    }

    public Person save (Person person) {
        try {
            em.getTransaction().begin();
            if (person.getPersonId() > 0){
                em.merge(person);
            } else {
                em.persist(person);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            em.getTransaction().rollback();
        }
        return person;
    }

    @Override
    public void delete(Person person) {
        try {
            em.getTransaction().begin();
            em.remove(em.merge(person));
            em.getTransaction().commit();
        } catch (Exception ex) {
            em.getTransaction().rollback();
        }

    }

    @Override
    public Person findById(int id) {
        String sql ="FROM Person p WHERE p.personId = :id";
        return em.createQuery(sql, Person.class).setParameter("id", id).getSingleResult();

    }

    @Override
    public List<Person> findAll() {
        String sql ="FROM Person p";
        return em.createQuery(sql).getResultList();
    }


}
