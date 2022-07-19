drop table if exists Societe_zonesGeographiques;
drop table if exists zonesGeographiques;
drop table if exists societe;

create table societe(
    id int primary key,
    nom varchar(100) not null,
    dateCreation date,
    CA2019 varchar(100),
    CA2020 varchar(100),
    CA2021 varchar(100),
    minFreelance int,
    maxFreelance int,
    zoneGeographique varchar(100),
    domaine varchar(100),
    sousDomaine varchar(100),
    TJMmin int,
    TJMmax int,
    matchOffreDemande text,
    assuranceRCPRO boolean, -- boolean correspond à un boolean
    paiementImmediat boolean,
    assuranceSante boolean,
    signatureElectronique boolean,
    aideCreationEntreprise boolean,
    accompagnementFreelanceSimulationRemuneration boolean,
    accompagnementFreelanceCreationME boolean,
    accompagnementFreelancePS boolean,
    evaluationClients boolean,
    modeContratPropose varchar(100),
    siteWeb varchar(100)
);

create table zonesGeographiques(
    id int primary key,
    valeur varchar(30)
);

create table Societe_zonesGeographiques(
    id_societe int,
    id_zoneGeographique int,
    FOREIGN KEY(id_societe) REFERENCES societe(id),
    FOREIGN KEY(id_zoneGeographique) REFERENCES zonesGeographiques(id)
);

INSERT INTO zonesGeographiques VALUES
(1, "Île-de-France"),
(2, "Régions"),
(3, "International");

