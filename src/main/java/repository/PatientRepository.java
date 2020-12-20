package repository;

import model.Patient;

import java.util.List;

public class PatientRepository implements Repository<Patient> {


    @Override
    public Patient save(Patient obj) {
        return null;
    }

    @Override
    public void delete(Patient obj) {

    }

    @Override
    public Patient findById(int id) {
        return null;
    }

    @Override
    public List<Patient> findAll() {
        return null;
    }
}
