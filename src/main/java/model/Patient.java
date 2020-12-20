package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "patients")

public class Patient  implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "patientId", insertable = false, nullable = false)
    private int patientId;
    @OneToOne
    @JoinColumn(name = "personId")
    private Person person;
    private int regNr;
    @OneToMany (mappedBy = "patient")
    private List<Appointment> appointments;

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public int getRegNr() {
        return regNr;
    }

    public void setRegNr(int regNr) {
        this.regNr = regNr;
    }

    public List<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(List<Appointment> appointments) {
        this.appointments = appointments;
    }

    @Override
    public String toString() {
        return "Patient{" +
                "patientId=" + patientId +
                ", person=" + person +
                ", regNr=" + regNr +
//                ", appointments=" + appointments +
                '}';
    }
}
