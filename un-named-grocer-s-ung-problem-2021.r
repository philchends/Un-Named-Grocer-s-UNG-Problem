{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "28991422",
   "metadata": {
    "_cell_guid": "020b09f5-9a68-4f8f-969d-dbf69af69e2c",
    "_uuid": "944778b4-1b96-4d75-b26e-3a0e29c03204",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:42.871610Z",
     "iopub.status.busy": "2022-01-02T06:35:42.868435Z",
     "iopub.status.idle": "2022-01-02T06:35:44.370538Z",
     "shell.execute_reply": "2022-01-02T06:35:44.368899Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.702558,
     "end_time": "2022-01-02T06:35:44.370721",
     "exception": false,
     "start_time": "2022-01-02T06:35:42.668163",
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
   "id": "ea47a8ac",
   "metadata": {
    "_cell_guid": "9dc1eab8-739e-46d5-9e76-cb5445ba2e82",
    "_uuid": "90a06d0a-fc87-4ea0-b024-d24d9c990c36",
    "papermill": {
     "duration": 0.201155,
     "end_time": "2022-01-02T06:35:44.774432",
     "exception": false,
     "start_time": "2022-01-02T06:35:44.573277",
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
   "id": "0e3123e9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:45.214796Z",
     "iopub.status.busy": "2022-01-02T06:35:45.182831Z",
     "iopub.status.idle": "2022-01-02T06:35:45.270611Z",
     "shell.execute_reply": "2022-01-02T06:35:45.268888Z"
    },
    "papermill": {
     "duration": 0.294965,
     "end_time": "2022-01-02T06:35:45.270757",
     "exception": false,
     "start_time": "2022-01-02T06:35:44.975792",
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
  },
  {
   "cell_type": "markdown",
   "id": "c5ac4891",
   "metadata": {
    "papermill": {
     "duration": 0.206818,
     "end_time": "2022-01-02T06:35:45.680835",
     "exception": false,
     "start_time": "2022-01-02T06:35:45.474017",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n",
    "## Ratings\n",
    "\n",
    "2. Our marketing team has called upon focus groups to compare the products.  These customer ratings *Ratings* [from 0 to 100 with 0 as worst and 100 as best] are provided for 50 consumers that evaluated both products.  "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "ee4a496e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:46.092150Z",
     "iopub.status.busy": "2022-01-02T06:35:46.090275Z",
     "iopub.status.idle": "2022-01-02T06:35:46.135130Z",
     "shell.execute_reply": "2022-01-02T06:35:46.133705Z"
    },
    "papermill": {
     "duration": 0.251786,
     "end_time": "2022-01-02T06:35:46.135283",
     "exception": false,
     "start_time": "2022-01-02T06:35:45.883497",
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
       "<ol class=list-inline><li>'Rater'</li><li>'TOI.Ratings'</li><li>'CRU.Ratings'</li><li>'Stacked.Rating'</li><li>'Stacked.Vendor'</li><li>'Stacked.Rater'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Rater'\n",
       "\\item 'TOI.Ratings'\n",
       "\\item 'CRU.Ratings'\n",
       "\\item 'Stacked.Rating'\n",
       "\\item 'Stacked.Vendor'\n",
       "\\item 'Stacked.Rater'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Rater'\n",
       "2. 'TOI.Ratings'\n",
       "3. 'CRU.Ratings'\n",
       "4. 'Stacked.Rating'\n",
       "5. 'Stacked.Vendor'\n",
       "6. 'Stacked.Rater'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Rater\"          \"TOI.Ratings\"    \"CRU.Ratings\"    \"Stacked.Rating\"\n",
       "[5] \"Stacked.Vendor\" \"Stacked.Rater\" "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "Ratings <- read_excel(\"../input/chooseyourownvendor2021/ChooseYourOwnVendor2021.xlsx\", sheet=\"Ratings\")\n",
    "names(Ratings)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a58c8d1c",
   "metadata": {
    "papermill": {
     "duration": 0.2066,
     "end_time": "2022-01-02T06:35:46.548291",
     "exception": false,
     "start_time": "2022-01-02T06:35:46.341691",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Financials\n",
    "\n",
    "3. Bottom line financials are most important.  The product was not outstanding with the existing supplier.  We expect the performance to be no better with a new vendor and a new recipe, but it is important that we pick the best vendor.  These data are supplied in *Financials*.  The data shows Costs and Boxes for each vendor over the last 52 weeks: *CRU.Costs* and *CRU.Boxes* provide the observations for Chicken R Us.  *TOI.Costs* and *TOI.Boxes* provide the observations for Taste of Italy.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "eebfcc1e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:46.967441Z",
     "iopub.status.busy": "2022-01-02T06:35:46.965961Z",
     "iopub.status.idle": "2022-01-02T06:35:47.011528Z",
     "shell.execute_reply": "2022-01-02T06:35:47.009951Z"
    },
    "papermill": {
     "duration": 0.257962,
     "end_time": "2022-01-02T06:35:47.011764",
     "exception": false,
     "start_time": "2022-01-02T06:35:46.753802",
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
       "<ol class=list-inline><li>'Week'</li><li>'TOI.Boxes'</li><li>'TOI.Costs'</li><li>'CRU.Boxes'</li><li>'CRU.Costs'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Week'\n",
       "\\item 'TOI.Boxes'\n",
       "\\item 'TOI.Costs'\n",
       "\\item 'CRU.Boxes'\n",
       "\\item 'CRU.Costs'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Week'\n",
       "2. 'TOI.Boxes'\n",
       "3. 'TOI.Costs'\n",
       "4. 'CRU.Boxes'\n",
       "5. 'CRU.Costs'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Week\"      \"TOI.Boxes\" \"TOI.Costs\" \"CRU.Boxes\" \"CRU.Costs\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "Financials <- read_excel(\"../input/chooseyourownvendor2021/ChooseYourOwnVendor2021.xlsx\", sheet=\"Financials\")\n",
    "names(Financials)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "57f1e3b5",
   "metadata": {
    "papermill": {
     "duration": 0.213038,
     "end_time": "2022-01-02T06:35:47.436327",
     "exception": false,
     "start_time": "2022-01-02T06:35:47.223289",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n",
    "# Let's Start with Ratings\n",
    "\n",
    "1. Provide some graphic that adequately captures and compares the core elements of the ratings data."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "69ae02a3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:47.863522Z",
     "iopub.status.busy": "2022-01-02T06:35:47.862465Z",
     "iopub.status.idle": "2022-01-02T06:35:48.435690Z",
     "shell.execute_reply": "2022-01-02T06:35:48.434593Z"
    },
    "papermill": {
     "duration": 0.789493,
     "end_time": "2022-01-02T06:35:48.435830",
     "exception": false,
     "start_time": "2022-01-02T06:35:47.646337",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdeZwcd33n/8/3W1V990z33Lpv67RsCXPYCwkQmyOEHBDwhiMcIcQJ7JJfkl3Y\nkN04xyb5JbvZLBsCbJIfgZj8wCGbhDNAEk4bY2xZspEtWbKtczT31Xcd3+/+MZKskUfySJ6e\n7im9no8HeFTTx7umuqve/a2jlbVWAAAAsPzpVgcAAADA4qDYAQAAxATFDgAAICYodgAAADFB\nsQMAAIgJih0AAEBMUOwAAABigmIHAAAQE26rAwDtK4qimZkZEeno6HAcp9VxALSRRqNRrVZF\npFgstjoL8DSKHXBJ1tooimZ/aHUWAO1ldv2glGp1EGAOdsUCAADEBMUOAAAgJih2AAAAMUGx\nAwAAiAmKHQAAQExQ7AAAAGKCYgcAABATFDsAAICYoNgBAADEBMUOAAAgJih2AAAAMUGxAwAA\niAmKHQAAQExQ7AAAAGKCYgcAABATFDsAAICYcFsd4AqEYdjqCLi2RFF00Q8AMMsYM/sD2yYs\nMaWU4ziX/K21dinTXDVjzOTkZKtT4Jpz/g2ilGptEgDtZnb9wMoBS8xxnEKhcKnfLptiByy9\nMAynpqZEpFAouO5yGt4G0Gz1er1cLiuluru7W50FeBrH2AEAAMQExQ4AACAmKHYAAAAxQbED\nAACICYodAABATFDsAAAAYoJiBwAAEBMUOwAAgJig2AEAAMQExQ4AACydhjFlvoC7afiWJAAA\nsBSO1Gr/NDF1tFYzVno99+XFws0deYcv211UFDsAANB0D5TKHx8aPtloFFzXVepUuX6kVj/e\naLypt0fR7RYPu2IBAEBzNYz5h7Hx043GjbncxlRqbTJ5Qy6nlfr65PTjtXqr08UKxQ4AADTX\n8XrjdMNfnUxdWDvWpZJjQfB4rdayWHFEsQMA4Ip9bnLqQ6PjX5wptTrI8lAzxrcmOXeXqxax\nSmrGtCpVLFHsAAC4Yp8aGf+d4bG7J2daHWR56HSdtHYuOhnWt8YR1ek4rUoVSxQ7AADQXGuS\nyesy6UHfr5wbnwutfbxWX51M7MpmWpstZjgrFgAANJej1Bt7u2eC4NFqzYh1RAdi16aSr+vp\nXpVMtjpdrFDsAABA061Ppd6/bs03p6aP1xtVa9YkErd0dqyl1S02ih0AAFgKecf5se6uVqeI\nOY6xAwAAiAmKHQAAQExQ7AAAAGKCYgcAABATFDsAAICYoNgBAADEBMUOAAAgJih2AAAAMUGx\nAwAAiAmKHQAAQExQ7AAAAGKCYgcAABATFDsAAICYoNgBAADEBMUOAAAgJih2AAAAMUGxAwAA\niAmKHQAAQExQ7AAAAGKCYgcAABATFDsAAICYoNgBAADEBMUOAAAgJih2AAAAMUGxAwAAiAmK\nHQAAQExQ7AAAAGKCYgcAABATFDsAAICYoNgBAADEBMUOAAAgJih2AAAAMUGxAwAAiAmKHQAA\nQExQ7AAAAGKCYgcAABATFDsAAICYoNgBAADEBMUOAAAgJih2AAAAMUGxAwAAiAmKHQAAQExQ\n7AAAAGKCYgcAABATFDsAAICYoNgBAADEBMUOAAAgJih2AAAAMUGxAwAAiAmKHQAAQExQ7AAA\nAGKCYgcAABATFDsAAICYcJfmaWw4+fmPf/TL3z04WnPWbtz1hjt+6eY1WREZ/u4Hf/73H7nw\nlu/8+N0/2Z1amlRoLmNEL/9PDsa0OgEAAAu1RMXuX37v1z7xaPFd7/u1TXnzzc/+6R/+6vs/\n9qkP9Xl6av9Uuvu17/v5nedvuS7vLU0kNIu15tQJc+xJmZ60iaTu69ebt6lcrtWxrpg5/Kj5\n6pdyZwZFWbNitXnFa/R121odCgCAy1mKYmdt42P7xnZ84Pdf/aI+Edm05Tc//4Z/94lT5f+w\noWPk0ZnCjltuuWXnsz4Ilgdro4e+b44clnpdkgkbTZszg2bwlPuiF6uunlaHuwLRv3wl/OoX\nRSllrYjYUyeDv/wz99U/7rz01lZHAwDgkpZmT5k1VpzE2edSOq2ViowVkf0zjeKeQlSbGRqZ\nsksSBU1lh8+YJ46IElmxUnX36r5+1ddnh4ejRw6IXTZL2I6PhV/7kog8ndkaERV+5Qt2cqKF\nwQAAuLylGLFTKvW+l6350B//z3t//R0b8+abd/93r2PXO9fmReShcmC/86E3/q9DgbVutveV\nb3rfL7x297wPYq0tl8tLkBbPhT5+zJmZjvpXqCB4emoqJUODtTODku9oXbQr4Ox/0Jmnhlox\ntrr/QXPTi1qQCUCbMecOwC2VSq1NgmuNUip36QOclugYu5t/7pc/d9/7/+ADvywiSunX/+ff\n7PN05J8uO976nlv+30/9dsGWvvel/++P/vw3kls++fZthWc+grW20WgsTVpcNa9WlSiKoujC\n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\nwQ4AAEAR/wcXp8wcviFoPAAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "Ratings %>%  ggplot() + aes(x=Stacked.Vendor, y=Stacked.Rating, color=Stacked.Vendor) + geom_boxplot() + geom_jitter(alpha=0.5, height = 0) + theme_minimal() + guides(color=\"none\") + labs(x=\"Vendor\", y=\"Rating\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d2151300",
   "metadata": {
    "papermill": {
     "duration": 0.226857,
     "end_time": "2022-01-02T06:35:48.874191",
     "exception": false,
     "start_time": "2022-01-02T06:35:48.647334",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n",
    "The graphic shows that TOI has a higher average rating and a small deviation. This may indicate that TOI has a better and more stable performance in rating and CRU.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8b88f018",
   "metadata": {
    "papermill": {
     "duration": 0.222803,
     "end_time": "2022-01-02T06:35:49.328955",
     "exception": false,
     "start_time": "2022-01-02T06:35:49.106152",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "2. Provide summary statistics for the *Ratings* for each producer.  Compare the means and standard deviations. What is the interquartile range for each?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "a4aa5ecd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:49.770863Z",
     "iopub.status.busy": "2022-01-02T06:35:49.769345Z",
     "iopub.status.idle": "2022-01-02T06:35:49.942082Z",
     "shell.execute_reply": "2022-01-02T06:35:49.940404Z"
    },
    "papermill": {
     "duration": 0.401512,
     "end_time": "2022-01-02T06:35:49.942241",
     "exception": false,
     "start_time": "2022-01-02T06:35:49.540729",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "── Data Summary ────────────────────────\n",
      "                           Values             \n",
      "Name                       Ratings$CRU.Ratings\n",
      "Number of rows             100                \n",
      "Number of columns          1                  \n",
      "_______________________                       \n",
      "Column type frequency:                        \n",
      "  numeric                  1                  \n",
      "________________________                      \n",
      "Group variables            None               \n",
      "\n",
      "── Variable type: numeric ──────────────────────────────────────────────────────\n",
      "  skim_variable n_missing complete_rate  mean    sd    p0   p25   p50   p75\n",
      "1 data                 50           0.5  74.7  4.60    65    72    75    77\n",
      "   p100 hist \n",
      "1    85 ▃▅▇▂▂\n"
     ]
    }
   ],
   "source": [
    "skim(Ratings$CRU.Ratings)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4aff7c66",
   "metadata": {
    "papermill": {
     "duration": 0.216119,
     "end_time": "2022-01-02T06:35:50.378420",
     "exception": false,
     "start_time": "2022-01-02T06:35:50.162301",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The mean of CRU is 74,7 with a standard deviation of 4.60. The interquartile is 5 (p75-p25)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "92fd5613",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:50.814890Z",
     "iopub.status.busy": "2022-01-02T06:35:50.812767Z",
     "iopub.status.idle": "2022-01-02T06:35:50.932378Z",
     "shell.execute_reply": "2022-01-02T06:35:50.930546Z"
    },
    "papermill": {
     "duration": 0.338859,
     "end_time": "2022-01-02T06:35:50.932643",
     "exception": false,
     "start_time": "2022-01-02T06:35:50.593784",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "── Data Summary ────────────────────────\n",
      "                           Values             \n",
      "Name                       Ratings$TOI.Ratings\n",
      "Number of rows             100                \n",
      "Number of columns          1                  \n",
      "_______________________                       \n",
      "Column type frequency:                        \n",
      "  numeric                  1                  \n",
      "________________________                      \n",
      "Group variables            None               \n",
      "\n",
      "── Variable type: numeric ──────────────────────────────────────────────────────\n",
      "  skim_variable n_missing complete_rate  mean    sd    p0   p25   p50   p75\n",
      "1 data                 50           0.5  76.0  3.57    68    73    76  78.8\n",
      "   p100 hist \n",
      "1    87 ▁▇▇▃▁\n"
     ]
    }
   ],
   "source": [
    "skim(Ratings$TOI.Ratings)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b51075f7",
   "metadata": {
    "papermill": {
     "duration": 0.215816,
     "end_time": "2022-01-02T06:35:51.363704",
     "exception": false,
     "start_time": "2022-01-02T06:35:51.147888",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The mean of TOI is 76 with a standard deviation of 3.57. The interquartile is 5.8."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0ebe1214",
   "metadata": {
    "papermill": {
     "duration": 0.214247,
     "end_time": "2022-01-02T06:35:51.793593",
     "exception": false,
     "start_time": "2022-01-02T06:35:51.579346",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "3. What is the 95% confidence interval for average ratings for each producer?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "52a5f369",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:52.250939Z",
     "iopub.status.busy": "2022-01-02T06:35:52.249424Z",
     "iopub.status.idle": "2022-01-02T06:35:52.268225Z",
     "shell.execute_reply": "2022-01-02T06:35:52.266617Z"
    },
    "papermill": {
     "duration": 0.237937,
     "end_time": "2022-01-02T06:35:52.268370",
     "exception": false,
     "start_time": "2022-01-02T06:35:52.030433",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tOne Sample t-test\n",
       "\n",
       "data:  Ratings$CRU.Ratings\n",
       "t = 114.85, df = 49, p-value < 2.2e-16\n",
       "alternative hypothesis: true mean is not equal to 0\n",
       "95 percent confidence interval:\n",
       " 73.39291 76.00709\n",
       "sample estimates:\n",
       "mean of x \n",
       "     74.7 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "t.test(Ratings$CRU.Ratings)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ae019eee",
   "metadata": {
    "papermill": {
     "duration": 0.216348,
     "end_time": "2022-01-02T06:35:52.701031",
     "exception": false,
     "start_time": "2022-01-02T06:35:52.484683",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The 95% confidence interval for average for CRU is between 73.39291 and 76.00709"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "3bde3c83",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:53.141487Z",
     "iopub.status.busy": "2022-01-02T06:35:53.139880Z",
     "iopub.status.idle": "2022-01-02T06:35:53.157569Z",
     "shell.execute_reply": "2022-01-02T06:35:53.155992Z"
    },
    "papermill": {
     "duration": 0.239309,
     "end_time": "2022-01-02T06:35:53.157709",
     "exception": false,
     "start_time": "2022-01-02T06:35:52.918400",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tOne Sample t-test\n",
       "\n",
       "data:  Ratings$TOI.Ratings\n",
       "t = 150.44, df = 49, p-value < 2.2e-16\n",
       "alternative hypothesis: true mean is not equal to 0\n",
       "95 percent confidence interval:\n",
       " 75.02426 77.05574\n",
       "sample estimates:\n",
       "mean of x \n",
       "    76.04 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "t.test(Ratings$TOI.Ratings)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e839319a",
   "metadata": {
    "papermill": {
     "duration": 0.215798,
     "end_time": "2022-01-02T06:35:53.591255",
     "exception": false,
     "start_time": "2022-01-02T06:35:53.375457",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The 95% confidence interval for average for TOI is between  75.02426 and 77.05574"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f6785ff1",
   "metadata": {
    "papermill": {
     "duration": 0.217885,
     "end_time": "2022-01-02T06:35:54.026940",
     "exception": false,
     "start_time": "2022-01-02T06:35:53.809055",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "4. Is either product better with 95% confidence?  Which product is better?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "94402660",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:54.467251Z",
     "iopub.status.busy": "2022-01-02T06:35:54.465668Z",
     "iopub.status.idle": "2022-01-02T06:35:54.482821Z",
     "shell.execute_reply": "2022-01-02T06:35:54.481256Z"
    },
    "papermill": {
     "duration": 0.237729,
     "end_time": "2022-01-02T06:35:54.482970",
     "exception": false,
     "start_time": "2022-01-02T06:35:54.245241",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tPaired t-test\n",
       "\n",
       "data:  Ratings$TOI.Ratings and Ratings$CRU.Ratings\n",
       "t = 2.9865, df = 49, p-value = 0.004396\n",
       "alternative hypothesis: true difference in means is not equal to 0\n",
       "95 percent confidence interval:\n",
       " 0.4383426 2.2416574\n",
       "sample estimates:\n",
       "mean of the differences \n",
       "                   1.34 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "t.test(Ratings$TOI.Ratings,Ratings$CRU.Ratings,paired = TRUE)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2e727764",
   "metadata": {
    "papermill": {
     "duration": 0.219582,
     "end_time": "2022-01-02T06:35:54.921702",
     "exception": false,
     "start_time": "2022-01-02T06:35:54.702120",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The average rating of TOI is 1.34 higher than that of CRU with a 95% confidence interval between 0.4383426 and 2.2416574. The product of TOI is better than that of CRU."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b935332e",
   "metadata": {
    "papermill": {
     "duration": 0.218183,
     "end_time": "2022-01-02T06:35:55.358293",
     "exception": false,
     "start_time": "2022-01-02T06:35:55.140110",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Ingredients\n",
    "\n",
    "## Sauce Cost\n",
    "\n",
    "1. Provide summary statistics and some combined graphic for the *SauceCost* for each vendor.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "9e8f0957",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:55.799498Z",
     "iopub.status.busy": "2022-01-02T06:35:55.798060Z",
     "iopub.status.idle": "2022-01-02T06:35:55.891187Z",
     "shell.execute_reply": "2022-01-02T06:35:55.889465Z"
    },
    "papermill": {
     "duration": 0.31565,
     "end_time": "2022-01-02T06:35:55.891341",
     "exception": false,
     "start_time": "2022-01-02T06:35:55.575691",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "── Data Summary ────────────────────────\n",
      "                           Values    \n",
      "Name                       Piped data\n",
      "Number of rows             64        \n",
      "Number of columns          7         \n",
      "_______________________              \n",
      "Column type frequency:               \n",
      "  numeric                  1         \n",
      "________________________             \n",
      "Group variables            None      \n",
      "\n",
      "── Variable type: numeric ──────────────────────────────────────────────────────\n",
      "  skim_variable    n_missing complete_rate  mean    sd    p0   p25   p50   p75\n",
      "1 StackedSauceCost         0             1  2.46 0.249  1.95  2.29  2.42  2.63\n",
      "   p100 hist \n",
      "1     3 ▂▇▇▅▃\n"
     ]
    }
   ],
   "source": [
    "Ingredients %>% filter(StackedVendor==\"CRU\")%>% skim(StackedSauceCost)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "296e570e",
   "metadata": {
    "papermill": {
     "duration": 0.222622,
     "end_time": "2022-01-02T06:35:56.337927",
     "exception": false,
     "start_time": "2022-01-02T06:35:56.115305",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "CRU has an average sauce cost of \\$2.46 with a standard deviation of 0.249."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "7f947afa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:56.785913Z",
     "iopub.status.busy": "2022-01-02T06:35:56.783869Z",
     "iopub.status.idle": "2022-01-02T06:35:56.871674Z",
     "shell.execute_reply": "2022-01-02T06:35:56.870084Z"
    },
    "papermill": {
     "duration": 0.313172,
     "end_time": "2022-01-02T06:35:56.871864",
     "exception": false,
     "start_time": "2022-01-02T06:35:56.558692",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "── Data Summary ────────────────────────\n",
      "                           Values    \n",
      "Name                       Piped data\n",
      "Number of rows             81        \n",
      "Number of columns          7         \n",
      "_______________________              \n",
      "Column type frequency:               \n",
      "  numeric                  1         \n",
      "________________________             \n",
      "Group variables            None      \n",
      "\n",
      "── Variable type: numeric ──────────────────────────────────────────────────────\n",
      "  skim_variable    n_missing complete_rate  mean    sd    p0   p25   p50   p75\n",
      "1 StackedSauceCost         0             1  2.59 0.128  2.23   2.5  2.59  2.68\n",
      "   p100 hist \n",
      "1  2.87 ▁▃▇▇▂\n"
     ]
    }
   ],
   "source": [
    "Ingredients %>% filter(StackedVendor==\"TOI\")%>% skim(StackedSauceCost)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5137fce3",
   "metadata": {
    "papermill": {
     "duration": 0.222038,
     "end_time": "2022-01-02T06:35:57.316860",
     "exception": false,
     "start_time": "2022-01-02T06:35:57.094822",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "TOI has an average sauce cost of \\$2.59 with a standard deviation of 0.128."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "51e30d89",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:57.766864Z",
     "iopub.status.busy": "2022-01-02T06:35:57.765426Z",
     "iopub.status.idle": "2022-01-02T06:35:58.064524Z",
     "shell.execute_reply": "2022-01-02T06:35:58.063931Z"
    },
    "papermill": {
     "duration": 0.525789,
     "end_time": "2022-01-02T06:35:58.064674",
     "exception": false,
     "start_time": "2022-01-02T06:35:57.538885",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n2AEATIgdAMBE0uPldFuL3eMAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "Ingredients %>% ggplot()+ aes(x=StackedVendor, y= StackedSauceCost, color= StackedVendor)+ geom_violin()+geom_jitter(alpha=0.1, height = 0) + theme_minimal() + guides(color=\"none\") + labs(x=\"Vendor\", y=\"Sauce Cost\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e64002df",
   "metadata": {
    "papermill": {
     "duration": 0.226672,
     "end_time": "2022-01-02T06:35:58.517566",
     "exception": false,
     "start_time": "2022-01-02T06:35:58.290894",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The graphic shows that CRU has a wider sauce cost interval compared to that of TOI. Despite a maximum cost of \\$3, \n",
    "\n",
    "most of CRU's cost is between \\$2.20 and \\$2.62, \n",
    "\n",
    "making it more cost-efficient than TOI. Most of TOI's cost is between \\$2.37  and \\$ 2.75"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ab1c9427",
   "metadata": {
    "papermill": {
     "duration": 0.235072,
     "end_time": "2022-01-02T06:35:58.979798",
     "exception": false,
     "start_time": "2022-01-02T06:35:58.744726",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "2. Assume that costs are normal with mean and standard deviation exactly as you have calculated above.\n",
    "    The probability of costs below \\$2.35 for CRU is 0.3293289"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "c59e7e47",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:35:59.434687Z",
     "iopub.status.busy": "2022-01-02T06:35:59.434010Z",
     "iopub.status.idle": "2022-01-02T06:35:59.450522Z",
     "shell.execute_reply": "2022-01-02T06:35:59.449079Z"
    },
    "papermill": {
     "duration": 0.246511,
     "end_time": "2022-01-02T06:35:59.450660",
     "exception": false,
     "start_time": "2022-01-02T06:35:59.204149",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.329328885638643"
      ],
      "text/latex": [
       "0.329328885638643"
      ],
      "text/markdown": [
       "0.329328885638643"
      ],
      "text/plain": [
       "[1] 0.3293289"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pnorm(2.35,2.46,0.249)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2ef54a80",
   "metadata": {
    "papermill": {
     "duration": 0.228454,
     "end_time": "2022-01-02T06:35:59.906634",
     "exception": false,
     "start_time": "2022-01-02T06:35:59.678180",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    " The probability of costs below \\$2.35 for TOI is 0.03039636. A lot lower than that of CRU."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "c9217727",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:00.366429Z",
     "iopub.status.busy": "2022-01-02T06:36:00.364619Z",
     "iopub.status.idle": "2022-01-02T06:36:00.382886Z",
     "shell.execute_reply": "2022-01-02T06:36:00.381258Z"
    },
    "papermill": {
     "duration": 0.248705,
     "end_time": "2022-01-02T06:36:00.383057",
     "exception": false,
     "start_time": "2022-01-02T06:36:00.134352",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.0303963617652615"
      ],
      "text/latex": [
       "0.0303963617652615"
      ],
      "text/markdown": [
       "0.0303963617652615"
      ],
      "text/plain": [
       "[1] 0.03039636"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pnorm(2.35,2.59,0.128)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "834d83f1",
   "metadata": {
    "papermill": {
     "duration": 0.233669,
     "end_time": "2022-01-02T06:36:00.846901",
     "exception": false,
     "start_time": "2022-01-02T06:36:00.613232",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "3. What is a 95% confidence interval for the average *SauceCost* for each vendor?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "618ce7a6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:01.320804Z",
     "iopub.status.busy": "2022-01-02T06:36:01.319160Z",
     "iopub.status.idle": "2022-01-02T06:36:01.336118Z",
     "shell.execute_reply": "2022-01-02T06:36:01.334507Z"
    },
    "papermill": {
     "duration": 0.254536,
     "end_time": "2022-01-02T06:36:01.336252",
     "exception": false,
     "start_time": "2022-01-02T06:36:01.081716",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tOne Sample t-test\n",
       "\n",
       "data:  Ingredients$CRUSauceCost\n",
       "t = 79.154, df = 63, p-value < 2.2e-16\n",
       "alternative hypothesis: true mean is not equal to 0\n",
       "95 percent confidence interval:\n",
       " 2.402616 2.527072\n",
       "sample estimates:\n",
       "mean of x \n",
       " 2.464844 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "t.test(Ingredients$CRUSauceCost)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d8e50809",
   "metadata": {
    "papermill": {
     "duration": 0.232353,
     "end_time": "2022-01-02T06:36:01.801952",
     "exception": false,
     "start_time": "2022-01-02T06:36:01.569599",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The 95% confidence interval for the average sauce cost for CRU is between \\$2.402616 \n",
    "\n",
    "and $2.527072"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "882093c8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:02.300720Z",
     "iopub.status.busy": "2022-01-02T06:36:02.299136Z",
     "iopub.status.idle": "2022-01-02T06:36:02.317474Z",
     "shell.execute_reply": "2022-01-02T06:36:02.315904Z"
    },
    "papermill": {
     "duration": 0.257089,
     "end_time": "2022-01-02T06:36:02.317615",
     "exception": false,
     "start_time": "2022-01-02T06:36:02.060526",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tOne Sample t-test\n",
       "\n",
       "data:  Ingredients$TOISauceCost\n",
       "t = 182.19, df = 80, p-value < 2.2e-16\n",
       "alternative hypothesis: true mean is not equal to 0\n",
       "95 percent confidence interval:\n",
       " 2.565983 2.622659\n",
       "sample estimates:\n",
       "mean of x \n",
       " 2.594321 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "t.test(Ingredients$TOISauceCost)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aaa9b1e1",
   "metadata": {
    "papermill": {
     "duration": 0.263126,
     "end_time": "2022-01-02T06:36:02.818067",
     "exception": false,
     "start_time": "2022-01-02T06:36:02.554941",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The 95% confidence interval for the average sauce cost for TOI is between \\$2.565983\n",
    "\n",
    "and \\$2.622659"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bfb9e3cc",
   "metadata": {
    "papermill": {
     "duration": 0.234065,
     "end_time": "2022-01-02T06:36:03.291141",
     "exception": false,
     "start_time": "2022-01-02T06:36:03.057076",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "4. What is the 95% confidence interval for the difference in average costs?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "46067241",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T05:46:06.801224Z",
     "iopub.status.busy": "2022-01-02T05:46:06.799983Z",
     "iopub.status.idle": "2022-01-02T05:46:06.814995Z"
    },
    "papermill": {
     "duration": 0.240686,
     "end_time": "2022-01-02T06:36:03.768385",
     "exception": false,
     "start_time": "2022-01-02T06:36:03.527699",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "bebd5838",
   "metadata": {
    "papermill": {
     "duration": 0.23736,
     "end_time": "2022-01-02T06:36:04.241893",
     "exception": false,
     "start_time": "2022-01-02T06:36:04.004533",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Comparing CRUSauceCost with TOISauceCost, the 95% confidence interval is \\$-0.19751362 \n",
    "\n",
    "to \\-$0.06144086.\n",
    "\n",
    "CRU's sauce cost is cheaper with 95% confidence."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "81a03b04",
   "metadata": {
    "papermill": {
     "duration": 0.234905,
     "end_time": "2022-01-02T06:36:04.712293",
     "exception": false,
     "start_time": "2022-01-02T06:36:04.477388",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Purchase Intentions\n",
    "\n",
    "1. What proportion would buy the products of each vendor?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "5163f8c3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:05.188129Z",
     "iopub.status.busy": "2022-01-02T06:36:05.186533Z",
     "iopub.status.idle": "2022-01-02T06:36:05.210478Z",
     "shell.execute_reply": "2022-01-02T06:36:05.208948Z"
    },
    "papermill": {
     "duration": 0.261756,
     "end_time": "2022-01-02T06:36:05.210611",
     "exception": false,
     "start_time": "2022-01-02T06:36:04.948855",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "     \n",
       "      Buy NotBuy\n",
       "  CRU  43     21\n",
       "  TOI  43     38"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "\n",
       "\t1-sample proportions test with continuity correction\n",
       "\n",
       "data:  table(Ingredients$CRUPurchase), null probability 0.5\n",
       "X-squared = 6.8906, df = 1, p-value = 0.008665\n",
       "alternative hypothesis: true p is not equal to 0.5\n",
       "95 percent confidence interval:\n",
       " 0.5419976 0.7810085\n",
       "sample estimates:\n",
       "       p \n",
       "0.671875 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "table(Ingredients$StackedVendor,Ingredients$StackedPurchase)\n",
    "\n",
    "prop.test(table(Ingredients$CRUPurchase))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "44965ad5",
   "metadata": {
    "papermill": {
     "duration": 0.23855,
     "end_time": "2022-01-02T06:36:05.685779",
     "exception": false,
     "start_time": "2022-01-02T06:36:05.447229",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The proportion of customers purchasing the product of CRU is 0.671875 with a 95 confidence interval from 0.5419976 to 0.7810085"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "4aa00c28",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:06.172287Z",
     "iopub.status.busy": "2022-01-02T06:36:06.170685Z",
     "iopub.status.idle": "2022-01-02T06:36:06.188107Z",
     "shell.execute_reply": "2022-01-02T06:36:06.186577Z"
    },
    "papermill": {
     "duration": 0.262371,
     "end_time": "2022-01-02T06:36:06.188248",
     "exception": false,
     "start_time": "2022-01-02T06:36:05.925877",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\t1-sample proportions test with continuity correction\n",
       "\n",
       "data:  table(Ingredients$TOIPurchase), null probability 0.5\n",
       "X-squared = 0.19753, df = 1, p-value = 0.6567\n",
       "alternative hypothesis: true p is not equal to 0.5\n",
       "95 percent confidence interval:\n",
       " 0.4173041 0.6414743\n",
       "sample estimates:\n",
       "        p \n",
       "0.5308642 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "prop.test(table(Ingredients$TOIPurchase))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3f8beede",
   "metadata": {
    "papermill": {
     "duration": 0.243195,
     "end_time": "2022-01-02T06:36:06.670172",
     "exception": false,
     "start_time": "2022-01-02T06:36:06.426977",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The proportion of customers purchasing the product of TOI is 0.5308642 with a 95% confidence interval from 0.4173041 to 0.6414743"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3fa8b95a",
   "metadata": {
    "papermill": {
     "duration": 0.245302,
     "end_time": "2022-01-02T06:36:07.159230",
     "exception": false,
     "start_time": "2022-01-02T06:36:06.913928",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "2. The surveys were, in each case, sent to 85 individuals.  With 95% confidence, what is the [two-sided] probability of responding to the survey for each product?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "1c35516c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:07.645535Z",
     "iopub.status.busy": "2022-01-02T06:36:07.644158Z",
     "iopub.status.idle": "2022-01-02T06:36:07.667404Z",
     "shell.execute_reply": "2022-01-02T06:36:07.665862Z"
    },
    "papermill": {
     "duration": 0.269713,
     "end_time": "2022-01-02T06:36:07.667547",
     "exception": false,
     "start_time": "2022-01-02T06:36:07.397834",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tExact binomial test\n",
       "\n",
       "data:  64 and 85\n",
       "number of successes = 64, number of trials = 85, p-value = 3.276e-06\n",
       "alternative hypothesis: true probability of success is not equal to 0.5\n",
       "95 percent confidence interval:\n",
       " 0.6474710 0.8401019\n",
       "sample estimates:\n",
       "probability of success \n",
       "             0.7529412 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "\n",
       "\tExact binomial test\n",
       "\n",
       "data:  81 and 85\n",
       "number of successes = 81, number of trials = 85, p-value < 2.2e-16\n",
       "alternative hypothesis: true probability of success is not equal to 0.5\n",
       "95 percent confidence interval:\n",
       " 0.8838737 0.9870311\n",
       "sample estimates:\n",
       "probability of success \n",
       "             0.9529412 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "binom.test(64,85, alternative = \"two.sided\") # CRU\n",
    "binom.test(81,85, alternative = \"two.sided\") # TOI"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "65e3a18c",
   "metadata": {
    "papermill": {
     "duration": 0.246249,
     "end_time": "2022-01-02T06:36:08.156424",
     "exception": false,
     "start_time": "2022-01-02T06:36:07.910175",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The probability of responding to the survey for CRU is betwee 0.6474710 and 0.8401019\n",
    "\n",
    "The probability of responding to the survey for TOI is betwee 0.8838737 and 0.9870311"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "82c2f582",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:08.654291Z",
     "iopub.status.busy": "2022-01-02T06:36:08.652757Z",
     "iopub.status.idle": "2022-01-02T06:36:08.676358Z",
     "shell.execute_reply": "2022-01-02T06:36:08.674892Z"
    },
    "papermill": {
     "duration": 0.274558,
     "end_time": "2022-01-02T06:36:08.676495",
     "exception": false,
     "start_time": "2022-01-02T06:36:08.401937",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\t2-sample test for equality of proportions with continuity correction\n",
       "\n",
       "data:  c(64, 81) out of c(85, 85)\n",
       "X-squared = 12.006, df = 1, p-value = 0.0005304\n",
       "alternative hypothesis: two.sided\n",
       "95 percent confidence interval:\n",
       " -0.31390985 -0.08609015\n",
       "sample estimates:\n",
       "   prop 1    prop 2 \n",
       "0.7529412 0.9529412 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Comparison\n",
    "prop.test(c(64,81), c(85,85))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "55e9f209",
   "metadata": {
    "papermill": {
     "duration": 0.247412,
     "end_time": "2022-01-02T06:36:09.173290",
     "exception": false,
     "start_time": "2022-01-02T06:36:08.925878",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The responding rate is from 0.08609015 to 0.31390985 less for CRU than for TOI. Because the reason why customers were less responsive to the survey for CRU remains unknown, we should be concerned about the difference in response rate. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d5be5ee2",
   "metadata": {
    "papermill": {
     "duration": 0.24622,
     "end_time": "2022-01-02T06:36:09.665987",
     "exception": false,
     "start_time": "2022-01-02T06:36:09.419767",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "3. What is a 95% confidence interval for the probability of Buy for each product?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "fe6d73b7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:10.169843Z",
     "iopub.status.busy": "2022-01-02T06:36:10.168244Z",
     "iopub.status.idle": "2022-01-02T06:36:10.191537Z",
     "shell.execute_reply": "2022-01-02T06:36:10.190053Z"
    },
    "papermill": {
     "duration": 0.278235,
     "end_time": "2022-01-02T06:36:10.191670",
     "exception": false,
     "start_time": "2022-01-02T06:36:09.913435",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\t1-sample proportions test with continuity correction\n",
       "\n",
       "data:  table(Ingredients$CRUPurchase), null probability 0.5\n",
       "X-squared = 6.8906, df = 1, p-value = 0.008665\n",
       "alternative hypothesis: true p is not equal to 0.5\n",
       "95 percent confidence interval:\n",
       " 0.5419976 0.7810085\n",
       "sample estimates:\n",
       "       p \n",
       "0.671875 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "\n",
       "\t1-sample proportions test with continuity correction\n",
       "\n",
       "data:  table(Ingredients$TOIPurchase), null probability 0.5\n",
       "X-squared = 0.19753, df = 1, p-value = 0.6567\n",
       "alternative hypothesis: true p is not equal to 0.5\n",
       "95 percent confidence interval:\n",
       " 0.4173041 0.6414743\n",
       "sample estimates:\n",
       "        p \n",
       "0.5308642 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "prop.test(table(Ingredients$CRUPurchase))\n",
    "prop.test(table(Ingredients$TOIPurchase))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "dfc45f77",
   "metadata": {
    "papermill": {
     "duration": 0.248048,
     "end_time": "2022-01-02T06:36:10.687853",
     "exception": false,
     "start_time": "2022-01-02T06:36:10.439805",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The 95 percent confidence interval for CRU is between 0.5419976 and 0.7810085\n",
    "\n",
    "The 95 percent confidence interval for TOI is between 0.4173041 and 0.6414743"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "81a351f6",
   "metadata": {
    "papermill": {
     "duration": 0.253916,
     "end_time": "2022-01-02T06:36:11.190777",
     "exception": false,
     "start_time": "2022-01-02T06:36:10.936861",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n",
    "4. What is a 95% confidence interval for the difference in the probability of Buy?  Does it favor either product with 95% confidence?  If so, which one?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "1df028c3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:11.695839Z",
     "iopub.status.busy": "2022-01-02T06:36:11.694185Z",
     "iopub.status.idle": "2022-01-02T06:36:11.711126Z",
     "shell.execute_reply": "2022-01-02T06:36:11.709657Z"
    },
    "papermill": {
     "duration": 0.270418,
     "end_time": "2022-01-02T06:36:11.711271",
     "exception": false,
     "start_time": "2022-01-02T06:36:11.440853",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\t2-sample test for equality of proportions with continuity correction\n",
       "\n",
       "data:  table(Ingredients$StackedVendor, Ingredients$StackedPurchase)\n",
       "X-squared = 2.3904, df = 1, p-value = 0.1221\n",
       "alternative hypothesis: two.sided\n",
       "95 percent confidence interval:\n",
       " -0.03122668  0.31324829\n",
       "sample estimates:\n",
       "   prop 1    prop 2 \n",
       "0.6718750 0.5308642 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "prop.test(table(Ingredients$StackedVendor,Ingredients$StackedPurchase))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "df346335",
   "metadata": {
    "papermill": {
     "duration": 0.252992,
     "end_time": "2022-01-02T06:36:12.216582",
     "exception": false,
     "start_time": "2022-01-02T06:36:11.963590",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The 95% confidence interval is between -0.03122668 and 0.31324829. Since the interval includes 0, it means there is no significant difference in the probability of Buy. However, we need to be mindful of CRU's lower response rate that could make survey for CRU less credible."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9742e06c",
   "metadata": {
    "papermill": {
     "duration": 0.25396,
     "end_time": "2022-01-02T06:36:12.721060",
     "exception": false,
     "start_time": "2022-01-02T06:36:12.467100",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Financials\n",
    "\n",
    "1. Summarize the data for each vendor.  Include a 95% confidence interval for boxes and costs for each vendor and describe these intervals in their relevant metrics."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "b99cfdfb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:13.263419Z",
     "iopub.status.busy": "2022-01-02T06:36:13.261709Z",
     "iopub.status.idle": "2022-01-02T06:36:13.392464Z",
     "shell.execute_reply": "2022-01-02T06:36:13.390838Z"
    },
    "papermill": {
     "duration": 0.392401,
     "end_time": "2022-01-02T06:36:13.392636",
     "exception": false,
     "start_time": "2022-01-02T06:36:13.000235",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "── Data Summary ────────────────────────\n",
      "                           Values    \n",
      "Name                       Financials\n",
      "Number of rows             52        \n",
      "Number of columns          5         \n",
      "_______________________              \n",
      "Column type frequency:               \n",
      "  numeric                  5         \n",
      "________________________             \n",
      "Group variables            None      \n",
      "\n",
      "── Variable type: numeric ──────────────────────────────────────────────────────\n",
      "  skim_variable n_missing complete_rate    mean      sd     p0     p25     p50\n",
      "1 Week                  0             1    26.5    15.2     1     13.8    26.5\n",
      "2 TOI.Boxes             0             1 23819.   2686.  17402  21855.  24072. \n",
      "3 TOI.Costs             0             1 73829.   7660.  53113. 68879.  73832. \n",
      "4 CRU.Boxes             0             1 25543.   4847.  16364  21477.  25063  \n",
      "5 CRU.Costs             0             1 64858.  11017.  40946. 56265.  65722. \n",
      "      p75   p100 hist \n",
      "1    39.2    52  ▇▇▇▇▇\n",
      "2 25476.  29623  ▂▇▇▇▂\n",
      "3 78487.  93313. ▁▃▇▆▁\n",
      "4 28832   34973  ▃▇▇▆▅\n",
      "5 73526.  89363. ▂▇▆▆▂\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "\n",
       "\tOne Sample t-test\n",
       "\n",
       "data:  Financials$TOI.Boxes\n",
       "t = 63.954, df = 51, p-value < 2.2e-16\n",
       "alternative hypothesis: true mean is not equal to 0\n",
       "95 percent confidence interval:\n",
       " 23071.67 24567.10\n",
       "sample estimates:\n",
       "mean of x \n",
       " 23819.38 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "\n",
       "\tOne Sample t-test\n",
       "\n",
       "data:  Financials$TOI.Costs\n",
       "t = 69.498, df = 51, p-value < 2.2e-16\n",
       "alternative hypothesis: true mean is not equal to 0\n",
       "95 percent confidence interval:\n",
       " 71696.23 75961.60\n",
       "sample estimates:\n",
       "mean of x \n",
       " 73828.91 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "skim(Financials)\n",
    "\n",
    "t.test(Financials$TOI.Boxes)\n",
    "t.test(Financials$TOI.Costs)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "963b4458",
   "metadata": {
    "papermill": {
     "duration": 0.264367,
     "end_time": "2022-01-02T06:36:13.934020",
     "exception": false,
     "start_time": "2022-01-02T06:36:13.669653",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The 95% confidence interval of boxes for TOI is between 23071.67 and 24567.10 boxes\n",
    "\n",
    "The 95% confidence interval of costs for TOI is between \\$71696.23 \n",
    "\n",
    "and \\$75961.60"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "ffccabef",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:14.462508Z",
     "iopub.status.busy": "2022-01-02T06:36:14.460688Z",
     "iopub.status.idle": "2022-01-02T06:36:14.486020Z",
     "shell.execute_reply": "2022-01-02T06:36:14.484380Z"
    },
    "papermill": {
     "duration": 0.289959,
     "end_time": "2022-01-02T06:36:14.486183",
     "exception": false,
     "start_time": "2022-01-02T06:36:14.196224",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tOne Sample t-test\n",
       "\n",
       "data:  Financials$CRU.Boxes\n",
       "t = 37.998, df = 51, p-value < 2.2e-16\n",
       "alternative hypothesis: true mean is not equal to 0\n",
       "95 percent confidence interval:\n",
       " 24193.91 26893.01\n",
       "sample estimates:\n",
       "mean of x \n",
       " 25543.46 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "\n",
       "\tOne Sample t-test\n",
       "\n",
       "data:  Financials$CRU.Costs\n",
       "t = 42.452, df = 51, p-value < 2.2e-16\n",
       "alternative hypothesis: true mean is not equal to 0\n",
       "95 percent confidence interval:\n",
       " 61791.21 67925.67\n",
       "sample estimates:\n",
       "mean of x \n",
       " 64858.44 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "t.test(Financials$CRU.Boxes)\n",
    "t.test(Financials$CRU.Costs)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ee7d52ac",
   "metadata": {
    "papermill": {
     "duration": 0.265314,
     "end_time": "2022-01-02T06:36:15.010860",
     "exception": false,
     "start_time": "2022-01-02T06:36:14.745546",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The 95% confidence interval of boxes for CRU is between 24193.91 and 26893.01 boxes\n",
    "\n",
    "The 95% confidence interval of costs for CRU is between \\$61791.21 \n",
    "\n",
    "and \\$67925.67"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "154575a3",
   "metadata": {
    "papermill": {
     "duration": 0.27511,
     "end_time": "2022-01-02T06:36:15.554501",
     "exception": false,
     "start_time": "2022-01-02T06:36:15.279391",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "2. A scatterplot of Costs and Boxes for each vendor."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "2b785c6b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:16.094020Z",
     "iopub.status.busy": "2022-01-02T06:36:16.092408Z",
     "iopub.status.idle": "2022-01-02T06:36:16.462541Z",
     "shell.execute_reply": "2022-01-02T06:36:16.463169Z"
    },
    "papermill": {
     "duration": 0.642946,
     "end_time": "2022-01-02T06:36:16.463334",
     "exception": false,
     "start_time": "2022-01-02T06:36:15.820388",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nxnb+Vxdu4hi5Kqtw4iO//8DNfrfkufUzKYq67njbhR3x28yNnZ4LnyLYvkEPojY5NVyBBi35\nyS9HdPJ/s/7WP//lHUXSDfcvGxJaIFf+zW3cPO37fzRl3vrTFnVG4bz5S0w6puV8+bY1b2xY\n9drffvJ/W197QN6XnySTf/LQBDVDCCEc6+ho2Lj642fuvfqg+dCmx8cINTQAuEL47UduGnv1\nugpr+qgZ198yS+JpO1N+6D+v/Wbd26veLz+yeJCq68LJk5bdPinp20ec29ry+do1L//PLVtP\n0yffXipIPti+QXccQDT4HEcIIUmjP73wqaC36fo0FSVi7nn5Ey/7XdzbWf74gmxCSPHDn4SC\nHstOQkjqhI0X7eXQ46MIIc/V2roGvZYj+QqJWDbIFWQv+ioAgItjfQ8XGSla/th7+7uGKzc+\nJxVRmqy7QhHruScIIcVPH+3WgM9xYoRSQokk5U4/H6lZdzUhZOGx1gt72zY3kxCyocN90Vyw\nfYOLwqFYiDlHf7dwfYNj5u/3vvnwQqbLHY8ZXcHv1pfdm68/+soNH7a4+t0+oy36bb4+4Dlf\n7goIkC4AXDEad9/3l6Pt45/c+ftbx3eN58x74oO5mbaaf77c4Lh0CxLliN+PTeJY/6cd7ksv\n2T/YvgEKO4g13E//VMqox6z9xdiLPCmS/27NAxwXfPKxw5fTx6lOL82kDFN8dypCy4HVt86b\nmKhTMUrt0JJZz7y9m4/bz69Ui+mcH68MLdm85wmKoua+dJR/6Di/5+c/uiYzUSdVGvKLrv7N\nGxtDJ8+w/vZXH79z5JAUmUSiSciYefND+9svfq4MAAwIax5YKxJr3nu05MKnZr/5+j/+8Y88\n9sJnugt4goSQTGm4ToXC9u1KF+1dhnCF6ulQrLt9LSEkY/ZnPb6S9aZJaVXqPfyjvh6KdVsa\nP/jjXRRFTXtiTyjY+vWLGrFIohx6x/2P/uaxn83K1xFCZv1qN//sl89MoSjqN/tbOI4LeM5N\n1EoTRj7sZzmO4xwNa4fIJRLF4OUP/PK5px5bOi2bEDJ62Vv8C/80K42i6Kt/dN8zv/3tL396\no4oWKVOv9+HwCMBAxaYwtDr9F71ZtKdDsX5XZYmaUSYvCnwbEfBQLLZvwHEcCjuIjp4KO0vN\n44SQMc8fu8Rrb09WSpTD+b97U9hdaMiNfwh8txR7U5JCoijY0+TkHwf9bf9VZKREsj1WL8dx\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "TOIFinancials <- Financials %>% ggplot() + aes(x=TOI.Boxes, y=TOI.Costs) + geom_point(alpha=0.5) + labs(title=\"TOI\", subtitle=\"Costs as a function of Boxes\")\n",
    "\n",
    "CRUFinancials <- Financials %>% ggplot() + aes(x=CRU.Boxes, y=CRU.Costs) + geom_point(alpha=0.5) + labs(title=\"CRU\", subtitle=\"Costs as a function of Boxes\")\n",
    "\n",
    "TOIFinancials + CRUFinancials"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "88fc7f49",
   "metadata": {
    "papermill": {
     "duration": 0.279106,
     "end_time": "2022-01-02T06:36:17.029865",
     "exception": false,
     "start_time": "2022-01-02T06:36:16.750759",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "3. Provide a regression model for the cost structure of each vendor; costs as a function of boxes.\n",
    "    \n",
    "  a. Write the relevant equation using the point estimates."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "8f5d7b0f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:17.593383Z",
     "iopub.status.busy": "2022-01-02T06:36:17.584636Z",
     "iopub.status.idle": "2022-01-02T06:36:17.614955Z",
     "shell.execute_reply": "2022-01-02T06:36:17.613389Z"
    },
    "papermill": {
     "duration": 0.312319,
     "end_time": "2022-01-02T06:36:17.615128",
     "exception": false,
     "start_time": "2022-01-02T06:36:17.302809",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = TOI.Costs ~ TOI.Boxes, data = Financials)\n",
       "\n",
       "Coefficients:\n",
       "(Intercept)    TOI.Boxes  \n",
       "  10087.589        2.676  \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "ModTOI <- lm(TOI.Costs~TOI.Boxes, data = Financials)\n",
    "ModTOI\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "976b78a6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:18.148775Z",
     "iopub.status.busy": "2022-01-02T06:36:18.147353Z",
     "iopub.status.idle": "2022-01-02T06:36:18.166495Z",
     "shell.execute_reply": "2022-01-02T06:36:18.165143Z"
    },
    "papermill": {
     "duration": 0.287573,
     "end_time": "2022-01-02T06:36:18.166638",
     "exception": false,
     "start_time": "2022-01-02T06:36:17.879065",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = CRU.Costs ~ CRU.Boxes, data = Financials)\n",
       "\n",
       "Coefficients:\n",
       "(Intercept)    CRU.Boxes  \n",
       "   9213.574        2.178  \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "ModCRU <- lm(CRU.Costs~CRU.Boxes, data = Financials)\n",
    "ModCRU"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fa863bf2",
   "metadata": {
    "papermill": {
     "duration": 0.26528,
     "end_time": "2022-01-02T06:36:18.696275",
     "exception": false,
     "start_time": "2022-01-02T06:36:18.430995",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    " The estimate equations:\n",
    "      \n",
    "  For TOI:\n",
    "    TOI.Costs = 10087.589 dollars + 2.676 dollars per box + error\n",
    "      \n",
    "  For CRU:\n",
    "    CRU.Costs = 9213.574 dollars + 2.178 dollars per box + erro\n",
    "    \n",
    "  \n",
    "  Estimate fixed costs for TOI is \\$10087.589\n",
    "\n",
    "  Estimate fixed costs for CRU is \\$9213.574\n",
    "  \n",
    "  Variable costs for TOI is 2.676 dollars per box\n",
    "    \n",
    "  Variable costs for CRU is 2.178 dollars per box"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e5aa11dd",
   "metadata": {
    "papermill": {
     "duration": 0.265355,
     "end_time": "2022-01-02T06:36:19.233126",
     "exception": false,
     "start_time": "2022-01-02T06:36:18.967771",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "d. Add the regression line to the plot"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "d539cf49",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:19.772093Z",
     "iopub.status.busy": "2022-01-02T06:36:19.770448Z",
     "iopub.status.idle": "2022-01-02T06:36:21.618482Z",
     "shell.execute_reply": "2022-01-02T06:36:21.617137Z"
    },
    "papermill": {
     "duration": 2.119074,
     "end_time": "2022-01-02T06:36:21.618664",
     "exception": false,
     "start_time": "2022-01-02T06:36:19.499590",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`geom_smooth()` using formula 'y ~ x'\n",
      "\n",
      "`geom_smooth()` using formula 'y ~ x'\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\n4wMwQxwOh1DGc+/5rGAoOvaWpfetKxnlX9M0Le5ngOP450Z1CKGCggKZTCaeMxuJRPheZHBt\nncuefPsHtP/S+rxlf/Xd//P7N/e8/ebv/8/3nl+We0uDj/qnPz8522cHAEIIFRUVGY3Gvr4+\nfmKWRCLBcdzhcGi12mNXKsTVmorT3VU541chlUolHuQDC1UCRuwg1xjMR+Fw2OVy8UnE/WPy\nM50xeSe715qxT5tkT63rTk1NzalTp86cOWO325VKZSgU4qO622+/HVpuz2Xa0udbD0oef/7v\nfv3Sd3796Up96aZf/vJ3z5VBQVcwJ+Tm5m7evPngwYOXL19WqVSpqal2u12v16fm1e47lSJs\nhmFo91oz/xrHcWggtkgkILB7Y8RX8r3r5xr/9u//hBAEdmAuGh0dFbqB7TmbzXHR/8CVOY4l\nmeO1oKbcJFsmkz3zzDPp6en19fVer5eiqHXr1m3fvr2oqGj6Jw9mVNaWrx5te6a/vaGl2xJE\ndEZBefWSbCgOAeaUu+66Kzc39/Tp0zabTaPRpKamlpSU/Pb0cnGPw5X5Y3mpXv41n08yO+cK\nkisBgR3kGoN5JxgMCiVOLl3TtFtiuu7sXjN+jzvNlBS1Wr1r16477rjDZrMpFAqtVgtjdfMH\nllW2KgsqrIO5CsOwysrKpUuX9vX1sSyLYdhlszbuUrZzZT//WiKRiPNJwMKWgPj9m8WaK68/\nf94eFK/8NNf4G9M/PgAJNzo6nj/Hctje2K47m5YMp2ujXXemn5IilUqzsrJ0Oh1EdXNfV93B\nA2aPsOix/PzJ57/1P+8e84r7qAMwZ7hcLo7jMAzjOCyugVht+bBRM/53Wa/Xw/Vn8UhAYAe5\nxmB+8Xg8weD49e5Qk85ij86EkNORHSuiXXegSfbi4erav2tFRknN7T9rtQsrQ96m1/7jp1/Z\nvTmjePOfL9tvsDsAyceyrNPp5F+f6Uqx2KNJIzQZuWP5eLUmqEi82CTgUSzkGoN5RFzixBck\n3j2bIn73zuUWpXR8niykpCwejOvU6mX3dwXxXc9+97mq6DQabcHPLp584J3fv/Kv/7nvsTU1\nmYPNt6ipGxwHgGRyOBx8TaVQBH+/IUP81h3LrEIDMZiGv9gkpo4d5BqD+cLlcgklTj68kOH2\nR0ucpKiCteVD/GuKom7QBBYsMEeee6IrEP77v/T+0+254vUYoV62/s5l6+984q5vF97z0ye/\n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\nR0zOOl4AAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "TOIFinancials <- Financials %>% ggplot() + aes(x=TOI.Boxes, y=TOI.Costs) + geom_point(alpha=0.5) + geom_smooth(method=\"lm\")+ labs(title=\"TOI\", subtitle=\"Costs as a function of Boxes\")\n",
    "\n",
    "CRUFinancials <- Financials %>% ggplot() + aes(x=CRU.Boxes, y=CRU.Costs) + geom_point(alpha=0.5) + geom_smooth(method=\"lm\")+ labs(title=\"CRU\", subtitle=\"Costs as a function of Boxes\")\n",
    "\n",
    "TOIFinancials + CRUFinancials"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "10c20250",
   "metadata": {
    "papermill": {
     "duration": 0.277307,
     "end_time": "2022-01-02T06:36:22.182604",
     "exception": false,
     "start_time": "2022-01-02T06:36:21.905297",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "4. Estimate each regression model and summarize the relevant regression using `summary()`.\n",
    " \n",
    "  a. Are the fixed costs zero with 95% confidence for each vendor?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "6b32e786",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:22.736622Z",
     "iopub.status.busy": "2022-01-02T06:36:22.734917Z",
     "iopub.status.idle": "2022-01-02T06:36:22.762335Z",
     "shell.execute_reply": "2022-01-02T06:36:22.760822Z"
    },
    "papermill": {
     "duration": 0.306239,
     "end_time": "2022-01-02T06:36:22.762481",
     "exception": false,
     "start_time": "2022-01-02T06:36:22.456242",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = CRU.Costs ~ CRU.Boxes, data = Financials)\n",
       "\n",
       "Residuals:\n",
       "    Min      1Q  Median      3Q     Max \n",
       "-6817.8 -1904.7  -374.3  2156.4  7835.6 \n",
       "\n",
       "Coefficients:\n",
       "             Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept) 9.214e+03  2.382e+03   3.868 0.000318 ***\n",
       "CRU.Boxes   2.178e+00  9.164e-02  23.771  < 2e-16 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 3173 on 50 degrees of freedom\n",
       "Multiple R-squared:  0.9187,\tAdjusted R-squared:  0.9171 \n",
       "F-statistic:   565 on 1 and 50 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(ModCRU)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "87ce4cda",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:23.319735Z",
     "iopub.status.busy": "2022-01-02T06:36:23.319114Z",
     "iopub.status.idle": "2022-01-02T06:36:23.359393Z",
     "shell.execute_reply": "2022-01-02T06:36:23.357952Z"
    },
    "papermill": {
     "duration": 0.321397,
     "end_time": "2022-01-02T06:36:23.359534",
     "exception": false,
     "start_time": "2022-01-02T06:36:23.038137",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>term</th><th scope=col>estimate</th><th scope=col>std.error</th><th scope=col>statistic</th><th scope=col>p.value</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>(Intercept)</td><td>9213.574189</td><td>2.381903e+03</td><td> 3.868156</td><td>3.178637e-04</td></tr>\n",
       "\t<tr><td>CRU.Boxes  </td><td>   2.178439</td><td>9.164457e-02</td><td>23.770517</td><td>6.601924e-29</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " term & estimate & std.error & statistic & p.value\\\\\n",
       " <chr> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t (Intercept) & 9213.574189 & 2.381903e+03 &  3.868156 & 3.178637e-04\\\\\n",
       "\t CRU.Boxes   &    2.178439 & 9.164457e-02 & 23.770517 & 6.601924e-29\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 5\n",
       "\n",
       "| term &lt;chr&gt; | estimate &lt;dbl&gt; | std.error &lt;dbl&gt; | statistic &lt;dbl&gt; | p.value &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| (Intercept) | 9213.574189 | 2.381903e+03 |  3.868156 | 3.178637e-04 |\n",
       "| CRU.Boxes   |    2.178439 | 9.164457e-02 | 23.770517 | 6.601924e-29 |\n",
       "\n"
      ],
      "text/plain": [
       "  term        estimate    std.error    statistic p.value     \n",
       "1 (Intercept) 9213.574189 2.381903e+03  3.868156 3.178637e-04\n",
       "2 CRU.Boxes      2.178439 9.164457e-02 23.770517 6.601924e-29"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "ModCRU %>% tidy() # Use tidy()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e43556b9",
   "metadata": {
    "papermill": {
     "duration": 0.306093,
     "end_time": "2022-01-02T06:36:23.941114",
     "exception": false,
     "start_time": "2022-01-02T06:36:23.635021",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The fixed costs for CRU are unlikely to be zero because The p-value for the intercept is 0.000318"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "d091f45d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:24.501711Z",
     "iopub.status.busy": "2022-01-02T06:36:24.500278Z",
     "iopub.status.idle": "2022-01-02T06:36:24.534080Z",
     "shell.execute_reply": "2022-01-02T06:36:24.532527Z"
    },
    "papermill": {
     "duration": 0.314489,
     "end_time": "2022-01-02T06:36:24.534228",
     "exception": false,
     "start_time": "2022-01-02T06:36:24.219739",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = TOI.Costs ~ TOI.Boxes, data = Financials)\n",
       "\n",
       "Residuals:\n",
       "    Min      1Q  Median      3Q     Max \n",
       "-4246.9 -2016.1  -315.6  1936.4  5096.1 \n",
       "\n",
       "Coefficients:\n",
       "             Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept) 1.009e+04  3.346e+03   3.015  0.00403 ** \n",
       "TOI.Boxes   2.676e+00  1.396e-01  19.170  < 2e-16 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 2677 on 50 degrees of freedom\n",
       "Multiple R-squared:  0.8802,\tAdjusted R-squared:  0.8778 \n",
       "F-statistic: 367.5 on 1 and 50 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>term</th><th scope=col>estimate</th><th scope=col>std.error</th><th scope=col>statistic</th><th scope=col>p.value</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>(Intercept)</td><td>10087.588635</td><td>3345.7234631</td><td> 3.015069</td><td>4.029355e-03</td></tr>\n",
       "\t<tr><td>TOI.Boxes  </td><td>    2.676027</td><td>   0.1395946</td><td>19.169992</td><td>1.083901e-24</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " term & estimate & std.error & statistic & p.value\\\\\n",
       " <chr> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t (Intercept) & 10087.588635 & 3345.7234631 &  3.015069 & 4.029355e-03\\\\\n",
       "\t TOI.Boxes   &     2.676027 &    0.1395946 & 19.169992 & 1.083901e-24\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 5\n",
       "\n",
       "| term &lt;chr&gt; | estimate &lt;dbl&gt; | std.error &lt;dbl&gt; | statistic &lt;dbl&gt; | p.value &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| (Intercept) | 10087.588635 | 3345.7234631 |  3.015069 | 4.029355e-03 |\n",
       "| TOI.Boxes   |     2.676027 |    0.1395946 | 19.169992 | 1.083901e-24 |\n",
       "\n"
      ],
      "text/plain": [
       "  term        estimate     std.error    statistic p.value     \n",
       "1 (Intercept) 10087.588635 3345.7234631  3.015069 4.029355e-03\n",
       "2 TOI.Boxes       2.676027    0.1395946 19.169992 1.083901e-24"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(ModTOI)\n",
    "ModTOI %>% tidy"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3dc2f226",
   "metadata": {
    "papermill": {
     "duration": 0.283835,
     "end_time": "2022-01-02T06:36:25.099022",
     "exception": false,
     "start_time": "2022-01-02T06:36:24.815187",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The fixed costs for TOI are unlikely to be zero because The p-value for the intercept is 0.00403"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d608ae94",
   "metadata": {
    "papermill": {
     "duration": 0.279812,
     "end_time": "2022-01-02T06:36:25.659943",
     "exception": false,
     "start_time": "2022-01-02T06:36:25.380131",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    " b. Are the variable costs zero with 95% confidence for each vendor?\n",
    "     \n",
    "    The variable costs are unlikely to be zero for CRU because p-value is < 2e-16.\n",
    "     \n",
    "    The variable costs are unlikely to be zero for TOI because p-value is < 2e-16.\n",
    "    \n",
    " c. Which vendor experienced the largest cost overrun?\n",
    "     \n",
    "    The maximum of residuals for CRU.Costs is 7835.6. The maximum of residuals for TOI.Costs is 5096.1. \n",
    "     \n",
    "    CRU experienced the largest cost overrun.\n",
    "    \n",
    " d. Which vendor experienced the largest cost underrun?\n",
    "     \n",
    "    The minimum of residuals for CRU.Costs is -6817.8. The minimum of residuals for TOI.Costs is -4246.9.\n",
    "     \n",
    "    CRU experienced the largest cost underrun."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "367753f6",
   "metadata": {
    "papermill": {
     "duration": 0.283045,
     "end_time": "2022-01-02T06:36:26.227539",
     "exception": false,
     "start_time": "2022-01-02T06:36:25.944494",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "5.What is the residual standard error for each vendor?  What does this mean about the predictability of their incurred costs?  In absolute terms, which has more predictable costs? "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "8334a852",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:26.793126Z",
     "iopub.status.busy": "2022-01-02T06:36:26.791291Z",
     "iopub.status.idle": "2022-01-02T06:36:26.811210Z",
     "shell.execute_reply": "2022-01-02T06:36:26.809656Z"
    },
    "papermill": {
     "duration": 0.304706,
     "end_time": "2022-01-02T06:36:26.811343",
     "exception": false,
     "start_time": "2022-01-02T06:36:26.506637",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = CRU.Costs ~ CRU.Boxes, data = Financials)\n",
       "\n",
       "Residuals:\n",
       "    Min      1Q  Median      3Q     Max \n",
       "-6817.8 -1904.7  -374.3  2156.4  7835.6 \n",
       "\n",
       "Coefficients:\n",
       "             Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept) 9.214e+03  2.382e+03   3.868 0.000318 ***\n",
       "CRU.Boxes   2.178e+00  9.164e-02  23.771  < 2e-16 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 3173 on 50 degrees of freedom\n",
       "Multiple R-squared:  0.9187,\tAdjusted R-squared:  0.9171 \n",
       "F-statistic:   565 on 1 and 50 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#CRU\n",
    "summary(ModCRU)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4e01fc4d",
   "metadata": {
    "papermill": {
     "duration": 0.280932,
     "end_time": "2022-01-02T06:36:27.374513",
     "exception": false,
     "start_time": "2022-01-02T06:36:27.093581",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "CRU has a residual standard error of 3173 on 50 degrees of freedom"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "id": "403c8ce7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:27.945074Z",
     "iopub.status.busy": "2022-01-02T06:36:27.943435Z",
     "iopub.status.idle": "2022-01-02T06:36:27.962500Z",
     "shell.execute_reply": "2022-01-02T06:36:27.961017Z"
    },
    "papermill": {
     "duration": 0.307756,
     "end_time": "2022-01-02T06:36:27.962640",
     "exception": false,
     "start_time": "2022-01-02T06:36:27.654884",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = TOI.Costs ~ TOI.Boxes, data = Financials)\n",
       "\n",
       "Residuals:\n",
       "    Min      1Q  Median      3Q     Max \n",
       "-4246.9 -2016.1  -315.6  1936.4  5096.1 \n",
       "\n",
       "Coefficients:\n",
       "             Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept) 1.009e+04  3.346e+03   3.015  0.00403 ** \n",
       "TOI.Boxes   2.676e+00  1.396e-01  19.170  < 2e-16 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 2677 on 50 degrees of freedom\n",
       "Multiple R-squared:  0.8802,\tAdjusted R-squared:  0.8778 \n",
       "F-statistic: 367.5 on 1 and 50 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#TOI\n",
    "summary(ModTOI)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fe472fe1",
   "metadata": {
    "papermill": {
     "duration": 0.286008,
     "end_time": "2022-01-02T06:36:28.533634",
     "exception": false,
     "start_time": "2022-01-02T06:36:28.247626",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "TOI has a residual standard error of 2677 on 50 degrees of freedom\n",
    "\n",
    "A smaller residual standard error means that the real value of the data is closer to the predictions of the model.Here, we see that TOI has a smaller standard deviation, which means TOI has more predictable costs."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "58328b36",
   "metadata": {
    "papermill": {
     "duration": 0.286892,
     "end_time": "2022-01-02T06:36:29.110989",
     "exception": false,
     "start_time": "2022-01-02T06:36:28.824097",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "6.Which of the two regressions has a higher proportion of explained variance? \n",
    "\n",
    "Provide the relevant statistic for each vendor. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "id": "1923dc67",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:29.683414Z",
     "iopub.status.busy": "2022-01-02T06:36:29.681775Z",
     "iopub.status.idle": "2022-01-02T06:36:29.705503Z",
     "shell.execute_reply": "2022-01-02T06:36:29.703924Z"
    },
    "papermill": {
     "duration": 0.310273,
     "end_time": "2022-01-02T06:36:29.705657",
     "exception": false,
     "start_time": "2022-01-02T06:36:29.395384",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.918704140391292"
      ],
      "text/latex": [
       "0.918704140391292"
      ],
      "text/markdown": [
       "0.918704140391292"
      ],
      "text/plain": [
       "[1] 0.9187041"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.880236247172886"
      ],
      "text/latex": [
       "0.880236247172886"
      ],
      "text/markdown": [
       "0.880236247172886"
      ],
      "text/plain": [
       "[1] 0.8802362"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# CRU\n",
    "ModCRU %>% summary %>% pluck(\"r.squared\")\n",
    "\n",
    "#TOI\n",
    "ModTOI %>% summary %>% pluck(\"r.squared\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b9977e47",
   "metadata": {
    "papermill": {
     "duration": 0.288897,
     "end_time": "2022-01-02T06:36:30.288993",
     "exception": false,
     "start_time": "2022-01-02T06:36:30.000096",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The value of R-squared for CRU is 0.9187. For TOI, the value of R-squared is 0.8802. CRU has a higher proportion of explained variance."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bc0aed2c",
   "metadata": {
    "papermill": {
     "duration": 0.291115,
     "end_time": "2022-01-02T06:36:30.869363",
     "exception": false,
     "start_time": "2022-01-02T06:36:30.578248",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    " a. What value of the F distribution/ratio would show that the proportion of variance explained per degree of freedom in the regression is strictly greater than the variance per degree of freedom in the residual **with 1% probability**?\n",
    " \n",
    " The value of F would be 7.170577"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "id": "51031730",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-02T06:36:31.452587Z",
     "iopub.status.busy": "2022-01-02T06:36:31.450618Z",
     "iopub.status.idle": "2022-01-02T06:36:31.470150Z",
     "shell.execute_reply": "2022-01-02T06:36:31.468362Z"
    },
    "papermill": {
     "duration": 0.312528,
     "end_time": "2022-01-02T06:36:31.470297",
     "exception": false,
     "start_time": "2022-01-02T06:36:31.157769",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "7.17057680189607"
      ],
      "text/latex": [
       "7.17057680189607"
      ],
      "text/markdown": [
       "7.17057680189607"
      ],
      "text/plain": [
       "[1] 7.170577"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "qf(0.01,1,50,lower.tail = FALSE)"
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
   "duration": 52.479055,
   "end_time": "2022-01-02T06:36:31.876840",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-01-02T06:35:39.397785",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
