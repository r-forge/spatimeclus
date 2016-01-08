###################################################################################
##' Constructor of [\code{\linkS4class{STCmodel}}] class
##'
##'  
##' \describe{
##'   \item{G}{integer. It defines the number of mixture components.}
##'   \item{K}{integer. It defines the number of polynoms for each component.}
##'   \item{Q}{integer. It defines the degree of the polynoms.}
##'   \item{nbparam}{integer.  It indicates the number of parameters involved by the model.}
##' }
##'
##' @examples
##'   getSlots("STCmodel")
##'
##' @name STCmodel-class
##' @rdname STCmodel-class
##' @exportClass STCmodel
##'
setClass(
  Class = "STCmodel", 
  representation = representation(
    G="numeric",
    K="numeric",
    Q="numeric",
    nbparam="numeric"
  ), 
  prototype = prototype(
    G=numeric(),
    K=numeric(),
    Q=numeric(),
    nbparam=numeric()
  )
)
###################################################################################
##' This function builts an instance of \linkS4class{STCmodel}.
##'
##' 
##' @param G integer. It defines the number of mixture components.
##' @param K integer. It defines the number of polynoms for each component.
##' @param Q integer. It defines the degree of the polynoms.
##' 
##'  
##' @return Returns an instance of \linkS4class{STCmodel}.
##' @export
##'
##'
STCmodel <- function(G, K, Q){
  nbparam <- G*K*(Q+6) - 3*G -1
  return(new("STCmodel", G=G, K=K, Q=Q, nbparam=nbparam))
}

###################################################################################
##' Constructor of [\code{\linkS4class{STCparam}}] class
##'
##'  
##' \describe{
##'   \item{proportions}{numeric. It defines the component proportions.}
##'   \item{lambda}{list. It defines the logistic coefficients per component.}
##'   \item{beta}{list.  It defines the polynom coefficients per component.}
##'   \item{sigma}{matrix.  It defines the variance associated to each polynom per component.}
##' }
##'
##' @examples
##'   getSlots("STCparam")
##'
##' @name STCparam-class
##' @rdname STCparam-class
##' @exportClass STCparam
##'
setClass(
  Class = "STCparam", 
  representation = representation(
    proportions="numeric",
    lambda="list",
    beta="list",
    sigma="matrix"
  ), 
  prototype = prototype(
    proportions=numeric(),
    lambda=list(),
    beta=list(),
    sigma=matrix()
  )
)

###################################################################################
##' Constructor of [\code{\linkS4class{STCcriteria}}] class
##'
##'  
##' \describe{
##'   \item{loglike}{numeric. It indicates the value of the log-likelihood.}
##'   \item{AIC}{numeric. It indicates the value of the AIC criterion.}
##'   \item{BIC}{numeric. It indicates the value of the BIC criterion.}
##'   \item{ICL}{numeric. It indicates the value of the ICL criterion.}
##' }
##'
##' @examples
##'   getSlots("STCcriteria")
##'
##' @name STCcriteria-class
##' @rdname STCcriteria-class
##' @exportClass STCcriteria
##'
setClass(
  Class = "STCcriteria", 
  representation = representation(
    loglike="numeric",
    AIC="numeric",
    BIC="numeric",
    ICL="numeric"
  ), 
  prototype = prototype(
    loglike=numeric(),
    AIC=numeric(),
    BIC=numeric(),
    ICL=numeric()
  )
)

###################################################################################
##' Constructor of [\code{\linkS4class{STCpartitions}}] class
##'
##'  
##' \describe{
##'   \item{hardind}{numeric. It indicates the hard partition of the individuals (obtained by the MAP rule qpplied with the MLE).}
##'   \item{fuzzyind}{matrix. It indicates the fuzzy partition (conditional probability of the component membership) of the individuals.}
##'   \item{hardseg}{list. It indicates the segmentation (most probable polynom according to the spatial and temporal grid) per components}
##' }
##'
##' @examples
##'   getSlots("STCpartitions")
##'
##' @name STCpartitions-class
##' @rdname STCpartitions-class
##' @exportClass STCpartitions
##'
setClass(
  Class = "STCpartitions", 
  representation = representation(
    hardind="numeric",
    fuzzyind="matrix",
    hardseg="list"
  ), 
  prototype = prototype(
    hardind=numeric(),
    fuzzyind=matrix(),
    hardseg=list()
  )
)

