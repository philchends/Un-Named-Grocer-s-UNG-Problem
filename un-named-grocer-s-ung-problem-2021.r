{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "cd643f4d",
   "metadata": {
    "_cell_guid": "020b09f5-9a68-4f8f-969d-dbf69af69e2c",
    "_uuid": "944778b4-1b96-4d75-b26e-3a0e29c03204",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2021-12-31T09:49:58.889764Z",
     "iopub.status.busy": "2021-12-31T09:49:58.887462Z",
     "iopub.status.idle": "2021-12-31T09:50:00.415501Z",
     "shell.execute_reply": "2021-12-31T09:50:00.413666Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.543806,
     "end_time": "2021-12-31T09:50:00.415681",
     "exception": false,
     "start_time": "2021-12-31T09:49:58.871875",
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
    "library(tidyverse)\n",
    "library(dplyr)\n",
    "library(skimr)\n",
    "library(ggplot2)\n",
    "library(patchwork)\n",
    "library(tidyr)\n",
    "library(gt)\n",
    "library(broom)\n",
    "library(magrittr)\n",
    "library(\"readxl\")\n",
    "data <- read_excel(\"../input/chooseyourownvendor2021/ChooseYourOwnVendor2021.xlsx\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "65f7c409",
   "metadata": {
    "_cell_guid": "9dc1eab8-739e-46d5-9e76-cb5445ba2e82",
    "_uuid": "90a06d0a-fc87-4ea0-b024-d24d9c990c36",
    "papermill": {
     "duration": 0.016156,
     "end_time": "2021-12-31T09:50:00.450621",
     "exception": false,
     "start_time": "2021-12-31T09:50:00.434465",
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
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "de4a4396",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2021-12-31T09:50:00.519534Z",
     "iopub.status.busy": "2021-12-31T09:50:00.490211Z",
     "iopub.status.idle": "2021-12-31T09:50:00.589312Z",
     "shell.execute_reply": "2021-12-31T09:50:00.586799Z"
    },
    "papermill": {
     "duration": 0.122184,
     "end_time": "2021-12-31T09:50:00.589481",
     "exception": false,
     "start_time": "2021-12-31T09:50:00.467297",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'CRUSauceCost'</li><li>'TOISauceCost'</li><li>'StackedSauceCost'</li><li>'StackedVendor'</li><li>'CRUPurchase'</li><li>'TOIPurchase'</li><li>'StackedPurchase'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'CRUSauceCost'\n",
       "\\item 'TOISauceCost'\n",
       "\\item 'StackedSauceCost'\n",
       "\\item 'StackedVendor'\n",
       "\\item 'CRUPurchase'\n",
       "\\item 'TOIPurchase'\n",
       "\\item 'StackedPurchase'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'CRUSauceCost'\n",
       "2. 'TOISauceCost'\n",
       "3. 'StackedSauceCost'\n",
       "4. 'StackedVendor'\n",
       "5. 'CRUPurchase'\n",
       "6. 'TOIPurchase'\n",
       "7. 'StackedPurchase'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"CRUSauceCost\"     \"TOISauceCost\"     \"StackedSauceCost\" \"StackedVendor\"   \n",
       "[5] \"CRUPurchase\"      \"TOIPurchase\"      \"StackedPurchase\" "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "Ingredients <- read_excel(\"../input/chooseyourownvendor2021/ChooseYourOwnVendor2021.xlsx\", sheet=\"Ingredients\")\n",
    "names(Ingredients)"
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
   "duration": 4.933011,
   "end_time": "2021-12-31T09:50:00.721680",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2021-12-31T09:49:55.788669",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
