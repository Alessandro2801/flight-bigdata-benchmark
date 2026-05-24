# Flight Big Data Project

Progetto base per scaricare un dataset pesante da Kaggle, pulirlo e prepararlo per successive analisi di big data.

## Obiettivi iniziali

1. Scaricare il dataset da Kaggle in `data/raw/`
2. Eseguire data preprocessing e pulizia in `data/processed/`
3. Preparare una struttura ordinata per notebook, test e future pipeline

## Struttura

- `run_pipeline.py`: entrypoint semplice per download e preprocessing
- `src/preparation/download.py`: download dataset da Kaggle
- `src/preparation/process_raw.py`: pulizia e normalizzazione del dataset
- `data/`: cartelle per raw, interim e processed data
- `tests/`: test minimi per le funzioni di preprocessing

## Setup rapido

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Kaggle

Configura le credenziali Kaggle prima del download.

Opzione 1: file `~/.kaggle/kaggle.json`

Opzione 2: variabili d'ambiente

```bash
export KAGGLE_USERNAME="..."
export KAGGLE_KEY="..."
```

## Uso

Scaricare un dataset:

```bash
python run_pipeline.py download --dataset <owner/dataset-name>
```

Preprocessare un file raw:

```bash
python run_pipeline.py preprocess --input data/raw/<file.csv> --output data/processed/cleaned.csv
```

Eseguire tutto in sequenza:

```bash
python run_pipeline.py all --dataset <owner/dataset-name> --input data/raw/<file.csv>
```

## Nota

La pipeline iniziale è volutamente generica, così puoi adattarla al dataset Kaggle specifico quando mi dici quale vuoi usare.