-- sidenotes.lua
--
-- Converts standard Pandoc footnotes (written as normal [^1]-style or
-- inline ^[...] footnotes in .qmd source) into Tufte-style margin
-- sidenotes in the HTML output, using the well-known "checkbox hack"
-- (label + hidden checkbox + span) so they work with no JavaScript at
-- all and degrade to tap-to-reveal on narrow screens.
--
-- Critically, this walks the Pandoc AST rather than converting to a
-- raw HTML string: the footnote's actual inline content (including
-- Math nodes) is spliced back in as real Pandoc inlines, so MathJax
-- sees ordinary <span class="math"> output exactly as it would
-- anywhere else on the page, instead of JS-injected markup it can
-- miss. That's the specific failure mode bigfoot.js had.

local sidenote_count = 0

local function flatten_blocks_to_inlines(blocks)
  local inlines = pandoc.List()
  for i, block in ipairs(blocks) do
    if block.t == "Para" or block.t == "Plain" then
      for _, inl in ipairs(block.content) do
        inlines:insert(inl)
      end
    else
      -- Fallback for footnotes containing block-level content (lists,
      -- code blocks, block quotes): render that block to HTML and
      -- splice it in as raw HTML. Math inside these still round-trips
      -- correctly because pandoc's HTML writer converts Math nodes to
      -- MathJax-compatible spans before this string is produced.
      local html = pandoc.write(pandoc.Pandoc({ block }), "html")
      inlines:insert(pandoc.RawInline("html", html))
    end
    if i < #blocks then
      inlines:insert(pandoc.Space())
    end
  end
  return inlines
end

function Note(el)
  sidenote_count = sidenote_count + 1
  local id = "sn-" .. tostring(sidenote_count)

  local content_inlines = flatten_blocks_to_inlines(el.content)

  local result = pandoc.List()
  result:insert(pandoc.RawInline("html",
    '<label for="' .. id .. '" class="margin-toggle sidenote-number"></label>' ..
    '<input type="checkbox" id="' .. id .. '" class="margin-toggle"/>' ..
    '<span class="sidenote">'))
  for _, inl in ipairs(content_inlines) do
    result:insert(inl)
  end
  result:insert(pandoc.RawInline("html", "</span>"))

  return result
end
