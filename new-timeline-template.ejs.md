<%
/* Renders each listing item as a .timeline-entry div, matching the same
   vertical-timeline markup/CSS used on the Blog page (writing/index.qmd).
   item.categories[0] is treated as the "kind" label (Essay / Paper /
   Preprint / Post / etc.). item.date arrives pre-formatted per Quarto's
   default listing date format, e.g. "Oct 30, 2019" -- extract the year
   from the tail rather than assuming an ISO string. */
%>
::: {.writing-timeline}
<% for (const item of items) { %>
<%
  const dateStr = String(item.date);
  const year = dateStr.slice(-4);
  const cats = (item.categories || []).filter(c => c !== "Selected");
  const kind = cats.length ? cats[0] : "";
  const dateLabel = kind ? (year + " · " + kind) : year;
%>
::: {.timeline-entry}
[<%- dateLabel %>]{.timeline-date}\
[**<%- item.title %>**](<%- item.path %>)<% if (item.description) { %> — <%- item.description %><% } %>
:::
<% } %>
:::
