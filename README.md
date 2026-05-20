# Highway Costs and the Efficient Mix of State and Local Funds

This folder records the archive decision for:

David M. Levinson and Bhanu Yerra. (2002). "Highway Costs and the Efficient Mix of State and Local Funds." Transportation Research Record 1812:28-35. https://doi.org/10.3141/1812-04

## Archive Decision

Status: compact public data/code package prepared.

The paper was reread from `paper/Hierarchy.pdf`. It states that the analysis data were obtained from U.S. Department of Transportation Highway Statistics and FHWA Highway Cost Allocation Study tables. Those are public federal source tables, and the paper describes the variables and model structure.

Public pointers:

- DOI: https://doi.org/10.3141/1812-04
- FHWA Highway Statistics: https://www.fhwa.dot.gov/policyinformation/statistics.cfm

## Local Context

The folder `/Users/dlev2617/Documents/Data/Stata Data/Highways` contains a relevant Stata working set. `Highway5.do` uses FHWA/state highway cost, VMT, road-mileage, price, and state/local/federal funding variables matching the paper's model family. Because this local set is small and directly paper-relevant, the useful source files have been staged here rather than leaving the row as a pointer-only closure.

The source folder also contained `Backup of Highway5.do`. That backup was not staged because it appears to be an older/non-final variant of the same script, mostly differing in case and older Stata syntax. The current `Highway5.do` is retained as the package code source.

## Local Contents

- `paper/Hierarchy.pdf`: local reference copy used for audit validation.
- `paper/README.md`: paper-reference note.
- `data/original/`: preserved source data files copied from `/Users/dlev2617/Documents/Data/Stata Data/Highways`.
- `data/modernized/`: CSV/XLSX convenience conversions created for review and reuse.
- `code/original/Highway5.do`: preserved original Stata script.
- `code/modernized/Highway5_normalized.do`: same Stata script with line endings normalized.
- `code/modernized/Highway5_relative_input.do`: convenience copy with the original Mac input path changed to a relative package path.
- `metadata/DATA_SUMMARY.csv`: row/column counts for converted datasets and workbook sheets.
- `metadata/COLUMN_SUMMARY.csv`: column-level inspection summary.
- `metadata/FILE_MANIFEST.csv`: file sizes and SHA-256 checksums.

The modernized files are convenience sidecars. The original data and code files remain the archival evidence.

<!-- package-hardening-status:start -->
## Package Hardening Status

Generated: 2026-05-21 06:40:20 AEST

- Pipeline: `UPLOADED`
- Sidecars added/updated: `PACKAGE_STATUS.md`, `PACKAGE_MANIFEST.csv`, `LICENSE_STATUS.md`.
- Paper reference copies are for local audit convenience and are not public-upload assets without rights review.
- Final GitHub upload should use the manifest include statuses and the license-status note.
<!-- package-hardening-status:end -->
