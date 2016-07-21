---
layout: post
title: First Post
subtitle: How this blog is made and what it can do
---
First post on my Jekyll-powered blog!

I've been blogging on [Wordpress](https://ninnatdangniam.wordpress.com/) for a long time (in Thai) but despite how easy it is to setup the blog,
there isn't much I can do without paying for a premium. Now you can follow [what I did](https://ninnat.github.io/README.html) and get your own blog hosted
on a free (public) Git repository.

If you are math bloggers, finding a functional blog is an even harder task. Math in this blog is written in [Markdown](http://daringfireball.net/projects/markdown/)
and diaplayed using [MathJax](https://www.mathjax.org/). Math in a paragraph (in-line math) is delimited by `$...$`, while displaying math in its own paragraph
uses the delimiter `$$...$$`. You can find a quick guide on MathJax syntax [here](http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference).

$$ \begin{align}
\nabla \cdot \mathbf{E} &= 4\pi \rho \end \\ 
\nabla \times \mathbf{E} &= -\frac{1}{c} \frac{\partial \mathbf{B}}{\partial t} \\
\nabla \cdot \mathbf{B} &= 0 \\
\nabla \times \mathbf{B} &= \frac{4\pi}{c} \mathbf{J} + \frac{1}{c} \frac{\partial \mathbf{E}}{\partial t}
$$ \end{align}

Another thing I made sure before posting on this blog is to use popup footnotes. There are electronic footnotes that are still made to work the same way as they would in a book.
You follow the link to the bottom of the post and then have to find a way back to the text you were just reading. This is 2016.
Electronic footnotes don't have to interrupt the reading flow. Just download [Bigfoot](http://www.bigfootjs.com/). Put the javascript file to, say, `/assets/js`  and call it with
```
<script type="text/javascript" src="/assets/js/bigfoot.js"></script>
<script type="text/javascript">
	$.bigfoot();	
</script>
``` 
within `/_includes/javascript.html`, and don't forget to paste the css into `/assets/css/style.css`

Here is an example [^1].

I will find a chance to explore blogging with [IPython Notebook](https://ipython.org/notebook.html) another time.

[^1]: Pretty nice, huh?