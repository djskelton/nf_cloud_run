params.results_dir = null
params.indir = null

results_dir = file( params.results_dir )
indir = file( params.indir )

process main {
  publishDir "${results_dir}", mode: "copy"

  input:
  file indir

  output:
  file indir into complete

  script:
  """
  cd ${indir}
  python run.py
  exit \$?
  """
}
