<?php

if ($argc !== 2) {
    echo "Usage: php countTokens.php /path/to/your/file.php\n";
    exit(1);
}

$fileContent = file_get_contents($argv[1]);
$tokens = token_get_all($fileContent);

echo "Total tokens in the file: " . count($tokens) . "\n";

?>

