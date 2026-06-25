---
theme: default
title: "Fields of The World Tech Kickoff"
info: "Working-session update on Global FTW, confidence, Explorer feedback, FTP, polygon-level evaluation, FTW v2, and contribution paths."
class: cover
drawings:
  persist: false
transition: none
mdc: true
aspectRatio: "16/9"
exportFilename: ftw-tech-kickoff-2026
routerMode: hash
---

<div class="cover-frame">
  <img :src="'./images/ftw-banner.webp'" alt="Agricultural field boundaries over satellite imagery">
</div>

<div class="cover-content">
  <img :src="'./images/ftw-logo-light.svg'" alt="Fields of The World">
  <div class="eyebrow">FTW Tech Kickoff · 2026</div>
  <h1>Fields of The World after the global release</h1>
  <p class="callout">Working notes on the dataset, the failure modes we are seeing, and where collaborators can make the next version better.</p>
  <div class="cover-meta">
    <span>Isaac Corley</span>
    <span class="dim">|</span>
    <span>Taylor Geospatial</span>
    <span class="dim">|</span>
    <span>2026</span>
  </div>
</div>

<!--
Opening frame: this is a working-session talk. The goal is not to pitch FTW as finished. It is to show what exists, what we trust, what we do not know yet, and where collaborators can help.
-->

---

<div class="two-col wide-left">
<div>
<div class="eyebrow">Release baseline</div>
<h1>What is now available</h1>
<p>Global FTW is a 10 m field-boundary layer for 2024 and 2025. The useful question now is where it is reliable enough for analysis, and where it needs local review.</p>
<div class="stat-strip">
<div class="stat">
<span class="value">3.17B</span>
<span class="label">field polygons in the release</span>
</div>
<div class="stat">
<span class="value">241</span>
<span class="label">countries / territories covered</span>
</div>
<div class="stat">
<span class="value">2 yrs</span>
<span class="label">annual Sentinel-2 runs</span>
</div>
</div>
</div>
<div class="image-panel">
<img :src="'./images/ftw-global-map.webp'" alt="FTW global map preview">
<div class="image-caption">Global FTW release preview</div>
</div>
</div>

<div class="source">Source: fieldsofthe.world global release page</div>

<!--
Keep this as the receipts slide, but do not sell it as done. The important shift is that the map is now public enough for people to inspect, download, and critique.
-->

---

<div class="two-col wide-left">
<div>
<div class="eyebrow">Global FTW paper</div>
<h1>The release includes a trust signal</h1>
<p>The polygons are only part of the product. Global FTW also ships confidence layers so users can filter, weight, and inspect predictions when labels are unavailable.</p>

<div class="layer-list">
  <div>
    <strong>Default field boundaries</strong>
    <span>confidence-thresholded polygons for general use.</span>
  </div>
  <div>
    <strong>Full unfiltered dataset</strong>
    <span>all predictions for users who need their own quality criteria.</span>
  </div>
  <div>
    <strong>Continuous confidence raster</strong>
    <span>a 500 m layer for weighting, filtering, and triage.</span>
  </div>
</div>
</div>

<div class="panel trust-panel">
<h3>Open research question</h3>
<p>How do we assess trust where we do not have local labels to compute metrics?</p>
<p>The confidence layer estimates whether a 500 m cell contains reliable true-positive field predictions. It is not a certificate of individual polygon geometry.</p>
</div>
</div>

<div class="source">Source: Robinson et al., arXiv:2605.11055v1</div>

<!--
This is the trust slide. The global product is not just polygons. It also includes a confidence layer, which is the bridge between "we have labels here" and "users still need a reliability signal everywhere else." Be clear that confidence is a cell-level trust signal, not proof that every boundary is geometrically correct.
-->

---

<div class="eyebrow">Since release</div>
<h1>Explorer feedback is becoming a research asset</h1>
<p>Users are rating tiles, tagging failure modes, leaving notes, and offering local help. It is not a formal validation sample, but it is a useful map of where to look next.</p>

