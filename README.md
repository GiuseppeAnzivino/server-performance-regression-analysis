# 📈 Server Performance Regression Analysis

> A multiple linear regression analysis in R, modelling the performance of a server from hardware and network indicators. Developed as a university project for the **Applied Statistics** course (Academic Year 2023/2024) at the University of Salerno (Unisa).

---

## 👥 Collaborators
- **Anzivino Giuseppe Fabrizio** — [@GiuseppeAnzivino](https://github.com/GiuseppeAnzivino)
- **De Luca Parisi Alessandro**
- **De Piano Angelo**
- **Pisanzio Francesco**

---

## 📋 Table of Contents
- [About the Project](#about)
- [Dataset](#dataset)
- [Methodology](#methodology)
- [Main Results](#results)
- [Repository Structure](#structure)
- [License](#license)

---

<a id="about"></a>
## 🚀 About the Project
The goal of the project is to build a statistical model that explains the **performance of a server** (dependent variable) as a function of five independent variables, going through the whole workflow of a data analysis: dataset inspection, descriptive statistics, relationship analysis, model estimation, residual diagnostics and model selection.

The full report (in Italian) is available in [`report/`](report/), and the R code used for the analysis in [`src/`](src/).

---

<a id="dataset"></a>
## 📊 Dataset
The dataset was provided by the university for the course and is **not included** in this repository. It consists of **60 observations** of continuous quantitative variables:

| Variable | Description |
|---|---|
| `y_PerfServer` | Server performance (dependent variable) |
| `x1_RAM` | RAM |
| `x2_CPU` | CPU |
| `x3_HD` | Hard disk |
| `x4_Cong` | Congestion |
| `x5_Buff` | Buffer |

The dataset is complete (no missing values) and all columns are numeric. The script in `src/` expects a CSV file with these six columns, in this order.

---

<a id="methodology"></a>
## 🔬 Methodology
1. **Data loading and cleaning:** import into a data frame, type checks (`str()`, `summary()`), missing value check.
2. **Descriptive statistics:** summary indices (range, variance, standard deviation), box plots with IQR-based outlier detection, relative and cumulative frequency tables (7 classes, Sturges' rule), histograms with density curves, step plots, scatter plots and Normal Q-Q plots.
3. **Relationship analysis:** simple linear regression of the performance on each predictor, compared through R² and p-values, with regression lines plotted for each variable. The report also includes a correlation analysis and polynomial fits.
4. **Model determination:** the three-predictor model is compared with a model including the `Cong * HD` interaction via `anova()`.
5. **Least squares estimation:** point estimates and 95% confidence intervals (`lm()`, `confint()`).
6. **Residual diagnostics:** linearity (residuals vs fitted values), zero mean of residuals (t-test), normality (Q-Q plot).
7. **Model selection:** forward, backward and stepwise selection with `step()`, compared using AIC and BIC.

---

<a id="results"></a>
## ✅ Main Results
The model selected by the group uses three predictors (CPU, hard disk and congestion):

```
Performance = 81.85 + 3.37·CPU − 1.88·HD − 5.96·Congestion
```

| Metric | Value |
|---|---|
| R² | 0.6953 |
| p-value (F-test) | 1.796 × 10⁻¹⁴ |
| RSS | 1418.4 |

**95% confidence intervals:**

| Parameter | Interval |
|---|---|
| Intercept | [80.53, 83.15] |
| CPU | [2.04, 4.69] |
| HD | [−3.25, −0.50] |
| Congestion | [−7.34, −4.57] |

**Key findings:**
- **Congestion** is the strongest predictor (correlation with performance of about −0.73), followed by **CPU** (+0.41) and **HD** (−0.32).
- **RAM** and **Buffer** show negligible correlation with performance and were excluded from the final model.
- The interaction term `Cong * HD` did not give a significant improvement (ANOVA p-value = 0.2878), so the simpler model was preferred to avoid overfitting.
- Forward, backward and stepwise selection (AIC-based) all retained **Buffer**. Comparing the two candidate models, **BIC favours the three-variable model** (206.15 vs 207.95), while AIC is almost a tie (197.78 vs 197.48).
- Residual diagnostics support the linear model assumptions (zero mean residuals, approximately Normal).

---

<a id="structure"></a>
## 📂 Repository Structure
```
.
├── README.md
├── LICENSE
├── .gitignore
├── report/
│   └── <report>.pdf        full project report (in Italian)
└── src/
    └── analysis.R          R script with the whole analysis
```

The `data/` folder is intentionally not tracked (see [Dataset](#dataset)).

---

<a id="license"></a>
## 📄 License
All rights reserved. This repository is published for viewing and educational reference only. See [`LICENSE`](LICENSE) for details.