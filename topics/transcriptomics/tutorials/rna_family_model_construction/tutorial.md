---
layout: tutorial_hands_on

title: RNA family model construction
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

***TODO***: *Add a general introduction to the topic*
***TODO***: *Add a description of the dataset and what you want to do with it*

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

# Get data

The RNA family model construction workflow accepts a single sequence in fasta format as input. 

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
{: .hands_on}

# Collection of the potentially homolog sequences

In the first step RNAlien collects potentially homolog sequences via homology search with sequences and secondary-structure information. The found sequences are then used to construct a structural sequences alignment with consensus structure and a RNA family, also called covariance, model.

> ### {% icon hands_on %} Hands-on: RNA family model construction
>
> 1. **RNAlien** {% icon tool %} with the following parameters:
>    - {% icon param-file %} *"Input sequence"*: `output` (Input dataset)
{: .hands_on}

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

The results of the construction process need now to be analysed. 

# Analysis of the construction process results

## Selection and evaluation of the representative sequences from the structural alignment

Representative sequences from the structural alignment are selected and then evaluated by RNAz and RNAcode. RNAz classifies if the alignment is of structural RNA quality and RNAcode searches for open readng frames and allows the identification of dual RNAs. 

> ### {% icon hands_on %} Hands-on: Selection of representative sequences
>
> 1. **Select Sequences** {% icon tool %} with the following parameters:
>    - {% icon param-file %} *"Input clustal alignment"*: `clustal` (output of **RNAlien** {% icon tool %})
>
{: .hands_on}

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

We now classify if the alignment is of structural RNA quality using **RNAz** {% icon tool %}. It will also generate some statistics for the alignment.

> ### {% icon hands_on %} Hands-on: Alignement classification
>
> 1. **RNAz** {% icon tool %} with the following parameters:
>    - {% icon param-file %} *"Input Alignment File"*: `clustal` (output of **Select Sequences** {% icon tool %})
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

To identify dual RNAs, we search for open reading frames using RNAcode.

> ### {% icon hands_on %} Hands-on: Identification of dual RNAs
>
> 1. **RNAcode** {% icon tool %} with the following parameters:
>    - {% icon param-file %} *"Multiple Alignment"*: `clustal` (output of **Select Sequences** {% icon tool %})
>    - *"Scoring parameters"*: `Default`
>    - *"Create colored plots in EPS format"*: `Create Plots`
>
>    ***TODO***: *Check parameter descriptions*
>
>    ***TODO***: *Consider adding a comment or tip box*
>
>    > ### {% icon comment %} Comment
>    >
>    > A comment about the tool or something else. This box can also be in the main text
>    {: .comment}
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

## Generation of covariance model statistics

Statistics for the resulting covariance model are generated with **cmstat** {% icon tool %}. 

> ### {% icon hands_on %} Hands-on: Generation of covariance model statistics
>
> 1. **cmstat** {% icon tool %} with the following parameters:
>    - *"Subject covariance models"*: `Covariance model from your history`
>        - {% icon param-file %} *"Covariance models file from the history."*: `cm` (output of **RNAlien** {% icon tool %})
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

## Visualization of the RNA family model

To visualize the RNA family model we use **cmv** {% icon tool %}. It generates a detailed visualization, showing nodes and probabilities of the model. The alignment is annotated with node indices of the model.

> ### {% icon hands_on %} Hands-on: Visualization of the RNA family model
>
> 1. **cmv** {% icon tool %} with the following parameters:
>    - {% icon param-file %} *"Input model"*: `cm` (output of **RNAlien** {% icon tool %})
>    - In *"Common parameters"*:
>        - {% icon param-file %} *"Input stockholm alignment"*: `stockholm` (output of **RNAlien** {% icon tool %})
>        - *"Specify visualization detail level."*: `detailed`
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

Sum up the tutorial and the key takeaways here. We encourage adding an overview image of the
pipeline used.