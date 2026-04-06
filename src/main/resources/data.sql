-- Table ETUDIANT
INSERT INTO ETUDIANT (id, nom, prenom) VALUES ('ST001', 'Dupont', 'Marie') ON CONFLICT (id) DO NOTHING;;
INSERT INTO ETUDIANT (id, nom, prenom) VALUES ('ST002', 'Durand', 'Lucas') ON CONFLICT (id) DO NOTHING;;
INSERT INTO ETUDIANT (id, nom, prenom) VALUES ('ST003', 'Lefebvre', 'Chloé') ON CONFLICT (id) DO NOTHING;;

-- Table ENSEIGNANT
INSERT INTO ENSEIGNANT (id, nom, prenom) VALUES ('T001', 'Martin', 'Jean') ON CONFLICT (id) DO NOTHING;
INSERT INTO ENSEIGNANT (id, nom, prenom) VALUES ('T002', 'Bernard', 'Sophie') ON CONFLICT (id) DO NOTHING;

-- Table COURS
INSERT INTO COURS (id, titre, departement, credit, descript, horaire, salle) VALUES ('CS101', 'Intro Informatique', 'Informatique', '4', 'Bases de la programmation', '2024-09-01', 'Amphi A') ON CONFLICT (id) DO NOTHING;
INSERT INTO COURS (id, titre, departement, credit, descript, horaire, salle) VALUES ('PHY305', 'Physique Quantique', 'Physique', '6', 'Introduction aux particules', '2024-09-02', 'Salle 302') ON CONFLICT (id) DO NOTHING;
INSERT INTO COURS (id, titre, departement, credit, descript, horaire, salle) VALUES ('ECO202', 'Macroéconomie', 'Économie', '3', 'Étude des agrégats économiques', '2024-09-03', 'Salle 105') ON CONFLICT (id) DO NOTHING;

-- Table ETUDIANTCOURS
INSERT INTO ETUDIANTCOURS (id, etudiant_id, cours_id) VALUES ('L001', 'ST001', 'CS101') ON CONFLICT (id) DO NOTHING;
INSERT INTO ETUDIANTCOURS (id, etudiant_id, cours_id) VALUES ('L002', 'ST001', 'PHY305') ON CONFLICT (id) DO NOTHING;
INSERT INTO ETUDIANTCOURS (id, etudiant_id, cours_id) VALUES ('L003', 'ST002', 'ECO202') ON CONFLICT (id) DO NOTHING;

-- Table ENSEIGNANTCOURS
INSERT INTO ENSEIGNANTCOURS (id, enseignant_id, cours_id) VALUES ('EL001', 'T001', 'CS101') ON CONFLICT (id) DO NOTHING;
INSERT INTO ENSEIGNANTCOURS (id, enseignant_id, cours_id) VALUES ('EL002', 'T002', 'PHY305') ON CONFLICT (id) DO NOTHING;