INSERT INTO societe VALUES
(1, '400 Partners', '2018-04-18', NULL, NULL, NULL, 100, 300, 'Ile de France', 'Management de Transition', NULL, 600, 5000, 'Commerciaux', FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 'Facturation indirecte', 'www.400.partners/'),
(2, '404 WORKS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.404works.com'),
(3, '5 EUROS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.5euros.com'),
(4, '99 DESIGNS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.99designs.com'),
(5, 'ACRACY', '2020-01-01', NULL, 'Entre 1 et 5M €', 'Entre 5 et 10M €', 100, 300, 'Ile de France', 'Marketing', 'Création / Social Média / Design', 600, 5000, 'Via une IA, commerciaux ou chargés de recherches', FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, 'Facturation indirecte', 'www.acracy.co'), 
(6, 'AD-AND-CO', '2012-10-12', NULL, NULL, NULL, 0, 50, 'France', 'Autre', 'Formation des indépendants', 100, 300, 'Via les réponses aux annonces et aux commerciaux et chargés de recherche', FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, 'Facturation indirecte', 'ad-and-co.fr'), 
(7, 'Adequancy', '2019-05-01', 'Entre 1 et 5M €', 'Entre 1 et 5M €', 'Entre 1 et 5M €', 50, 100, 'Ile de France', 'Management de Transition', NULL, 600, 5000, 'Via les réponses à annonces, IA, commerciaux et chargés de recherche', TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, 'Factuation indirecte', 'www.adequancy.com'), 
(8, 'AIRJOB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.airjob.fr'), 
(9, 'AMAZING DEV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.amazing.dev'), 
(10, 'BeAdvize', '2018-11-05', NULL, NULL, NULL, NULL, NULL, 'Ile de France', 'Généraliste', "Maîtrise d'ouvrage, développement Web, PMO", 600, 5000, 'Via une IA', FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, 'Facturation indirecte', 'www.beadvize.fr'), 
(11, 'BUBBLETING', '2016-03-01', NULL, NULL, NULL, 0, 50, 'Ile de France', 'IT / Développement logiciel / Data', 'DSI, Digital, Infrastructure', 300, 600, 'Via les réponses aux annonces, IA, commerciaux et chargés de recherche', TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, 'Facturation indirecte', 'bubbleting.com'), 
(12, 'BUILD2B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.build2b.fr'), 
(13, 'Bulldoz', '2010-01-01', NULL, NULL, NULL, NULL, NULL, 'International', 'Rédaction', NULL, 100, 300, 'Via les réponses à des annonces', FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, 'Facturation indirecte', 'www.bulldoz.net'), 
(14, 'CAPEXFI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.capexfi.com'), 
(15, 'Castor Network', '2019-12-26', NULL, NULL, NULL, 100, 300, 'Ile de France', 'IT / Développement logiciel / Data', 'Ingénierie, IT, Logiciel', 600, 5000, 'Via les réponses aux annonces, IA, commerciaux et chargés de recherche', FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 'Factuation directe', 'www.castor-network.com'), 
(16, 'CHANGE ME UP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.changemeup.com'), 
(17, 'Cherry Pick', '2017-08-28', 'Entre 1 et 5M€', 'Entre 5 et 10M €', 'Plus de 10M €', 50, 100, 'France', 'IT / Développement logiciel / Data', 'LIST', 600, 5000, 'Intelligence artificielle et commerciaux', TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, 'Factuation indirecte', 'www.app.charry-pick.io'), 
(18, 'CLUB FREELANCE', '2014-05-21', 'Plus de 10M €', 'Plus de 10M €', NULL, 300, 500, 'Ile de France', 'IT / Développement logiciel / Data', 'Couvre tous les métiers tech & IT', 600, 5000, 'Via les réponses aux annonces, IA, commerciaux et chargés de recherche', FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, 'Factuation indirecte', 'www.club-freelance.com'), 
(19, 'CODEUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.codeur.com'), 
(20, 'COLIBEE', '2008-05-22', NULL, NULL, NULL, 50, 100, 'Ile de France', 'Généraliste', 'Conseil en management et conseil aux DSI et Digital', 600, 5000, 'Via une IA, commerciaux et chargés de recherche', TRUE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, 'Facturation indirecte', 'www.colibee.com'), 
(21, 'COMATCH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.comatch.com'), 
(22, 'Comet', '2016-06-06', NULL, NULL, NULL, 300, 500, 'Ile de France', 'IT / Développement / Data', 'Product Mangaer / Chef de projet / Scrum Master', 600, 5000, 'Intelligence artificielle et commerciaux', TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, 'Facturation indirecte', 'www.comet.co'), 
(23, 'Computer Futures', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.computerfutures.com'),
(24, 'Connecting Freelance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.connectingfreelance.com'),
(25, 'COWORKESS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.coworkess.com'),
(26, 'CREADS', '2008-05-15', NULL, NULL, NULL, NULL, NULL, 'Ile de France', 'Graphisme / Création artistique', NULL, 300, 600, 'Via les réponses aux annonces, IA, commerciaux et chargés de recherche', TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, 'Facturation directe et indirecte', 'www.creads.fr'), 
(27, 'CREATIV.LINK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.creativ.link'),
(28, 'CREME DE LA CREME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.cremedelacreme.io'),
(29, 'DSM Gestion', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.directeur-financier-temps-partage.fr'),
(30, 'ENTOURAGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.entourage.orson.io'),
(31, 'ESPACE FREELANCE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.espace-freelance.fr'),
(32, 'Expert Line', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.expert-line.com'),
(33, 'FAIR4B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.fair4b.com'),
(34, 'FinStart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.FinStart.io'),
(35, 'Fit In NETWORK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.fitin-network.com'),
(36, 'FIVERR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.fiverr.com'),
(37, 'Freejob', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.freejob.fr'),
(38, 'Freelance Addict', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.freelanceaddict.com'),
(39, 'Freelance Factory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.freelance-factory.fr'), 
(40, 'Freelance Informatique', '2001-01-08', 'Plus de 10M €', 'Plus de 10M €', 'Plus de 10M €', 300, 500, 'Ile de France', 'IT / Développement logiciel / Data', 'Digital / Infrastructures / IT / Cybersécurité', 300, 600, 'Via les réponses aux annonces et commerciaux', TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, 'Facturation directe et indirecte', 'www.freelance-informatique.fr'), 
(41, 'FREELANCE-DAY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.freelance-day.eu'),
(42, 'FREELANCE-INFO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.freelance-info.fr'),
(43, 'Freelance.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.freelance.com'), 
(44, 'FREELANCE STARTER', '2020-06-10', NULL, NULL, 'Moins de 1M €', 30, 50, 'Ile de France', 'IT / Développement logiciel / Data', NULL, 300, 600, 'Commerciaux ou chargés de recherche', TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, 'Facturation directe et indirecte', 'www.freestarter.fr'), 
(45, 'FREELANCEREPUBLIK', '2016-01-01', 'Entre 5 et 10M €', 'Plus de 10M €', 'Plus de 10M €', 100, 300, 'Ile de France', 'IT / Développement logiciel / Data', 'Développement Web et mobile / Data / Gestion de projets (AMOA & MOE)', 600, 5000, 'IA et commerciaux', TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, 'Facturation directe et indirecte', 'www.freelancerepublik.com'), 
(46, 'FREELANSSIME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.freelanssime.com'),
(47, 'Grant Alexander', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.grantalexander.com'),
(48, 'GRAPHISTE.COM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.graphiste.com'),
(49, 'GRAPHISTEONLINE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.graphistesonline.com'),
(50, 'GUN.IO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.gun.io'),
(51, 'Hired', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.hired.com'),
(52, 'HITECHPROS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.indep.hitechpros.com'),
(53, 'HUMANIANCE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.humaniance.com'),
(54, 'Huxley', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0www.huxley.com'),
(55, 'IMAÉ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.imae-france.com'),
(56, 'Indeed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.indeed.com'),
(57, 'IT PROFIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.itprofil.com'),
(58, 'IZI#DAY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.iziday.com'),
(59, 'JEAN-MICHEL.IO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.jean-michel.io'),
(60, 'JOB MINUTE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.job-minute.fr'),
(61, 'JOBPHONING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.jobphoning.com'),
(62, 'Jooble', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.fr.jooble.org'),
(63, 'JOOJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.jooj-consulting.com'),
(64, 'KANG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.kang.fr'), 
(65, 'Kerteam', '2015-04-15', 'Moins de 1M €', 'Moins de 1M €', 'Moins de 1M €', 20, 50, 'Ile de France', 'IT / Développement / Data', 'IT Digital', 300, 600, 'Via les réponses aux annonces, IT, commerciaux et chargés de recherche', FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 'Facturation directe', 'www.kerteam.com'), 
(66, 'Kicklox', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.kicklox.com'),
(67, 'Le Hibou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.lehibou.com'), 
(68, 'Les Entremetteurs', '2015-07-29', NULL, NULL, NULL, 100, 300, 'Ile de France', 'Graphisme / Création artistique', 'Conseil, Crétaion et production', 600, 5000, 'Via les réponses aux annonces', TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, 'Facturation indirecte', 'www.les-entremetteurs.fr'), 
(69, 'Les Jeudis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.lesjeudis.com'),
(70, 'LesBonsFreelances', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.lesbonsfreelances.com'),
(71, 'LinkedIn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.linkedin.com'),
(72, 'LittleBigConnection', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.littlebigconnection.com'),
(73, 'LUM TRANSITION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.lum-transition.com'),
(74, 'MALT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.malt.fr'),
(75, 'Meteojob', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.meteojob.com'),
(76, 'MOBISKILL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.mobiskill.fr'),
(77, 'Mon Consultant Indépendant', '2021-03-25', NULL, NULL, NULL, NULL, NULL, 'Ile de France', 'Management de transition', 'Profils généraliste, experts sectoriels et techniques', 600, 5000, 'Via les réponses aux annonces, commerciaux et chargés de recherche', FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, 'Facturation indirecte', 'www.mon-consultant-independant.com'),
(78, 'Mon-expert-digital.com', '2021-04-02', NULL, NULL, 'Moins de 1M €', 20, 50, 'France', 'Développement Web', 'Aspect numérique, en particulier la création de site Internet', 100, 300, 'Via les réponses aux annonces', FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, 'Facturation indirecte', 'www.Mon-expert-digital.com'),
(79, 'MOVEMEON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.movemeon.com'),
(80, 'MYINDEP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.myindep.fr'),
(81, 'MyTopManager', '2018-04-25', 'Entre 1 et 5M €', 'Entre 1 et 5M €', 'Entre 1 et 5M €', 30, 50, 'Ile de France', 'Management de Transition', 'Ressources Humaines, Finance, Gestion', 300, 600, 'Via les réponses aux annonces, IA, commerciaux et chargés de recherche', FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, 'Facturation indirecte', 'www.mytopmanager.com'),
(82, 'Nexoris', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.nexoris.com'),
(83, 'Ocean Freelancers', '2019-07-07', NULL, NULL, NULL, 30, 50, 'International', 'Secteurs maritime et naval', NULL, 600, 5000, 'Via les réponses aux annonces, IA, commerciaux et chargés de recherche', FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, 'Facturation indirecte', 'www.ocean-freelancers.com'),
(84, 'Oceanedrive Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.oceandrive-services.com'),
(85, 'One Man Support', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.onemansupport.com'),
(86, 'Opteamis', '2005-02-28', 'Plus de 10M €', 'Plus de 10M €', 'Plus de 10M €', 20, 50, 'Ile de France', 'IT / Développement lociciel / Data', 'IT de manière globale', 300, 600, 'Via les réponses aux annonces, IA, commerciaux et chargés de recherche', FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, 'Facturation indirecte', 'www.'),
(87, 'Ouiboss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.ouiboss.com'),
(88, 'PeoplePerHour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.peopleperhour.com'),
(89, 'Reactive Executive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.reactive-executive.com'),
(90, 'Redacteur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.redacteur.com'),
(91, 'Référence DSi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.referencedsi.com'),
(92, 'Scribbr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.scribbr.fr'),
(93, 'Scribeur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.scribeur.com'),
(94, 'Shaaman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.shaaman.fr'),
(95, 'Side', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.side.co'),
(96, 'Silkhom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.silkhom.com/freelance/'),
(97, 'SKILLVALUE FREELANCERS', '2015-09-10', NULL, NULL, NULL, NULL, NULL, 'International', 'IT / Développement logiciel / Data', 'Marketing, management', 300, 600, 'IA, Commerciaux et chargés de recherche', FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, 'Facturation directe et indirecte', 'www.skillvalue.com/fr/'),
(98, 'Smartransition', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.smartransition.com'),
(99, 'SPRO-FREELANCER', '2020-06-01', NULL, NULL, NULL, NULL, NULL, 'International', 'SAP', NULL, 600, 5000, 'Via les réponses aux annonces', FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, 'Facturation directe', 'www.spro-freelancer.com'),
(100, 'Staffman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.staffman.fr'),
(101, 'StaffMe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.staffme.fr'),
(102, 'SThree', '2007-10-31', 'Plus de 10M €', 'Plus de 10M €', 'Plus de 10M €', 500, 1000, 'International', 'Autre', 'IT / Pharma / Engineering / Finance', 600, 5000, 'Via les réponses aux annonces, IA, commerciaux et chargés de recherche', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Facturation indirecte', 'www.sthree.com'),
(103, 'Swapers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.swapers.fr'),
(104, 'Talents Around', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.talentsaround.com'),
(105, 'Talent.io', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.talent.io'),
(106, 'Terajob', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.terajob.com'),
(107, 'Textbroker', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.textbroker.fr'),
(108, 'Textmaster', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.textmaster.com'),
(109, 'Toptal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.toptal.com'),
(110, 'Tradelakerpro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.tradelakepro.com'),
(111, 'Turnover-IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.turnover-it.com'),
(112, 'Twago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.twago.fr'),
(113, 'Twineeds', '2017-11-13', 'Entre 1 et 5M €', 'Entre 1 et 5M €', 'Entre 5 et 10M €', 50, 100, 'Ile de France', 'Management de Transition', 'Achats / RH / Finance', 600, 5000, 'Via les réponses aux annonces, IA, commerciaux et chargés de recherche', FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, 'Facturation indirecte', 'www.twineeds.com'),
(114, 'Upward', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.groupe-upward.fr'),
(115, 'Upward Consulting', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.upwardconsulting.fr'),
(116, 'Upway', '2018-01-02', NULL, NULL, NULL, 50, 100, 'Ile de France', 'IT / Développement logiciel / Data', 'Développement Web / Marketing', 300, 600, 'Via une IA, commerciaux et chargés de recherche', FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, 'Facturation directe', 'www.upway.io'),
(117, 'Upwork', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.upwork.com'),
(118, 'Valtus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.valtus.fr'),
(119, 'Wayden', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.wayden.fr'),
(120, 'Welcometothejungle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.welcometothejungle.com'),
(121, 'Welovedevs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.welovedevs.com'),
(122, 'Wirtuo', '2018-08-01', NULL, NULL, NULL, NULL, NULL, 'Ile de France', 'IT / Développement logiciel / Data', 'Cybersécurité / Cloud / Big Data', 600, 5000, 'Via une IA, commerciaux et chargés de recherche', TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, FALSE, 'Facturation directe et indirecte', 'www.wirtuo.io'),
(123, 'Wriiters', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.wriiters.com'),
(124, 'XPM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.management-transition-xpm.com'),
(125, 'XXE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.xxe.fr'),
(126, 'Yalink', '2021-02-15', NULL, NULL, 'Moins de 1M €', 30, 50, 'France', 'BTP', 'Industrie / Energies / Ferroviaire', 300, 600, 'Via une IA, commerciaux et chargés de recherche', TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, 'Facturation directe et indirecte', 'www.yalink.fr'),
(127, 'YouLoveWords', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.youlovewords.com');

INSERT INTO Societe_zonesGeographiques VALUES
(1, 1), (1, 2),
(2, NULL),
(3, NULL),
(4, NULL),
(5, 1), (5, 2), (5, 3),
(6, 2),
(7, 1), (7, 2),
(8, NULL),
(9, NULL),
(10, 1),
(11, 1), (11, 2), (11, 3),
(12, NULL),
(13, 3),
(14, NULL),
(15, 1), (15, 2),
(16, NULL),
(17, 2),
(18, 1), (18, 2), (18, 3),
(19, NULL),
(20, 1), (20, 2),
(21, NULL),
(22, 1), (22, 2),
(23, NULL),
(24, NULL),
(25, NULL),
(26, 1), (26, 2), (26, 3),
(27, NULL),
(28, NULL),
(29, NULL),
(30, NULL),
(31, NULL),
(32, NULL),
(33, NULL),
(34, NULL),
(35, NULL),
(36, NULL),
(37, NULL),
(38, NULL),
(39, NULL),
(40, 1),
(40, 2),
(41, NULL),
(42, NULL),
(43, NULL),
(44, 1), (44, 2),
(45, 1), (45, 2),
(46, NULL),
(47, NULL),
(48, NULL),
(49, NULL),
(50, NULL),
(51, NULL),
(52, NULL),
(53, NULL),
(54, NULL),
(55, NULL),
(56, NULL),
(57, NULL),
(58, NULL),
(59, NULL),
(60, NULL),
(61, NULL),
(62, NULL),
(63, NULL),
(64, NULL),
(65, 1), (65, 2),
(66, NULL),
(67, NULL),
(68, 1), (68, 2),
(69, 1),
(70, NULL),
(71, NULL),
(72, NULL),
(73, NULL),
(74, NULL),
(75, NULL),
(76, NULL),
(77, NULL),
(78, 1),
(79, 2),
(80, NULL),
(81, NULL),
(82, 1),
(82, 2),
(83, NULL),
(84, 3),
(85, NULL),
(86, NULL),
(87, 1), (87, 2),
(87, NULL),
(88, NULL),
(89, NULL),
(90, NULL),
(91, NULL),
(92, NULL),
(93, NULL),
(94, NULL),
(95, NULL),
(96, NULL),
(97, 2), (97, 3),
(98, NULL),
(99, 3),
(100, NULL),
(101, NULL),
(102, 1), (102, 2), (102, 3),
(103, NULL),
(104, NULL),
(105, NULL),
(106, NULL),
(107, NULL),
(108, NULL),
(109, NULL),
(110, NULL),
(111, NULL),
(112, NULL),
(113, 1), (113, 2),
(114, NULL),
(115, NULL),
(116, 1), (116, 2),
(117, NULL),
(118, NULL),
(119, NULL),
(120, NULL),
(121, NULL),
(122, 1), (122, 2),
(123, NULL),
(124, NULL),
(125, NULL),
(126, 2),
(127, NULL);