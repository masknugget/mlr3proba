#' @template surv_measure
#' @templateVar title Hung and Chiang's AUC
#' @templateVar inherit `MeasureSurvAUC`/[MeasureSurv]
#' @templateVar fullname MeasureSurvHungAUC
#' @templateVar shortname surv.hungAUC
#' @templateVar pars integrated = TRUE, times
#' @templateVar int_par TRUE
#' @templateVar times_par TRUE
#'
#' @description
#' Calls [survAUC::AUC.hc()].
#'
#' Assumes random censoring.
#'
#' @template measure_survAUC
#'
#' @references
#' Hung, H. and C.-T. Chiang (2010).\cr
#' Estimation methods for time-dependent AUC models with survival data.\cr
#' Canadian Journal of Statistics 38, 8–26.
#'
#' @family AUC survival measures
#' @export
MeasureSurvHungAUC = R6Class("MeasureSurvHungAUC",
  inherit = MeasureSurvAUC,
  public = list(
    initialize = function(integrated = TRUE, times) {
      super$initialize(integrated = integrated,
                       times = times,
                       id = "surv.hungAUC",
                       properties = c("requires_task", "requires_train_set"))
    },

    score_internal = function(prediction, task, train_set, ...) {
      super$score_internal(prediction = prediction,
                           task = task,
                           train_set = train_set,
                           FUN = survAUC::AUC.hc,
                           ...)
    }
  )
)