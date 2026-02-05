# Design System

> Living reference for visual design decisions. Update as the system evolves.

---

## Principles

1. **Consistency over novelty** — Use what exists before creating new patterns
2. **80% monochrome** — Color is for meaning, not decoration
3. **Mobile-first** — Design for the smallest screen, enhance for larger
4. **Accessible by default** — 4.5:1 contrast minimum, keyboard navigable

---

## Colors (OKLCH)

```css
:root {
  /* Monochrome */
  --gray-0:   oklch(100% 0 0);  /* White */
  --gray-100: oklch(96% 0 0);   /* Subtle bg */
  --gray-200: oklch(92% 0 0);   /* Borders */
  --gray-500: oklch(55% 0 0);   /* Secondary text */
  --gray-700: oklch(35% 0 0);   /* Headings */
  --gray-900: oklch(15% 0 0);   /* Body text */

  /* Primary (adjust hue per project: 0-360) */
  --primary: oklch(55% 0.25 250);  /* Example: blue */

  /* Status (never change these) */
  --error:   oklch(55% 0.22 25);   /* Red */
  --success: oklch(55% 0.18 145);  /* Green */
  --warning: oklch(75% 0.15 85);   /* Yellow */
  --info:    oklch(55% 0.15 250);  /* Blue */
}
```

**Rules:**
- Use gray for 80% of the interface
- Primary color only for CTAs and key interactive elements
- Status colors only for status (errors, success, warnings)
- No colored shadows, no gradients

---

## Typography

```css
:root {
  --font-family: 'DM Sans', system-ui, sans-serif;

  --text-xs:   clamp(0.6875rem, 0.65rem + 0.1vw, 0.75rem);
  --text-sm:   clamp(0.8125rem, 0.78rem + 0.15vw, 0.875rem);
  --text-base: clamp(0.9375rem, 0.9rem + 0.2vw, 1rem);
  --text-lg:   clamp(1.0625rem, 1rem + 0.3vw, 1.125rem);
  --text-xl:   clamp(1.1875rem, 1.1rem + 0.4vw, 1.25rem);
  --text-2xl:  clamp(1.375rem, 1.25rem + 0.6vw, 1.5rem);
  --text-3xl:  clamp(1.625rem, 1.4rem + 1vw, 1.875rem);
  --text-4xl:  clamp(2rem, 1.7rem + 1.5vw, 2.5rem);
}
```

**Usage:**
| Size | Use for |
|------|---------|
| xs | Captions, labels, meta |
| sm | Secondary text, help text |
| base | Body text |
| lg | Emphasized body |
| xl | Section headers |
| 2xl | Page sections |
| 3xl | Page titles |
| 4xl | Hero text |

---

## Spacing

Base unit: **4px**

```
1 = 4px    4 = 16px    8 = 32px    12 = 48px
2 = 8px    5 = 20px    10 = 40px   16 = 64px
3 = 12px   6 = 24px
```

**Rules:**
- Use consistent spacing within components
- More space between unrelated elements
- Less space between related elements

---

## Border Radius

```
sm = 4px    lg = 12px    2xl = 24px
md = 8px    xl = 16px    full = 9999px
```

**Usage:**
- `sm`: Inputs, small buttons
- `md`: Cards, modals
- `lg`: Large cards, containers
- `full`: Pills, avatars

---

## Shadows

```css
--shadow-sm: 0 2px 4px oklch(0% 0 0 / 0.06);
--shadow-md: 0 4px 8px oklch(0% 0 0 / 0.08);
--shadow-lg: 0 8px 16px oklch(0% 0 0 / 0.1);
--shadow-xl: 0 12px 24px oklch(0% 0 0 / 0.12);
```

**Rules:**
- Monochrome shadows only
- Use sparingly — shadows indicate elevation
- Elevated elements: modals, dropdowns, floating buttons

---

## Animation

```css
--ease-out: cubic-bezier(0.16, 1, 0.3, 1);
--ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1);
--duration-fast: 100ms;
--duration-normal: 200ms;
--duration-slow: 300ms;
```

**Rules:**
- Fast: Micro-interactions (hover, focus)
- Normal: State changes (show/hide)
- Slow: Page transitions, complex animations
- Respect `prefers-reduced-motion`

---

## Breakpoints

```
sm = 640px    lg = 1024px    2xl = 1536px
md = 768px    xl = 1280px
```

---

## Common Patterns

### Truncate text
```css
.truncate {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
```

### Horizontal scroll
```css
.scroll-x {
  display: flex;
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  scrollbar-width: none;
  -webkit-overflow-scrolling: touch;
}
```

### Icon-only on mobile
```css
.label { display: none; }
@media (min-width: 768px) { .label { display: inline; } }
```

---

## Hard Rules

| DO | DON'T |
|-------|----------|
| 80% monochrome | Colored shadows |
| Single primary hue | Gradient backgrounds |
| Truncate overflow text | `flex-wrap` for overflow |
| Icon-only on mobile | Mix multiple accent colors |
| Status colors for status only | Decorative color |

---

## Resources

- **Normalize:** `cdn.jsdelivr.net/npm/normalize.css@8/normalize.css`
- **Font:** `fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700`
- **Icons:** `unpkg.com/@phosphor-icons/web/src/regular/style.css`

---

## Contributing to the design system

1. Check if a pattern already exists before creating new ones
2. Document new patterns in this file
3. Get design review before merging UI changes
4. Update component library if applicable
