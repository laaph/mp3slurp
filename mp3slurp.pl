#!/usr/bin/perl -n

# Download each file in turn
# quick and elegant
# Eh, we may want to know our download folder....

# Upgrades:  Take an input, which is the directory we want to download in
# Then, rather than using -O, cut off all before the last "/" in the webpage
# and append download directory to that.  Then use -o $fullfile.

# Sample usage:  ./mp3slurp.pl out_dir < list_of_downloadables.

#print;

chomp;
$get = $_;
#$get =~ s|%28|\(|g; # Could just use tr
#$get =~ s|%29|\)|g;

$local_file = $get;
$local_file =~ s|.*\/||;
$local_file =~ s/\%20/ /g; # Just a nicety.  Should we delete other ugly chars too?

#$local_dir = $ARGV[0] . '/'  or  './';



#$local_file = $local_dir . $local_file;

print("$local_file\n");

print "/usr/bin/curl $get -o \"$local_file\"\n";
`/usr/bin/curl $get -o "$local_file"`;


