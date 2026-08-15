<?php
$content = file_get_contents('quic1934_tugas.sql');
preg_match_all("/INSERT INTO `users` \(`id`, `username`, `password`, `role`, `nama`, `kelas`, `created_at`, `updated_at`\) VALUES\s*(.*?);/s", $content, $matches);

$classes = [];
foreach ($matches[1] as $valuesBlock) {
    preg_match_all("/\([^)]+\)/", $valuesBlock, $rows);
    foreach ($rows[0] as $row) {
        $cols = str_getcsv(trim($row, "()"), ",", "'");
        if (isset($cols[5])) {
            $class = trim($cols[5], " '");
            if (!empty($class)) {
                $classes[$class] = true;
            }
        }
    }
}
print_r(array_keys($classes));
