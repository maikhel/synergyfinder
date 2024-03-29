% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_synergy_score.R
\name{ZIP}
\alias{ZIP}
\title{Calculate Delta synergy score based on ZIP model}
\usage{
ZIP(response.mat, quiet = TRUE, drug.row.model = NULL,
  drug.col.model = NULL)
}
\arguments{
\item{response.mat}{A drug cobination dose-response matrix. It's column name
and row name are representing the concerntrations of drug added to column 
and row, respectively. The values in matrix indicate the inhibition rate to
cell growth.}

\item{quiet}{A logical value. If it is \code{TRUE} then the warning message
will not show during calculation.}

\item{drug.row.model}{(optional) a character. It indicates the model type
used for fitting dose-response curve for drug added to rows.}

\item{drug.col.model}{(optional) a character. It indicates the model used for
fitting dose-response curve for drug added to columns.}
}
\value{
A matrix of \eqn{\Delta} score calculated via Zero Interaction
Potency (ZIP) method.
}
\description{
\code{ZIP} calculates the \eqn{\Delta} score matrix from a dose-response 
matrix by using Zero Interaction Potency (ZIP) method.
}
\details{
Zero Interaction Potency (ZIP) is a reference model for evaluating 
  the conbimation effect of two drugs. It captures the effect of drug 
  combination by comparing the change in the potency of the dose-response 
  curves between individual drugs and their combinations. \cr
  \cr
  The optional arguments \code{drug.col.model}, \code{drug.row.model} are 
  designed for reuse the single drug dose response model fitting results, 
  if it has been down before. Functions \code{\link{FitDoseResponse}} and 
  \code{\link{ExtractSingleDrug}} could be used to calculate these arguments.
}
\examples{
# No single drug fitted modle before
data("mathews_screening_data")
data <- ReshapeData(mathews_screening_data)
response.mat <- data$dose.response.mats[[1]]
ZIP.score <- ZIP(response.mat)

# Single drug dose response models have been fitted before.
drug.row.model <- FitDoseResponse(ExtractSingleDrug(response.mat, dim="row"))
drug.col.model <- FitDoseResponse(ExtractSingleDrug(response.mat, dim="col"))

ZIP.score <- ZIP(response.mat, drug.col.model=drug.col.model,
                 drug.row.model=drug.row.model)
}
\references{
\itemize{
   \item{Yadav B, Wennerberg K, Aittokallio T, Tang J. (2015).
   \href{https://doi.org/10.1016/j.csbj.2015.09.001}{Searching for Drug
   Synergy in Complex Dose-Response Landscape Using an Interaction Potency
   Model.} Comput Struct Biotechnol J, 13:504– 513.}
}
}
\author{
\itemize{
   \item{Liye He \email{liye.he@helsinki.fi}}
   \item{Jing Tang \email{jing.tang@helsinki.fi}}
   \item{Shuyu Zheng \email{shuyu.zheng@helsinki.fi}}
}
}
