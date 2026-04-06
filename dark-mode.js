/* ═══════════════════════════════════════════════════════════════
   Open TechStack — Dark Mode
   Include this script in every page. It:
   1. Reads preference from localStorage (or system preference)
   2. Toggles .dark class on <html>
   3. Injects a toggle button into the nav bar
   ═══════════════════════════════════════════════════════════════ */
(function () {
  const STORAGE_KEY = 'ots-dark-mode';

  // Determine initial state
  function getPreference() {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (stored !== null) return stored === 'true';
    return window.matchMedia('(prefers-color-scheme: dark)').matches;
  }

  function apply(dark) {
    document.documentElement.classList.toggle('dark', dark);
    localStorage.setItem(STORAGE_KEY, dark);
    // Update any toggle buttons
    document.querySelectorAll('.dm-toggle-icon').forEach(el => {
      el.textContent = dark ? '☀️' : '🌙';
    });
  }

  // Apply immediately (before paint)
  apply(getPreference());

  // Inject toggle button into nav once DOM is ready
  function injectToggle() {
    const nav = document.querySelector('nav .flex.items-center');
    if (!nav) return;
    const btn = document.createElement('button');
    btn.className = 'dm-toggle ml-1 px-1.5 py-0.5 rounded text-base hover:bg-white/10 transition';
    btn.title = 'Toggle dark mode';
    btn.setAttribute('aria-label', 'Toggle dark mode');
    btn.innerHTML = '<span class="dm-toggle-icon">' + (getPreference() ? '☀️' : '🌙') + '</span>';
    btn.addEventListener('click', () => {
      const next = !document.documentElement.classList.contains('dark');
      apply(next);
    });
    nav.appendChild(btn);
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', injectToggle);
  } else {
    injectToggle();
  }
})();
