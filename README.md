# API Gestion Académique

API REST pour la gestion des étudiants, enseignants et cours dans une institution académique.

## 📋 Table des matières

- [Description](#description)
- [Stack technologique](#stack-technologique)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Configuration](#configuration)
- [Démarrage](#démarrage)
- [API Endpoints](#api-endpoints)
- [Structure de la base de données](#structure-de-la-base-de-données)
- [Architecture du projet](#architecture-du-projet)

## 📝 Description

API REST permettant de gérer les informations académiques, incluant :
- Gestion des étudiants
- Gestion des enseignants
- Gestion des cours
- Inscription des étudiants aux cours

## 🛠️ Stack technologique

- **Langage** : Java 21
- **Framework** : Spring Boot 4.0.5
- **ORM** : Hibernate/JPA
- **Base de données** : PostgreSQL
- **Build** : Maven
- **Console H2** : Disponible pour le développement

## ✅ Prérequis

- Java 21 ou supérieur
- Maven 3.6+
- PostgreSQL 12+ (ou système compatible)
- Git

## 📦 Installation

1. **Cloner le repository** :
```bash
git clone <repository-url>
cd API-Gestion-academique
```

2. **Installer les dépendances** :
```bash
mvn clean install
```

## ⚙️ Configuration

### Configuration de la base de données

Modifiez `src/main/resources/application.properties` avec vos paramètres PostgreSQL :

```properties
spring.datasource.url=jdbc:postgresql://localhost:5433/education
spring.datasource.username=postgres
spring.datasource.password=mon_pass
```

### Paramètres disponibles

```properties
# URL de connexion à PostgreSQL
spring.datasource.url=jdbc:postgresql://localhost:5433/education

# Identifiants
spring.datasource.username=postgres
spring.datasource.password=mon_pass

# Driver PostgreSQL
spring.datasource.driver-class-name=org.postgresql.Driver

# Hibernate - gère les migrations de schéma
spring.jpa.hibernate.ddl-auto=update

# Mode d'initialisation SQL
spring.sql.init.mode=always

# Logs SQL (utile pour le débogage)
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
```

## 🚀 Démarrage

### Via Maven

```bash
mvn spring-boot:run
```

### Via Java directement

```bash
mvn clean package
java -jar target/api-service-0.0.1-SNAPSHOT.jar
```

L'application démarre par défaut sur **http://localhost:8080**

## 📡 API Endpoints

### Étudiants

#### Get tous les étudiants
```http
GET /api/etudiants
```
**Response** : Liste de tous les étudiants
```json
[
  {
    "id": "ST001",
    "nom": "Dupont",
    "prenom": "Jean"
  }
]
```

#### Get un étudiant par ID
```http
GET /api/etudiants/{id}
```
**Exemple** : `GET /api/etudiants/ST001`

**Response** :
```json
{
  "id": "ST001",
  "nom": "Dupont",
  "prenom": "Jean"
}
```

## 📊 Structure de la base de données

### Table ETUDIANT
```sql
CREATE TABLE ETUDIANT (
    id VARCHAR(10) PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL
);
```

### Table ENSEIGNANT
```sql
CREATE TABLE ENSEIGNANT (
    id VARCHAR(10) PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL
);
```

### Table COURS
```sql
CREATE TABLE COURS (
    id VARCHAR(16) PRIMARY KEY,
    titre VARCHAR(64) NOT NULL,
    departement VARCHAR(128) NOT NULL,
    credit INT NOT NULL,
    descript TEXT NOT NULL,
    horaire DATE NOT NULL,
    salle VARCHAR(64)
);
```

### Table ETUDIANTCOURS (Relation Many-to-Many)
```sql
CREATE TABLE ETUDIANTCOURS (
    id VARCHAR(10) PRIMARY KEY,
    etudiant_id VARCHAR(10) NOT NULL,
    cours_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (etudiant_id) REFERENCES ETUDIANT(id),
    FOREIGN KEY (cours_id) REFERENCES COURS(id)
);
```

## 📁 Architecture du projet

```
src/
├── main/
│   ├── java/com/gui/api_service/
│   │   ├── ApiServiceApplication.java       # Point d'entrée Spring Boot
│   │   ├── controllers/
│   │   │   └── EtudiantController.java      # Endpoints pour les étudiants
│   │   ├── models/
│   │   │   └── Etudiant.java               # Entité Etudiant (JPA)
│   │   └── repositories/
│   │       └── EtudiantRepository.java      # Accès données Etudiant
│   └── resources/
│       ├── application.properties           # Configuration Spring
│       ├── schema.sql                       # Schéma de base de données
│       └── data.sql                         # Données initiales
└── test/
    └── java/com/gui/api_service/
        └── ApiServiceApplicationTests.java  # Tests
```

## 🔧 Développement

### Voir les requêtes SQL
Les requêtes SQL sont affichées dans la console grâce à la configuration :
```properties
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
```

### Console H2
Une console H2 est disponible pour le développement. Consultez la configuration Spring Boot officielle pour y accéder.

## 📝 Notes

- Le DDL auto est configuré à `update`, ce qui signifie que Hibernate met à jour automatiquement le schéma
- Le fichier `schema.sql` s'exécute toujours au démarrage (`spring.sql.init.mode=always`)
- Les données de test peuvent être ajoutées dans `data.sql`

## ✨ Future améliorations

- [ ] Endpoints CRUD complets pour tous les modèles
- [ ] Gestion des erreurs améliorée avec codes HTTP appropriés
- [ ] Validation des données avec annotations Bean Validation
- [ ] Documentation OpenAPI/Swagger
- [ ] Authentification et autorisation
- [ ] Tests unitaires et d'intégration

## 📞 Support

Pour toute question ou problème, consultez la documentation Spring Boot : https://spring.io/projects/spring-boot
