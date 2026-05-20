# Source Review

Paper: David M. Levinson and Bhanu Yerra. (2002). "Highway Costs and the Efficient Mix of State and Local Funds." Transportation Research Record 1812:28-35. https://doi.org/10.3141/1812-04

Source folder reviewed: `/Users/dlev2617/Documents/Data/Stata Data/Highways`

The paper states that the data were obtained from U.S. Department of Transportation Highway Statistics and FHWA Highway Cost Allocation Study tables. It estimates ordinary least-squares regression models for highway costs using expenditure shares, highway class, VMT, road length, vehicle class, and related price/network variables.

The staged `Highway5.do` file constructs variables from the Stata input data and runs regressions over highway cost, VMT, mileage, funding, labor, material-price, interest-rate, and state/local/federal variables. This matches the model family described in the paper closely enough to justify staging the compact local working set.

The staged package preserves original Stata and Excel-era files and adds modern CSV/XLSX sidecars. The sidecars are for inspection and convenience; they are not replacements for the original files.

The source folder also included `Backup of Highway5.do`. It was excluded from the package because it appears to be a non-final backup variant of `Highway5.do`, mostly differing by case and older syntax. Keeping it would add ambiguity without improving the paper archive.
