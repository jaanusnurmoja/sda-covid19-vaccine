package repository;

import java.util.List;

public interface Repository<T> {

    T save(T obj);
    void delete (T obj);
    T findById (int id);
    List<T> findAll();
}
