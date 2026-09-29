# Citation Quality Audit

- Output directory: `paper_rewriting_output`
- Scene: report_review
- Target citation count: 5
- Entries analyzed: 20
- Verified: 19 | Mismatched: 0 | Dead: 0
- Overall quality score: 75/100
- Status: PASS

> Each entry below includes a teaching note explaining *why* the citation quality matters.

## Per-Citation Analysis

| ID | DOI | Type | Resolves | Title Match | Year Match | Score | Status |
|---|---|---|---|---|---|---|---|
| C16 | https://www.ti.com/lit/an/slva | sota | yes | 0% | no | 55 | verified |
| C17 | https://control.ros.org/jazzy/ | sota | yes | 0% | no | 55 | verified |
| C18 | https://www.st.com/resource/en | sota | yes | 0% | no | 55 | verified |
| C19 | https://github.com/ros-infrast | sota | yes | 0% | no | 55 | verified |
| C20 | https://github.com/airockchip/ | sota | yes | 0% | no | 55 | verified |
| C01 | - | sota | no | 0% | no | 50 | error |
| C02 | https://www.gowinsemi.com.cn/u | sota | yes | 0% | no | 55 | verified |
| C03 | https://www.gowinsemi.com.cn/s | sota | yes | 0% | no | 90 | verified |
| C04 | https://www.gowinsemi.com.cn/u | sota | yes | 0% | no | 55 | verified |
| C05 | https://www.gowinsemi.com.cn/s | sota | yes | 0% | no | 85 | verified |
| C06 | https://www.gowinsemi.com.cn/s | sota | yes | 0% | no | 90 | verified |
| C07 | https://www.gowinsemi.com.cn/p | sota | yes | 0% | no | 90 | verified |
| C08 | https://www.gowinsemi.com.cn/p | sota | yes | 0% | no | 90 | verified |
| C09 | https://www.gowinsemi.com.cn/p | sota | yes | 0% | no | 90 | verified |
| C10 | https://www.gowinsemi.com.cn/p | sota | yes | 0% | no | 85 | verified |
| C11 | https://www.gowinsemi.com.cn/p | sota | yes | 0% | no | 90 | verified |
| C12 | https://www.gowinsemi.com.cn/p | sota | yes | 0% | no | 85 | verified |
| C13 | https://www.gowinsemi.com.cn/s | sota | yes | 0% | no | 90 | verified |
| C14 | https://www.gowinsemi.com.cn/s | sota | yes | 0% | no | 90 | verified |
| C15 | https://www.gowinsemi.com.cn/s | sota | yes | 0% | no | 90 | verified |

### C01 — 

Status: **error**

- No DOI or stable external identifier found in citation entry

> Every citation should include a DOI, URL, arXiv ID, or local metadata note. Without one, the reference cannot be verified and readers cannot easily locate the source.

## Citation Diversity Gaps

**Missing foundational method or theory papers.** Only 0 of 20 entries (0%). Cite the key methods that define the field. Explain their contributions. Consider adding 1-3 foundational method or theory paper references.

**Missing dataset, benchmark, or evaluation protocol papers.** Only 0 of 20 entries (0%). Cite datasets if you use them. Consider adding 1-3 dataset, benchmark, or evaluation protocol paper references.

**Missing survey, review, or meta-analysiss.** Only 0 of 20 entries (0%). Essential: cite 3-5 surveys to establish the review's coverage. Consider adding 1-3 survey, review, or meta-analysis references.

**Missing domain-application or impact papers.** Only 0 of 20 entries (0%). Include application papers that show real-world relevance. Consider adding 1-3 domain-application or impact paper references.


## Scene-Specific Citation Strategy

For **report_review** papers, your citation strategy should:

- **direct task or state-of-the-art paper**: Cite representative methods across the field. Breadth matters more than exhaustiveness.
- **foundational method or theory paper**: Cite the key methods that define the field. Explain their contributions.
- **dataset, benchmark, or evaluation protocol paper**: Cite datasets if you use them.
- **survey, review, or meta-analysis**: Essential: cite 3-5 surveys to establish the review's coverage.
- **domain-application or impact paper**: Include application papers that show real-world relevance.
- **limitation, robustness, reproducibility, or ethics paper**: Include limitation/robustness discussions to show balanced coverage.

## Citation Strategy Principles

- **Diversity over density.** A narrow citation pool makes your Introduction read as insular. Mix SOTA, foundational, benchmark, survey, and application papers.
- **Recency signals engagement.** Most citations should be from the last 3 years. Older citations are fine for foundational work, but they need a reason to be there.
- **Verifiability is non-negotiable.** Every DOI must resolve. A dead DOI in your final paper is a credibility failure that reviewers notice immediately.
- **Type matters by venue.** Journals expect deep SOTA coverage. Reports expect broad survey coverage. Competitions expect benchmark and leaderboard coverage. Match your strategy to your scene.