###################################################################################
##' Constructor of [\code{\linkS4class{STCdata}}] class
##'
##'  
##' \describe{
##'   \item{x}{matrix. It contains the observations. Each column corresponds to an individual. The row indicates the values of each site for each time.}
##'   \item{TT}{numeric. It indicates the number of elements of the time grid.}
##'   \item{JJ}{numeric. It indicates the number of sites.}
##'   \item{n}{numeric. It indicates the number of observations.}
##'   \item{map}{numeric. It indicates the spatial coordinates of each site.}
##' }
##'
##' @examples
##'   getSlots("STCdata")
##'
##' @name STCdata-class
##' @rdname STCdata-class
##' @exportClass STCdata
##'
setClass(
  Class = "STCdata", 
  representation = representation(
    x="matrix",
    TT="numeric",
    JJ="numeric",
    n="numeric",
    map="matrix"
  ), 
  prototype = prototype(
    x=matrix(),
    TT=numeric(),
    JJ=numeric(),
    n=numeric(),
    map=matrix()
  )
)
###################################################################################
##' Constructor of [\code{\linkS4class{STCtune}}] class
##'
##'  
##' \describe{
##'   \item{tol}{numeric. The algorithm is stopped when two successive iterations increase the log-likelihood less than tol.}
##'   \item{nbinitSmall}{numeric. Number of random initializations for the short run EM algorithm.}
##'   \item{nbinitKept}{numeric. Number of initializations kept for the long run EM algorithm.}
##'   \item{nbiterSmall}{numeric. Maximum number of iteration before stopping the short run EM algorithm.}
##'   \item{nbiterKept}{numeric. Maximum number of iteration before stopping the long run EM algorithm.}
##' }
##'
##' @examples
##'   getSlots("STCtune")
##'
##' @name STCtune-class
##' @rdname STCtune-class
##' @exportClass STCtune
##'
setClass(
  Class = "STCtune", 
  representation = representation(
    tol="numeric",
    nbinitSmall="numeric",
    nbinitKept="numeric",
    nbiterSmall="numeric",
    nbiterKept="numeric"
  ), 
  prototype = prototype(
    tol=numeric(),
    nbinitSmall=numeric(),
    nbinitKept=numeric(),
    nbiterSmall=numeric(),
    nbiterKept=numeric()
  )
)
###################################################################################
##' Constructor of [\code{\linkS4class{STCresults}}] class
##'
##'  
##' \describe{
##'   \item{model}{\linkS4class{STCmodel}. It contains the elements relied to the model.}
##'   \item{data}{\linkS4class{STCdata}. It contains the elements relied to the data.}
##'   \item{param}{\linkS4class{STCparam}. It contains the elements relied to the parameters.}
##'   \item{criteria}{\linkS4class{STCcriteria}. It contains the elements relied to the information criteria.}
##'   \item{partitions}{\linkS4class{STCpartitions}. It contains the elements relied to the partitions.}
##'   \item{tune}{\linkS4class{STCtune}. It contains the tunning parameters of the algorithm.}
##' }
##'
##' @examples
##'   getSlots("STCresults")
##'
##' @name STCresults-class
##' @rdname STCresults-class
##' @exportClass STCresults
##'
setClass(
  Class = "STCresults", 
  representation = representation(
    model="STCmodel",
    data="STCdata",
    param="STCparam",
    criteria="STCcriteria",
    partitions="STCpartitions",
    tune="STCtune"
  ), 
  prototype = prototype(
    model=new("STCmodel"),
    param=new("STCdata"),
    param=new("STCparam"),
    criteria=new("STCcriteria"),
    partitions=new("STCpartitions"),
    tune=new("STCtune")
  )
)