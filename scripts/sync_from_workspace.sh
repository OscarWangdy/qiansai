#!/usr/bin/env bash
set -euo pipefail

source_root="${1:-/Users/oscar/Documents/ChatGPT/fpga}"
repo_root="$(cd "$(dirname "$0")/.." && pwd)"
paper_root="$source_root/paper_rewriting_output"

if [[ ! -d "$source_root" || ! -d "$paper_root" ]]; then
  echo "未找到源工作区：$source_root" >&2
  exit 1
fi

mkdir -p \
  "$repo_root/01-inputs/config" \
  "$repo_root/01-inputs/source-indexes" \
  "$repo_root/02-research/planning" \
  "$repo_root/02-research/evidence" \
  "$repo_root/02-research/reviews" \
  "$repo_root/02-research/audits" \
  "$repo_root/03-deliverables" \
  "$repo_root/04-releases/pdfs" \
  "$repo_root/04-releases/source-archives" \
  "$repo_root/05-history/working-builds" \
  "$repo_root/05-history/alternate-packages" \
  "$repo_root/06-validation"

rsync -a "$paper_root/final_paper/" "$repo_root/03-deliverables/implementation-guide/"
rsync -a "$paper_root/ACG720_赛题三配件与软件采购指南/" "$repo_root/03-deliverables/accessories-guide/"
rsync -a "$paper_root/ACG720_赛题三_采购清单_LaTeX/" "$repo_root/03-deliverables/procurement-checklist/"
rsync -a "$source_root/output/pdf/" "$repo_root/04-releases/pdfs/"
rsync -a "$source_root/tmp/" "$repo_root/06-validation/"
rsync -a "$paper_root/accessories_report/" "$repo_root/05-history/working-builds/accessories_report/"
rsync -a "$paper_root/ACG720_Accessories_Guide/" "$repo_root/05-history/alternate-packages/ACG720_Accessories_Guide/"

cp -a "$paper_root/ACG720_赛题三实施指南_LaTeX.zip" "$repo_root/04-releases/source-archives/"
cp -a "$paper_root/ACG720_赛题三配件与软件采购指南_LaTeX.zip" "$repo_root/04-releases/source-archives/"
cp -a "$paper_root/ACG720_赛题三_采购清单_LaTeX.zip" "$repo_root/04-releases/source-archives/"
cp -a "$paper_root/paper_spine_config.json" "$paper_root/paper_spine_config.md" "$repo_root/01-inputs/config/"
cp -a "$paper_root/source_inventory.json" "$paper_root/source_inventory.md" "$paper_root/source_map.md" "$repo_root/01-inputs/source-indexes/"
rsync -a "$paper_root/reference_materials/" "$repo_root/01-inputs/reference_materials/"
rsync -a "$paper_root/review_prompts/" "$repo_root/02-research/reviews/review_prompts/"

planning_files=(
  confirmed_contribution.md confirmed_motivation.md contribution_check.md
  exemplar_learning_dossier.md motivation_options_after_research.md
  original_logic_map.md rewrite_matrix.md section_blueprints.md sota_gap_map.md
  style_profile.md writing_rationale_matrix.md
)
evidence_files=(
  citation_bank_check.md citation_quality_audit.md citation_support_bank.md
  claim_register.md evidence_bank.md figure_asset_map.md research_dossier.md
)
review_files=(
  review_clarity.md review_contribution.md review_methods.md reviewer_audit.md
  reviewer_audit_check.md structured_review.md
)
audit_files=(
  accessories_artifact_manifest.md accessories_latex_report.md artifact_check.md
  final_artifact_manifest.md integrity_audit.md latex_report.md
  logic_transfer_audit.md procurement_checklist_latex_report.md progress.md
  revision_audit.md
)

for file in "${planning_files[@]}"; do cp -a "$paper_root/$file" "$repo_root/02-research/planning/"; done
for file in "${evidence_files[@]}"; do cp -a "$paper_root/$file" "$repo_root/02-research/evidence/"; done
for file in "${review_files[@]}"; do cp -a "$paper_root/$file" "$repo_root/02-research/reviews/"; done
for file in "${audit_files[@]}"; do cp -a "$paper_root/$file" "$repo_root/02-research/audits/"; done

echo "同步完成：$source_root -> $repo_root"

