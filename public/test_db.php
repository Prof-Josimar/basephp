<?php
require __DIR__ . '/../vendor/autoload.php';

use App\Config\Database;

try {
    $pdo = Database::getConexao();
    echo "✅ Conexão estabelecida com sucesso!";
} catch (Exception $e) {
    echo "❌ Erro na conexão: " . $e->getMessage();
}
