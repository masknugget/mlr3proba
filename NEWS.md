# mlr3proba 0.2.0.9000

* Removed `PredictionRegr` causing masking issues with `{mlr3}`
* Bug fix in `PipeOpDistrCompositor` causing some `cdf` predictions to be lost

# mlr3proba 0.2.0

### Added Functionality

* `MeasureSurvCindex` added. Generalises all c-index measures with a fast C++ implementation
* Akritas estimator added to [mlr3learners.proba repo](https://www.github.com/mlr3learners/mlr3learners.proba)
* Added scoring rule `MeasureSurvSchmid`
* Addd calibration measures `MeasureSurvCalibrationBeta` and `MeasureSurvCalibrationAlpha`
* `surv.brier` alias added for `surv.graf`
* `response` parameter added to `PipeOpCrankCompositor` and `crankcompositor` to now optionally fill `response` predict type with same values as `crank`
* Added `PipeOpProbregrCompostior` and `compose_probregr` for composition to `distr` return type from (a) regression learner(s) predicting `response` and `se`
* Added `PipeOpSurvAvg` and `surv_averager` pipeline for weighted model averaging of distr, lp, crank, and response predictions.

### Deprecated Functionality

* The following measures are deprecated use `MeasureSurvCindex` instead with following parameters: `MeasureSurvBeggC`, use defaults; `MeasureSurvHarrellC`, use defaults; `MeasureSurvUnoC`, use `weight_meth = 'G/2'`; `MeasureSurvGonenC`, use `weight_method = 'GH'`
* `MeasureSurvGrafSE`, `MeasureSurvLoglossSE`, `MeasureSurvIntLoglossSE`, `MeasureSurvRMSESE`, `MeasureSurvMSESE`, and `MeasureSurvMAESE` all deprecated and will be deleted in v0.4.0. Use `msr("surv.graf", se = TRUE)` instead (for example).
* Measures renamed such that `surv.nagelkR2` is now `surv.nagelk_r2`, analogously for all R2, AUC, TPR, and TNR measures. Old constructors will be deleted in v0.4.0.
* Renamed `distrcompose` and `crankcompose` to `distr_compose` and `crank_compose`. Old ids will be deleted in v0.4.0.

### Edited Functionality

* Measures renamed such that `surv.nagelkR2` is now `surv.nagelk_r2`, analogously for all R2, AUC, TPR, and TNR measures. Old constructors will be deleted in v0.4.0.
* `MeasureSurvGraf` and `MeasureSurvIntLogloss` now have much faster C++ implementation

### Moved Functionality

- `LearnerSurvGlmnet`, `LearnerSurvCVGlmnet`, `LearnerSurvXgboost` and `LearnerSurvRanger` have been moved to the [mlr3learners repo](https://www.github.com/mlr-org/mlr3learners)

- `LearnerSurvGBM` has been moved to https://www.github.com/mlr3learners/mlr3learners.gbm

- `LearnerSurvMboost`, `LearnerSurvGlmBoost`, `LearnerSurvGamboost`, `LearnerSurvBlackboost` have been moved to https://www.github.com/mlr3learners/mlr3learners.mboost

  

# mlr3proba 0.1.6

* Early release due to backward compatibility error introduced by an upstream dependency
* Minor updates to `mboost` family of learners: added `gehan` family, fixed parameters for `cindex`, added support for:  `weights`, `response` predict type, `importance`, `selected_features`
* Minor internal changes
* All density learners except `LearnerDensHist` and `LearnerDensKDE` have been moved to the [mlr3learners org](https://mlr3learners.mlr-org.com/dev/articles/learners/additional-learners.html)
* The following survival learners have been moved to  the [mlr3learners org](https://mlr3learners.mlr-org.com/dev/articles/learners/additional-learners.html), LearnerSurv: `Flexible`, `ObliqueRSF`, `Penalized`, `RandomForestSRC`
* Bugfix in `LearnerSurvXgboost` previously `lp` was erroneously returned as `exp(lp)`
* Now licenced under LPGL-3

# mlr3proba 0.1.5

* `LearnerSurvParametric` and `LearnerSurvNelson` moved to `mlr3learners/mlr3learners.survival ` repo
* `LearnerSurvCoxboost` and `LearnerSurvCVCoxboost` moved to `mlr3learners/mlr3learners.coxboost ` repo
* `LearnerSurvSVM` moved to `mlr3learners/mlr3learners.survivalsvm` repo
* In the next release, all learners except for `LearnerSurvKaplan`, `LearnerSurvCoxPH`, and `LearnerDensHist` will be moved to the `mlr3learners` org
* Minor internal changes

# mlr3proba 0.1.4

* Density estimation has now been added to mlr3proba, see `TaskDens`, `LearnerDens`, `PredictionDens`, and `MeasureDens`.
* Added `mlr_tasks_faithful` and `mlr_tasks_precip` for density task examples
* Added `mlr_task_generators_simdens` for generating density tasks
* Added learners for density estimation, see `mlr3::mlr_learners$keys("^dens")` for the full list
* In line with mlr3 0.1.7, public methods `train_internal`, `predict_internal`, `score_internal` are now private methods `.train`,`.predict`,`.score` 
* Converted to roxygen2 R6 documentation

# mlr3proba 0.1.3

* Changed `lp` in `surv.parametric` to include the intercept, which is in line with `survival::survreg`. Now `exp(pred$lp)` is equal to the predicted survival time for AFTs
* Moved `mboost` to `suggests`
* Added `response` predict type, which predicts the time until event. Currently only supported for AFT models in `surv.parametric`
* Added measures for `response` predict type: `MeasureSurvMAE, MeasureSurvMAESE, MeasureSurvMSE, MeasureSurvMSESE, MeasureSurvRMSE, MeasureSurvRMSESE`

# mlr3proba 0.1.2

* Fixed error in r-patched-solaris
* Added `mode` option to `crankcompositor`
* Fixes bug resulting from `R62S3` incompatibility

# mlr3proba 0.1.1

* Added `method` argument to integrated scores and added weighting by bin-width
* Added notes to IGS documentation regarding default methods and comparison to other packages
* Added `method` to `MeasureSurvIntegrated` constructor and fields
* Fixed mistake in documentation of: `TaskSurv`, `MeasureSurvUnoC`
* Added missing `LearnerSurvRpart` parameter `parms` and `cost`
* Fixed errors in r-patched-solaris and r-devel debian-clang

# mlr3proba 0.1.0

* Initial upload to CRAN.
