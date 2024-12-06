#!/bin/bash
# Alex 2024-12-06: generate RSS feed based on indexa
# Evil trickery from https://stackoverflow.com/a/41194927/978796: rip from \K to capturing group (?=)

build_date=$(date +"%Y-%m-%dT%H:%M:%SZ")

echo '<?xml version="1.0" encoding="UTF-8" ?>'
echo '<rss version="2.0">'
echo '<channel>'
echo "	<title>RSS feed for pinchito.es</title>"
echo "	<description>RSS feed for pinchito's blog</description>"
echo "	<link>https://pinchito.es/</link>"
echo "	<copyright>2012-2024 Alex Fernández, all rights reserved</copyright>"
echo "	<lastBuildDate>$build_date</lastBuildDate>"
echo "	<pubDate>$build_date</pubDate>"

cat index.md | while read line; do
	if [[ -n $(echo $line | grep ": \[") ]]; then
		echo "	<item>"
		date=$(echo $line | grep -oP "....-..-..(?=:)")
		title=$(echo $line | grep -oP "\[\K(.*)(?=\])")
		link=$(echo $line | grep -oP "\]\(\K(.*)(?=\))")
		echo "		<title>$title</title>"
		echo "		<link>https://pinchito.es/$link</link>"
		echo "		<pubDate>$date</pubDate>"
		echo "	</item>"
	fi
done

echo '</channel>'
echo '</rss>'

