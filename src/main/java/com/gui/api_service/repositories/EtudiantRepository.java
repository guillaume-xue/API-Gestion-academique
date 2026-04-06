package com.gui.api_service.repositories;

import com.gui.api_service.models.Etudiant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EtudiantRepository extends JpaRepository<Etudiant, String> {
    // L'interface est vide, mais Spring Boot va générer automatiquement
    // toutes les méthodes nécessaires (save, findAll, findById, deleteById...)
}
