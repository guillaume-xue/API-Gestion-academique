package com.gui.api_service.models;

import jakarta.persistence.*;

@Entity
@Table(name = "etudiant")
public class Etudiant {

    @Id
    private String id;
    private String nom;
    private String prenom;

    // Constructeur vide obligatoire pour Spring/Hibernate
    public Etudiant() {}

    public Etudiant(String nom, String prenom) {
        this.nom = nom;
        this.prenom = prenom;
    }

    // Getters et Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }
}
