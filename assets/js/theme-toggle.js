/* Light/dark toggle button, inserted into the navbar's tools slot.
   The visitor's explicit choice (data-theme on <html>) always wins over
   the OS preference and is remembered via localStorage; theme-init.html
   re-applies it on the next page load before first paint. */
(function () {
  function getEffectiveTheme() {
    var attr = document.documentElement.getAttribute('data-theme');
    if (attr === 'light' || attr === 'dark') return attr;
    return window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches
      ? 'dark'
      : 'light';
  }

  function updateButton(btn, theme) {
    var icon = btn.querySelector('i');
    if (theme === 'dark') {
      icon.className = 'bi bi-sun';
      btn.setAttribute('aria-label', 'Switch to light mode');
      btn.setAttribute('title', 'Switch to light mode');
    } else {
      icon.className = 'bi bi-moon-stars';
      btn.setAttribute('aria-label', 'Switch to dark mode');
      btn.setAttribute('title', 'Switch to dark mode');
    }
  }

  function setTheme(btn, theme) {
    document.documentElement.setAttribute('data-theme', theme);
    try { localStorage.setItem('theme', theme); } catch (e) {}
    updateButton(btn, theme);
  }

  function init() {
    var container = document.querySelector('.quarto-navbar-tools');
    if (!container || document.getElementById('theme-toggle-btn')) return;

    var btn = document.createElement('button');
    btn.id = 'theme-toggle-btn';
    btn.type = 'button';
    btn.className = 'theme-toggle-btn';

    var icon = document.createElement('i');
    icon.setAttribute('role', 'img');
    icon.setAttribute('aria-hidden', 'true');
    btn.appendChild(icon);

    btn.addEventListener('click', function () {
      setTheme(btn, getEffectiveTheme() === 'dark' ? 'light' : 'dark');
    });

    container.appendChild(btn);
    updateButton(btn, getEffectiveTheme());
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
