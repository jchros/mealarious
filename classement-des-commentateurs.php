<?php
require '../../credentials.php';
$connect = new mysqli(SERVER, LOGIN, PASSWRD);
$dbConnectSuccess = $connect && $connect->select_db(DB);

function friendlyErrorMessage(string $requestDescriptor): string {
    $errorMessage = $connect->error;
    $errorNo      = $connect->errno;
    // Addresse légèrement obfusquée pour embêter les vilains robots
    $address = "&#106;&#00097;&#000115;&#000111;&#000110;&#00046;&#x"
             . "63;&#000104;&#x72;&#000111;&#000115;&#x72;&#000111;&#118;&#0009"
             . "7;&#x40;&#101;&#x74;&#x75;&#x2e;&#117"
             . ";&#000110;&#000105;&#118;&#"
             . "00045;&#116;&#108;&#x73;&#101;&#x32;&#x2e;&#x66;&#x72;";
    $header = "Erreur requête: $requestDescriptor"
            . "%28code erreur:" .  $connect->errno . " %29";
    $body = urlencode($connect->error);
    $errLink = "mai" . "lto:$address" . "?subject=$header" . "&body=$body";
    return <<<HTML
    <p>
    Échec de la requête vers la base de données:<br/>
    <a href="$errLink">
    Cliquez-ici pour notifier les développeurs de cette erreur via courriel.
    </a><br/>
    <b>$error_message;</b>
    Veuillez rester courtois dans votre requête,
    nous ferons de notre mieux pour résoudre le problème.
    </p>
HTML;
}
?>

<!DOCTYPE html>
<html lang="fr">

<head>
<title>
Mealarious - Classement des commentateurs
</title>
<meta charset="utf-8"/>
</head>

<body>
<header>
<h1>Mealarious</h1>
<nav>
<ul>
    <li><a href="../index.php">Accueil</a></li>
</ul>
</nav>
</header>

<main>
<?php
if (!$dbConnectSuccess) {
    die("<b>Erreur:</b> Échec de la connexion à la base de données.\n");
}
function tableRankOfCommenters(): string
{
    $rankCommenters = <<<SQL
      SELECT `Utilisateurs`.`Pseudo` AS "Pseudo"
           ,  COUNT(*)               AS "# de commentaires"
        FROM `Commentaires`, `Utilisateurs`
       WHERE `Commentaires`.`Auteur` = `Utilisateurs`.`Identifiant`
    GROUP BY `Commentaires`.`Auteur`
    ORDER BY "# de commentaires";
SQL;
    $rankOfCommenters = $connect->query($rankCommenters);
    if (!$rankOfCommenters) {
        echo friendlyErrorMessage("Classement de commentaires");
        return "";
    }
    $htmlCode = <<<HTML
    <table>
    <thead>
    <tr>
        <th>#</th>
        <th>Utilisateur</th>
        <th>Nombre de commentaires</th>
    </tr>
    </thead>
HTML;
    $htmlCode .= "<tbody>\n";
    for ($i = 1; $usr = $rankOfCommenters->fetch_assoc(); ++$i) {
        $htmlCode .= "<tr>\n"
                  .  "    <td>" . $i                        . "</td>\n"
                  .  "    <td>" . $usr['Pseudo']            . "</td>\n"
                  .  "    <td>" . $usr['# de commentaires'] . "</td>\n"
                  .  "</tr>\n";
    }
    return $htmlCode .= "<tbody>\n";
}
echo tableRankOfCommenters();
?>
</main>

<footer>
<p>
Réalisé par
<strong>Jason Chrosrova</strong>
et
<strong>Mohamed Kolon Bah</strong>.
</p>
</footer>
</body>

</html>
