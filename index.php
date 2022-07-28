<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Annuaire</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <main>
        <h1 class="main-heading">Annuaire 2022 - Sites d'intermédiation commerciale</h1>
        <nav class="nav">
            <ul>
                <li class="active nav-item" id="rechercheSimplifieeBtn">Recherche simplifiée</li>
                <li class="nav-item" id="rechercheDetailleeBtn">Recherche détaillée</li>
                <li class="nav-item" id="annuaireCompletBtn">
                    <form action="" method="post"> <!-- Bouton d'affichage de l'annuaire complet -->
                        <input type="submit" name="show-annuaireComplet-input" value="Annuaire Complet">
                    </form>
                </li>
            </ul>
        </nav>
        <!-- Formulaire de recherche Simplifiée -->
        <form class="searchSimplifiee" action="" method="post">
            <label for="nom-domaine">Nom de domaine :</label>
            <select name="nom-domaine" id="nom-domaine-select">
                <option value="">--Veuillez choisir une option--</option>
                <option value="BTP">BTP</option>
                <option value="Data Management">Data Management</option>
                <option value="Développement Web">Développement Web</option>
                <option value="Finance">Finance</option>
                <option value="Formation des indépendants">Formation des indépendants</option>
                <option value="Généraliste">Généraliste</option>
                <option value="Graphisme">Graphisme</option>
                <option value="Industrie et services">Industrie et services</option>
                <option value="IT">IT</option>
                <option value="IT / Pharma / Engineering / Finance">IT / Pharma / Engineering / Finance</option>
                <option value="IT / Developpement logiciel / Data">IT / Développement logiciel / Data</option>
                <option value="Management de transition">Management de transition</option>
                <option value="Marketing">Marketing</option>
                <option value="Rédaction">Rédaction</option>
                <option value="SAP">SAP</option>
                <option value="Secteur maritime">Secteur maritime</option>
                <option value="Startup">Startup</option>
                <option value="Tech">Tech</option>
                <option value="Téléprospection">Téléprospection</option>
                <option value="Transformation digitale">Transformation digitale</option>
            </select>
            <input type="submit" value="Rechercher" class="search-button" name="submit-button-simplifie">
        </form>

        <!-- Formulaire de recherche détaillée -->
        <form class="searchDetaillee" action="" method="post">
            <label for="nom-domaine">Nom de domaine :</label>
            <select name="nom-domaine" id="nom-domaine-select">
                <option value="">--Veuillez choisir une option--</option>
                <option value="BTP">BTP</option>
                <option value="Data Management">Data Management</option>
                <option value="Développement Web">Développement Web</option>
                <option value="Finance">Finance</option>
                <option value="Formation des indépendants">Formation des indépendants</option>
                <option value="Généraliste">Généraliste</option>
                <option value="Graphisme">Graphisme</option>
                <option value="Industrie et services">Industrie et services</option>
                <option value="IT">IT</option>
                <option value="IT / Pharma / Engineering / Finance">IT / Pharma / Engineering / Finance</option>
                <option value="IT / Développement logiciel / Data">IT / Développement logiciel / Data</option>
                <option value="Management de transition">Management de transition</option>
                <option value="Marketing">Marketing</option>
                <option value="Rédaction">Rédaction</option>
                <option value="SAP">SAP</option>
                <option value="Secteur maritime">Secteur maritime</option>
                <option value="Startup">Startup</option>
                <option value="Tech">Tech</option>
                <option value="Téléprospection">Téléprospection</option>
                <option value="Transformation digitale">Transformation digitale</option>
                <option value="Autre">Autre</option>
            </select>
            <fieldset>
                <legend>&nbsp;&nbsp;Zones géographiques :&nbsp;&nbsp;</legend>
                <div>
                    <input id="IDFinput" type="checkbox" name="IDFinput" checked>
                    <label for="IDFinput">Île de France</label>
                </div>
                <div>
                    <input id="regionInput" type="checkbox" name="regionInput">
                    <label for="regionInput">Régions</label>
                </div>
                <div>
                    <input id="internationalInput" type="checkbox" name="internationalInput">
                    <label for="internationalInput">International</label>
                </div>
            </fieldset>
            <div class="odgInput">Ordre de grandeur du tarif journalier moyen (TJM) : De <input class="inputNumber" type="number" min="0" value="0" name="TJMmin"> à <input class="inputNumber" type="number" max="5000" value="5000" name="TJMmax"> €</div>
            <div class="odgInput">Nombre de freelances en mission : De <input class="inputNumber" type="number" min="0" value="0" name="minFreelance"> à <input class="inputNumber" type="number" max="1000" value="1000" name="maxFreelance"></div>
            <input type="submit" value="Rechercher" class="search-button" name="submit-button-detaille">
        </form>

        <!-- Affichage des résultats -->
        <div class="results">
            <?php
            if (isset($_POST['submit-button-simplifie'])) { # Si l'on fait une recherche simplifiée
                $conn = new mysqli('ipaddress', 'username', 'password', 'databasename');
                if ($conn->connect_error) {
                    die('Connection failed : ' . $conn -> connect_error);
                }
                $nomDomaine = $_POST['nom-domaine'];
                $sql = "SELECT nom, domaine, TJMmin, TJMmax, modeContratPropose, minFreelance, zoneGeographique, sousDomaine, maxFreelance, siteWeb FROM societe WHERE domaine = '" . $nomDomaine . "'";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $table = "<table class='societeTable'>
                        <tr>
                            <th>Nom de la société</th>";
                            if(isset($row["zoneGeographique"])) $table.= "<td>Emplacement d'activité</td>";
                            if(isset($row["minFreelance"]) && isset($row["maxFreelance"])) $table .= "<td>Nombre de freelances en mission</td>";
                            $table .=  "<td>Domaine spécifique de la plateforme</td>";
                            if(isset($row["sousDomaine"])) $table.= "<td>Sous domaine d'expertise</td>";
                            if(isset($row["TJMmin"]) && isset($row["TJMmax"])) $table.= "<td>TJM</td>";
                            if(isset($row["modeContratPropose"])) $table.= "<td>Mode de facturation aux freelances</td>";
                            $table .=  "<td>Site Web</td>
                        </tr>
                        <tr>
                            <th>" . $row["nom"] . "</th>";
                            if(isset($row["zoneGeographique"])) $table.= "<td>" . $row["zoneGeographique"] . "</td>";
                            if(isset($row["minFreelance"]) && isset($row["maxFreelance"])) $table .= "<td>Entre " . $row["minFreelance"] . " et " . $row["maxFreelance"] . "</td>";
                            $table .=  "<td>" . $row["domaine"] . "</td>";
                            if(isset($row["sousDomaine"])) $table.= "<td>" . $row["sousDomaine"] . "</td>";
                            if(isset($row["TJMmin"]) && isset($row["TJMmax"])) $table.= "<td>De " . $row["TJMmin"] . " € à " . $row["TJMmax"] . " €</td>";
                            if(isset($row["modeContratPropose"])) $table.= "<td>" . $row["modeContratPropose"] . "</td>";
                            $table .=  "<td><a target='_blank' href='https://" . $row["siteWeb"] . "'>" . $row["siteWeb"] . "</a></td>
                        </tr>
                        </table>";
                        echo $table;
                    }
                } else echo "<table class='societeTable'> <tr><th>Aucun résultat</th></tr> </table>";
                $conn->close();
            }

            if (isset($_POST['submit-button-detaille'])) { # Si l'on fait une recherche détaillée
                $conn = new mysqli('ipaddress', 'username', 'password', 'databasename');
                if ($conn->connect_error) {
                    die('Connection failed : ' . $conn -> connect_error);
                }
                $nomDomaine = $_POST['nom-domaine'];
                $TJMmin = $_POST['TJMmin'];
                $TJMmax = $_POST['TJMmax'];
                $minFreelance = $_POST['minFreelance'];
                $maxFreelance = $_POST['maxFreelance'];
                $IDFinput = isset($_POST['IDFinput']);
                $regionInput = isset($_POST['regionInput']);
                $internationalInput = isset($_POST['internationalInput']);

                $sql = "SELECT nom, domaine, TJMmin, TJMmax, modeContratPropose, minFreelance, zoneGeographique, sousDomaine, maxFreelance, siteWeb FROM societe JOIN societe_zonesgeographiques ON societe.id = societe_zonesgeographiques.id_societe JOIN zonesgeographiques ON zonesgeographiques.id = societe_zonesgeographiques.id_zoneGeographique
                WHERE domaine = '" . $nomDomaine . "' 
                AND minFreelance IS NOT NULL AND minFreelance >=  " . intval($minFreelance) . "
                AND maxFreelance IS NOT NULL AND maxFreelance <=  " . intval($maxFreelance) . "
                AND TJMmin IS NOT NULL AND TJMmin >= " . intval($TJMmin) . "
                AND TJMmax IS NOT NULL AND TJMmax <= " . intval($TJMmax);

                if($IDFinput && !$regionInput && !$internationalInput) $sql.= " AND zonesgeographiques.valeur = 'Île-de-France'";
                if(!$IDFinput && $regionInput && !$internationalInput) $sql.= " AND zonesgeographiques.valeur = 'Régions'";
                if($IDFinput && $regionInput && !$internationalInput) $sql.= " AND (zonesgeographiques.valeur = 'Île-de-France' OR zonesgeographiques.valeur = 'Régions')";
                if(!$IDFinput && !$regionInput && $internationalInput) $sql.= " AND zonesgeographiques.valeur = 'International'";
                if($IDFinput && !$regionInput && $internationalInput) $sql.= " AND (zonesgeographiques.valeur = 'Île-de-France' OR zonesgeographiques.valeur = 'International')";
                if(!$IDFinput && $regionInput && $internationalInput) $sql.= " AND (zonesgeographiques.valeur = 'Régions' OR zonesgeographiques.valeur = 'International')";
                if($IDFinput && $regionInput && $internationalInput) $sql.= " AND (zonesgeographiques.valeur = 'Île-de-France' OR zonesgeographiques.valeur = 'Régions' OR zonesgeographiques.valeur = 'International')";

                $result = $conn->query($sql);

                if(!$IDFinput && !$regionInput && !$internationalInput) echo "<table class='societeTable'> <tr><th>Veuillez choisir au moins une zone géographique</th></tr> </table>";
                else if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $table = "<table class='societeTable'>
                        <tr>
                            <th>Nom de la société</th>";
                            if(isset($row["zoneGeographique"])) $table.= "<td>Emplacement d'activité</td>";
                            $table .= "<td>Nombre de freelances en mission</td>
                            <td>Domaine spécifique de la plateforme</td>";
                            if(isset($row["sousDomaine"])) $table.= "<td>Sous domaine d'expertise</td>";
                            $table.= "<td>TJM</td>";
                            if(isset($row["modeContratPropose"])) $table.= "<td>Mode de facturation aux freelances</td>";
                            $table .=  "<td>Site Web</td>
                        </tr>
                        <tr>
                            <th>" . $row["nom"] . "</th>";
                            if(isset($row["zoneGeographique"])) $table.= "<td>" . $row["zoneGeographique"] . "</td>";
                            $table .= "<td>Entre " . $row["minFreelance"] . " et " . $row["maxFreelance"] . "</td>
                            <td>" . $row["domaine"] . "</td>";
                            if(isset($row["sousDomaine"])) $table.= "<td>" . $row["sousDomaine"] . "</td>";
                            $table.= "<td>De " . $row["TJMmin"] . " € à " . $row["TJMmax"] . " €</td>";
                            if(isset($row["modeContratPropose"])) $table.= "<td>" . $row["modeContratPropose"] . "</td>";
                            $table .=  "<td><a target='_blank' href='https://" . $row["siteWeb"] . "'>" . $row["siteWeb"] . "</a></td>
                        </tr>
                        </table>";
                        echo $table;
                    }
                } else echo "<table class='societeTable'> <tr><th>Aucun résultat</th></tr> </table>";
                $conn->close();
            }
            
            if (isset($_POST['show-annuaireComplet-input'])) { # Si l'on souhaite afficher l'annuaire complet
                $conn = new mysqli('ipaddress', 'username', 'password', 'databasename');
                if ($conn->connect_error) {
                    die('Connection failed : ' . $conn -> connect_error);
                }
                $sql = "SELECT nom, dateCreation, CA2019, CA2020, CA2021, minFreelance, maxFreelance, zoneGeographique, domaine, sousDomaine, TJMmin, TJMmax, matchOffreDemande, assuranceRCPRO, paiementImmediat, assuranceSante, signatureElectronique, aideCreationEntreprise, accompagnementFreelanceSimulationRemuneration, accompagnementFreelanceCreationME, accompagnementFreelancePS, evaluationClients, modeContratPropose, siteWeb FROM societe";
                $result = $conn -> query($sql);

                while ($row = $result -> fetch_assoc()) {
                    $table = "<table class='societeTable'>
                    <tr>
                        <th class='underlined'>Nom de la société</th>";
                        if(isset($row["dateCreation"])) $table.= "<td>Date de création de la société</td>";
                        if(isset($row["CA2019"])) $table.= "<td>Chiffre d'affaires 2019</td>";
                        if(isset($row["CA2020"])) $table.= "<td>Chiffre d'affaires 2020</td>";
                        if(isset($row["CA2021"])) $table.= "<td>Chiffre d'affaires 2021</td>";
                        if(isset($row["minFreelance"]) && isset($row["maxFreelance"])) $table .= "<td>Nombre de freelances en mission</td>";
                        if(isset($row["zoneGeographique"])) $table.= "<td>Emplacement d'activité</td>";
                        $table .= "<th class='underlined'>Description de la plateforme</th>
                        <td>Domaine spécifique de la plateforme</td>";
                        if(isset($row["sousDomaine"])) $table.= "<td>Sous-domaine d'expertise</td>";
                        if(isset($row["TJMmin"]) && isset($row["TJMmax"])) $table.= "<td>TJM</td>";
                        if(isset($row["matchOffreDemande"])) $table.= "<td>Le match entre offre et demande se fait</td>";
                        $table .= "<th class='underlined'>Accompagnement des freelances</th>";
                        if(isset($row["assuranceRCPRO"])) $table.= "<td>Propose une assurance RC PRO</td>";
                        if(isset($row["paiementImmediat"])) $table.= "<td>Propose un service de paiement immédiat</td>";
                        if(isset($row["assuranceSante"])) $table.= "<td>Propose un service d'assurance santé</td>";
                        if(isset($row["signatureElectronique"])) $table.= "<td>Utilise la signature électronique pour les contrats commerciaux</td>";
                        $table .= "<th class='underlined'>Inscription sur la plateforme</th>";
                        if(isset($row["aideCreationEntreprise"])) $table.= "<td>Propose une aide à la création d'entreprise</td>";
                        if(isset($row["accompagnementFreelanceSimulationRemuneration"])) $table.= "<td>Accompagne le freelance sur la simulation de leur future rémunération</td>";
                        if(isset($row["accompagnementFreelanceCreationME"])) $table.= "<td>Accompagne le freelance dans sa création de micro-entreprise</td>";
                        if(isset($row["accompagnementFreelancePS"])) $table.= "<td>Accompagne le freelance sur du portage salarial</td>";
                        if(isset($row["evaluationClients"])) $table.= "<td>Les clients peuvent évaluer les missions réalisées</td>";
                        if(isset($row["modeContratPropose"])) $table.= "<td>Mode contractuel de facturation aux freelances</td>";
                        $table .=  "<td>Site Web</td>
                    </tr>
                    <tr>
                        <th>" . $row["nom"] . "</th>";
                        if(isset($row["dateCreation"])) $table.= "<td>Date de création de la société</td>";
                        if(isset($row["CA2019"])) $table.= "<td>" . $row["CA2019"] . "</td>";
                        if(isset($row["CA2020"])) $table.= "<td>" . $row["CA2020"] . "</td>";
                        if(isset($row["CA2021"])) $table.= "<td>" . $row["CA2021"] . "</td>";
                        if(isset($row["minFreelance"]) && isset($row["maxFreelance"])) $table.= "<td>De " . $row["minFreelance"] . " € à " . $row["maxFreelance"] . " €</td>";
                        if(isset($row["zoneGeographique"])) $table.= "<td>" . $row["zoneGeographique"] . "</td>";
                        $table .= "<td>&nbsp;</td>
                        <td>" . $row["domaine"] . "</td>";
                        if(isset($row["sousDomaine"])) $table.= "<td>" . $row["sousDomaine"] . "</td>";
                        if(isset($row["TJMmin"]) && isset($row["TJMmax"])) $table.= "<td>De " . $row["TJMmin"] . " € à " . $row["TJMmax"] . " €</td>";
                        if(isset($row["matchOffreDemande"])) $table.= "<td>" . $row["matchOffreDemande"] . "</td>";
                        $table .= "<td>&nbsp;</td>";
                        if(isset($row["assuranceRCPRO"])) $table.= "<td>" . $row["assuranceRCPRO"] . "</td>";
                        if(isset($row["paiementImmediat"])) $table.= "<td>" . $row["paiementImmediat"] . "</td>";
                        if(isset($row["assuranceSante"])) $table.= "<td>" . $row["assuranceSante"] . "</td>";
                        if(isset($row["signatureElectronique"])) $table.= "<td>" . $row["signatureElectronique"] . "</td>";
                        $table .= "<td>&nbsp;</td>";
                        if(isset($row["aideCreationEntreprise"])) $table.= "<td>" . $row["aideCreationEntreprise"] . "</td>";
                        if(isset($row["accompagnementFreelanceSimulationRemuneration"])) $table.= "<td>" . $row["accompagnementFreelanceSimulationRemuneration"] . "</td>";
                        if(isset($row["accompagnementFreelanceCreationME"])) $table.= "<td>" . $row["accompagnementFreelanceCreationME"] . "</td>";
                        if(isset($row["accompagnementFreelancePS"])) $table.= "<td>" . $row["accompagnementFreelancePS"] . "</td>";
                        if(isset($row["evaluationClients"])) $table.= "<td>" . $row["evaluationClients"] . "</td>";
                        if(isset($row["modeContratPropose"])) $table.= "<td>" . $row["modeContratPropose"] . "</td>";
                        $table .=  "<td><a target='_blank' href='https://" . $row["siteWeb"] . "'>" . $row["siteWeb"] . "</a></td>
                    </tr>
                    </table>";
                    echo $table;
                }
                echo '<script type="text/JavaScript"> 
                    document.getElement
                    </script>';
                $conn->close();
            }
            ?>
        </div>
        <h2 class="footer-title-1">DIGIWORK SOLUTIONS</h2>
        <h3 class="footer-title-2">Groupe WORK4YOU</h3>
    </main>
</body>
<script src="script.js"></script>

</html>