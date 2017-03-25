---
layout: default
title: How This is Made

---

[![Build Status](https://travis-ci.org/Ninnat/ninnat.github.io.svg?branch=dev)](https://travis-ci.org/Ninnat/ninnat.github.io)

This blog is statically generated using [Jekyll](https://github.com/mojombo/jekyll).
It is written in [Markdown](http://daringfireball.net/projects/markdown/) and converted into HTML by a [pandoc](http://pandoc.org/) plugin which can display math using [MathJax](https://www.mathjax.org/).
The code deployment to [Github](https://github.com/ninnat/ninnat.github.io) is done automatically by [Travis-CI](http://travis-ci.org) and rake.

The main source code for this blog was forked from Xiaodong Qi's Git [repository](https://github.com/i2000s/i2000s.github.io), which in turns was modified from [Carl Boettiger](http://carlboettiger.info)'s and [David Ketcheson](http://davidketcheson.info)'s websites. Sukhumvit Thai font is implemented using the source code forked from Tulakan Ruangrong and Titipat Achakulvisut's Git [repository](https://github.com/tupleblog/tupleblog.github.io). The instruction to install dependencies and modify the source code can be found on Xiaodong Qi's [website](http://i2000s.github.io/README.html).  Please feel free to fork it for your own use.
On Windows, you can follow the instruction [here](http://jekyll-windows.juthilo.com/1-ruby-and-devkit/) to install Ruby and Jekyll.
I have not been able to install the [GSL](https://www.gnu.org/software/gsl/) on Windows and, as a result, can't compile the blog locally on my computer. But I will leave the trouble of dealing with that for the future. Another problem that I have not been able to fix is that combining Xiaodong's source code and the one for the Thai font disables highlighting and copying texts. Feel free to lecture me if you know a fix that does not alter the appearance of this blog.

I use popup footnotes to improve readability, using [Bigfoot](http://www.bigfootjs.com/) and Benjamin Esham's [code](https://esham.io/2014/07/mathjax-and-bigfoot) to enable MathJax in footnotes. All you have to do is pasting the css into `/assets/css/style.css`, putting the javascript file to, say, `/assets/js`  and calling it with
```
<script type="text/javascript" src="/assets/js/bigfoot.js"></script>
<script type="text/javascript">
	$.bigfoot({
		activateCallback: function($popover, $button) {
				if (MathJax && !$button.data('mathjax-processed')) {
						var content_wrapper = $popover.find('.bigfoot-footnote__content')[0];
						MathJax.Hub.Queue(['Typeset', MathJax.Hub, content_wrapper]);
						MathJax.Hub.Queue(function () {
								$button.attr('data-bigfoot-footnote', content_wrapper.innerHTML);
								$button.data('mathjax-processed', true);
						});
				}
		}
	});
</script>
```
within `/_includes/javascript.html`.