<div class="stat-strip four">
  <div class="stat">
    <span class="value">4,440</span>
<span class="label">feedback records</span>
  </div>
  <div class="stat">
    <span class="value">4,170</span>
    <span class="label">quick tile ratings</span>
  </div>
  <div class="stat">
    <span class="value">37</span>
    <span class="label">detailed submissions</span>
  </div>
  <div class="stat">
    <span class="value">233</span>
    <span class="label">contribution offers</span>
  </div>
</div>

<div class="compact-note-grid">
<div class="compact-note">
<strong>Time window</strong>
Apr 23 – Jun 24, 2026, across 4,143 distinct map tiles.
</div>
<div class="compact-note">
<strong>Potential collaborators</strong>
Annotation help, local data, code, and model contributions.
</div>
</div>

<div class="source">Source: FTW Explorer user feedback</div>

<!--
This is the feedback receipts slide. Emphasize that this is not website analytics. These are geolocated ratings and structured tags, but they are biased toward places people inspected and felt motivated to report.
-->

---

<div class="two-col wide-left">
<div>
<div class="eyebrow">Feedback analysis</div>
<h1>Feedback is a triage queue, not an accuracy metric</h1>
<p>The signal skews toward problems, which is useful. It tells us where missing fields, shape errors, and merge/split failures are visible enough to users that they report them.</p>
<div class="rating-stack">
<div class="rating-line">
<span class="name">Poor</span>
<div class="mini-bar issue"><span style="width: 57.8%;"></span></div>
<span class="number">2,432</span>
</div>
<div class="rating-line">
<span class="name">Acceptable</span>
<div class="mini-bar"><span style="width: 22.9%;"></span></div>
<span class="number">965</span>
</div>
<div class="rating-line">
<span class="name">Good</span>
<div class="mini-bar ok"><span style="width: 19.3%;"></span></div>
<span class="number">810</span>
</div>
</div>
<p class="note">Average rating: 1.61 / 3 across 4,207 rated tiles.</p>
</div>
<div class="panel">
<h3>Common failure modes</h3>
<div class="tag-stack">
<div class="tag-line">
<span class="name">missing fields</span>
<div class="mini-bar issue"><span style="width: 100%;"></span></div>
<span class="number">2,140</span>
</div>
<div class="tag-line">
<span class="name">jagged edges</span>
<div class="mini-bar issue"><span style="width: 48.4%;"></span></div>
<span class="number">1,036</span>
</div>
<div class="tag-line">
<span class="name">over-merged</span>
<div class="mini-bar issue"><span style="width: 38.6%;"></span></div>
<span class="number">827</span>
</div>
<div class="tag-line">
<span class="name">fragmented</span>
<div class="mini-bar issue"><span style="width: 37.8%;"></span></div>
<span class="number">808</span>
</div>
<div class="tag-line">
<span class="name">false positives</span>
<div class="mini-bar issue"><span style="width: 31.0%;"></span></div>
<span class="number">664</span>
</div>
<div class="tag-line">
<span class="name">good shapes</span>
<div class="mini-bar ok"><span style="width: 28.9%;"></span></div>
<span class="number">619</span>
</div>
</div>
</div>
</div>

<div class="source">Source: FTW Explorer user feedback</div>

<!--
This is the "what are people saying" slide. Say explicitly that this is a triage stream. It over-represents places where people felt something was wrong, which is useful for deciding what to validate and label next.
-->

---

<div class="section-full">
  <h1>What's Next</h1>
</div>

<!--
Transition slide.
-->

---

