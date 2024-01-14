# The Seedcase Data Repository

This repository contains the data we use for testing and demo purposes. All data is either fake, synthetically generated, or completely open.

For now this repo is being used to store both the instructions on how to create a synthetic data set, as well as a set of data files that can be used for various test purposes for Seedcase software.

## Our Data Need

In order to test and demo the different iterations of Seedcase we will need data that we can test with going forward. There are a few things that this data must be able to do.

We need data that:

1. is in a recognised format (for now we focus our attention on csv)
2. is in a clean and consistent format (we will be testing data with missing values later)
3. is similar to or mimics the medical research data which we are mainly focused on
4. does not have any connection to data on real people (is completely fake)
5. have enough individual tables that we can test linking them in the backend
6. is not under any form of copyright and free to use in a software product that may in future be used by commercial entities

We looked at a number of data sets available online but most didn't fulfil the last three items in the list above. This led us to look at generating our own synthetic data set.

## Synthetic Data Generation

We have decided to work with the software Synthea from [SyntheaHealth](https://github.com/synthetichealth) and generate a standard set of csv files with as few alterations as possible.

### Pros

* It fulfils all of the items in the list above
* It is easy to use
* It has excellent documentation

### Cons

* Installation of software will need to be kept updated
* What you see is what you get in terms of columns and data formats

### How To Use Synthea

There is an excellent installation guide on [Synthea GitHub](https://github.com/synthetichealth/synthea?tab=readme-ov-file#developer-quick-start). As detailed there, the requirements are a version of Java 11 or higher. We have generated data with Synthea with Java 17.

Once the appropriate version of Java is installed, follow the installation guidance under `Installation` on the page linked above. The gradlew steps can be skipped, but it is a good idea to generate a population of one patient initially to check that it works as expected.

When the run of Synthea is successful there is a small change needed to the settings file. This file (as described on Synthea's page) is located in the src folder:

`src/main/resources/synthea.properties`

In the properties file update the following values to: 

`exporter.fhir.export = False`

`exporter.csv.export = True`

`exporter.csv.folder_per_run = True`

Once the settings file is updated, generate data for 1000 patients with the following command:

``` bash
./run_synthea -p 1000
```

This will generate a folder called Output with the produced csv files. There is a detailed description of the various files and fields [here](https://github.com/synthetichealth/synthea/wiki/CSV-File-Data-Dictionary).
