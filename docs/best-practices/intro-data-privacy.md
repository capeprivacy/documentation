## Introduction to Data Privacy

Data privacy is of increasing importance in the data science and data engineering fields to both build trust with the community, organization and people who share their data with you. Increased government regulations, such as GDPR in Europe, also place accountability on the persons and organizations who work on processing and gaining insights from other people's data. 

Cape Privacy's Python library aims to provide privacy techniques that work for data scientists and data engineers to properly do their work while also taking privacy and trust into account. Using this library will hopefully allow you to build more trustworthy and privacy-enhancing data science and therefore bring more trust and accountability into your organization. 

### When to Use Cape Python

Cape Privacy's Python library is a great tool to begin exploring privacy-enhancing techniques in your data science workflows. We recommend you take some time to explore how [policy]() works and what [transformations]() are available before using it in your daily workflows.

Some use cases where this library is a good fit are:

- Apache Spark jobs that move data from a more sensitive data store to a data lake or shared data store
- Creating a clean and pre-processed dataset to share with the data science team for exploratory data analysis (EDA)
- Automating data science and analytics scripts with attention to privacy
- Working on sensitive data as part of initial model development (for exploring data in preparation to develop a model)

In the current version (0.1.0) of this library, we do not recommend this library for training machine learning models on sensitive data. Techniques for training models on sensitive data will be considered for future releases of Cape Python.

### Explore Privacy Enhancement via Transformations

We encourage you to take a look through the [transformations]() available and determine which is a good fit for your data science needs. In our initial release, we have included some basic transformations that fit the needs to quite a few privacy protections. We recommend their use in the following situations:

| Use Case  | Text Data | Numeric Data | Inconsistent Data
| ------------- | ------------- | --------------- | -----------
| EDA | Format-preserving Data Masking or linked, reversible tokenization  | Rounding, Pertubation or Redaction | Redaction or Tokenization 
| Analytics | Linkable, Consistent Tokenization  | Rounding or Pertubation | Redaction
| ML Development | Format-preserving Data Masking | Rounding or Pertubation | Consistent, Linkable, Reversible tokenization
| ML Training/Serving | Raw data | Raw data | Raw data

In the future, we hope to offer more techniques for each of these cases and expand this library's utility with regard to use cases such as machine learning training and serving.

Of course, as with most complex issues such as privacy in data science, you know your data best and therefore should evaluate the transformations and data sensitivity with your use case in mind. If your organization has legal support, you can also coordinate with them to write the data policy and ensure it fits the legal privacy needs for the project in mind.

### Privacy Attacks on Transformations

There are serious complexities and privacy attacks with utilizing linkable tokenization for sensitive data. Therefore, we do not recommend releasing or sharing data that has been tokenized with preserved linkability to an untrusted or outside party. In general, we would only recommend state-of-the-art anonymization techniques for releasing data publicly or with untrusted parties. This library does not currently have anonymization transformations; however, we can recommend you investigate [OpenDP](https://github.com/opendifferentialprivacy/) as a library to help with anonymization.

### Transformation Enhancements and Open Research

At Cape Privacy, we are also working on incorporating techniques such as differential privacy, synthetic data and other advanced privacy techniques that would help make this library useful in cases where stronger privacy guarantees are required.

To that end, some transformation we hope to implement (and would gladly accept as contributions) are:

- Truncation for multiple data types aimed at EDA and analyticis
- Pertubation informed by existing data distribution
- Secure approaches to pertubation that would allow for consistency
- Data generation informed by data schema

### Want to Learn More?

Making data privacy techniques easier to use and more transparent is part of Cape Privacy's mission. To that end, you can visit our [Community Resources](https://capeprivacy.com/community) or join our [Slack Team](https://capecommunity.slack.com) to learn more about upcoming webinars, events and ask questions about how privacy and data science can work together.
