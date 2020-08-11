# ghist-scraper
This is a web scraper of gwiki history.

## Why it is needed?
"git blame" command is very useful to find when each line was edited as followings;
<pre>
1199 1daabaa7 (koteitan 2019-12-13 23:45:19 -0500 1199) \mathrm{Lowermost~nonzero:}~t&amp;=&amp;\max\{y|S_{(X-1)y}\gt 0\}\\
1200 ^3fe7c95 (koteitan 2019-12-13 23:45:13 -0500 1200) \mathrm{Bad~root:}~r &amp;=&amp; P_t(X-1)\\
1201 ^3fe7c95 (koteitan 2019-12-13 23:45:13 -0500 1201) \mathrm{parent~of}~S_{xy}:~P_{y}(x)&amp;=&amp;\left\{\begin{array}{ll}
1202 dc27fb09 (koteitan 2019-12-13 23:45:17 -0500 1202) \max\{p|p\lt x \land S_{py} \lt  S_{xy} \land \exists a( p=(P_{y-1})^a(x))\} &amp; (\mathrm{if}~y\gt 0)\\
1203 dc27fb09 (koteitan 2019-12-13 23:45:17 -0500 1203) \max\{p|p\lt x \land S_{py} \lt  S_{xy} \} &amp; (\mathrm{if}~y=0)\\
1204 ^3fe7c95 (koteitan 2019-12-13 23:45:13 -0500 1204) \end{array}\right.\\
1205 ^3fe7c95 (koteitan 2019-12-13 23:45:13 -0500 1205) \end{eqnarray*}
</pre>

It scrapes the edit history of the particular page in fandom and commit the revisions into git repository.

## requirements
The following are required for execution:
- OS:
  - linux, Mac OS or Ubuntu for Windows 10
- commands:
  - wget, sed, git

## usage
<pre>
./scrap.bash [URL]
cd work
git blame body.html
</pre>

## explanation

[URL] is the URL of the page of fandom. for example,

 ./scrap.bash https://googology.wikia.org/wiki/User_blog:Koteitan/Purely_mathematical_definition_of_BMS

Any pages which has the query ?action=history are acceptable.

It makes directory work/ and the new git repository in it.

It commits all edit in the page as git commit. The edited date of the original page is recorded into the commit comment, so it can be shown in the blame of github.


