#!/bin/bash

# Define the document files and templates
DOCUMENT_INPUT_FILES=("modules/module_0_foundations/foundations.md")
DOCUMENT_OUTPUT="documents/foundations.pdf"
DOCUMENT_TEMPLATE="/home/pedersen/misc/pandoc-templates/default.latex"

# Define the slide files and templates
SLIDE_INPUT_FILES=("test_slides/slide1.md")
SLIDE_OUTPUT="slides/foundations.pdf"
SLIDE_TEMPLATE="/home/pedersen/misc/pandoc-templates/default.slidy"  # You can choose 'beamer', 'slidy', or 'revealjs'


# Function to generate documents
generate_document() {
    INPUT_FILES=("${!1}")
    OUTPUT_FILE=$2
    TEMPLATE=$3

    pandoc "${INPUT_FILES[@]}" \
           --output="$OUTPUT_FILE" \
           --from=markdown \
           --template="$TEMPLATE" \
           --pdf-engine=pdflatex \
           --variable=geometry:"margin=1in" \
           --highlight-style=tango
}


# Function to generate slides
generate_slides() {
    INPUT_FILES=("${!1}")
    OUTPUT_FILE=$2
    TEMPLATE=$3

    pandoc "${INPUT_FILES[@]}" \
           --output="$OUTPUT_FILE" \
           --from=markdown \
           --template="$TEMPLATE" \
           --pdf-engine=pdflatex \
           --variable=geometry:"margin=1in" \
           --highlight-style=tango
}

# Generate slides
generate_slides SLIDE_INPUT_FILES[@] "$SLIDE_OUTPUT" "$SLIDE_TEMPLATE"

# Generate documents
generate_document DOCUMENT_INPUT_FILES[@] "$DOCUMENT_OUTPUT" "$DOCUMENT_TEMPLATE"

# Generate slides
generate_slides SLIDE_INPUT_FILES[@] "$SLIDE_OUTPUT" "$SLIDE_TEMPLATE"

