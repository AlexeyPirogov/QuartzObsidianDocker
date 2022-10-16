Image for Quartz web-ui used to share Obsidian notes. See https://github.com/jackyzha0/quartz.

Clone https://github.com/jackyzha0/quartz, add your Obsidian files (.MD) to content folder and mount this folder.

``` docker run -p 1313:1313 -v ${PWD}/content:/opt/quartz/content -it alex12/quartz_obsidian ```
