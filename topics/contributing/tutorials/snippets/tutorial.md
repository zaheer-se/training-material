---
layout: tutorial_hands_on

title: "Snippets to share text between tutorials"
questions:
  - "How to share part of text between different tutorials?"
  - "What are the snippets?"
  - "How to include a snippet in a tutorial?"
  - "What are the available snippets?"
  - "How to create a snippet?"
objectives:
  - "Share text between different tutorials"
  - "Use snippets inside tutorial"
  - "Create a new snippet"
  - "Know the available snippets"
time_estimation: "15m"
key_points:
  - "Portion of text can be easily shared between tutorials"
  - "Snippets are there to share portion of text"
  - "Lots of snippets are already available and documented"
contributors:
  - bebatut
---

# Introduction
{:.no_toc}

Some portion of text are repeated between tutorials. For example, the tip boxes explaining how to import from link or from the data library in the data upload boxes.

To keep it coherent and limit the redundancy, we introduced the snippets: a file with short portion of text that can be included in several tutorial and avoid to copy/paste it.

# How to use an existing snippet in a tutorial?

Most of the snippets are located in `snippets` folder at the root: they are the general one, like "how to add a tag to a dataset" or "how to extract a workflow from an history". A snippet is included in a tutorial with:

{% raw %}
```markdown
{% include snippets/<snippet_name>.md %}
```
{% endraw %}

The available snippets are listed [below](#available-general-snippets).

Some more specific snippets can found directly inside tutorial folders. For example, the explanation of the BAM format used in the tutorials ["Reference-based RNA-Seq data analysis" (transcriptomics)]({{ site.baseurl }}{% link topics/transcriptomics/tutorials/ref-based/tutorial.md %}) and ["Formation of the Super-Structures on the Inactive X" (chip-seq)]({{ site.baseurl }}{% link topics/chip-seq/tutorials/formation_of_super-structures_on_xi/tutorial.md %}) is a snippet in [`topics/sequence-analysis/tutorials/mapping/bam_explanation.md`]({{ site.baseurl }}{% link topics/sequence-analysis/tutorials/mapping/bam_explanation.md %}).

To include them:

{% raw %}
```markdown
{% include topics/<topic_name>/tutorials/<tutorial_name>/<snippet_name>.md %}
```
{% endraw %}


Some of the snippets come with parameters, e.g. the name when renaming a dataset. The parameters are added with `include` call:

{% raw %}
```markdown
{% include snippets/<snippet_name>.md paramter=<parameter_value> %}
```
{% endraw %}

Each snippet should be documented with the required and/or optional parameters, and also [below](#available-general-snippets).

# Available snippets

## General snippets in `snippet` folder

### Adding a custom Database/Build

{% include snippets/add_custom_build.md name="name" dbkey="dbkey" fasta="fasta" %}

This tip box should be included inside an existing box.

It required as arguments:

- `name`: name of the reference build
- `dbkey`: dbkey of the reference 
- `fasta`: fasta file for the reference

{% raw %}
```markdown
{% include snippets/add_custom_build.md name=<> dbkey=<> fasta=<> %}
```
{% endraw %}

## Specific snippets

# Conclusion
{:.no_toc}
