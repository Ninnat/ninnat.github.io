---
layout: post
title: First Post
subtitle: How this blog is made and what it can do
---
First post on my Jekyll-powered blog!

I've been blogging on [Wordpress](https://ninnatdangniam.wordpress.com/) for a long time (in Thai) but despite how easy it is to setup the blog,
there isn't much I can do without paying. Now you can follow [what I did](https://ninnat.github.io/README.html) and get your own blog hosted
on a free (public) Git repository.

If you are math bloggers, finding a functional blog is even harder. Math in this blog is written in [Markdown](http://daringfireball.net/projects/markdown/)
and diaplayed using [MathJax](https://www.mathjax.org/). Math in a paragraph (in-line math) is delimited by `$...$`, while displaying math in its own paragraph
uses `$$...$$`. For aligned equations in multiple lines, use `\begin{aligned}...\end{aligned}` *inside* `$$...$$`. Finally, if you want the equations numbered, use "align" instead of
"aligned". A quick guide on MathJax syntax can be found [here](http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference).

Let's test this by writing the Maxwell's equations in cgs units:

$$
\begin{align}
\nabla \cdot \mathbf{E} &= 4\pi \rho , \\ 
\nabla \times \mathbf{E} &= -\frac{1}{c} \frac{\partial \mathbf{B}}{\partial t} , \\
\nabla \cdot \mathbf{B} &= 0, \\
\nabla \times \mathbf{B} &= \frac{4\pi}{c} \mathbf{J} + \frac{1}{c} \frac{\partial \mathbf{E}}{\partial t}.
\end{align}
$$

Another thing that was made sure to work before I start writing is the popup footnote. To these days, there are still electronic footnotes that are limited in the way
 footnotes in print media are limited; you follow the link to the bottom of the post and then have to find a way back to where you were just reading. This is 2016, ladies and gentlemen.
Electronic footnotes don't have to break the reading flow. Just download [Bigfoot](http://www.bigfootjs.com/). Put the javascript file to, say, `/assets/js`  and call it with
```
<script type="text/javascript" src="/assets/js/bigfoot.js"></script>
<script type="text/javascript">
	$.bigfoot();	
</script>
``` 
within `/_includes/javascript.html`, and don't forget to paste the css into `/assets/css/style.css`. For searchability, I also show footnotes in the footer.

Here is an example [^1].

[^1]: Pretty nice, huh?