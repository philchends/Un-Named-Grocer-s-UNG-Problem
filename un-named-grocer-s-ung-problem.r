{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "af146c56",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2021-12-31T05:42:59.702434Z",
     "iopub.status.busy": "2021-12-31T05:42:59.699964Z",
     "iopub.status.idle": "2021-12-31T05:43:01.129846Z",
     "shell.execute_reply": "2021-12-31T05:43:01.128229Z"
    },
    "papermill": {
     "duration": 1.441676,
     "end_time": "2021-12-31T05:43:01.130005",
     "exception": false,
     "start_time": "2021-12-31T05:42:59.688329",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.5     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.5     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.7\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.0.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "\n",
      "Attaching package: ‘magrittr’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    set_names\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:tidyr’:\n",
      "\n",
      "    extract\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "knitr::opts_chunk$set(echo = TRUE)\n",
    "library(tidyverse)\n",
    "library(dplyr)\n",
    "library(skimr)\n",
    "library(ggplot2)\n",
    "library(patchwork)\n",
    "library(tidyr)\n",
    "library(gt)\n",
    "library(broom)\n",
    "library(magrittr)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a1d629f5",
   "metadata": {
    "papermill": {
     "duration": 0.012817,
     "end_time": "2021-12-31T05:43:01.158585",
     "exception": false,
     "start_time": "2021-12-31T05:43:01.145768",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Un-Named Grocer's (UNG) Problem\n",
    "\n",
    "The UNG food division has a problem and you have previously recommended a course of action for solving the problem.  Their original problem was to compare a Chicken Kiev and Chicken Marsala because of the supplier disruptions.  Both products were produced by the same vendor and the vendor could no longer fully supply UNG's required quantities for both products.  The vendor can continue to supply one of the two products but a new vendor would be needed if both products were continued.   The company has decided to leave Chicken Kiev with the existing vendor and to seek out a new vendor for Chicken Marsala.  Your task is to help them choose a vendor among CRU **Chicken R Us** and TOI **Taste of Italy**; two vendors that UNG has worked with in the past.   Variables with names starting with **Stacked**  indicate stacked/tidy versions.\n",
    "\n",
    "The prior recipe has a trademarked sauce that is an ingredient in the current product.  The product must be changed.  \n",
    "\n",
    "## Ingredients\n",
    "\n",
    "1. The two vendors have supplied random samples of costs for their own sauce replacements *Sauce.Cost* and some (self-reported) customer purchase intentions (**Buy/NotBuy**) to help us choose.  Customer opinions matter.  These data are supplied in *Ingredients* in both stacked and unstacked form."
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 4.599381,
   "end_time": "2021-12-31T05:43:01.282570",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2021-12-31T05:42:56.683189",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
