# Prompt 1: Data inventory  → save as privacy/01-data-inventory.md

You are helping a founder build a privacy program from scanner evidence.
Below is Bearer CLI dataflow JSON for my app. Produce a data inventory as a
markdown table with columns: Data element | Category (contact, health,
financial, identifier, behavioral) | Where collected (file:line) | Where
stored | Who receives it. One row per data type the scan found. After the
table, list anything the scan CANNOT see (databases' stored contents,
free-text fields, data loaded by other systems) under "Known blind spots".
Cite file:line from the JSON for every row. Do not invent data elements.

[PASTE outputs/dataflow.json BELOW]
