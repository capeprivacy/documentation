# API Reference

## pycape.Cape
::: cape-ds.pycape.Cape
    handler: python
    selection:
        members:
            - login
            - list_projects
            - get_project
            - delete_project
    rendering:
        heading_level: 4
        show_root_heading: false
        show_source: false
        show_root_toc_entry: false

## pycape.Project
::: cape-ds.pycape.Project
    handler: python
    selection:
        members:
            - list_dataviews
            - get_dataview
            - create_dataview
            - get_job
            - submit_job
            - delete_dataview
    rendering:
        heading_level: 4
        show_root_heading: false
        show_source: false
        show_root_toc_entry: false

## pycape.Organization
::: cape-ds.pycape.api.organization.organization.Organization
    handler: python
    rendering:
        heading_level: 4
        show_root_heading: false
        show_source: false
        show_root_toc_entry: false

## pycape.DataView
::: cape-ds.pycape.DataView
    handler: python
    selection:
        members:
            - "!"  # exlude all members
    rendering:
        heading_level: 4
        show_root_heading: false
        show_source: false
        show_root_toc_entry: false

## pycape.Job
::: cape-ds.pycape.Job
    handler: python
    rendering:
        heading_level: 4
        show_root_heading: false
        show_source: false
        show_root_toc_entry: false

## pycape.Task
::: cape-ds.pycape.api.task.task.Task
    handler: python
    rendering:
        heading_level: 4
        show_root_heading: false
        show_source: false
        show_root_toc_entry: false

## pycape.VerticallyPartitionedLinearRegressionJob
::: cape-ds.pycape.VerticallyPartitionedLinearRegression
    handler: python
    selection:
        filters:
            - "!^_"  # exlude all members starting with _
    rendering:
        heading_level: 4
        show_root_heading: false
        show_source: false
        show_root_toc_entry: false