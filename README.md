---
layout: default
title: About this site

---

[![Build Status](https://travis-ci.org/Ninnat/ninnat.github.io.svg?branch=dev)](https://travis-ci.org/Ninnat/ninnat.github.io)

This blog is statically generated using [Jekyll](https://github.com/mojombo/jekyll).
It is written in [Markdown](http://daringfireball.net/projects/markdown/) and converted into HTML by a [pandoc](http://pandoc.org/) plugin which can display math using [MathJax](https://www.mathjax.org/).
The code deployment to [Github](https://github.com/ninnat/ninnat.github.io) is done automatically by [Travis-CI](http://travis-ci.org) and rake.

The source code for this blog was forked from Xiaodong Qi's Git [repository](https://github.com/i2000s/i2000s.github.io), which in turns modified from
[Carl Boettiger](http://carlboettiger.info)'s and [David Ketcheson](http://davidketcheson.info)'s websites. Please feel free to fork it for your own use.
The instruction to install independencies and modify the source code can be found on Xiaodong Qi's [website](http://i2000s.github.io/README.html).
On Windows, you can follow the instruction to install Ruby and Jekyll on [this site](http://jekyll-windows.juthilo.com/1-ruby-and-devkit/).
I have not been able to install the gsl plugin on Windows and, as a result, can't compile the blog locally on my computer. But I will leave that for the future.

I use popup footnotes to improve the readability, made possible by [Bigfoot](http://www.bigfootjs.com/). Just put the javascript file to, say, `/assets/js`  and call it with
```
<script type="text/javascript" src="/assets/js/bigfoot.js"></script>
<script type="text/javascript">
	$.bigfoot();	
</script>
``` 
within `/_includes/javascript.html`, and don't forget to paste the css into `/assets/css/style.css`. I decide to also show the footnote in the footer for searchability.
