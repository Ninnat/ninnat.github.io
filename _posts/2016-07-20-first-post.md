---
layout: post
title: First Post
subtitle: How this blog is made and what it can do
categories: English
tags:
---

Modified: *3 Jan 2017*

First post on my Jekyll-powered blog!

I've been blogging on [Wordpress](https://ninnatdangniam.wordpress.com/) for a long time (in Thai) but despite how easy it is to setup the blog,
there isn't much I can do without paying. Now you can follow [what I did](https://ninnat.github.io/README.html) and get your own blog hosted
on a free (public) Git repository.

Finding a blog that functions without a hassle is even harder if you are a math blogger, but that is not a problem here. Equations are written in [Markdown](http://daringfireball.net/projects/markdown/) and displayed using [MathJax](https://www.mathjax.org/). Math in a paragraph (in-line math) is delimited by `$...$`, while displaying math in its own paragraph uses `$$...$$`. Use `\begin{aligned}...\end{aligned}` for aligned equations and `\begin{aligned}...\end{aligned}` for numbered aligned equations. (Both delimiters have to be placed inside `$$...$$`.) A quick guide on MathJax syntax can be found [here](http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference).

Let's test this by writing the Maxwell's equations in cgs units:

$$
\begin{align}
\nabla \cdot \mathbf{E} &= 4\pi \rho , \\
\nabla \times \mathbf{E} &= -\frac{1}{c} \frac{\partial \mathbf{B}}{\partial t} , \\
\nabla \cdot \mathbf{B} &= 0, \\
\nabla \times \mathbf{B} &= \frac{4\pi}{c} \mathbf{J} + \frac{1}{c} \frac{\partial \mathbf{E}}{\partial t}.
\end{align}
$$

Another indispensable feature that I've always longed for is the popup footnote. Digital footnotes today are often still implemented as if they are in print media. You follow the link to the bottom of the post and then have to find a way back to where you were in the main text, thus breaking the flow of reading. (And maybe it's just me but it's tempting to take a peek at footnotes even when I know they aren't necessary to the main text.) A much better way to implement a digital footnote is using, for example, [Bigfoot](http://www.bigfootjs.com/) like this. [^1] All you have to do is pasting the css into `/assets/css/style.css`, putting the javascript file to, say, `/assets/js`  and calling it with
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
within `/_includes/javascript.html`. This code, created by [Benjamin Esham](https://esham.io/2014/07/mathjax-and-bigfoot) enables MathJax in the footnote. You also have the option to show or hide footnotes in the footer. I decide to show it for searchability.

[^1]: Alan Jacobs, ["The Technology of a Better Footnote,"](http://www.theatlantic.com/technology/archive/2012/03/the-technology-of-a-better-footnote/254403/) *The Atlantic*, March 2012.
