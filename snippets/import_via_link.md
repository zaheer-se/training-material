<!--
type: tip box
location: inside a box
arguments:
    required:
        links: links, separated by a comma (e.g. "link1,link2")
    optional:
        collection: boolean to define if collection if used
        collection_type: type of the collection (if collection is true)
        collection_name: name of the collection (if collection is true)
        forward_name: name for the forward reads (if collection_type == paired)
        reverse_name: name for the reverse reads (if collection_type == paired)
        collection_name_convention: explanation of a naming convention
        format: file format
        genome: reference genome
-->
>
>    > ### {% icon tip %} Tip: Importing data via links
>    >
>    > * Copy the link location
>    > * Open the Galaxy Upload Manager ({% icon galaxy-upload %} on the top-right of the tool panel)
>    > {% if include.collection %}
>    > * Click on **Collection** on the top
>    > {% if include.collection_type %}
>    > * Click on **Collection Type** and select `{{ include.collection_type }}`
>    > {% endif %}
>    > {% endif %}
>    > * Select **Paste/Fetch Data**
>    > * Paste the link into the text field
>    > {% assign links = include.links | split: "," %}
>    > {% for l in links %}
>    >   `{{ l }}`
>    > {% endfor %}
>    > {% if include.format %}
>    > * Change **Type** from "Auto-detect" to `{{ include.format }}`
>    > {% endif %}
>    > {% if include.genome %}
>    > * Change **Genome** to `{{ include.genome }}`
>    > {% endif %}
>    > * Press **Start**
>    > {% if include.collection %}
>    > * Click on **Build** when available
>    > {% if include.collection_type == "Paired" %}
>    > * Ensure that forward and reverse reads are correctly assigned
>    >    * Forward should end with `{{ include.forward_name }}`
>    >    * Reverse should end with `{{ include.reverse_name }}`
>    > * Click **Swap** otherwise
>    > {% endif %}
>    > * Enter a name for the collection{% if include.collection_name %}, `{{ include.collection_name }}` here{% endif %}
>    > {% if include.collection_name_convention %}
>    >     * A useful naming convention is to use {{ include.collection_name_convention }}
>    > {% endif %}
>    > * Click on **Create list** (and wait a bit)
>    > {% else %}
>    > * **Close** the window
>    > {% endif %}
>    > By default, Galaxy uses the URL as the name, so rename the files with a more useful name.
>    {: .tip}
>