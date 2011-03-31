#!/usr/bin/perl 

# For now just searches for http://.../.mp3.  Next version will get fancy
# and find things like <a href="../something.mp3">.

# We are using /usr/bin/everything because we know this will be run on a mac.

#print "$ARGV[0]\n";
$_ = $ARGV[0];
s|\(|%28|g; # Could just use tr
s|\)|%29|g;
$top = $_;
$text = `/usr/bin/curl -s $_`;

# Add in -s when all is done.

#$snoot = join('', @text);

# Try one
#@hrefs= ($text =~ m/href\s*=\s*\"(.*?\.mp3)\"/ig);

#http://onaje.com/php/article.php4/46
@hrefs= ($text =~ m/href\s*=\s*[\"']?([^\"' >]+\.mp3)[\"' >]/ig);

# Another "duh" thing:  I should weed out duplicates.  
# Does perl have an unique function?

foreach( @hrefs)
{
    s|\(|%28|g; # Could just use tr
    s|\)|%29|g;
    print("$_\n") if /^http/;
    next if /^http/;
    print "$top\/$_\n";

  #  push(@files, $1);
}



