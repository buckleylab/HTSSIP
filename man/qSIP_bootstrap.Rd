% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qSIP_atom_excess.R
\name{qSIP_bootstrap}
\alias{qSIP_bootstrap}
\title{Calculate bootstrap CI for atom fraction excess using q-SIP method}
\usage{
qSIP_bootstrap(atomX, isotope = "13C", n_sample = c(3, 3),
  n_boot = 10, parallel = FALSE, a = 0.1)
}
\arguments{
\item{atomX}{A list object created by \code{qSIP_atom_excess()}}

\item{isotope}{The isotope for which the DNA is labeled with ('13C' or '18O')}

\item{n_sample}{A vector of length 2.
The sample size for data resampling (with replacement) for 1) control samples
and 2) treatment samples.}

\item{n_boot}{Number of bootstrap replicates.}

\item{parallel}{Parallel processing. See \code{.parallel} option in
\code{dplyr::mdply()} for more details.}

\item{a}{A numeric value. The alpha for calculating confidence intervals.}
}
\value{
A data.frame of atom fraction excess values (A) and
atom fraction excess confidence intervals.
}
\description{
Calculate bootstrap CI for atom fraction excess using q-SIP method
}
\examples{
# tranforming values
physeq_rep3_t = OTU_qPCR_trans(physeq_rep3, physeq_rep3_qPCR)

\dontrun{
# BD shift (Z) & atom excess (A)
atomX = qSIP_atom_excess(physeq_rep3_t,
                        control_expr='Treatment=="12C-Con"',
                        treatment_rep='Replicate')

# bootstrapping in parallel
doParallel::registerDoParallel(2)
df_atomX_boot = qSIP_bootstrap(atomX, parallel=TRUE)
head(df_atomX_boot)
}

}
