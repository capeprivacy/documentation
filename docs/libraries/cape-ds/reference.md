# API Reference

## Cape
::: cape-ds.cape.Cape
    handler: python
    selection:
        filters:
            - "!^_"  # exlude all members starting with _
            - "^__init__$"  # but always include __init__ modules and methods
    rendering:
      show_root_heading: false
      show_source: false
      show_root_toc_entry: false

## Project
::: cape-ds.cape.Project
    handler: python
    selection:
        members:
            - list_dataviews
            - get_dataview
            - add_dataview
            - get_job
            - submit_job
            - remove_dataview
    rendering:
      show_root_heading: false
      show_source: false
      show_root_toc_entry: false

## DataView
::: cape-ds.cape.DataView
    handler: python
    selection:
        members:
            - __init__
    rendering:
      show_root_heading: false
      show_source: false
      show_root_toc_entry: false

## Job
::: cape-ds.cape.Job
    handler: python
    selection:
        members:
            - get_status
            - get_results
    rendering:
      show_root_heading: false
      show_source: false
      show_root_toc_entry: false

## VerticalLinearRegressionJob
::: cape-ds.cape.VerticalLinearRegressionJob
    handler: python
    selection:
        filters:
            - "!^_"  # exlude all members starting with _
            - "^__init__$"  # but always include __init__ modules and methods
    rendering:
      show_root_heading: false
      show_source: false
      show_root_toc_entry: false