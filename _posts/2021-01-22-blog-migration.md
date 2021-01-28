---
layout: single
title: Blog migration
subtitle:
date: 2021-01-23
categories: "Meta"
tags:
toc: true
toc_label: "Contents"
toc_sticky: true
toc_icon: "anchor"
---

This GitHub Page blog was originally set up with the help of my friend and was forked from [his repository](https://github.com/i2000s/i2000s.github.io). The blog went 404 in August last year, and now that I have time, I decide that I should rebuild the site by myself from scratch since the old site has so much excess baggage that I neither use nor understand, which probably contributed to the reason why I accidentally made it disappear in the first place. The attempt was successful and I want to record the process in this post.

<!-- How easy it is today to find a free blogging platform that checks all your needs. Not so for math bloggers, especially those that are used to seeing equations beautifully typeset in [latex](https://www.latex-project.org/) without needing to run codes through some kind of converter.

Finding a blog that functions without a hassle is even harder if you are a math blogger, but that is not a problem here. Equations are written in [Markdown](http://daringfireball.net/projects/markdown/) and displayed using [MathJax](https://www.mathjax.org/).

Another indispensable feature that I've always longed for is the popup footnote. Digital footnotes today are often still implemented as if they are in print media. You follow the link to the bottom of the post and then have to find a way back to where you were in the main text, thus breaking the flow of reading. (And maybe it's just me but it's tempting to take a peek at footnotes even when I know they aren't necessary to the main text.) A much better way to implement a digital footnote is using, for example, [Bigfoot](http://www.bigfootjs.com/) like this. [^1] -->

# Migration

I chose the [Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes) theme by Michael Rose. (I stumbled upon the creator from [this bilingual (EN-TH) Jekyll math blog](https://tupleblog.github.io/))
To "migrate" to this new theme, I mainly follow two sources:
- Programming Historian has a beginner-friendly [guide to build a GitHub Page site with Jekyll](https://programminghistorian.org/en/lessons/building-static-sites-with-jekyll-github-pages), as in they will tell you things like "Don't enter a new command before the previous one finishes running" so you can follow the guide easily even if you are clueless about command lines, for example.
- [This Stack Overflow answer](https://web.archive.org/web/20210123074854/https://stackoverflow.com/questions/31327045/switch-theme-in-an-existing-jekyll-installation/37186333) by Daniel A. A. Pelsmaeker gives a complete rundown on how to switch an existing Jekyll GitHub Page site to a new theme. In the end I had to commit a terrible Git sin of [merging completely different branches](https://stackoverflow.com/questions/2862590/how-to-replace-master-branch-in-git-entirely-from-another-branch) using `--allow-unrelated-histories` but that's fine.

Some random problems that I encountered:
- When running the site locally using `bundle exec jekyll serve`, make sure to use `http` and not `https` (which most browsers usually assume is what you want).
- In the final `git push`, I received an error  
	```
	fatal: HttpReqestException encountered.
	Remote "origin" does not support the LFS locking API.
	Git credentials for https://github.com/[GitHub Page site].git not found.
	```
	After installing  Git Credential Manager for Windows (1.20.0), `git push` still prompt failed authentication but after enough failures it just works.

While my old site used [Redcarpet](https://www.rubydoc.info/gems/redcarpet/3.2.2) to write in markdown if I recall correctly, this site uses [kramdown](https://kramdown.gettalong.org/index.html), which I suspect is the reason some markdown elements in my old posts stop working. But all in all, they only need slight adjustment (like line breaks in appropriate places) to start working again.

# Customization


## Pages

Create a folder called `_pages`, inside which create a markdown file with the following front matter
```
---
layout: single
title: [the title you want]
permalink: /about/
---
```
Then tell the theme to make a link to the page in the top navigation bar in
`_data/navigation.yml` by adding
```
- title: "About"
	url: /about/
```

## Favicon

The favicon (which incidentally shows a capybara, not a lemming) are generated using [https://realfavicongenerator.net/](https://realfavicongenerator.net/) (as recommended in `_includes/head/custom.html`). Choose “I cannot or do not want to place favicon files at the root of my web site” and enter `/asset/[your image folder name]` as the location. Download and unzip the package in the image folder and place the code snippet provided by the website in `_includes/head/custom.html`.


## MathJax

This site uses MathJax (2.7.7) and [tex2jax](https://docs.mathjax.org/en/v2.7-latest/options/preprocessors/tex2jax.html) to create beautiful equations with minimal effort (unlike bare bone Wordpress LaTeX support). The only file that controls MathJax is `_includes/scripts.html` where I put the following codes for
- Latex macros (the example showing macros for the quantum mechanical [bra-kets](https://en.wikipedia.org/wiki/Bra%E2%80%93ket_notation))
- in-line math delimitor `$...$` (instead of the default `\\(...\\)`)
- equation numbers

```
<!-- Customize this part for LaTeX macros.-->

<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]},
  TeX: {
    Macros: {
      ket: ["{\\left| {#1} \\right\\rangle}",1],
      bra: ["{\\left\\langle {#1} \\right|}",1],
      ketbra: ["{\\left|{#1}\\vphantom{#2}\\right\\rangle\\!\\left\\langle{#2}\\vphantom{#1}\\right|}",2],
			av: ["{\\left\\langle{#1}\\right\\rangle}",1],
    }
  <!-- extensions: ["autoload-all.js"]-->
  }
});
</script>

<!-- for $...$ delimitor -->

<script type="text/x-mathjax-config"> MathJax.Hub.Config({ tex2jax: { inlineMath: [['$', '$'],['\\(','\\)'] ], processEscapes: true } }); </script>

<!-- for equation numbers-->

<script type="text/x-mathjax-config"> MathJax.Hub.Config({ TeX: { equationNumbers: {autoNumber: "all"} } }); </script>
```

To display (say aligned) equations in their own paragraph, use `$$\begin{align}...\end{align}$$` for numbered equations

$$
\begin{align}
\nabla \cdot \mathbf{E} &= 4\pi \rho , \\
\nabla \times \mathbf{E} &= -\frac{1}{c} \frac{\partial \mathbf{B}}{\partial t} , \\
\nabla \cdot \mathbf{B} &= 0, \\
\nabla \times \mathbf{B} &= \frac{4\pi}{c} \mathbf{J} + \frac{1}{c} \frac{\partial \mathbf{E}}{\partial t}.
\end{align}
$$

or `$$\begin{aligned}...\end{aligned}$$` for unnumbered equations

$$
\begin{aligned}
i\hbar\frac{\partial}{\partial t} \ket{\psi(t)} = H\ket{\psi(t)}
\end{aligned}
$$

A quick guide on MathJax syntax can be found [here](http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference).


## Popup footnotes

For popup footnotes like this [^1], this site uses [Littlefoot.js](https://github.com/goblindegook/littlefoot), a descendent of [Bigfoot.js](https://github.com/lemonmade/bigfoot/) that does not require an additional jQuery.
The code snippets in the installation direction needs to be placed in `_layouts/default.html`. Currently, I do not have MathJax enabled in footnotes. It was possible with Bigfoot using [a code](https://esham.io/2014/07/mathjax-and-bigfoot) by Benjamin Esham, but even that breaks when the formula is too complicated or not supposed to be in-line (for example matrices). So now I avoid using formulas in footnotes in general.


## Table of contents

Jekyll can [automatically generate table of contents](https://mmistakes.github.io/minimal-mistakes/docs/helpers/#enabled-via-yaml-front-matter) for your posts. This can be done easily by entering `toc: true` in the front matter of that post. However, what stumped me at first was that to do this you have to be using the `single` layout, not `posts`!

[^1]: Alan Jacobs, ["The Technology of a Better Footnote,"](http://www.theatlantic.com/technology/archive/2012/03/the-technology-of-a-better-footnote/254403/) *The Atlantic*, March 2012.
