---
layout: tutorial_hands_on

title: Scan for C/D-box sequences with segmentation-fold
zenodo_link: ''
questions:
- Which biological questions are addressed by the tutorial?
- Which bioinformatics techniques are important to know for this type of data?
objectives:
- The learning objectives are the goals of the tutorial
- They will be informed by your audience and will communicate to them and to yourself
  what you should focus on during the course
- They are single sentences describing what a learner should be able to do once they
  have completed the tutorial
- You can use Bloom's Taxonomy to write effective learning objectives
time_estimation: 3H
key_points:
- The take-home messages
- They will appear at the end of the tutorial
contributors:
- bebatut
- pavanvidem
---


# Introduction
{:.no_toc}

<!-- This is a comment. -->

***TODO***: *Add General introduction about the topic and then an introduction of the
tutorial (the questions and the objectives). It is nice also to have a
scheme to sum up the pipeline used during the tutorial. The idea is to
give to trainees insight into the content of the tutorial and the (theoretical
and technical) key concepts they will learn.*

**Please follow our
[tutorial to learn how to fill the Markdown]({{ site.baseurl }}/topics/contributing/tutorials/create-new-tutorial-content/tutorial.html)**

> ### Agenda
>
> In this tutorial, we will cover:
>
> 1. TOC
> {:toc}
>
{: .agenda}

# Get and prepare data

> ### {% icon hands_on %} Hands-on: Data upload
>
> 1. Create a new history for this tutorial
> 2. Import the files from [Zenodo]() or from the shared data library
>
>    ```
>    
>    ```
>    ***TODO***: *Add the files by the ones on Zenodo here (if not added)*
>
>    ***TODO***: *Remove the useless files (if added)*
>
>    {% include snippets/import_via_link.md %}
>    {% include snippets/import_from_data_library.md %}
>
> 3. Rename the datasets
> 4. Check that the datatype
>
>    {% include snippets/change_datatype.md datatype="datatypes" %}
>
> 5. Add to each database a tag corresponding to ...
>
>    {% include snippets/add_tag.md %}
>
> 1. **fix-fasta-headers** {% icon tool %} with the following parameters:
>    - {% icon param-file %} *"Fasta file with RNA-sequece"*: `output` (Input dataset)
{: .hands_on}

# Find C/D-boxes and extract corresponding sequences

We will now search for 2 boxes in the FASTA file:
- The C-box: `NRUGAUG`
- The D-box: `CUGA`

We use the **find-boxes** {% icon tool %} tool and then we can extract the corresponding sequences using **extract-boxed-sequences** {% icon tool %}

## Sub-step with **find-boxes**

> ### {% icon hands_on %} Hands-on: Find all C/D boxes in the FASTA file
>
> 1. **find-boxes** {% icon tool %} with the following parameters:
>    - {% icon param-file %} *"Fasta file with RNA-sequece"*: `fasta_output` (output of **fix-fasta-headers** {% icon tool %})
>
>
{: .hands_on}

***TODO***: *Comment quickly the generated outputs*

***TODO***: *Consider adding a question to test the learners understanding of the previous exercise*

> ### {% icon question %} Questions
>
> 1. Question1?
> 2. Question2?
>
> > ### {% icon solution %} Solution
> >
> > 1. Answer for question1
> > 2. Answer for question2
> >
> {: .solution}
>
{: .question}

> ### {% icon hands_on %} Hands-on: Extact boxed sequences
>
> 1. **extract-boxed-sequences** {% icon tool %} with the following parameters:
>    - {% icon param-file %} *"Genomic reference FASTA file"*: `fasta_output` (output of **fix-fasta-headers** {% icon tool %})
>    - {% icon param-file %} *"BED file containing the sequence boxes"*: `bed_output` (output of **find-boxes** {% icon tool %})
>    - *"Maximal distance between the boxes"*: `110`
>
{: .hands_on}

***TODO***: *Comment quickly the generated outputs*

***TODO***: *Consider adding a question to test the learners understanding of the previous exercise*

> ### {% icon question %} Questions
>
> 1. Question1?
> 2. Question2?
>
> > ### {% icon solution %} Solution
> >
> > 1. Answer for question1
> > 2. Answer for question2
> >
> {: .solution}
>
{: .question}

# Identify stable C/D-box K-turns

To identify stable C/D-box K-turns, we import a file file containing C/D-box K-turn annotations and then use the tool **estimate-energy** {% icon tool %} to estimate if the segment in our annotation could be found in the previously extracted sequences. If some are found, **estimate-energy** {% icon tool %} will also scan for the Gibbs free energy necessary for the segment to contribute for the optimal structure. 

> ### {% icon hands_on %} Hands-on: Task description
> 1. Import the XML file describing the be tested from [Zenodo]() or from the shared data library
> 1. **estimate-energy** {% icon tool %} with the following parameters:
>    - *"Use segment definition from history"*: `Yes`
>        - {% icon param-file %} *"Custom 'segments.xml'-syntaxed file"*: `output` (Input dataset)
>    - *"Precision"*: `0.1`
>    - {% icon param-file %} *"Optional sequences to scan for Segment(Loop)s (FASTA)"*: `fasta_output_file` (output of **extract-boxed-sequences** {% icon tool %})
>
{: .hands_on}

***TODO***: *Comment quickly the generated outputs*

***TODO***: *Consider adding a question to test the learners understanding of the previous exercise*

> ### {% icon question %} Questions
>
> 1. Question1?
> 2. Question2?
>
> > ### {% icon solution %} Solution
> >
> > 1. Answer for question1
> > 2. Answer for question2
> >
> {: .solution}
>
{: .question}

We now filter the generated output to extract only the subsequences that have a difference in folding dE by including the segment annotations.

> ### {% icon hands_on %} Hands-on: Task description
>
> 1. **filter-by-energy** {% icon tool %} with the following parameters:
>    - {% icon param-file %} *"Input DBN file"*: `output_list` (output of **estimate-energy** {% icon tool %})
>    - *"Energy value"*: `-15.0`
>
{: .hands_on}

***TODO***: *Comment quickly the generated outputs*

***TODO***: *Consider adding a question to test the learners understanding of the previous exercise*

> ### {% icon question %} Questions
>
> 1. Question1?
> 2. Question2?
>
> > ### {% icon solution %} Solution
> >
> > 1. Answer for question1
> > 2. Answer for question2
> >
> {: .solution}
>
{: .question}


# Conclusion
{:.no_toc}

***TODO***: *Sum up the tutorial and the key takeaways here. We encourage adding an overview image of the pipeline used.*