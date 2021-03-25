# Roadmap

Cape Privacy's software is currently in alpha state. This document describes Cape Privacy's goals, and some upcoming features.

## The goal

Cape Privacy's goal is to make encrypted learning available for everyone. We believe the future of machine learning is encrypted -- to offer more privacy, more security and provide the right data for solving real world problems.

Through our open source approach, we ensure our own code and tools are transparent and auditable.

### Data flow

Data will flow between the following elements of Cape Privacy's architecture:

* Cape workers access local data, encrypt it using multi-party computation and connect with the broker and coordinator to execute encrypted learning jobs.
* The broker (maintained by Cape) allows two or more organizations to work together on encrypted computations by acting as a secure bridge when jobs are running.
* The pycape library is built for data scientists: allowing data scientists to view projects they are a part of, add or remove data views, create and check status of jobs and pull model metrics and results (if permitted). If approved, these jobs are then sent to the workers to be run.

## Upcoming features

### pycape

* Debug encrypted learning jobs more easily with shape and schema checking 
* Define a model_owner for a job explicitly in the Job declaration
* Enhanced roles and permissions for data scientists and operators

### Cape workers

* Performance enhancements
* Networking improvements
* Enhanced roles and permissions for operators
