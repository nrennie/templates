import pandas as pd
import plotnine as gg
import matplotlib.pyplot as plt
import highlight_text as ht
from pyfonts import load_font

# Load data ---------------------------------------------------------------


# Define colours ----------------------------------------------------------

bg_col = "#F2F4F8"
text_col = "#151C28"
highlight_col = "#7F055F"


# Load fonts --------------------------------------------------------------

title_font = load_font(
   font_url="https://github.com/google/fonts/blob/main/apache/slackey/Slackey-Regular.ttf?raw=true"
)
body_font = load_font(
   font_url="https://github.com/google/fonts/blob/main/ofl/archivo/Archivo%5Bwdth%2Cwght%5D.ttf?raw=true"
)


# Data wrangling ----------------------------------------------------------



# Define text -------------------------------------------------------------

title = ""
st = ""
wrapped_subtitle = '\n'.join(textwrap.wrap(st, width=80))
cap = '<Data::{"fontweight": "bold"}>: Source\n<Graphic::{"fontweight": "bold"}>: Nicola Rennie (@nrennie)'


# Plot --------------------------------------------------------------------

p = ()

fig = p.draw()
fig.set_size_inches(6, 9.5, forward=True)

plt.figure(fig)

# add caption
ht.fig_text(0.02, 0.04, cap, color=text_col, fontsize=7.5, va='top', fontfamily='sans-serif', fig=fig)
# add title
ht.fig_text(0.02, 0.98, title, color=text_col, fontsize=14, va='top', fontweight='bold', fontfamily='sans-serif', fig=fig)
# add subtitle
ht.fig_text(0.02, 0.93, wrapped_subtitle, color=text_col, fontsize=10, va='top', fontfamily='sans-serif', fig=fig, linespacing=0.9)


# Save --------------------------------------------------------------------

# Plotnine only
g.save("image.png", height=6, width=6, units="in")

# With highlight text
fig.savefig("image.png", dpi=300)

