# API Reference

## cape.Cape
::: cape-ds.cape.Cape
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

## cape.Project
::: cape-ds.cape.Project
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

## cape.DataView
::: cape-ds.cape.DataView
    handler: python
    selection:
        members:
            - "!"  # exlude all members
    rendering:
        heading_level: 4
        show_root_heading: false
        show_source: false
        show_root_toc_entry: false

## cape.ob
::: cape-ds.cape.Job
    handler: python
    rendering:
        heading_level: 4
        show_root_heading: false
        show_source: false
        show_root_toc_entry: false

## cape.VerticallyPartitionedLinearRegressionJob
::: cape-ds.cape.VerticallyPartitionedLinearRegression
    handler: python
    selection:
        filters:
            - "!^_"  # exlude all members starting with _
    rendering:
        heading_level: 4
        show_root_heading: false
        show_source: false
        show_root_toc_entry: false