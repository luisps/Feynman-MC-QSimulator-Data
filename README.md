
May, 2024

Benchmarking Feynman MC simulator

FILES:

********

circuit_<ID>.data_stats_<algorithm>_<input state>_<output state>_<Nsamples>_<Nthreads>_average.csv

CSV file with statistics per task (n tasks = Nthreads*8)
Average of 5 executions

Structure:
2nd row - true amplitude transition complex number

4th row and below (per task ordered by termination time):
n_samples, time (us), n_paths, non zero paths, estimateR, estimateI, varianceR, varianceI, variance, L2

********

circuit_<ID>.data_stats_<algorithm>_<input state>_<output state>_<Nsamples>_<Nthreads>.csv

Results for large (>=120 qubits) Hidden Shift circuits)
CSV file with statistics per task (n tasks = Nthreads*8)
Single execution

Structure:
2nd row - true amplitude transition complex number

4th row and below (per task ordered by termination time):
n_samples, time (us), n_paths, non zero paths, estimateR, estimateI, varianceR, varianceI

*********

ExecutionData.xlsx

Excel spreadsheet with data for each circuit and algorithm

*********

CircuitsForBenchMarking.pdf

Data on the circuits
