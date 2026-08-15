<?php
$content = file_get_contents('quic1934_tugas.sql');

// Fix constraints for users
$content = preg_replace('/ALTER TABLE `users`\r?\n  ADD PRIMARY KEY \(`id`\),\r?\n  ADD UNIQUE KEY `uq_username` \(`username`\);/',
"ALTER TABLE `users`\n  ADD PRIMARY KEY (`id`),\n  ADD UNIQUE KEY `uq_username` (`username`),\n  ADD KEY `fk_users_kelas` (`kelas_id`);", $content);

$content = str_replace(
    'ALTER TABLE `soal`',
    "ALTER TABLE `users`\n  ADD CONSTRAINT `fk_users_kelas` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE SET NULL;\n\nALTER TABLE `soal`",
    $content
);

// Map class names to IDs
$map = [
    "'6B'" => "1",
    "'6C'" => "2",
    "'PAI-DN-1'" => "3",
    "NULL" => "NULL"
];

// Replace INSERT INTO `users` (`id`, `username`, `password`, `role`, `nama`, `kelas`, `created_at`, `updated_at`) 
$content = str_replace(
    'INSERT INTO `users` (`id`, `username`, `password`, `role`, `nama`, `kelas`, `created_at`, `updated_at`) VALUES',
    'INSERT INTO `users` (`id`, `username`, `password`, `role`, `nama`, `kelas_id`, `created_at`, `updated_at`) VALUES',
    $content
);

// We need to replace the 6th parameter in the VALUES clause of users.
// Using a regex callback to match the whole VALUES block for users.
$content = preg_replace_callback(
    "/INSERT INTO `users` \(`id`, `username`, `password`, `role`, `nama`, `kelas_id`, `created_at`, `updated_at`\) VALUES\s*(.*?);/s",
    function($matches) use ($map) {
        $valuesBlock = $matches[1];
        // Split by lines or tuples
        $valuesBlock = preg_replace_callback("/\((.*?)\)/", function($rowMatches) use ($map) {
            $row = $rowMatches[1];
            // Split by comma honoring strings
            $cols = str_getcsv($row, ",", "'");
            if (isset($cols[5])) {
                $classRaw = trim($row); 
                // A bit fragile, let's just use str_replace for the known classes since they appear uniquely enough at the 6th position
            }
            return ""; // handled differently below
        }, $valuesBlock);
        return ""; // handled differently below
    },
    $content
);

// Let's do a simpler approach. I'll just use a smarter regex for the row itself
$content = preg_replace_callback(
    "/INSERT INTO `users` \(`id`, `username`, `password`, `role`, `nama`, `kelas_id`, `created_at`, `updated_at`\) VALUES\s*(.*?);/s",
    function($matches) use ($map) {
        $valuesBlock = $matches[1];
        
        $lines = explode("\n", $valuesBlock);
        $newLines = [];
        foreach($lines as $line) {
            if (trim($line) == '') {
                $newLines[] = $line;
                continue;
            }
            
            // replace the class string with its ID
            foreach ($map as $str => $id) {
                // The class string is preceded by ', ' and followed by ', '
                if (strpos($line, ", $str, ") !== false) {
                    $line = str_replace(", $str, ", ", $id, ", $line);
                    break;
                }
            }
            $newLines[] = $line;
        }
        
        return "INSERT INTO `users` (`id`, `username`, `password`, `role`, `nama`, `kelas_id`, `created_at`, `updated_at`) VALUES\n" . implode("\n", $newLines) . ";";
    },
    $content
);

file_put_contents('quic1934_tugas.sql', $content);
echo "Done replacing in quic1934_tugas.sql";
