#!/bin/bash
python3 format.py
cd report
make
cd ..
cp report/report.pdf rendu/sauvage_merckle_report_graph.pdf
cat Queries/* > rendu/sauvage_merckle_queries.gql
echo Ok!