<div class="ftp-hero-slide">
<div class="ftp-head">
<div class="eyebrow">FTP · pre-release</div>
<h1>Fields of the Planet: FTW at 3 m</h1>
<p>A paired dataset for studying whether higher-resolution imagery improves field-boundary extraction.</p>
</div>
<div class="paper-figure ftp-paper-figure">
<img :src="'./images/ftp-hero.png'" alt="FTP paper hero figure comparing Sentinel-2, PlanetScope, and label polygons">
</div>
<div class="ftp-facts">
<span><strong>3 m</strong> PlanetScope companion imagery</span>
<span><strong>66.6K</strong> FTW patches paired across sensors</span>
<span><strong>133K</strong> seasonal image windows</span>
<span><strong>25</strong> regions across 24 countries</span>
</div>
</div>

<div class="source">Source: Fields of the Planet paper hero figure</div>

<!--
This is the one paper figure to use. The visual should make the FTP story obvious: Sentinel-2 at 10 m, PlanetScope at 3 m, same label polygons. Keep the tone as "dataset for studying the question," not "new product hero."
-->

---

<div class="two-col top">
  <div>
    <div class="eyebrow">Evaluation shift</div>
<h1>Evaluation should follow the object people consume</h1>
    <p>Pixel IoU can stay high while parcel boundaries merge, fragment, or drift. Users consume vector polygons, so FTP evaluates after vectorization.</p>
    <div class="metric-points">
      <div><strong>Object F1</strong><span>Did we recover the field as a field?</span></div>
      <div><strong>Panoptic quality</strong><span>Detection and polygon overlap in one score.</span></div>
      <div><strong>Boundary error</strong><span>Meter-scale displacement on matched polygons.</span></div>
    </div>
  </div>

  <div class="panel">
    <h3>Protocol shift</h3>
    <div class="metric-bars">
      <div class="metric-row">
        <span class="name">S2 PQ</span>
        <div class="bar"><span style="width: 24.2%;"></span></div>
        <span class="number">24.2</span>
      </div>
      <div class="metric-row">
        <span class="name">FTP PQ</span>
        <div class="bar"><span style="width: 35.5%;"></span></div>
        <span class="number">35.5</span>
      </div>
      <div class="metric-row">
        <span class="name">S2 boundary</span>
        <div class="bar"><span style="width: 72%;"></span></div>
        <span class="number">14.4 m</span>
      </div>
      <div class="metric-row">
        <span class="name">FTP boundary</span>
        <div class="bar"><span style="width: 37%;"></span></div>
        <span class="number">7.4 m</span>
      </div>
    </div>
    <p class="note">Scored against true FTW vector polygons at each sensor's native resolution. Boundary error is measured on matched polygons.</p>
  </div>
</div>

<div class="source">Source: FTP benchmark results, true-GT/native-GSD protocol</div>

<!--
This is the key measurement point. Pixel IoU is kept for continuity, but the main metric should be polygon-level because users consume polygons. Mention object F1, panoptic quality, and matched-polygon boundary error.
-->

---

<div class="two-col wide-left">
<div>
<div class="eyebrow">FTW v2</div>
<h1>The next benchmark should be shaped by failure modes</h1>
<p>Global release feedback gives us a map of where the current system fails. FTW v2 should turn that into stronger labels, harder validation, and more realistic baselines.</p>
<div class="chip-row">
<span class="chip">more regions</span>
<span class="chip">harder crops</span>
<span class="chip">smallholder density</span>
<span class="chip">quality flags</span>
<span class="chip">polygon-first eval</span>
<span class="chip">stronger baselines</span>
</div>
</div>
<div class="panel">
<h3>Where collaborators matter</h3>
<p>New labels, local validation, benchmark issues, model configs, and reproducible baselines should land where the FTW community can inspect and reuse them.</p>
<p><strong>Repo:</strong> fieldsoftheworld/ftw-baselines</p>
</div>
</div>

<!--
FTW v2 is the next benchmark/data/model loop. The emphasis is not only bigger. It should be more directly shaped by observed failure modes and local validation.
-->

---

