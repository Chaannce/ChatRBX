<?php

$op = $_GET["prompt"];

$headers = [
    'Content-Type: application/json',
    'Authorization: Bearer API KEY HERE',
];

$ch = curl_init('https://api.openai.com/v1/completions');
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_POSTFIELDS, "{\"prompt\":\"".$op."\",\"temperature\":1,\"model\":\"text-davinci-003\",\"max_tokens\":100}");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
$response = curl_exec($ch);
curl_close($ch);

$pj = json_decode($response, true);
echo $pj["choices"][0]["text"]

?>
