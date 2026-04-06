package com.gui.api_service.controllers;

import com.gui.api_service.models.Etudiant;
import com.gui.api_service.repositories.EtudiantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/etudiants")
public class EtudiantController {

    @Autowired
    private EtudiantRepository etudiantRepository;

    // Récupérer TOUS les étudiants (GET http://localhost:8080/api/etudiants)
    @GetMapping
    public List<Etudiant> getAllEtudiants() {
        return etudiantRepository.findAll();
    }

    // Récupérer UN étudiant précis via son ID (GET http://localhost:8080/api/etudiants/ST001)
    @GetMapping("/{id}")
    public Etudiant getEtudiantById(@PathVariable String id) {
        Optional<Etudiant> etudiant = etudiantRepository.findById(id);
        // Si l'étudiant existe on le retourne, sinon on retourne null (ou on pourrait gérer une erreur 404)
        return etudiant.orElse(null);
    }
}
