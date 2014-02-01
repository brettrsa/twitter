#!/bin/bash
#
#  A script that searches for a specific word via twitter
#
# Start

if [ ! $1 ];then
      echo "Usage: "
      echo "./twitter.sh <search term 1> <search term 2> <search term 3>"
      exit
fi

# Go to twitter and get 10 tweets that contain the variable entered
wget -q "http://search.twitter.com/search.json?q=$1%20$2%20$3&rpp=20&result_type=mixed&show_user=true"

# Find the text field from the twitter feeds
cat search.json* |tr "," \\n | sed s'/"//g'| egrep "created_at:|from_user_name:|from_user:|text:"| sed 's/{created_at:/DATE ---->/g'| sed 's/from_user_name:/IDENTIFIER --->/g'| sed 's/from_user:/TWITTER TAG -->@/g'| sed 's/text:/TWEET -->/g'

# Remove the original file
rm -f search.json*

# End

