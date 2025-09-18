import pandas as pd 

## Read data 
d = pd.read_stata(
    filepath_or_buffer = "./python/data/raw/hajj_public.dta", convert_categoricals=True
    )

## Rename to things that aren't horrible
d = d.rename(
    columns={
        "x_s14aq10": "regarded_as_religious", 
        ## views about groups of peoples 
        ## ranging from +2 (very positive) to -2 (very negative)
        "x_s15cq5": "views_about_saudis", 
        "x_s15cq6": "views_about_indonesians", 
        "x_s15cq7": "views_about_turks", 
        "x_s15cq8": "views_about_africans",
        "x_s15cq10": "views_about_europeans", 
        "x_s15cq9": "views_about_chinese",
        ## views toward women; 
        ## 0 = "men are better or equal", 
        ## 1 = "women are better"
        "x_s10dq15a": "equal_intellect", 
        "x_s10dq15b": "equal_spiritual", 
        "x_s10dq15c": "equal_ethical", 
        "x_s10dq18": "equal_status", 
        ## girls education
        "x_s10eq2": "girls_should_attend", 
        ## won the hajj lottery 
        "success": "won_lottery"
    }
)

# Keep only some columns 
d = d[[
    "regarded_as_religious", 
    "views_about_saudis", 
    "views_about_indonesians", 
    "views_about_turks", 
    "views_about_africans",
    "views_about_europeans", 
    "views_about_chinese",
    "equal_intellect", 
    "equal_spiritual", 
    "equal_ethical", 
    "equal_status", 
    "girls_should_attend", 
    "won_lottery"]
]

d.to_parquet(path = "python/data/procesed/haaj_data.gzip")