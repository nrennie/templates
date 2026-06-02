import pandas as pd
import plotnine as gg
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm
import PyDyTuesday
import os
import highlight_text as ht


# Load data ---------------------------------------------------------------

PyDyTuesday.get_date(date_chr)
tt_data = pd.read_csv()


# Define colours ----------------------------------------------------------

bg_col = "#F2F4F8"
text_col = "#151C28"
highlight_col = "#7F055F"


# Load fonts --------------------------------------------------------------

oswald_paths = [p for p in fm.findSystemFonts() if 'oswald' in p.lower()]
for p in oswald_paths:
    fm.fontManager.addfont(p)
nunito_paths = [p for p in fm.findSystemFonts() if 'nunito' in p.lower()]
for p in nunito_paths:
    fm.fontManager.addfont(p)
    
available_names = [f.name for f in fm.fontManager.ttflist]
if 'Nunito' in available_names:
    body_font = 'Nunito'
else:
    body_font = 'sans-serif'

if 'Oswald' in available_names:
    title_font = 'Oswald'
else:
    title_font = 'sans-serif'


# Data wrangling ----------------------------------------------------------



# Define text -------------------------------------------------------------

title = ""
st = ""
cap = '<Data::{"fontweight": "bold"}>: source\n<Graphic::{"fontweight": "bold"}>: Nicola Rennie (@nrennie)'


# Plot --------------------------------------------------------------------

p = ()

fig = p.draw()
fig.set_size_inches(7, 5, forward=True)

plt.figure(fig)

ht.fig_text(
    x=0.01, y=0.06, s=cap,
    fontsize=7.5, va='top',
    fontfamily=body_font,
    color=text_col,
    linespacing=0.6,
    fig=fig)
    

# Save --------------------------------------------------------------------

fpath = os.path.join(yr, date_chr, f'{date_strip}.png')
fig.savefig(fpath, dpi=300)