<div class="two-col wide-left">
<div>
<div class="eyebrow">FTW Change · exploration</div>
<h1>Annual maps make change detection possible</h1>
<p>With 2024 and 2025 side by side, we can start producing candidate change signals. Backfilling earlier Sentinel-2 years turns FTW into a time series, not just a current snapshot.</p>
<div class="chip-row">
<span class="chip">field expansion</span>
<span class="chip">consolidation</span>
<span class="chip">new large blocks</span>
<span class="chip">loss & abandonment</span>
<span class="chip">confidence shifts</span>
</div>
</div>
<div class="panel">
<h3>Example research task</h3>
<p>Find large new field blocks that appear between 2024 and 2025, then route candidates to local review instead of treating model output as ground truth.</p>
</div>
</div>

<!--
This is intentionally exploratory. The message is that change layers should produce candidate signals and review queues, not pretend to make governance claims by themselves. The 2024/2025 product opens the door, and backfilling previous years makes the signal useful.
-->

---

<div class="eyebrow">Field-level attributes</div>
<h1>Boundaries are an index for field-level analysis</h1>
<p>The global FTW layer becomes more useful when joined to other data. Once each polygon is stable, users can attach raster and vector attributes with zonal statistics or spatial joins.</p>

<div class="attribute-grid">
  <div class="attribute-card">
    <h3>Earth observation</h3>
    <p>NDVI/EVI time series, crop calendars, evapotranspiration, flood or drought exposure.</p>
  </div>
  <div class="attribute-card">
    <h3>Environment</h3>
    <p>Soils, slope, weather, water access, biome, and climate normals.</p>
  </div>
  <div class="attribute-card">
    <h3>Administration</h3>
    <p>Country, district, watershed, protected area, tenure, and policy overlays.</p>
  </div>
  <div class="attribute-card">
    <h3>Applied analyses</h3>
    <p>Field-level risk, production, insurance, carbon, subsidy, and supply-chain signals.</p>
  </div>
</div>

<!--
This is where FTW becomes an analytics substrate. The polygon itself is useful, but the bigger user value comes from joining fields to other data and exposing field-level attributes.
-->

---

<div class="eyebrow">How to plug in</div>
<h1>Contribute where others can inspect and reuse it</h1>

<div class="flow">
  <div class="flow-box">
    <h3>Baselines</h3>
    <p>Open issues, configs, data loaders, evaluation scripts, and model improvements in ftw-baselines.</p>
  </div>
  <div class="flow-box">
    <h3>Tutorials</h3>
    <p>Write use-case tutorials for your crops, your region, and your downstream workflow.</p>
  </div>
  <div class="flow-box">
    <h3>Validation</h3>
    <p>Bring local field knowledge, registries, or hand checks where the Explorer shows friction.</p>
  </div>
  <div class="flow-box">
    <h3>Joins</h3>
    <p>Prototype field-level attributes by joining FTW polygons to other open datasets.</p>
  </div>
</div>

<div class="links">
  <div class="link-item">
    <span class="name">Contribute</span>
    <span class="url">github.com/fieldsoftheworld/ftw-baselines</span>
  </div>
  <div class="link-item">
    <span class="name">Tutorials</span>
    <span class="url">fieldsofthe.world/tutorial.html</span>
  </div>
  <div class="link-item">
    <span class="name">Data</span>
    <span class="url">source.coop/ftw/global-data</span>
  </div>
</div>

<!--
End with workstreams. The important nudge: do not just use FTW privately. Put reusable code, model work, tutorials, validation notes, and use-case examples where other people can inspect and build on them.
-->

---

<div class="section-full">
  <img :src="'./images/ftw-logomark.svg'" alt="FTW logomark" style="height: 88px; margin-bottom: 30px;">
  <div class="eyebrow">Questions</div>
  <h1>What would make FTW more useful in your work?</h1>
  <p>Fields of The World · fieldsofthe.world</p>
</div>

<!--
Use this to turn the room toward feedback. The useful question is not whether FTW is impressive; it is what would make it trusted and useful enough for their work.
-->
