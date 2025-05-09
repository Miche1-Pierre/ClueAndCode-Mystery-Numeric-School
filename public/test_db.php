<?php
require '../includes/db.php';

$query = $pdo->query("SELECT * FROM aventures");
$aventures = $query->fetchAll();

foreach ($aventures as $aventure) {
    echo "Aventure : " . $aventure['nom'] . " - " . $aventure['description'] . "<br>";
}