#!/bin/sh

# A script to convert github flavoured markdown into ODT format
# required to submit coursework as a docx file, I open and check the
# ODT file in libreoffice before saving as a docx and submitting

# I created this because I always forget the command and it will
# presumably remain fairly constant

# you can do what you want with this
# thank pandoc, not me.

convert ()
{
			pandoc $1 \
			-f gfm \
			--columns=10 \
			-t odt \
			-o $2
}

usage ()
{
	echo "Converts from git-flavoured Markdown to ODT"
	echo "I can't stand word processors, so this means I don't have to mess around to0 much"
	echo " Usage: $1 infile [outfile]"
}

IFILE="$1"

# exit if an input file is not provided
if [ -z "$IFILE" ]; then
	usage "$0"
	exit 1
fi

# Output filename default is "converted.odt"
if [ ! -z "$2" ]; then
	OFILE="$2"
else
	OFILE="converted.odt"
fi

convert "$IFILE" "$OFILE"