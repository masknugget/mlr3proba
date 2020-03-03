#' @template surv_measure
#' @templateVar title Root Mean Squared Error
#' @templateVar inherit [MeasureSurv]
#' @templateVar fullname MeasureSurvRMSE
#'
#' @description
#' Calculates the root mean squared error (RMSE).
#'
#' The RMSE is defined by
#' \deqn{\sqrt{\frac{1}{n} \sum ((t - \hat{t})^2)}}{\sqrt(1/n \sum ((t - t*)^2))}
#' where \eqn{t} is the true value and \eqn{\hat{t}}{t*} is the prediction.
#'
#' Censored observations in the test set are ignored.
#'
#' @family response survival measures
#' @export
MeasureSurvRMSE = R6::R6Class("MeasureSurvRMSE",
  inherit = MeasureSurv,
  public = list(
    initialize = function() {
      super$initialize(
        id = "surv.rmse",
        range = c(0, Inf),
        minimize = TRUE,
        predict_type = "response"
      )
    },

    score_internal = function(prediction, ...) {
      sqrt(mean(surv_mse(prediction$truth, prediction$response)$mse))
    }
  )
)