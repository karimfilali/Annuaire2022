<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
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
                <li class="nav-item" id="annuaireCompletBtn">Annuaire Complet</li>
            </ul>
        </nav>
        <!-- Recherche Simplifiée -->
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
            </select>
            <input type="submit" value="Rechercher" class="search-button" name="submit-button-simplifiee">
        </form>

        <!-- Recherche détaillée -->
        <form class="searchDetaillee">
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
            </select>
            <fieldset>
                <legend>&nbsp;&nbsp;Zones géographiques :&nbsp;&nbsp;</legend>
                <div>
                    <input type="checkbox" id="IDFinput" name="IDFinput" checked>
                    <label for="IDFinput">Île de France</label>
                </div>
                <div>
                    <input type="checkbox" id="regionInput" name="regionInput">
                    <label for="regionInput">Régions</label>
                </div>
                <div>
                    <input type="checkbox" id="internationalInput" name="internationalInput">
                    <label for="internationalInput">International</label>
                </div>
            </fieldset>
            <div class="odgInput">Ordre de grandeur du tarif journalier moyen (TJM) : De <input class="inputNumber" type="number" min="0" value="0"> à <input class="inputNumber" type="number" max="5000" value="5000"> €</div>
            <div class="odgInput">Nombre de freelances en mission : De <input class="inputNumber" type="number" min="0" value="0"> à <input class="inputNumber" type="number" max="1000" value="1000"></div>
            <input type="submit" value="Rechercher" class="search-button" name="submit-button-detaille">
        </form>

        <!-- Annuaire complet -->
        <div class="annuaireComplet">
            <p class="showAnnuaireParagraph">Cliquez ci-dessous pour obtenir la dernière version de notre annuaire :</p>
            <a href="annuaireComplet.pdf" target="_blank">Annuaire Complet</a>
        </div>
        <div class="results">
            <?php
            if (isset($_POST['submit-button-simplifiee'])) {
                $conn = new mysqli('localhost', 'root', '', 'annuaire');
                if ($conn->connect_error) {
                    die('Connection failed : ' . $conn->connect_error);
                }
                $nomDomaine = $_POST['nom-domaine'];
                $sql = "SELECT nom, domaine, TJMmin, TJMmax, modeContratPropose, minFreelance, zoneGeographique, sousDomaine, maxFreelance, siteWeb FROM societe WHERE domaine = '" . $nomDomaine . "'";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $zoneGeographique = empty($row["zoneGeographique"]) ? ' - ' : $row["zoneGeographique"];
                        $minFreelance = empty($row["minFreelance"]) ? ' - ' : $row["minFreelance"];
                        $maxFreelance = empty($row["maxFreelance"]) ? ' - ' : $row["maxFreelance"];
                        $sousDomaine = empty($row["sousDomaine"]) ? ' - ' : $row["sousDomaine"];
                        $TJMmin = empty($row["TJMmin"]) ? ' - ' : $row["TJMmin"];
                        $TJMmax = empty($row["TJMmax"]) ? ' - ' : $row["TJMmax"];
                        $modeContratPropose = empty($row["modeContratPropose"]) ?  ' - ' : $row["modeContratPropose"];
                        echo "<table class='societeTable'>
                        <tr>
                            <th>Nom de la société</th>
                            <td>Emplacement d'activité</td>
                            <td>Nombre de freelances en mission</td>
                            <td>Domaine spécifique de la plateforme</td>
                            <td>Sous domaine d'expertise</td>
                            <td>TJM</td>
                            <td>Mode de facturation aux freelances</td>
                            <td>Site Web</td>
                        </tr>
                        <tr>
                            <th>" . $row["nom"] . "</th>
                            <td>" . $zoneGeographique . "</td>
                            <td>Entre " . $minFreelance . " et " . $maxFreelance . "</td>
                            <td>" . $row["domaine"] . "</td>
                            <td>" . $sousDomaine . "</td>
                            <td>De " . $TJMmin . " € à " . $TJMmax . " €</td>
                            <td>" . $modeContratPropose . "</td>
                            <td><a target='_blank' href='https://" . $row["siteWeb"] . "'>" . $row["siteWeb"] . "</a></td>
                        </tr>
                </table>";
                    }
                } else echo "<table class='societeTable'> <tr><th>Aucun résultat</th></tr> </table>";
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